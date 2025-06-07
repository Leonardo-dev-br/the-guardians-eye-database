/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/

SET SERVEROUTPUT ON
-- 1 Cursor - VANTs utilizados para monitoramento de �reas e suas velocidades
DECLARE
    CURSOR c_desastres IS
        SELECT id_desastre FROM tb_tge_desastre;

    v_id_desastre tb_tge_desastre.id_desastre%TYPE;
BEGIN
    OPEN c_desastres;
    LOOP
        FETCH c_desastres INTO v_id_desastre;
        EXIT WHEN c_desastres%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('--- VANTs do Desastre ID: ' || v_id_desastre || ' ---');

        FOR vant IN (
            SELECT v.modelo, v.velocidade_maxima
            FROM tb_tge_desastre_vant dv
            JOIN tb_tge_vant v ON v.id_vant = dv.id_vant
            WHERE dv.id_desastre = v_id_desastre
        ) LOOP
            DBMS_OUTPUT.PUT_LINE(' -> Modelo: ' || vant.modelo || ' | Velocidade M�xima: ' || vant.velocidade_maxima || ' km/h');
        END LOOP;

    END LOOP;
    CLOSE c_desastres;
END;
/

-- 2 Cursor - Verificar inc�ndios florestais e suas classifica��es de impacto

DECLARE
  CURSOR c_incendios IS
    SELECT i.id_incendio, i.causa, i.tipo_incendio, ic.nivel
    FROM tb_tge_incendio_florestal i
    JOIN tb_tge_impacto_classificacao ic ON i.id_impacto_classificacao = ic.id_impacto_classificacao;

  v_id_incendio tb_tge_incendio_florestal.id_incendio%TYPE;
  v_causa tb_tge_incendio_florestal.causa%TYPE;
  v_tipo tb_tge_incendio_florestal.tipo_incendio%TYPE;
  v_nivel tb_tge_impacto_classificacao.nivel%TYPE;
BEGIN
  OPEN c_incendios;
  LOOP
    FETCH c_incendios INTO v_id_incendio, v_causa, v_tipo, v_nivel;
    EXIT WHEN c_incendios%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Inc�ndio ' || v_id_incendio || ' | Causa: ' || v_causa || ' | Tipo: ' || v_tipo || ' | N�vel: ' || v_nivel);
  END LOOP;
  CLOSE c_incendios;
END;
