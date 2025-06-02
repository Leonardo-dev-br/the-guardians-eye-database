/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/


--BLOCO 1 - Identificar zonas com tendência crescente de impacto nos últimos 7 dias
WITH impactos_recentes AS (
    SELECT
        z.ID_ZONA,
        z.DS_NOME AS NOME_ZONA,
        d.ID_DESASTRE,
        d.DS_NOME AS NOME_DESASTRE,
        i.DT_MEDICAO,
        i.VALOR,
        ROW_NUMBER() OVER (PARTITION BY z.ID_ZONA, d.ID_DESASTRE ORDER BY i.DT_MEDICAO DESC) AS dia_recente
    FROM
        tb_tge_impacto i
    INNER JOIN tb_tge_desastre d ON d.ID_DESASTRE = i.ID_DESASTRE
    INNER JOIN tb_tge_local l ON l.ID_LOCAL = d.ID_LOCAL
    INNER JOIN tb_tge_zona z ON z.ID_ZONA = l.ID_ZONA
    WHERE
        i.DT_MEDICAO >= CURRENT_DATE - INTERVAL '7 days'
),
agrupado_por_zona AS (
    SELECT
        ID_ZONA,
        ID_DESASTRE,
        ARRAY_AGG(VALOR ORDER BY dia_recente DESC) AS valores
    FROM
        impactos_recentes
    WHERE
        dia_recente <= 5
    GROUP BY
        ID_ZONA, ID_DESASTRE
),
zonas_com_tendencia_crescente AS (
    SELECT
        ID_ZONA,
        ID_DESASTRE,
        valores,
        CASE 
            WHEN array_length(valores, 1) = 5 AND
                 valores[1] < valores[2] AND
                 valores[2] < valores[3] AND
                 valores[3] < valores[4] AND
                 valores[4] < valores[5]
            THEN TRUE
            ELSE FALSE
        END AS tendencia_crescente
    FROM agrupado_por_zona
)
SELECT
    zc.ID_ZONA,
    z.DS_NOME AS NOME_ZONA,
    zc.ID_DESASTRE,
    d.DS_NOME AS NOME_DESASTRE,
    zc.valores
FROM
    zonas_com_tendencia_crescente zc
INNER JOIN tb_tge_zona z ON z.ID_ZONA = zc.ID_ZONA
INNER JOIN tb_tge_desastre d ON d.ID_DESASTRE = zc.ID_DESASTRE
WHERE
    tendencia_crescente = TRUE;


-- BLOCO 2 - 
WITH ultimo_sobrevoo AS (
    SELECT
        l.ID_LOCAL,
        MAX(i.DT_CRIACAO) AS ultima_imagem
    FROM
        tb_tge_imagem i
    INNER JOIN tb_tge_local l ON l.ID_LOCAL = i.ID_LOCAL
    GROUP BY
        l.ID_LOCAL
),
risco_atual_por_local AS (
    SELECT
        l.ID_LOCAL,
        z.ID_ZONA,
        MAX(ic.NU_CRITICIDADE) AS risco_maximo
    FROM
        tb_tge_impacto imp
    INNER JOIN tb_tge_desastre d ON d.ID_DESASTRE = imp.ID_DESASTRE
    INNER JOIN tb_tge_local l ON l.ID_LOCAL = d.ID_LOCAL
    INNER JOIN tb_tge_zona z ON z.ID_ZONA = l.ID_ZONA
    LEFT JOIN tb_tge_impacto_classificacao ic ON ic.ID_IMPACTO_CLASSIFICACAO = imp.ID_IMPACTO_CLASSIFICACAO
    WHERE
        imp.DT_MEDICAO >= CURRENT_DATE - INTERVAL '7 days'
    GROUP BY
        l.ID_LOCAL, z.ID_ZONA
),
locais_para_priorizar AS (
    SELECT
        ral.ID_LOCAL,
        ral.ID_ZONA,
        ral.risco_maximo,
        us.ultima_imagem,
        NOW() - us.ultima_imagem AS tempo_desde_ultima_imagem
    FROM
        risco_atual_por_local ral
    LEFT JOIN ultimo_sobrevoo us ON us.ID_LOCAL = ral.ID_LOCAL
    WHERE
        us.ultima_imagem IS NULL OR us.ultima_imagem < NOW() - INTERVAL '48 hours'
)
SELECT
    z.ID_ZONA,
    z.DS_NOME AS NOME_ZONA,
    l.ID_LOCAL,
    l.DS_NOME AS NOME_LOCAL,
    lp.risco_maximo,
    lp.ultima_imagem,
    EXTRACT(EPOCH FROM lp.tempo_desde_ultima_imagem)/3600 AS horas_desde_ultima_imagem
FROM
    locais_para_priorizar lp
INNER JOIN tb_tge_zona z ON z.ID_ZONA = lp.ID_ZONA
INNER JOIN tb_tge_local l ON l.ID_LOCAL = lp.ID_LOCAL
ORDER BY
    lp.risco_maximo DESC,
    horas_desde_ultima_imagem DESC
LIMIT 3;
