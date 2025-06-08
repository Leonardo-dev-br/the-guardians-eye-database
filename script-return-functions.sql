/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/

--FUNÇÃO 1 -> Retornar quantidade total de pessoas afetadas por um desastre específico
CREATE OR REPLACE FUNCTION fn_populacao_afetada (
  p_id_desastre IN NUMBER
) RETURN NUMBER IS
  v_total_populacao NUMBER := 0;
BEGIN
  SELECT SUM(z.populacao)
  INTO v_total_populacao
  FROM tb_tge_desastre_zona dz
  JOIN tb_tge_zona z ON dz.id_zona = z.id_zona
  WHERE dz.id_desastre = p_id_desastre;

  RETURN v_total_populacao;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END;
/

DECLARE
  v_result NUMBER;
BEGIN
  v_result := fn_populacao_afetada(3);
  DBMS_OUTPUT.PUT_LINE('Pessoas afetadas: ' || v_result);
END;
/






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

