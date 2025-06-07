/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/

--FUNÇÃO 1 -> Classificação Nível de Alerta
CREATE OR REPLACE FUNCTION fn_classificar_nivel_alerta (
    p_pluviosidade IN NUMBER,    
    p_umidade_solo IN NUMBER,    
    p_risco_visual IN NUMBER     
) RETURN VARCHAR2 IS

    v_nivel_alerta INTEGER;
    v_desc_alerta VARCHAR2(50);

BEGIN
    
    IF p_pluviosidade > 80 AND p_umidade_solo > 75 AND p_risco_visual = 1 THEN
        v_nivel_alerta := 4; 
    ELSIF p_pluviosidade > 50 AND p_umidade_solo > 60 THEN
        v_nivel_alerta := 3;
    ELSIF p_pluviosidade > 30 THEN
        v_nivel_alerta := 2; 
    ELSE
        v_nivel_alerta := 1;
    END IF;


    SELECT desc_nivel INTO v_desc_alerta
    FROM tb_tge_impacto_classificacao
    WHERE nivel = v_nivel_alerta;

    RETURN v_desc_alerta;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NÍVEL DESCONHECIDO';
    WHEN OTHERS THEN
        RETURN 'ERRO NA CLASSIFICAÇÃO';

END;
/

-- Exemplo 1: Chuva forte, solo muito úmido, risco visual detectado
SELECT fn_classificar_nivel_alerta(85, 80, 1) FROM dual;
-- Resultado esperado: 'CRÍTICO'

-- Exemplo 2: Chuva moderada, solo úmido, sem risco visual
SELECT fn_classificar_nivel_alerta(55, 65, 0) FROM dual;
-- Resultado esperado: 'ALTO'

-- Exemplo 3: Pouca chuva
SELECT fn_classificar_nivel_alerta(20, 40, 0) FROM dual;
-- Resultado esperado: 'BAIXO'



--FUNÇÃO 2 -> nível de risco de desastres naturais por município
CREATE OR REPLACE FUNCTION fn_localizacao_risco
RETURN SYS_REFCURSOR
IS
  v_risco_cursor SYS_REFCURSOR;
BEGIN
  OPEN v_risco_cursor FOR
    SELECT 
      loc.municipio AS nome_municipio,
      COUNT(DISTINCT des.id_desastre) AS quantidade_desastres,
      ROUND(AVG(ic.nivel), 2) AS impacto_medio,
      SUM(z.populacao) AS total_populacao_afetada,
      CASE 
        WHEN ROUND(AVG(ic.nivel), 2) <= 3 THEN 'BAIXO'
        WHEN ROUND(AVG(ic.nivel), 2) BETWEEN 3.01 AND 6 THEN 'MEDIO'
        ELSE 'ALTO'
      END AS classificacao_risco
    FROM 
      tb_tge_desastre des
      JOIN tb_tge_local loc ON des.id_local = loc.id_local
      JOIN tb_tge_impacto impacto ON des.id_impacto = impacto.id_impacto
      JOIN tb_tge_impacto_material impacto_material ON impacto.id_impacto_material = impacto_material.id_impacto_material
      JOIN tb_tge_impacto_classificacao ic ON impacto_material.id_impacto_classificacao = ic.id_impacto_classificacao
      JOIN tb_tge_desastre_zona desastre_zona ON des.id_desastre = desastre_zona.id_desastre
      JOIN tb_tge_zona z ON desastre_zona.id_zona = z.id_zona
    GROUP BY 
      loc.municipio;

  RETURN v_risco_cursor;
END;
/

DECLARE
  v_cursor SYS_REFCURSOR;
BEGIN
  v_cursor := fn_localizacao_risco();
  DBMS_SQL.RETURN_RESULT(v_cursor);
END;
/

