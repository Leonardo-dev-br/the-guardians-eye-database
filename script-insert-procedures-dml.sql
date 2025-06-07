/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/

SET SERVEROUTPUT ON
-- INSER��O
--Terrno Geografico
CREATE OR REPLACE PROCEDURE inserir_tb_tge_terreno_geografico_procedure (
    p_terreno IN VARCHAR2
)
IS
BEGIN
    INSERT INTO tb_tge_terreno_geografico (terreno)
    VALUES (p_terreno);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Terreno "' || p_terreno || '" inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir terreno: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_terreno_geografico_procedure('Plan�cie');
    inserir_tb_tge_terreno_geografico_procedure('Depress�o');
    inserir_tb_tge_terreno_geografico_procedure('Colina');
    inserir_tb_tge_terreno_geografico_procedure('Chapada');
    inserir_tb_tge_terreno_geografico_procedure('Morro');
    inserir_tb_tge_terreno_geografico_procedure('Montanha');
    inserir_tb_tge_terreno_geografico_procedure('Vale');
END;
/


--Usuario
CREATE OR REPLACE PROCEDURE inserir_tb_tge_usuario_procedure (
    p_nome_usuario IN VARCHAR2,
    p_sobrenome    IN VARCHAR2,
    p_cpf          IN INTEGER,
    p_cargo        IN VARCHAR2,
    p_funcao       IN VARCHAR2,
    p_email        IN VARCHAR2,
    p_senha        IN VARCHAR2
)
IS
BEGIN
    INSERT INTO tb_tge_usuario (
        nome_usuario,
        sobrenome,
        cpf,
        cargo,
        funcao,
        email,
        senha
    ) VALUES (
        p_nome_usuario,
        p_sobrenome,
        p_cpf,
        p_cargo,
        p_funcao,
        p_email,
        p_senha
    );
    
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Usu�rio "' || p_nome_usuario || '" inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir usu�rio: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_usuario_procedure(
        'Ana', 'Souza Lima', 12345678901, 'Engenheira Ambiental', 'Coleta de Dados', 'ana.lima@exemplo.com', 'senhaAna2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Bruno', 'Ferreira Santos', 22345678902, 'Ge�grafo', 'Mapeamento de �reas', 'bruno.ferreira@exemplo.com', 'senhaBruno2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Carla', 'Oliveira Mendes', 32345678903, 'Analista', 'Gest�o de Riscos', 'carla.mendes@exemplo.com', 'senhaCarla2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Daniel', 'Pereira Costa', 42345678904, 'Tecn�logo', 'Monitoramento Clim�tico', 'daniel.costa@exemplo.com', 'senhaDaniel2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Eduarda', 'Nunes Rocha', 52345678905, 'Coordenadora', 'Acompanhamento de Projetos', 'eduarda.rocha@exemplo.com', 'senhaEduarda2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Felipe', 'Silva Martins', 62345678906, 'T�cnico', 'Instala��o de Sensores', 'felipe.martins@exemplo.com', 'senhaFelipe2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Giovana', 'Barros Almeida', 72345678907, 'Bi�loga', 'An�lise de Impacto', 'giovana.almeida@exemplo.com', 'senhaGiovana2025'
    );
END;
/

--Local
CREATE OR REPLACE PROCEDURE inserir_tb_tge_local_procedure (
    p_cep       IN INTEGER,
    p_endereco  IN VARCHAR2,
    p_municipio IN VARCHAR2,
    p_numero    IN INTEGER,
    p_longitude IN NUMBER,
    p_latitude IN NUMBER
)
IS
BEGIN
    INSERT INTO tb_tge_local (
        cep,
        endereco,
        municipio,
        numero,
        longitude,
        latitude
    ) VALUES (
        p_cep,
        p_endereco,
        p_municipio,
        p_numero,
        p_longitude,
        p_latitude
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Local inserido com sucesso: ' || p_endereco || ', ' || p_numero || ' - ' || p_municipio || ' (CEP: ' || p_cep || ')');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir local: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_local_procedure(12345678, 'Rua S�o Pualo', 'Ibi�na', 120, -48.0972, -134.2266);
    inserir_tb_tge_local_procedure(23456789, 'Av. Brasil', 'Sorocaba', 45, -30.1653, -7.0289);
    inserir_tb_tge_local_procedure(34567890, 'Rua S�o Jo�o', 'Cotia', 221, -21.7678, -106.9430);
    inserir_tb_tge_local_procedure(45678901, 'Alameda das Flores', 'Votorantim', 305, -21.2467, 110.1850);
    inserir_tb_tge_local_procedure(56789012, 'Travessa do Sol', 'S�o Roque', 88, 73.5046, -18.3137);
    inserir_tb_tge_local_procedure(67890123, 'Rua Aurora', 'Itu', 133, 1.0334, -116.3303);
    inserir_tb_tge_local_procedure(78901234, 'Rua dos Pinhais', 'Jundia�', 77, 88.2035, 68.1825);
END;
/


--Subgrupo
CREATE OR REPLACE PROCEDURE inserir_tb_tge_subgrupo_desastre_procedure (
    p_subgrupo IN VARCHAR2,
    p_tipo     IN VARCHAR2,
    p_subtipo  IN VARCHAR2
)
IS
BEGIN
    INSERT INTO tb_tge_subgrupo_desastre (
        subgrupo,
        tipo,
        subtipo
    ) VALUES (
        p_subgrupo,
        p_tipo,
        p_subtipo
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Subgrupo inserido com sucesso: ' || p_subgrupo || ' | Tipo: ' || p_tipo || ' | Subtipo: ' || p_subtipo);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir subgrupo: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_subgrupo_desastre_procedure('1. Terremoto', 'Tremor de terra', '0');
    inserir_tb_tge_subgrupo_desastre_procedure('2. Movimento de massa', 'Deslizamento', 'Desmoronamento');
    inserir_tb_tge_subgrupo_desastre_procedure('3. Inunda��o', 'Enchente', 'Inunda��o lenta');
    inserir_tb_tge_subgrupo_desastre_procedure('4. Inc�ndio', 'Florestal', '0');
    inserir_tb_tge_subgrupo_desastre_procedure('5. Eros�o', 'Marinha', '0');
    inserir_tb_tge_subgrupo_desastre_procedure('6. Tempestade', 'Granizo', '0');
    inserir_tb_tge_subgrupo_desastre_procedure('7. Estiagem', 'Seca Prolongada', '0');
END;
/

--Vant
CREATE OR REPLACE PROCEDURE inserir_tb_tge_vant_procedure (
    p_fabricante        IN VARCHAR2,
    p_modelo            IN VARCHAR2,
    p_tempo_voo         IN DATE,
    p_distancia_maxima  IN NUMBER,
    p_velocidade_maxima IN NUMBER,
    p_peso              IN NUMBER DEFAULT NULL,
    p_camera            IN VARCHAR2 DEFAULT NULL
)
IS
BEGIN
    INSERT INTO tb_tge_vant (
        fabricante,
        modelo,
        tempo_voo,
        distancia_maxima,
        velocidade_maxima,
        peso,
        camera
    ) VALUES (
        p_fabricante,
        p_modelo,
        p_tempo_voo,
        p_distancia_maxima,
        p_velocidade_maxima,
        p_peso,
        p_camera
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('VANT inserido com sucesso: ' || p_modelo || ' - ' || p_fabricante);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir VANT: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_vant_procedure(
        p_fabricante        => 'DJI',
        p_modelo            => 'Phantom 4',
        p_tempo_voo         => TO_DATE('00:30:00', 'HH24:MI:SS'),
        p_distancia_maxima  => 5.00,
        p_velocidade_maxima => 72.00,
        p_peso              => 1.38,
        p_camera            => '4K 20MP'
    );

    inserir_tb_tge_vant_procedure(
        p_fabricante        => 'Parrot',
        p_modelo            => 'Anafi',
        p_tempo_voo         => TO_DATE('00:25:00', 'HH24:MI:SS'),
        p_distancia_maxima  => 4.00,
        p_velocidade_maxima => 55.00,
        p_peso              => 0.32,
        p_camera            => '4K HDR'
    );
    
    inserir_tb_tge_vant_procedure(
        p_fabricante        => 'Autel Robotics',
        p_modelo            => 'EVO II Pro',
        p_tempo_voo         => TO_DATE('00:40:00', 'HH24:MI:SS'),
        p_distancia_maxima  => 9.00,
        p_velocidade_maxima => 72.00,
        p_peso              => 1.19,
        p_camera            => '6K HDR'
    );

    inserir_tb_tge_vant_procedure(
        p_fabricante        => 'Yuneec',
        p_modelo            => 'Typhoon H Plus',
        p_tempo_voo         => TO_DATE('00:28:00', 'HH24:MI:SS'),
        p_distancia_maxima  => 5.50,
        p_velocidade_maxima => 70.00,
        p_peso              => 1.80,
        p_camera            => '4K 20MP'
    );

    inserir_tb_tge_vant_procedure(
        p_fabricante        => 'Skydio',
        p_modelo            => 'Skydio 2+',
        p_tempo_voo         => TO_DATE('00:27:00', 'HH24:MI:SS'),
        p_distancia_maxima  => 6.00,
        p_velocidade_maxima => 58.00,
        p_peso              => 0.80,
        p_camera            => '4K60 HDR'
    );

    inserir_tb_tge_vant_procedure(
        p_fabricante        => 'DJI',
        p_modelo            => 'Mavic Air 2',
        p_tempo_voo         => TO_DATE('00:34:00', 'HH24:MI:SS'),
        p_distancia_maxima  => 6.20,
        p_velocidade_maxima => 68.00,
        p_peso              => 0.57,
        p_camera            => '48MP 4K'
    );

    inserir_tb_tge_vant_procedure(
        p_fabricante        => 'Parrot',
        p_modelo            => 'Disco-Pro AG',
        p_tempo_voo         => TO_DATE('00:45:00', 'HH24:MI:SS'),
        p_distancia_maxima  => 10.00,
        p_velocidade_maxima => 80.00,
        p_peso              => 0.75,
        p_camera            => 'Sequoia multispectral'
    );
END;
/


--Imagens Capturadas
CREATE OR REPLACE PROCEDURE inserir_tb_tge_imagens_capturadas_procedure (
    p_hospedagem IN VARCHAR2,
    p_tamanho    IN VARCHAR2
)
IS
BEGIN
    INSERT INTO tb_tge_imagens_capturadas (
        hospedagem,
        tamanho
    ) VALUES (
        p_hospedagem,
        p_tamanho
    );
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Imagem inserida com sucesso em: ' || p_hospedagem || ' com ' || p_tamanho || 'de tamanho');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Imagem: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_imagens_capturadas_procedure(
        p_hospedagem => 'https://cdn.desastres.org/imagens/terremoto-2025_01.jpg',
        p_tamanho    => '3.2MB'
    );

    inserir_tb_tge_imagens_capturadas_procedure(
        p_hospedagem => 'https://cdn.desastres.org/imagens/enchente_norte_02.png',
        p_tamanho    => '2.8MB'
    );

    inserir_tb_tge_imagens_capturadas_procedure(
        p_hospedagem => 'https://cloud.mapeamento.gov.br/imgs/deslizamento_abril.jpg',
        p_tamanho    => '4.1MB'
    );

    inserir_tb_tge_imagens_capturadas_procedure(
        p_hospedagem => 'https://imagens.resgatedigital.net/ciclone_sul_2024.jpg',
        p_tamanho    => '3.5MB'
    );

    inserir_tb_tge_imagens_capturadas_procedure(
        p_hospedagem => 'https://imagens.monitoramento.io/fogo_floresta2025.jpg',
        p_tamanho    => '5.0MB'
    );

    inserir_tb_tge_imagens_capturadas_procedure(
        p_hospedagem => 'https://cdn.geoanalise.gov/media/queda_barreiras_2025.png',
        p_tamanho    => '2.6MB'
    );

    inserir_tb_tge_imagens_capturadas_procedure(
        p_hospedagem => 'https://dados.abertos.io/desastres/estudo_meteorologico.jpeg',
        p_tamanho    => '3.9MB'
    );
END;
/

--Zona
CREATE OR REPLACE PROCEDURE inserir_tb_tge_zona_procedure ( 
    p_desc_zona IN VARCHAR2,
    p_populacao IN INTEGER,
    p_porte     IN VARCHAR2
)
IS
BEGIN
    INSERT INTO tb_tge_zona (
        desc_zona,
        populacao,
        porte
    ) VALUES (
        p_desc_zona,
        p_populacao,
        p_porte
    );
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Zona inserida com sucesso: ' || p_desc_zona || ' com popula��o de: ' || p_populacao || ' e porte: ' || p_porte);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir zona: ' || SQLERRM);
END;
/


BEGIN
    inserir_tb_tge_zona_procedure('Zona Norte', 150000, 'Grande');
    inserir_tb_tge_zona_procedure('Zona Sul', 98000, 'M�dia');
    inserir_tb_tge_zona_procedure('Zona Leste', 200000, 'Grande');
    inserir_tb_tge_zona_procedure('Zona Oeste', 75000, 'M�dia');
    inserir_tb_tge_zona_procedure('Zona Central', 120000, 'Grande');
    inserir_tb_tge_zona_procedure('Zona Rural', 30000, 'Pequena');
    inserir_tb_tge_zona_procedure('Zona Costeira', 56000, 'Pequena');
END;
/


--Sensores
CREATE OR REPLACE PROCEDURE inserir_tb_tge_sensores_procedure (
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
    INSERT INTO tb_tge_sensores (
        chip,
        modelo,
        interface,
        utilidade,
        fabricante,
        estado,
        saida,
        tipo_saida,
        media_tensao_registrada
    ) VALUES (
        p_chip,
        p_modelo,
        p_interface,
        p_utilidade,
        p_fabricante,
        p_estado,
        p_saida,
        p_tipo_saida,
        p_media_tensao_registrada
    );
    
     COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Sensor inserida com sucesso: ' || p_chip || ' - ' || p_interface);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Sensor: ' || SQLERRM);
END;
/


BEGIN
    inserir_tb_tge_sensores_procedure('CHP-001', 'SM300', 'I2C', 'Umidade do Solo', 'AgroTech', 'Ativo', 'Digital', '0-1V', 3.30);
    inserir_tb_tge_sensores_procedure('CHP-002', 'YL69', 'Anal�gica', 'Umidade do Solo', 'SoilSense', 'Ativo', 'Anal�gica', '0-5V', 2.80);
    inserir_tb_tge_sensores_procedure('CHP-003', 'DHT11', 'Digital', 'Umidade do Ar', 'SensorCorp', 'Ativo', 'Digital', '0-1V', 3.10);
    inserir_tb_tge_sensores_procedure('CHP-004', 'DHT22', 'Digital', 'Umidade do Ar', 'SensorCorp', 'Ativo', 'Digital', '0-1V', 3.50);
    inserir_tb_tge_sensores_procedure('CHP-005', 'FC28', 'Anal�gica', 'Umidade do Solo', 'AgroTech', 'Ativo', 'Anal�gica', '0-3.3V', 2.60);
    inserir_tb_tge_sensores_procedure('CHP-006', 'HS1101', 'PWM', 'Umidade do Ar', 'ClimaSensor', 'Ativo', 'PWM', 'Modulada', 3.00);
    inserir_tb_tge_sensores_procedure('CHP-007', 'SEN0193', 'I2C', 'Condutividade do Solo', 'DFRobot', 'Ativo', 'Digital', '0-5V', 2.90);
END;
/

--Classifica��o de Impacto
CREATE OR REPLACE PROCEDURE inserir_tb_tge_impacto_classificacao_procedure (
    p_nivel      IN INTEGER,
    p_desc_nivel IN VARCHAR2
)
IS
BEGIN
    INSERT INTO tb_tge_impacto_classificacao (
        nivel,
        desc_nivel
    ) VALUES (
        p_nivel,
        p_desc_nivel
    );
     
     COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Classifica��o do Impacto inserida com sucesso: ' || p_nivel || ' - ' || p_desc_nivel);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Classifica��o do Impacto: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_impacto_classificacao_procedure(1, 'Sem Impacto');
    inserir_tb_tge_impacto_classificacao_procedure(2, 'Impacto Leve');
    inserir_tb_tge_impacto_classificacao_procedure(3, 'Impacto Moderado');
    inserir_tb_tge_impacto_classificacao_procedure(4, 'Impacto Relevante');
    inserir_tb_tge_impacto_classificacao_procedure(5, 'Impacto Grave');
    inserir_tb_tge_impacto_classificacao_procedure(6, 'Impacto Muito Grave');
    inserir_tb_tge_impacto_classificacao_procedure(7, 'Impacto Catastr�fico');
END;
/


--Impacto Humano
CREATE OR REPLACE PROCEDURE inserir_tb_tge_impacto_humano_procedure (
    p_id_impacto_classificacao IN INTEGER,
    p_quantidade_afetados      IN INTEGER,
    p_estado_afetados          IN VARCHAR2,
    p_suporte_internacional    IN INTEGER
)
IS
BEGIN
    INSERT INTO tb_tge_impacto_humano (
        id_impacto_classificacao,
        quantidade_afetados,
        estado_afetados,
        suporte_internacional
    ) VALUES (
        p_id_impacto_classificacao,
        p_quantidade_afetados,
        p_estado_afetados,
        p_suporte_internacional
    );
    
      COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Impacto Humano inserido com sucesso: ' || p_id_impacto_classificacao || ' Afetados:  ' || p_quantidade_afetados || 'com o estado: ' || p_estado_afetados);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Impacto Humano: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_impacto_humano_procedure(1, 0, 'Popula��o preservada', 0);
    inserir_tb_tge_impacto_humano_procedure(2, 15, 'Ferimentos leves e apoio local', 0);
    inserir_tb_tge_impacto_humano_procedure(3, 80, 'Deslocamento e pequenos traumas', 0);
    inserir_tb_tge_impacto_humano_procedure(4, 200, 'Evacua��o de �rea urbana parcial', 0);
    inserir_tb_tge_impacto_humano_procedure(5, 500, 'Popula��o em abrigos e feridos graves', 1);
    inserir_tb_tge_impacto_humano_procedure(6, 1200, 'Mortes registradas, sistema de sa�de sobrecarregado', 1);
    inserir_tb_tge_impacto_humano_procedure(7, 5000, 'Regi�o colapsada, ajuda humanit�ria internacional', 1);
END;
/


--Impacto Material
CREATE OR REPLACE PROCEDURE inserir_tb_tge_impacto_material_procedure (
    p_id_impacto_classificacao INTEGER,
    p_danos_materiais          VARCHAR2,
    p_impacto_ambiental        VARCHAR2
) AS
BEGIN
    INSERT INTO tb_tge_impacto_material (
        id_impacto_classificacao,
        danos_materiais,
        impacto_ambiental
    ) VALUES (
        p_id_impacto_classificacao,
        p_danos_materiais,
        p_impacto_ambiental
    );
      COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Impacto Material inserido com sucesso ');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Impacto Material: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_impacto_material_procedure(1, 'Nenhum dano', 'Ambiente preservado');
    inserir_tb_tge_impacto_material_procedure(2, 'Pequenos danos', 'Res�duos e sujeira localizada');
    inserir_tb_tge_impacto_material_procedure(3, 'Danifica��o de estruturas leves', 'Polui��o localizada no solo ou �gua');
    inserir_tb_tge_impacto_material_procedure(4, 'Destrui��o parcial de edifica��es', 'Comprometimento de �reas urbanas e verdes');
    inserir_tb_tge_impacto_material_procedure(5, 'Colapso de estruturas e rodovias', 'Contamina��o de solo e mananciais');
    inserir_tb_tge_impacto_material_procedure(6, 'Infraestrutura severamente comprometida', 'Desmatamento e destrui��o de ecossistemas locais');
    inserir_tb_tge_impacto_material_procedure(7, 'Destrui��o em massa', 'Colapso ecol�gico, perda de biodiversidade e risco ambiental global');
END;
/



--Impacto
CREATE OR REPLACE PROCEDURE inserir_tb_tge_impacto_procedure (
    p_id_impacto_material INTEGER,
    p_id_impacto_humano   INTEGER,
    p_impacto             VARCHAR2
) AS
BEGIN
    INSERT INTO tb_tge_impacto (
        id_impacto,
        id_impacto_material,
        id_impacto_humano,
        impacto
    ) VALUES (
        NULL,
        p_id_impacto_material,
        p_id_impacto_humano,
        p_impacto
    );
      COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Impacto inserido com sucesso ');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Impacto: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_impacto_procedure(1, 1, 'Sem Impacto');
    inserir_tb_tge_impacto_procedure(2, 2, 'Impacto Leve');
    inserir_tb_tge_impacto_procedure(3, 3, 'Impacto Moderado');
    inserir_tb_tge_impacto_procedure(4, 4, 'Impacto Relevante');
    inserir_tb_tge_impacto_procedure(5, 5, 'Impacto Grave');
    inserir_tb_tge_impacto_procedure(6, 6, 'Impacto Muito Grave');
    inserir_tb_tge_impacto_procedure(7, 7, 'Impacto Catastr�fico');
END;
/


--Grupo Desastre
CREATE OR REPLACE PROCEDURE inserir_tb_tge_grupo_desastre_procedure (
  p_id_grupo_desastre IN NUMBER,
  p_id_subgrupo       IN NUMBER,
  p_grupo             IN VARCHAR2
)
IS
BEGIN
  INSERT INTO tb_tge_grupo_desastre (
    id_grupo_desastre,
    id_subgrupo,
    grupo
  ) VALUES (
    p_id_grupo_desastre,
    p_id_subgrupo,
    p_grupo
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso ');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir  ' || SQLERRM);
END;
/


BEGIN
  inserir_tb_tge_grupo_desastre_procedure(1, 1, 'Inunda��es Urbanas');
  inserir_tb_tge_grupo_desastre_procedure(2, 1, 'Inunda��es Rurais');
  inserir_tb_tge_grupo_desastre_procedure(3, 2, 'Deslizamento em Encostas');
  inserir_tb_tge_grupo_desastre_procedure(4, 2, 'Desmoronamento de Rochas');
  inserir_tb_tge_grupo_desastre_procedure(5, 3, 'Secas Agr�colas');
  inserir_tb_tge_grupo_desastre_procedure(6, 3, 'Estresse H�drico');
  inserir_tb_tge_grupo_desastre_procedure(7, 4, 'Ciclones Tropicais');
END;
/



--Desastre
CREATE OR REPLACE PROCEDURE inserir_tb_tge_desastre_procedure (
    p_id_local          IN tb_tge_desastre.id_local%TYPE,
    p_id_impacto        IN tb_tge_desastre.id_impacto%TYPE,
    p_id_grupo_desastre IN tb_tge_desastre.id_grupo_desastre%TYPE,
    p_id_usuario        IN tb_tge_desastre.id_usuario%TYPE,
    p_cobrade           IN tb_tge_desastre.cobrade%TYPE,
    p_data_ocorrencia   IN tb_tge_desastre.data_ocorrencia%TYPE
)
IS
BEGIN
    INSERT INTO tb_tge_desastre (
        id_local,
        id_impacto,
        id_grupo_desastre,
        id_usuario,
        cobrade,
        data_ocorrencia
    )
    VALUES (
        p_id_local,
        p_id_impacto,
        p_id_grupo_desastre,
        p_id_usuario,
        p_cobrade,
        p_data_ocorrencia
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso na tb_tge_desastre.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir na tb_tge_desastre: ' || SQLERRM);
END;
/


BEGIN
  inserir_tb_tge_desastre_procedure(
    p_id_local          => 1,
    p_id_impacto        => 1,
    p_id_grupo_desastre => 1,
    p_id_usuario        => 1,
    p_cobrade           => 11110,
    p_data_ocorrencia   => TO_DATE('2025-06-03', 'YYYY-MM-DD')
  );
  
  inserir_tb_tge_desastre_procedure(
    p_id_local          => 1,
    p_id_impacto        => 2,
    p_id_grupo_desastre => 1,
    p_id_usuario        => 2,
    p_cobrade           => 12110,
    p_data_ocorrencia   => TO_DATE('2025-06-03', 'YYYY-MM-DD')
  );
  
   inserir_tb_tge_desastre_procedure(
    p_id_local          => 1,
    p_id_impacto        => 1,
    p_id_grupo_desastre => 4,
    p_id_usuario        => 3,
    p_cobrade           => 11410,
    p_data_ocorrencia   => TO_DATE('2025-06-11', 'YYYY-MM-DD')
  );
  
  inserir_tb_tge_desastre_procedure(
    p_id_local          => 1,
    p_id_impacto        => 3,
    p_id_grupo_desastre => 1,
    p_id_usuario        => 4,
    p_cobrade           => 13110,
    p_data_ocorrencia   => TO_DATE('2025-08-22', 'YYYY-MM-DD')
  );
  
  inserir_tb_tge_desastre_procedure(
    p_id_local          => 1,
    p_id_impacto        => 2,
    p_id_grupo_desastre => 3,
    p_id_usuario        => 5,
    p_cobrade           => 12310,
    p_data_ocorrencia   => TO_DATE('2025-08-30', 'YYYY-MM-DD')
  );
  
  inserir_tb_tge_desastre_procedure(
    p_id_local          => 1,
    p_id_impacto        => 3,
    p_id_grupo_desastre => 2,
    p_id_usuario        => 6,
    p_cobrade           => 13210,
    p_data_ocorrencia   => TO_DATE('2025-08-13', 'YYYY-MM-DD')
  );
  
  inserir_tb_tge_desastre_procedure(
    p_id_local          => 1,
    p_id_impacto        => 3,
    p_id_grupo_desastre => 2,
    p_id_usuario        => 5,
    p_cobrade           => 13220,
    p_data_ocorrencia   => TO_DATE('2025-08-13', 'YYYY-MM-DD')
  );
END;
/


--Terreno Desastre
CREATE OR REPLACE PROCEDURE inserir_tb_tge_terreno_desastre_procedure (
  p_id_desastre IN NUMBER,
  p_id_terreno IN NUMBER
)
IS
BEGIN
  INSERT INTO tb_tge_terreno_desastre (
    id_desastre,
    id_terreno
  ) VALUES (
    p_id_desastre,
    p_id_terreno
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso ');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir' || SQLERRM);
END;
/


BEGIN
  inserir_tb_tge_terreno_desastre_procedure(1, 1);
  inserir_tb_tge_terreno_desastre_procedure(2, 2);
  inserir_tb_tge_terreno_desastre_procedure(3, 3);
  inserir_tb_tge_terreno_desastre_procedure(4, 4);
  inserir_tb_tge_terreno_desastre_procedure(5, 5);
  inserir_tb_tge_terreno_desastre_procedure(6, 6);
  inserir_tb_tge_terreno_desastre_procedure(7, 7);
END;
/





--Vant Imagem
CREATE OR REPLACE PROCEDURE inserir_tb_tge_vant_imagens_procedure (
  p_id_imagem IN NUMBER,
  p_id_vant   IN NUMBER
)
IS
BEGIN
  INSERT INTO tb_tge_vant_imagens (
    id_imagem,
    id_vant
  ) VALUES (
    p_id_imagem,
    p_id_vant
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir ' || SQLERRM);
END;
/

BEGIN
  inserir_tb_tge_vant_imagens_procedure(1, 1);
  inserir_tb_tge_vant_imagens_procedure(2, 1);
  inserir_tb_tge_vant_imagens_procedure(3, 2);
  inserir_tb_tge_vant_imagens_procedure(4, 2);
  inserir_tb_tge_vant_imagens_procedure(5, 3);
  inserir_tb_tge_vant_imagens_procedure(6, 3);
  inserir_tb_tge_vant_imagens_procedure(7, 4);
END;
/




--Desastre Vant
CREATE OR REPLACE PROCEDURE inserir_tb_tge_desastre_vant_procedure (
  p_id_desastre IN NUMBER,
  p_id_vant     IN NUMBER
)
IS
BEGIN
  INSERT INTO tb_tge_desastre_vant (
    id_desastre,
    id_vant
  ) VALUES (
    p_id_desastre,
    p_id_vant
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir' || SQLERRM);
END;
/

BEGIN
  inserir_tb_tge_desastre_vant_procedure(1, 1);
  inserir_tb_tge_desastre_vant_procedure(2, 1);
  inserir_tb_tge_desastre_vant_procedure(3, 2);
  inserir_tb_tge_desastre_vant_procedure(4, 2);
  inserir_tb_tge_desastre_vant_procedure(5, 3);
  inserir_tb_tge_desastre_vant_procedure(6, 3);
  inserir_tb_tge_desastre_vant_procedure(7, 4);
END;
/



--Desastre Zona
CREATE OR REPLACE PROCEDURE inserir_tb_tge_desastre_zona_procedure (
  p_id_zona     IN NUMBER,
  p_id_desastre IN NUMBER
)
IS
BEGIN
  INSERT INTO tb_tge_desastre_zona (
    id_zona,
    id_desastre
  ) VALUES (
    p_id_zona,
    p_id_desastre
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir ZONA ID: ' || SQLERRM);
END;
/

BEGIN
  inserir_tb_tge_desastre_zona_procedure(1, 1);
  inserir_tb_tge_desastre_zona_procedure(1, 2);
  inserir_tb_tge_desastre_zona_procedure(2, 3);
  inserir_tb_tge_desastre_zona_procedure(2, 4);
  inserir_tb_tge_desastre_zona_procedure(3, 5);
  inserir_tb_tge_desastre_zona_procedure(3, 6);
  inserir_tb_tge_desastre_zona_procedure(4, 7);
END;
/


--Inc�ndio
CREATE OR REPLACE PROCEDURE inserir_tb_tge_incendio_florestal_procedure (
  p_id_impacto_classificacao IN NUMBER,
  p_causa                    IN VARCHAR2,
  p_tipo_incendio            IN VARCHAR2
)
IS
BEGIN
  INSERT INTO tb_tge_incendio_florestal (
    id_impacto_classificacao,
    causa,
    tipo_incendio
  ) VALUES (
    p_id_impacto_classificacao,
    p_causa,
    p_tipo_incendio
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso' );

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir inc�ndio florestal: ' || SQLERRM);
END;
/

BEGIN
  inserir_tb_tge_incendio_florestal_procedure(1, 'Raio durante tempestade seca', 'Superficial');
  inserir_tb_tge_incendio_florestal_procedure(2, 'Queimada agr�cola descontrolada', 'Subterr�neo');
  inserir_tb_tge_incendio_florestal_procedure(3, 'Fogueira deixada por campistas', 'Copa das �rvores');
  inserir_tb_tge_incendio_florestal_procedure(1, 'Curto-circuito em rede el�trica rural', 'Superficial');
  inserir_tb_tge_incendio_florestal_procedure(2, 'A��o criminosa deliberada', 'Subterr�neo');
  inserir_tb_tge_incendio_florestal_procedure(4, 'Explos�o de tanque de combust�vel', 'Copa das �rvores');
  inserir_tb_tge_incendio_florestal_procedure(3, 'Fuma�a de fog�o a lenha em dia seco', 'Superficial');
END;
/

--Deslizamento
CREATE OR REPLACE PROCEDURE inserir_tb_tge_deslizamento_procedure (
  p_id_impacto_classificacao IN NUMBER,
  p_umidade_solo             IN NUMBER
)
IS
BEGIN
  INSERT INTO tb_tge_deslizamento (
    id_impacto_classificacao,
    umidade_solo
  ) VALUES (
    p_id_impacto_classificacao,
    p_umidade_solo
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir deslizamento: ' || SQLERRM);
END;
/

BEGIN
  inserir_tb_tge_deslizamento_procedure(1, 88.5);
  inserir_tb_tge_deslizamento_procedure(2, 91.2);
  inserir_tb_tge_deslizamento_procedure(3, 86.7);
  inserir_tb_tge_deslizamento_procedure(4, 93.1);
  inserir_tb_tge_deslizamento_procedure(2, 89.4);
  inserir_tb_tge_deslizamento_procedure(1, 95.0);
  inserir_tb_tge_deslizamento_procedure(3, 87.9);
END;
/


--Inunda��o
CREATE OR REPLACE PROCEDURE inserir_tb_tge_inundacao_procedure (
  p_id_impacto_classificacao IN NUMBER,
  p_causa                    IN VARCHAR2,
  p_metros                   IN NUMBER
)
IS
BEGIN
  INSERT INTO tb_tge_inundacao (
    id_impacto_classificacao,
    causa,
    metros
  ) VALUES (
    p_id_impacto_classificacao,
    p_causa,
    p_metros
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso ');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir inunda��o: ' || SQLERRM);
END;
/

BEGIN
  inserir_tb_tge_inundacao_procedure(1, 'Chuvas intensas na serra', 3.75);
  inserir_tb_tge_inundacao_procedure(2, 'Transbordamento de rio urbano', 2.40);
  inserir_tb_tge_inundacao_procedure(3, 'Obstru��o de galerias pluviais', 1.95);
  inserir_tb_tge_inundacao_procedure(1, 'Rompimento de barragem', 4.85);
  inserir_tb_tge_inundacao_procedure(4, 'Ac�mulo de �gua em �rea de v�rzea', 2.15);
  inserir_tb_tge_inundacao_procedure(2, 'Eleva��o do n�vel do mar em zona costeira', 3.20);
  inserir_tb_tge_inundacao_procedure(3, 'Falha no sistema de drenagem urbana', 1.80);
END;
/


--Seca
CREATE OR REPLACE PROCEDURE inserir_tb_tge_seca_procedure (
  p_id_impacto_classificacao IN NUMBER,
  p_temperatura              IN NUMBER,
  p_medida                   IN VARCHAR2,
  p_umidade_solo             IN NUMBER
)
IS
BEGIN
  INSERT INTO tb_tge_seca (
    id_impacto_classificacao,
    temperatura,
    medida,
    umidade_solo
  ) VALUES (
    p_id_impacto_classificacao,
    p_temperatura,
    p_medida,
    p_umidade_solo
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Inser��o realizada com sucesso');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao inserir seca: ' || SQLERRM);
END;
/

BEGIN
  inserir_tb_tge_seca_procedure(1, 38.50, '�C', 5.20);
  inserir_tb_tge_seca_procedure(2, 40.25, '�C', 3.80);
  inserir_tb_tge_seca_procedure(3, 37.10, '�C', 6.45);
  inserir_tb_tge_seca_procedure(2, 42.00, '�C', 2.10);
  inserir_tb_tge_seca_procedure(1, 39.75, '�C', 4.25);
  inserir_tb_tge_seca_procedure(3, 41.30, '�C', 1.95);
  inserir_tb_tge_seca_procedure(4, 36.80, '�C', 7.10);
END;
/



--Desastre Sensores
CREATE OR REPLACE PROCEDURE inserir_tb_tge_desastre_sensores_procedure (
  p_id_sensor   IN NUMBER,
  p_id_desastre IN NUMBER
)
IS
BEGIN
  INSERT INTO tb_tge_desastre_sensores (
    id_sensor,
    id_desastre
  ) VALUES (
    p_id_sensor,
    p_id_desastre
  );

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Associa��o inserida com sucesso ');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao associar sensor ao desastre: ' || SQLERRM);
END;
/

BEGIN
  inserir_tb_tge_desastre_sensores_procedure(1, 1);
  inserir_tb_tge_desastre_sensores_procedure(2, 2);
  inserir_tb_tge_desastre_sensores_procedure(3, 3);
  inserir_tb_tge_desastre_sensores_procedure(4, 4);
  inserir_tb_tge_desastre_sensores_procedure(5, 5);
  inserir_tb_tge_desastre_sensores_procedure(6, 6);
  inserir_tb_tge_desastre_sensores_procedure(7, 7);
END;
/

