/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/


SET SERVEROUTPUT ON
--ATUALIZAÇÕES
--Terrno Geografico
CREATE OR REPLACE PROCEDURE atualizar_terreno_geografico_procedure (
    p_id_terreno IN NUMBER,
    p_terreno IN VARCHAR2
)
IS
BEGIN

    IF p_id_terreno IS NULL THEN
        AISE_APPLICATION_ERROR(-20001, 'ID do terreno não pode ser nulo.');
    END IF;

    UPDATE tb_tge_terreno_geografico
    SET terreno = p_terreno
    WHERE id_terreno = p_id_terreno;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum terreno encontrado com o ID ' || p_id_terreno);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Terreno atualizado com sucesso: ' || p_terreno);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar terreno: ' || SQLERRM);
END;
/

BEGIN
    atualizar_terreno_geografico_procedure(1,'Planície');
    atualizar_terreno_geografico_procedure(4,'Depressão');
END;
/

--Usuario
CREATE OR REPLACE PROCEDURE atualizar_usuario_procedure (
    p_id_usuario   IN NUMBER,
    p_nome_usuario IN VARCHAR2,
    p_sobrenome    IN VARCHAR2,
    p_cpf          IN NUMBER,
    p_cargo        IN VARCHAR2,
    p_funcao       IN VARCHAR2,
    p_email        IN VARCHAR2,
    p_senha        IN VARCHAR2
)
IS
BEGIN
    IF p_id_usuario IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do usuário não pode ser nulo');
    END IF;

    UPDATE tb_tge_usuario
    SET 
        nome_usuario = p_nome_usuario,
        sobrenome    = p_sobrenome,
        cpf          = p_cpf,
        cargo        = p_cargo,
        funcao       = p_funcao,
        email        = p_email,
        senha        = p_senha
    WHERE id_usuario = p_id_usuario;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum usuário encontrado com o ID ' || p_id_usuario);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Usuário atualizado com sucesso: ' || p_nome_usuario || ' ' || p_sobrenome);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar usuário: ' || SQLERRM);
END;
/

BEGIN
    atualizar_usuario_procedure(
        1,
        'Ana',
        'Souza Lima',
        12345678901,
        'Engenheira Ambiental',
        'Coleta de Dados',
        'ana.lima@cemaden.gov.br',
        'senhaAna2025'
    );

    atualizar_usuario_procedure(
        2,
        'Carlos',
        'Menezes Rocha',
        98765432100,
        'Meteorologista',
        'Previsão Climática',
        'carlos.rocha@cemaden.gov.br',
        'senhaCarlos2025'
    );
END;
/

--Local
CREATE OR REPLACE PROCEDURE atualizar_local_procedure (
    p_id_local  IN NUMBER,
    p_cep       IN NUMBER,
    p_endereco  IN VARCHAR2,
    p_municipio IN VARCHAR2,
    p_numero    IN NUMBER,
    p_longitude IN NUMBER,
    p_latitude  IN NUMBER
)
IS
BEGIN
    IF p_id_local IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do local não pode ser nulo');
    END IF;

    UPDATE tb_tge_local
    SET
        cep       = p_cep,
        endereco  = p_endereco,
        municipio = p_municipio,
        numero    = p_numero,
        longitude = p_longitude,
        latitude  = p_latitude
    WHERE id_local = p_id_local;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum local encontrado com o ID ' || p_id_local);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Local atualizado com sucesso: ' || p_endereco || ', ' || p_municipio);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar local: ' || SQLERRM);
END;
/

BEGIN
    atualizar_local_procedure(
        1,
        12270110, -- CEP
        'Rua dos Operários',
        'São José dos Campos',
        305,
        -45.8876,
        -23.1891
    );

    atualizar_local_procedure(
        2,
        13500000,
        'Avenida das Estações',
        'Campinas',
        1001,
        -47.0608,
        -22.9056
    );
END;
/


--Subgrupo
CREATE OR REPLACE PROCEDURE atualizar_subgrupo_desastre_procedure (
    p_id_subgrupo IN NUMBER,
    p_subgrupo    IN VARCHAR2,
    p_tipo        IN VARCHAR2,
    p_subtipo     IN VARCHAR2
)
IS
BEGIN
    IF p_id_subgrupo IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do subgrupo não pode ser nulo');
    END IF;

    UPDATE tb_tge_subgrupo_desastre
    SET
        subgrupo = p_subgrupo,
        tipo     = p_tipo,
        subtipo  = p_subtipo
    WHERE id_subgrupo = p_id_subgrupo;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum subgrupo encontrado com o ID ' || p_id_subgrupo);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Subgrupo de desastre atualizado com sucesso: ' || p_subgrupo);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar subgrupo de desastre: ' || SQLERRM);
END;
/

BEGIN
    atualizar_subgrupo_desastre_procedure(
        1,
        'Inundações Urbanas',
        'Hidrológico',
        'Alagamento Extremo'
    );

    atualizar_subgrupo_desastre_procedure(
        2,
        'Deslizamentos de Terra',
        'Geológico',
        'Movimento de Massa'
    );
END;
/


--Vant
CREATE OR REPLACE PROCEDURE atualizar_vant_procedure (
    p_id_vant           IN NUMBER,
    p_fabricante        IN VARCHAR2,
    p_modelo            IN VARCHAR2,
    p_tempo_voo         IN DATE,
    p_distancia_maxima  IN NUMBER,
    p_velocidade_maxima IN NUMBER,
    p_peso              IN NUMBER,
    p_camera            IN VARCHAR2
)
IS
BEGIN
    IF p_id_vant IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do VANT não pode ser nulo');
    END IF;

    UPDATE tb_tge_vant
    SET
        fabricante        = p_fabricante,
        modelo            = p_modelo,
        tempo_voo         = p_tempo_voo,
        distancia_maxima  = p_distancia_maxima,
        velocidade_maxima = p_velocidade_maxima,
        peso              = p_peso,
        camera            = p_camera
    WHERE id_vant = p_id_vant;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum VANT encontrado com o ID ' || p_id_vant);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('VANT atualizado com sucesso: ' || p_modelo || ' (' || p_fabricante || ')');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar VANT: ' || SQLERRM);
END;
/

BEGIN
    atualizar_vant_procedure(
        1,
        'DJI',
        'Mavic 3 Enterprise',
        TO_DATE('2025-06-01 00:38:00', 'YYYY-MM-DD HH24:MI:SS'),
        150.50,
        72.00,
        0.92,
        'RGB 20MP'
    );

    atualizar_vant_procedure(
        2,
        'Parrot',
        'Anafi USA',
        TO_DATE('2025-06-01 01:20:00', 'YYYY-MM-DD HH24:MI:SS'),
        130.75,
        60.00,
        0.50,
        'Térmica e RGB'
    );
END;
/

--Imagens Capturadas

CREATE OR REPLACE PROCEDURE atualizar_imagem_capturada_procedure (
    p_id_imagem  IN NUMBER,
    p_hospedagem IN VARCHAR2,
    p_tamanho    IN VARCHAR2
)
IS
BEGIN
    IF p_id_imagem IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da imagem não pode ser nulo');
    END IF;

    UPDATE tb_tge_imagens_capturadas
    SET
        hospedagem = p_hospedagem,
        tamanho    = p_tamanho
    WHERE id_imagem = p_id_imagem;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma imagem encontrada com o ID ' || p_id_imagem);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Imagem atualizada com sucesso: ' || p_hospedagem);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar imagem: ' || SQLERRM);
END;
/


BEGIN
    atualizar_imagem_capturada_procedure(
        1,
        'https://cemaden.gov.br/imagens/captura_2025_06_01_10h30.jpg',
        '2.5 MB'
    );

    atualizar_imagem_capturada_procedure(
        2,
        'https://cemaden.gov.br/imagens/desastre_area_norte_2025_06_01.jpg',
        '3.2 MB'
    );
END;
/

--Zona
CREATE OR REPLACE PROCEDURE atualizar_zona_procedure (
    p_id_zona   IN NUMBER,
    p_desc_zona IN VARCHAR2,
    p_populacao IN NUMBER,
    p_porte     IN VARCHAR2
)
IS
BEGIN
    IF p_id_zona IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da zona não pode ser nulo');
    END IF;

    UPDATE tb_tge_zona
    SET
        desc_zona = p_desc_zona,
        populacao = p_populacao,
        porte     = p_porte
    WHERE id_zona = p_id_zona;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma zona encontrada com o ID ' || p_id_zona);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Zona atualizada com sucesso: ' || p_desc_zona);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar zona: ' || SQLERRM);
END;
/

BEGIN
    atualizar_zona_procedure(
        1,
        'Zona Urbana Norte',
        15230,
        'Médio Porte'
    );

    atualizar_zona_procedure(
        2,
        'Zona Rural Leste',
        4310,
        'Pequeno Porte'
    );
END;
/


--Sensores
CREATE OR REPLACE PROCEDURE atualizar_sensor_procedure (
    p_id_sensor               IN NUMBER,
    p_chip                    IN VARCHAR2,
    p_modelo                  IN VARCHAR2,
    p_interface               IN VARCHAR2,
    p_utilidade               IN VARCHAR2,
    p_fabricante              IN VARCHAR2,
    p_estado                  IN VARCHAR2,
    p_saida                   IN VARCHAR2,
    p_tipo_saida              IN VARCHAR2,
    p_media_tensao_registrada IN NUMBER
)
IS
BEGIN
    IF p_id_sensor IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do sensor não pode ser nulo');
    END IF;

    UPDATE tb_tge_sensores
    SET
        chip                    = p_chip,
        modelo                  = p_modelo,
        interface               = p_interface,
        utilidade               = p_utilidade,
        fabricante              = p_fabricante,
        estado                  = p_estado,
        saida                   = p_saida,
        tipo_saida              = p_tipo_saida,
        media_tensao_registrada = p_media_tensao_registrada
    WHERE id_sensor = p_id_sensor;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum sensor encontrado com o ID ' || p_id_sensor);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Sensor atualizado com sucesso: ' || p_modelo);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar sensor: ' || SQLERRM);
END;
/


BEGIN
    atualizar_sensor_procedure(
        1,
        'ESP32-WROOM',
        'DHT22',
        'I2C',
        'Monitoramento de Umidade',
        'Sensirion',
        'Operacional',
        'Digital',
        'PWM',
        3.30
    );

    atualizar_sensor_procedure(
        2,
        'STM32F103',
        'BMP280',
        'SPI',
        'Monitoramento de Pressão Atmosférica',
        'Bosch',
        'Manutenção',
        'Analógica',
        'Analógica',
        5.00
    );
END;
/


--Classificação de Impacto
CREATE OR REPLACE PROCEDURE atualizar_impacto_classificacao_procedure (
    p_id_impacto_classificacao IN NUMBER,
    p_nivel                   IN NUMBER,
    p_desc_nivel              IN VARCHAR2
)
IS
BEGIN
    IF p_id_impacto_classificacao IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da classificação de impacto não pode ser nulo');
    END IF;

    UPDATE tb_tge_impacto_classificacao
    SET
        nivel = p_nivel,
        desc_nivel = p_desc_nivel
    WHERE id_impacto_classificacao = p_id_impacto_classificacao;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhuma classificação de impacto encontrada para o ID ' || p_id_impacto_classificacao);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Classificação de impacto atualizada com sucesso: ' || p_desc_nivel);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar classificação de impacto: ' || SQLERRM);
END;
/

BEGIN
    atualizar_impacto_classificacao_procedure(1, 1, 'Baixo');
    atualizar_impacto_classificacao_procedure(2, 3, 'Alto');
    atualizar_impacto_classificacao_procedure(3, 2, 'Médio');
END;
/


--Impacto Humano
CREATE OR REPLACE PROCEDURE atualizar_impacto_humano_procedure (
    p_id_impacto_humano        IN NUMBER,
    p_id_impacto_classificacao IN NUMBER,
    p_quantidade_afetados      IN NUMBER,
    p_estado_afetados          IN VARCHAR2,
    p_suporte_internacional    IN NUMBER
)
IS
BEGIN
    IF p_id_impacto_humano IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do impacto humano não pode ser nulo');
    END IF;

    UPDATE tb_tge_impacto_humano
    SET
        id_impacto_classificacao = p_id_impacto_classificacao,
        quantidade_afetados = p_quantidade_afetados,
        estado_afetados = p_estado_afetados,
        suporte_internacional = p_suporte_internacional
    WHERE id_impacto_humano = p_id_impacto_humano;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum impacto humano encontrado para o ID ' || p_id_impacto_humano);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Impacto humano atualizado com sucesso para o ID ' || p_id_impacto_humano);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar impacto humano: ' || SQLERRM);
END;
/

BEGIN
    atualizar_impacto_humano_procedure(
        p_id_impacto_humano => 1,
        p_id_impacto_classificacao => 2,
        p_quantidade_afetados => 1500,
        p_estado_afetados => 'São Paulo, Rio de Janeiro',
        p_suporte_internacional => 1
    );

    atualizar_impacto_humano_procedure(
        p_id_impacto_humano => 2,
        p_id_impacto_classificacao => 3,
        p_quantidade_afetados => 300,
        p_estado_afetados => 'Minas Gerais',
        p_suporte_internacional => 0
    );
END;
/


--Impacto Material
CREATE OR REPLACE PROCEDURE atualizar_impacto_material_procedure (
    p_id_impacto_material      IN NUMBER,
    p_id_impacto_classificacao IN NUMBER,
    p_danos_materiais          IN VARCHAR2,
    p_impacto_ambiental        IN VARCHAR2
)
IS
BEGIN
    IF p_id_impacto_material IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do impacto material não pode ser nulo');
    END IF;

    UPDATE tb_tge_impacto_material
    SET
        id_impacto_classificacao = p_id_impacto_classificacao,
        danos_materiais = p_danos_materiais,
        impacto_ambiental = p_impacto_ambiental
    WHERE id_impacto_material = p_id_impacto_material;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum impacto material encontrado para o ID ' || p_id_impacto_material);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Impacto material atualizado com sucesso para o ID ' || p_id_impacto_material);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar impacto material: ' || SQLERRM);
END;
/

BEGIN
    atualizar_impacto_material_procedure(
        p_id_impacto_material => 1,
        p_id_impacto_classificacao => 2,
        p_danos_materiais => 'Danos estruturais severos',
        p_impacto_ambiental => 'Contaminação de solo e água'
    );

    atualizar_impacto_material_procedure(
        p_id_impacto_material => 2,
        p_id_impacto_classificacao => 1,
        p_danos_materiais => 'Perda de equipamentos eletrônicos',
        p_impacto_ambiental => 'Poluição atmosférica temporária'
    );
END;
/


--Impacto
CREATE OR REPLACE PROCEDURE atualizar_impacto_procedure (
    p_id_impacto          IN NUMBER,
    p_id_impacto_material IN NUMBER,
    p_id_impacto_humano   IN NUMBER,
    p_impacto             IN VARCHAR2
)
IS
BEGIN
    IF p_id_impacto IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do impacto não pode ser nulo');
    END IF;

    UPDATE tb_tge_impacto
    SET
        id_impacto_material = p_id_impacto_material,
        id_impacto_humano = p_id_impacto_humano,
        impacto = p_impacto
    WHERE id_impacto = p_id_impacto;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum impacto encontrado para o ID ' || p_id_impacto);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Impacto atualizado com sucesso para o ID ' || p_id_impacto);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar impacto: ' || SQLERRM);
END;
/

BEGIN
    atualizar_impacto_procedure(
        p_id_impacto => 1,
        p_id_impacto_material => 1,
        p_id_impacto_humano => 1,
        p_impacto => 'Danos significativos'
    );

    atualizar_impacto_procedure(
        p_id_impacto => 2,
        p_id_impacto_material => 2,
        p_id_impacto_humano => 2,
        p_impacto => 'Impacto moderado'
    );
END;
/


--Desastre
CREATE OR REPLACE PROCEDURE atualizar_desastre_procedure (
    p_id_desastre       IN NUMBER,
    p_id_local          IN NUMBER,
    p_id_impacto        IN NUMBER,
    p_id_grupo_desastre IN NUMBER,
    p_id_usuario        IN NUMBER,
    p_cobrade           IN NUMBER,
    p_data_ocorrencia   IN DATE
)
IS
BEGIN
    IF p_id_desastre IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do desastre não pode ser nulo');
    END IF;

    UPDATE tb_tge_desastre
    SET
        id_local = p_id_local,
        id_impacto = p_id_impacto,
        id_grupo_desastre = p_id_grupo_desastre,
        id_usuario = p_id_usuario,
        cobrade = p_cobrade,
        data_ocorrencia = p_data_ocorrencia
    WHERE id_desastre = p_id_desastre;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum desastre encontrado para o ID ' || p_id_desastre);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Desastre atualizado com sucesso para o ID ' || p_id_desastre);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar desastre: ' || SQLERRM);
END;
/

BEGIN
    atualizar_desastre_procedure(
        p_id_desastre => 1,
        p_id_local => 1,
        p_id_impacto => 1,
        p_id_grupo_desastre => 1,
        p_id_usuario => 1,
        p_cobrade => 12345,
        p_data_ocorrencia => TO_DATE('2025-05-15', 'YYYY-MM-DD')
    );

    atualizar_desastre_procedure(
        p_id_desastre => 2,
        p_id_local => 2,
        p_id_impacto => 2,
        p_id_grupo_desastre => 2,
        p_id_usuario => 2,
        p_cobrade => 67890,
        p_data_ocorrencia => TO_DATE('2025-06-01', 'YYYY-MM-DD')
    );
END;
/


--Terreno Desastr
CREATE OR REPLACE PROCEDURE atualizar_terreno_desastre_procedure (
    p_id_terreno_desastre IN NUMBER,
    p_id_desastre         IN NUMBER,
    p_id_terreno          IN NUMBER
)
IS
BEGIN
    IF p_id_terreno_desastre IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do terreno desastre não pode ser nulo');
    END IF;

    UPDATE tb_tge_terreno_desastre
    SET
        id_desastre = p_id_desastre,
        id_terreno = p_id_terreno
    WHERE id_terreno_desastre = p_id_terreno_desastre;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado para o ID ' || p_id_terreno_desastre);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso para o ID ' || p_id_terreno_desastre);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar terreno desastre: ' || SQLERRM);
END;
/

BEGIN
    atualizar_terreno_desastre_procedure(
        p_id_terreno_desastre => 1,
        p_id_desastre => 10,
        p_id_terreno => 5
    );

    atualizar_terreno_desastre_procedure(
        p_id_terreno_desastre => 2,
        p_id_desastre => 11,
        p_id_terreno => 6
    );
END;
/

--Grupo Desastre
CREATE OR REPLACE PROCEDURE atualizar_grupo_desastre_procedure (
    p_id_grupo_desastre IN INTEGER,
    p_id_subgrupo       IN INTEGER,
    p_grupo             IN VARCHAR2
)
IS
BEGIN
    IF p_id_grupo_desastre IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do grupo desastre não pode ser nulo');
    END IF;

    UPDATE tb_tge_grupo_desastre
    SET
        id_subgrupo = p_id_subgrupo,
        grupo = p_grupo
    WHERE id_grupo_desastre = p_id_grupo_desastre;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado para o ID ' || p_id_grupo_desastre);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso para o ID ' || p_id_grupo_desastre);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar grupo desastre: ' || SQLERRM);
END;
/

BEGIN
    atualizar_grupo_desastre_procedure(
        p_id_grupo_desastre => 1,
        p_id_subgrupo => 3,
        p_grupo => 'Desastre Natural'
    );
END;
/

--Vant Imagem
CREATE OR REPLACE PROCEDURE atualizar_tb_tge_vant_imagens_procedure (
    p_id_vant_imagem IN INTEGER,
    p_id_imagem      IN INTEGER,
    p_id_vant        IN INTEGER
)
IS
BEGIN

    IF p_id_vant_imagem IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do vant_imagem não pode ser nulo.');
    END IF;

    UPDATE tb_tge_vant_imagens
    SET
        id_imagem = p_id_imagem,
        id_vant = p_id_vant
    WHERE id_vant_imagem = p_id_vant_imagem;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado com o ID ' || p_id_vant_imagem);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso: ID ' || p_id_vant_imagem);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tb_tge_vant_imagens: ' || SQLERRM);
END;
/

BEGIN
    atualizar_tb_tge_vant_imagens_procedure(1, 20, 10);
    atualizar_tb_tge_vant_imagens_procedure(2, 25, 15);
END;
/


--Desastre Vant
CREATE OR REPLACE PROCEDURE atualizar_tb_tge_desastre_vant_procedure (
    p_id_desastre_vant IN INTEGER,
    p_id_desastre      IN INTEGER,
    p_id_vant          IN INTEGER
)
IS
BEGIN

    IF p_id_desastre_vant IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do desastre vant não pode ser nulo.');
    END IF;

    UPDATE tb_tge_desastre_vant
    SET 
        id_desastre = p_id_desastre,
        id_vant = p_id_vant
    WHERE id_desastre_vant = p_id_desastre_vant;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado com o ID ' || p_id_desastre_vant);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso: ID ' || p_id_desastre_vant);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tb_tge_desastre_vant: ' || SQLERRM);
END;
/

BEGIN
    atualizar_tb_tge_desastre_vant_procedure(1, 10, 20);
    atualizar_tb_tge_desastre_vant_procedure(5, 15, 25);
END;
/

--Desastre Zona
CREATE OR REPLACE PROCEDURE atualizar_tb_tge_desastre_zona_procedure (
    p_id_desastre_zona IN INTEGER,
    p_id_zona          IN INTEGER,
    p_id_desastre      IN INTEGER
)
IS
BEGIN

    IF p_id_desastre_zona IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do desastre zona não pode ser nulo.');
    END IF;

    UPDATE tb_tge_desastre_zona
    SET
        id_zona = p_id_zona,
        id_desastre = p_id_desastre
    WHERE id_desastre_zona = p_id_desastre_zona;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado com o ID ' || p_id_desastre_zona);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso: ID ' || p_id_desastre_zona);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tb_tge_desastre_zona: ' || SQLERRM);
END;
/

BEGIN
    atualizar_tb_tge_desastre_zona_procedure(1, 3, 10);
    atualizar_tb_tge_desastre_zona_procedure(2, 4, 15);
END;
/


--Incêndio Florestal
CREATE OR REPLACE PROCEDURE atualizar_tb_tge_incendio_florestal_procedure (
    p_id_incendio              IN INTEGER,
    p_id_impacto_classificacao IN INTEGER,
    p_causa                    IN VARCHAR2,
    p_tipo_incendio            IN VARCHAR2
)
IS
BEGIN
    IF p_id_incendio IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do incêndio não pode ser nulo.');
    END IF;

    UPDATE tb_tge_incendio_florestal
    SET
        id_impacto_classificacao = p_id_impacto_classificacao,
        causa = p_causa,
        tipo_incendio = p_tipo_incendio
    WHERE id_incendio = p_id_incendio;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado com o ID ' || p_id_incendio);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso: ID ' || p_id_incendio);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tb_tge_incendio_florestal: ' || SQLERRM);
END;
/

BEGIN
    atualizar_tb_tge_incendio_florestal_procedure(1, 2, 'Causa Exemplo', 'Tipo Exemplo');
    atualizar_tb_tge_incendio_florestal_procedure(2, 3, 'Causa Teste', 'Tipo Teste');
END;
/


--Deslizamento
CREATE OR REPLACE PROCEDURE atualizar_tb_tge_deslizamento_procedure (
    p_id_deslizamento          IN INTEGER,
    p_id_impacto_classificacao IN INTEGER,
    p_umidade_solo             IN NUMBER
)
IS
BEGIN
    IF p_id_deslizamento IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do deslizamento não pode ser nulo.');
    END IF;

    UPDATE tb_tge_deslizamento
    SET
        id_impacto_classificacao = p_id_impacto_classificacao,
        umidade_solo = p_umidade_solo
    WHERE id_deslizamento = p_id_deslizamento;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado com o ID ' || p_id_deslizamento);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso: ID ' || p_id_deslizamento);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tb_tge_deslizamento: ' || SQLERRM);
END;
/

BEGIN
    atualizar_tb_tge_deslizamento_procedure(1, 3, 45.75);
    atualizar_tb_tge_deslizamento_procedure(2, 2, 30.50);
END;
/

--Inundação
CREATE OR REPLACE PROCEDURE atualizar_tb_tge_inundacao_procedure (
    p_id_inundacao             IN INTEGER,
    p_id_impacto_classificacao IN INTEGER,
    p_causa                   IN VARCHAR2,
    p_metros                  IN NUMBER
)
IS
BEGIN
    IF p_id_inundacao IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da inundação não pode ser nulo.');
    END IF;

    UPDATE tb_tge_inundacao
    SET
        id_impacto_classificacao = p_id_impacto_classificacao,
        causa = p_causa,
        metros = p_metros
    WHERE id_inundacao = p_id_inundacao;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado com o ID ' || p_id_inundacao);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso: ID ' || p_id_inundacao);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tb_tge_inundacao: ' || SQLERRM);
END;
/

BEGIN
    atualizar_tb_tge_inundacao_procedure(1, 2, 'Chuva forte e transbordamento', 3.5);
END;
/

--Seca
CREATE OR REPLACE PROCEDURE atualizar_tb_tge_seca_procedure (
    p_id_seca                  IN INTEGER,
    p_id_impacto_classificacao IN INTEGER,
    p_temperatura              IN NUMBER,
    p_medida                   IN VARCHAR2,
    p_umidade_solo             IN NUMBER
)
IS
BEGIN
    IF p_id_seca IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID da seca não pode ser nulo.');
    END IF;

    UPDATE tb_tge_seca
    SET
        id_impacto_classificacao = p_id_impacto_classificacao,
        temperatura = p_temperatura,
        medida = p_medida,
        umidade_solo = p_umidade_solo
    WHERE id_seca = p_id_seca;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado com o ID ' || p_id_seca);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso: ID ' || p_id_seca);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tb_tge_seca: ' || SQLERRM);
END;
/

BEGIN
    atualizar_tb_tge_seca_procedure(1, 2, 38.5, '°C', 15.7);
    atualizar_tb_tge_seca_procedure(2, 3, 40.0, '°C', 12.3);
END;
/


--Desastre Sensores
CREATE OR REPLACE PROCEDURE atualizar_tb_tge_desastre_sensores_procedure (
    p_id_desastre_sensor IN INTEGER,
    p_id_sensor          IN INTEGER,
    p_id_desastre        IN INTEGER
)
IS
BEGIN
    IF p_id_desastre_sensor IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID do desastre sensor não pode ser nulo.');
    END IF;

    UPDATE tb_tge_desastre_sensores
    SET
        id_sensor = p_id_sensor,
        id_desastre = p_id_desastre
    WHERE id_desastre_sensor = p_id_desastre_sensor;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado com o ID ' || p_id_desastre_sensor);
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Registro atualizado com sucesso: ID ' || p_id_desastre_sensor);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar tb_tge_desastre_sensores: ' || SQLERRM);
END;
/

BEGIN
    atualizar_tb_tge_desastre_sensores_procedure(1, 10, 5);
    atualizar_tb_tge_desastre_sensores_procedure(2, 15, 6);
END;
/
