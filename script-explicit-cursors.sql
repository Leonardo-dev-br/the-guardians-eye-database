/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/

-- 1 Cursor - Atualizar níveis de risco com base no impacto humano classificado

DECLARE
    CURSOR c_impactos IS
        SELECT id_impacto_humano, quantidade_afetados, estado_afetados
        FROM tb_tge_impacto_humano;

    v_id_impacto_humano tb_tge_impacto_humano.id_impacto_humano%TYPE;
    v_quantidade INTEGER;
    v_estado VARCHAR2(150);
BEGIN
    OPEN c_impactos;
    LOOP
        FETCH c_impactos INTO v_id_impacto_humano, v_quantidade, v_estado;
        EXIT WHEN c_impactos%NOTFOUND;

        IF v_quantidade > 1000 THEN
            DBMS_OUTPUT.PUT_LINE('ALERTA: Alto impacto humano no estado ' || v_estado);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Impacto controlado no estado ' || v_estado);
        END IF;
    END LOOP;
    CLOSE c_impactos;
END;
/

-- 2 Cursor - VANTs utilizados para monitoramento de áreas e suas velocidades
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
            DBMS_OUTPUT.PUT_LINE(' -> Modelo: ' || vant.modelo || ' | Velocidade Máxima: ' || vant.velocidade_maxima || ' km/h');
        END LOOP;

    END LOOP;
    CLOSE c_desastres;
END;
/

-- 3 Cursor - Verificar incêndios florestais e suas classificações de impacto

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

    DBMS_OUTPUT.PUT_LINE('Incêndio ' || v_id_incendio || ' | Causa: ' || v_causa || ' | Tipo: ' || v_tipo || ' | Nível: ' || v_nivel);
  END LOOP;
  CLOSE c_incendios;
END;
