/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/
SET SERVEROUTPUT ON

--Terreno Geografico
CREATE OR REPLACE PROCEDURE deletar_terreno_geografico_procedure (
    p_id_terreno IN NUMBER
)
IS
BEGIN
    IF p_id_terreno IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do terreno n�o pode ser nulo.');
    END IF;

    -- Exclui os registros dependentes da tabela filha
    DELETE FROM tb_tge_terreno_desastre
    WHERE id_terreno = p_id_terreno;

    -- Agora pode excluir o terreno geogr�fico
    DELETE FROM tb_tge_terreno_geografico
    WHERE id_terreno = p_id_terreno;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum terreno encontrado com o ID ' || p_id_terreno);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Terreno deletado com sucesso. ID: ' || p_id_terreno);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar terreno: ' || SQLERRM);
END;
/



BEGIN
    deletar_terreno_geografico_procedure(4);
END;
/

SELECT * FROM tb_tge_terreno_geografico;



--Usuario
CREATE OR REPLACE PROCEDURE deletar_usuario_procedure (
    p_id_usuario IN NUMBER
)
IS
BEGIN
    IF p_id_usuario IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do usu�rio n�o pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_usuario
    WHERE id_usuario = p_id_usuario;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum usu�rio encontrado com o ID ' || p_id_usuario);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Us�rio deletado com sucesso. ID: ' || p_id_usuario);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar usu�rio: ' || SQLERRM);
END;
/

BEGIN
    deletar_usuario_procedure(5);
    deletar_usuario_procedure(6);
END;
/

SELECT * FROM tb_tge_usuario;


--Local
CREATE OR REPLACE PROCEDURE deletar_local_procedure (
    p_id_local IN NUMBER
)
IS
BEGIN
    IF p_id_local IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do local n�o pode ser nulo.');
    END IF;


    DELETE FROM tb_tge_local
    WHERE id_local = p_id_local;


    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum local encontrado com o ID ' || p_id_local);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Local deletado com sucesso. ID: ' || p_id_local);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar local: ' || SQLERRM);
END;
/

BEGIN
    deletar_local_procedure(1);
    deletar_local_procedure(3);
END;
/

SELECT * FROM tb_tge_local;


--Subgrupo
CREATE OR REPLACE PROCEDURE deletar_subgrupo_desastre_procedure (
    p_id_subgrupo IN NUMBER
)
IS
BEGIN
    IF p_id_subgrupo IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do subgrupo não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_subgrupo_desastre
    WHERE id_subgrupo = p_id_subgrupo;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum subgrupo encontrado com o ID ' || p_id_subgrupo);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Subgrupo deletado com sucesso. ID: ' || p_id_subgrupo);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar subgrupo: ' || SQLERRM);
END;
/

BEGIN
    deletar_subgrupo_desastre_procedure(5);
    deletar_subgrupo_desastre_procedure(6);
END;
/


--Vant
CREATE OR REPLACE PROCEDURE deletar_vant_procedure (
    p_id_vant IN NUMBER
)
IS
BEGIN
    IF p_id_vant IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do VANT não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_vant
    WHERE id_vant = p_id_vant;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum VANT encontrado com o ID ' || p_id_vant);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('VANT deletado com sucesso. ID: ' || p_id_vant);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar VANT: ' || SQLERRM);
END;
/

BEGIN
    deletar_vant_procedure(3);
    deletar_vant_procedure(4);
END;
/

SELECT * FROM tb_tge_vant;

--Imagens Capturadas
CREATE OR REPLACE PROCEDURE deletar_imagem_capturada_procedure (
    p_id_imagem IN NUMBER
)
IS
BEGIN

    IF p_id_imagem IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da imagem não pode ser nulo.');
    END IF;


    DELETE FROM tb_tge_imagens_capturadas
    WHERE id_imagem = p_id_imagem;


    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma imagem encontrada com o ID ' || p_id_imagem);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Imagem deletada com sucesso. ID: ' || p_id_imagem);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar imagem: ' || SQLERRM);
END;
/

BEGIN
    deletar_imagem_capturada_procedure(2);
    deletar_imagem_capturada_procedure(5);
END;
/

SELECT * FROM tb_tge_imagens_capturadas;


--Zona
CREATE OR REPLACE PROCEDURE deletar_zona_procedure (
    p_id_zona IN NUMBER
)
IS
BEGIN
    IF p_id_zona IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da zona não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_zona
    WHERE id_zona = p_id_zona;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma zona encontrada com o ID ' || p_id_zona);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Zona deletada com sucesso. ID: ' || p_id_zona);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar zona: ' || SQLERRM);
END;
/
BEGIN
    deletar_zona_procedure(1);
    deletar_zona_procedure(3);
END;
/

SELECT * FROM tb_tge_zona;


--Sensores
CREATE OR REPLACE PROCEDURE deletar_sensor_procedure (
    p_id_sensor IN NUMBER
)
IS
BEGIN
    IF p_id_sensor IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do sensor não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_sensores
    WHERE id_sensor = p_id_sensor;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum sensor encontrado com o ID ' || p_id_sensor);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Sensor deletado com sucesso. ID: ' || p_id_sensor);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar sensor: ' || SQLERRM);
END;
/

BEGIN
    deletar_sensor_procedure(2);
    deletar_sensor_procedure(4);
END;
/
SELECT * FROM tb_tge_sensores;


--Classificação de Impacto
CREATE OR REPLACE PROCEDURE deletar_impacto_classificacao_procedure (
    p_id_impacto_classificacao IN NUMBER
)
IS
BEGIN
    IF p_id_impacto_classificacao IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da classificação de impacto não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_impacto_classificacao
    WHERE id_impacto_classificacao = p_id_impacto_classificacao;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma classificação de impacto encontrada com o ID ' || p_id_impacto_classificacao);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Classificação de impacto deletada com sucesso. ID: ' || p_id_impacto_classificacao);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar classificação de impacto: ' || SQLERRM);
END;
/
BEGIN
    deletar_impacto_classificacao_procedure(1);
    deletar_impacto_classificacao_procedure(3);
END;
/
SELECT * FROM tb_tge_impacto_classificacao;

--Impacto Humano
CREATE OR REPLACE PROCEDURE deletar_impacto_humano_procedure (
    p_id_impacto_humano IN NUMBER
)
IS
BEGIN
    IF p_id_impacto_humano IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do impacto humano não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_impacto_humano
    WHERE id_impacto_humano = p_id_impacto_humano;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum impacto humano encontrado com o ID ' || p_id_impacto_humano);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Impacto humano deletado com sucesso. ID: ' || p_id_impacto_humano);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar impacto humano: ' || SQLERRM);
END;
/

BEGIN
    deletar_impacto_humano_procedure(3);
    deletar_impacto_humano_procedure(4);
END;
/
SELECT * FROM tb_tge_impacto_humano;


--Impacto Material
CREATE OR REPLACE PROCEDURE deletar_impacto_material_procedure (
    p_id_impacto_material IN NUMBER
)
IS
BEGIN
    IF p_id_impacto_material IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do impacto material não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_impacto_material
    WHERE id_impacto_material = p_id_impacto_material;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum impacto material encontrado com o ID ' || p_id_impacto_material);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Impacto material deletado com sucesso. ID: ' || p_id_impacto_material);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar impacto material: ' || SQLERRM);
END;
/

BEGIN
    deletar_impacto_material_procedure(2);
    deletar_impacto_material_procedure(5);
END;
/

SELECT * FROM tb_tge_impacto_material;


--Impacto
CREATE OR REPLACE PROCEDURE deletar_impacto_procedure (
    p_id_impacto IN NUMBER
)
IS
BEGIN
    IF p_id_impacto IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do impacto não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_impacto
    WHERE id_impacto = p_id_impacto;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum impacto encontrado com o ID ' || p_id_impacto);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Impacto deletado com sucesso. ID: ' || p_id_impacto);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar impacto: ' || SQLERRM);
END;
/
BEGIN
    deletar_impacto_procedure(1);
    deletar_impacto_procedure(3);
END;
/

SELECT * FROM tb_tge_impacto;


--Desastre
CREATE OR REPLACE PROCEDURE deletar_desastre_procedure (
    p_id_desastre IN NUMBER
)
IS
BEGIN
    IF p_id_desastre IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do desastre não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_desastre
    WHERE id_desastre = p_id_desastre;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum desastre encontrado com o ID ' || p_id_desastre);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Desastre deletado com sucesso. ID: ' || p_id_desastre);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar desastre: ' || SQLERRM);
END;
/
BEGIN
    deletar_desastre_procedure(2);
    deletar_desastre_procedure(4);
END;
/

SELECT * FROM tb_tge_desastre;


--Terreno Desastre
CREATE OR REPLACE PROCEDURE deletar_terreno_desastre_procedure (
    p_id_terreno_desastre IN NUMBER
)
IS
BEGIN
    IF p_id_terreno_desastre IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do terreno_desastre não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_terreno_desastre
    WHERE id_terreno_desastre = p_id_terreno_desastre;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum terreno_desastre encontrado com o ID ' || p_id_terreno_desastre);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Terreno_desastre deletado com sucesso. ID: ' || p_id_terreno_desastre);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar terreno_desastre: ' || SQLERRM);
END;
/
BEGIN
    deletar_terreno_desastre_procedure(1);
    deletar_terreno_desastre_procedure(3);
END;
/

SELECT * FROM tb_tge_terreno_desastre;


--Grupo Desastre
CREATE OR REPLACE PROCEDURE deletar_grupo_desastre_procedure (
    p_id_grupo_desastre IN INTEGER
)
IS
BEGIN
    IF p_id_grupo_desastre IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do grupo_desastre não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_grupo_desastre
    WHERE id_grupo_desastre = p_id_grupo_desastre;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum grupo_desastre encontrado com o ID ' || p_id_grupo_desastre);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Grupo_desastre deletado com sucesso. ID: ' || p_id_grupo_desastre);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar grupo_desastre: ' || SQLERRM);
END;
/

BEGIN
    deletar_grupo_desastre_procedure(2);
    deletar_grupo_desastre_procedure(3);
END;
/

SELECT * FROM tb_tge_grupo_desastre;


--Vant Imagem
CREATE OR REPLACE PROCEDURE deletar_vant_imagem_procedure (
    p_id_vant_imagem IN INTEGER
)
IS
BEGIN
    IF p_id_vant_imagem IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da vant_imagem não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_vant_imagens
    WHERE id_vant_imagem = p_id_vant_imagem;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma vant_imagem encontrada com o ID ' || p_id_vant_imagem);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Vant_imagem deletada com sucesso. ID: ' || p_id_vant_imagem);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar vant_imagem: ' || SQLERRM);
END;
/

BEGIN
    deletar_vant_imagem_procedure(1);
    deletar_vant_imagem_procedure(2);
END;
/

SELECT * FROM tb_tge_vant_imagens;

--Desastre Vant
CREATE OR REPLACE PROCEDURE deletar_desastre_vant_procedure (
    p_id_desastre_vant IN INTEGER
)
IS
BEGIN
    IF p_id_desastre_vant IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do desastre_vant não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_desastre_vant
    WHERE id_desastre_vant = p_id_desastre_vant;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum desastre_vant encontrado com o ID ' || p_id_desastre_vant);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Desastre_vant deletado com sucesso. ID: ' || p_id_desastre_vant);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar desastre_vant: ' || SQLERRM);
END;
/

BEGIN
    deletar_desastre_vant_procedure(1);
    deletar_desastre_vant_procedure(5);
END;
/
SELECT * FROM tb_tge_desastre_vant;


--Desastre Zona
CREATE OR REPLACE PROCEDURE deletar_desastre_zona_procedure (
    p_id_desastre_zona IN INTEGER
)
IS
BEGIN
    IF p_id_desastre_zona IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do desastre_zona não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_desastre_zona
    WHERE id_desastre_zona = p_id_desastre_zona;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum desastre_zona encontrado com o ID ' || p_id_desastre_zona);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Desastre_zona deletado com sucesso. ID: ' || p_id_desastre_zona);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar desastre_zona: ' || SQLERRM);
END;
/

BEGIN
    deletar_desastre_zona_procedure(1);
    deletar_desastre_zona_procedure(2);
END;
/
SELECT * FROM tb_tge_desastre_zona;

--Incêndio
CREATE OR REPLACE PROCEDURE deletar_incendio_florestal_procedure (
    p_id_incendio IN INTEGER
)
IS
BEGIN
    IF p_id_incendio IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do incêndio não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_incendio_florestal
    WHERE id_incendio = p_id_incendio;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum incêndio florestal encontrado com o ID ' || p_id_incendio);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Incêndio florestal deletado com sucesso. ID: ' || p_id_incendio);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar incêndio florestal: ' || SQLERRM);
END;
/

BEGIN
    deletar_incendio_florestal_procedure(1);
    deletar_incendio_florestal_procedure(3);
END;
/

SELECT * FROM tb_tge_incendio_florestal;

--Deslizamento
CREATE OR REPLACE PROCEDURE deletar_deslizamento_procedure (
    p_id_deslizamento IN INTEGER
)
IS
BEGIN
    IF p_id_deslizamento IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do deslizamento não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_deslizamento
    WHERE id_deslizamento = p_id_deslizamento;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum deslizamento encontrado com o ID ' || p_id_deslizamento);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Deslizamento deletado com sucesso. ID: ' || p_id_deslizamento);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar deslizamento: ' || SQLERRM);
END;
/
BEGIN
    deletar_deslizamento_procedure(2);
    deletar_deslizamento_procedure(4);
END;
/

SELECT * FROM tb_tge_deslizamento;

--Inundação
CREATE OR REPLACE PROCEDURE deletar_inundacao_procedure (
    p_id_inundacao IN INTEGER
)
IS
BEGIN
    IF p_id_inundacao IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da inundação não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_inundacao
    WHERE id_inundacao = p_id_inundacao;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma inundação encontrada com o ID ' || p_id_inundacao);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Inundação deletada com sucesso. ID: ' || p_id_inundacao);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar inundação: ' || SQLERRM);
END;
/
BEGIN
    deletar_inundacao_procedure(1);
    deletar_inundacao_procedure(3);
END;
/

SELECT * FROM tb_tge_inundacao;

--Seca
CREATE OR REPLACE PROCEDURE deletar_seca_procedure (
    p_id_seca IN INTEGER
)
IS
BEGIN
    IF p_id_seca IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da seca não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_seca
    WHERE id_seca = p_id_seca;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma ocorrência de seca encontrada com o ID ' || p_id_seca);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Ocorrência de seca deletada com sucesso. ID: ' || p_id_seca);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar ocorrência de seca: ' || SQLERRM);
END;
/
BEGIN
    deletar_seca_procedure(3);
    deletar_seca_procedure(4);
END;
/
SELECT * FROM tb_tge_seca;

--Desastre Sensores
CREATE OR REPLACE PROCEDURE deletar_desastre_sensor_procedure (
    p_id_desastre_sensor IN INTEGER
)
IS
BEGIN
    IF p_id_desastre_sensor IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do desastre_sensor não pode ser nulo.');
    END IF;

    DELETE FROM tb_tge_desastre_sensores
    WHERE id_desastre_sensor = p_id_desastre_sensor;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum vínculo encontrado com o ID ' || p_id_desastre_sensor);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Vínculo entre desastre e sensor deletado com sucesso. ID: ' || p_id_desastre_sensor);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao deletar vínculo de desastre com sensor: ' || SQLERRM);
END;
/
BEGIN
    deletar_desastre_sensor_procedure(1);
    deletar_desastre_sensor_procedure(2);
END;
/

SELECT * FROM tb_tge_desastre_sensores;