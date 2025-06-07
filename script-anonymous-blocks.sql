/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/

SET SERVEROUTPUT ON;
--BLOCO 1 - Identificar Total de impactos Recentes por Grupo de Desastre
DECLARE
    v_total_impacto NUMBER;
BEGIN
    FOR rec IN (
        SELECT gd.grupo, COUNT(i.id_impacto) AS total_impacto
        FROM tb_tge_desastre d
        JOIN tb_tge_grupo_desastre gd ON d.id_grupo_desastre = gd.id_grupo_desastre
        JOIN tb_tge_impacto i ON d.id_impacto = i.id_impacto
        WHERE d.data_ocorrencia >= SYSDATE - 5
        GROUP BY gd.grupo
        HAVING COUNT(i.id_impacto) > 0
        ORDER BY total_impacto DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Grupo: ' || rec.grupo || ' | Total Impactos: ' || rec.total_impacto);
    END LOOP;
END;










-- BLOCO 2 - Classificar os desastres mais recentes por risco (baixa/média/alta)
DECLARE
  v_nivel_risco VARCHAR2(20);
BEGIN
  FOR rec IN (
    SELECT 
      d.id_desastre,
      gd.grupo            AS tipo_desastre,
      c.desc_nivel        AS classificacao
    FROM tb_tge_desastre d
    JOIN tb_tge_grupo_desastre gd 
      ON d.id_grupo_desastre = gd.id_grupo_desastre
    JOIN tb_tge_impacto i 
      ON d.id_impacto = i.id_impacto
    JOIN tb_tge_impacto_humano hum 
      ON i.id_impacto_humano = hum.id_impacto_humano
    JOIN tb_tge_impacto_classificacao c 
      ON hum.id_impacto_classificacao = c.id_impacto_classificacao
    WHERE d.data_ocorrencia >= SYSDATE - 10
    ORDER BY d.data_ocorrencia DESC
  ) LOOP
    -- Mapear o desc_nivel para um texto amigável
    IF rec.classificacao = 'ALTO' THEN
      v_nivel_risco := 'Risco Alto';
    ELSIF rec.classificacao = 'MÉDIO' THEN
      v_nivel_risco := 'Risco Médio';
    ELSE
      v_nivel_risco := 'Risco Baixo';
    END IF;

    DBMS_OUTPUT.PUT_LINE(
      'Desastre ID: '      || rec.id_desastre ||
      ' | Tipo: '          || rec.tipo_desastre ||
      ' | Nível de Risco: '|| v_nivel_risco
    );
  END LOOP;
END;
/
