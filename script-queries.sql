/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/

-- 1 Query - Total de desastres por municÌpio e tipo
SELECT 
    l.municipio,
    gd.grupo,
    COUNT(d.id_desastre) AS total_desastres
FROM tb_tge_desastre d
JOIN tb_tge_local l ON d.id_local = l.id_local
JOIN tb_tge_grupo_desastre gd ON d.id_grupo_desastre = gd.id_grupo_desastre
GROUP BY l.municipio, gd.grupo
ORDER BY total_desastres DESC;


-- 2 Query - MÈdia de pessoas afetadas por n√≠vel de impacto humano
SELECT 
    ic.desc_nivel,
    AVG(ih.quantidade_afetados) AS media_afetados
FROM tb_tge_impacto_humano ih
JOIN tb_tge_impacto_classificacao ic ON ih.id_impacto_classificacao = ic.id_impacto_classificacao
GROUP BY ic.desc_nivel
HAVING AVG(ih.quantidade_afetados) > 10;

-- 3 Query - Zonas com maior n√∫mero de desastres registrados
SELECT 
    z.desc_zona,
    z.porte,
    COUNT(dz.id_desastre_zona) AS total_desastres
FROM tb_tge_desastre_zona dz
JOIN tb_tge_zona z ON dz.id_zona = z.id_zona
GROUP BY z.desc_zona, z.porte
ORDER BY total_desastres DESC;
