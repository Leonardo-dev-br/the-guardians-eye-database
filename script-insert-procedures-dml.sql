-- INSERÇÃO

--Terrno Geografico
CREATE OR REPLACE PROCEDURE inserir_terreno_geografico_procedure (
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
    inserir_terreno_geografico('Planície');
    inserir_terreno_geografico('Depressão');
    inserir_terreno_geografico('Colina');
    inserir_terreno_geografico('Chapada');
    inserir_terreno_geografico('Morro');
    inserir_terreno_geografico('Montanha');
    inserir_terreno_geografico('Vale');
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

    DBMS_OUTPUT.PUT_LINE('Usuário "' || p_nome_usuario || '" inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir usuário: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_usuario_procedure(
        'Ana', 'Souza Lima', 12345678901, 'Engenheira Ambiental', 'Coleta de Dados', 'ana.lima@exemplo.com', 'senhaAna2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Bruno', 'Ferreira Santos', 22345678902, 'Geógrafo', 'Mapeamento de Áreas', 'bruno.ferreira@exemplo.com', 'senhaBruno2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Carla', 'Oliveira Mendes', 32345678903, 'Analista', 'Gestão de Riscos', 'carla.mendes@exemplo.com', 'senhaCarla2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Daniel', 'Pereira Costa', 42345678904, 'Tecnólogo', 'Monitoramento Climático', 'daniel.costa@exemplo.com', 'senhaDaniel2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Eduarda', 'Nunes Rocha', 52345678905, 'Coordenadora', 'Acompanhamento de Projetos', 'eduarda.rocha@exemplo.com', 'senhaEduarda2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Felipe', 'Silva Martins', 62345678906, 'Técnico', 'Instalação de Sensores', 'felipe.martins@exemplo.com', 'senhaFelipe2025'
    );

    inserir_tb_tge_usuario_procedure(
        'Giovana', 'Barros Almeida', 72345678907, 'Bióloga', 'Análise de Impacto', 'giovana.almeida@exemplo.com', 'senhaGiovana2025'
    );
END;
/

--Local
CREATE OR REPLACE PROCEDURE inserir_tb_tge_local_procedure (
    p_cep       IN INTEGER,
    p_endereco  IN VARCHAR2,
    p_municipio IN VARCHAR2,
    p_numero    IN INTEGER
)
IS
BEGIN
    INSERT INTO tb_tge_local (
        cep,
        endereco,
        municipio,
        numero
    ) VALUES (
        p_cep,
        p_endereco,
        p_municipio,
        p_numero
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Local inserido com sucesso: ' || p_endereco || ', ' || p_numero || ' - ' || p_municipio || ' (CEP: ' || p_cep || ')');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir local: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_local_procedure(12345678, 'Rua São Pualo', 'Ibiúna', 120);
    inserir_tb_tge_local_procedure(23456789, 'Av. Brasil', 'Sorocaba', 45);
    inserir_tb_tge_local_procedure(34567890, 'Rua São João', 'Cotia', 221);
    inserir_tb_tge_local_procedure(45678901, 'Alameda das Flores', 'Votorantim', 305);
    inserir_tb_tge_local_procedure(56789012, 'Travessa do Sol', 'São Roque', 88);
    inserir_tb_tge_local_procedure(67890123, 'Rua Aurora', 'Itu', 133);
    inserir_tb_tge_local_procedure(78901234, 'Rua dos Pinhais', 'Jundiaí', 77);
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
    inserir_tb_tge_subgrupo_desastre_procedure('3. Inundação', 'Enchente', 'Inundação lenta');
    inserir_tb_tge_subgrupo_desastre_procedure('4. Incêndio', 'Florestal', '0');
    inserir_tb_tge_subgrupo_desastre_procedure('5. Erosão', 'Marinha', '0');
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
    
    DBMS_OUTPUT.PUT_LINE('Zona inserida com sucesso: ' || desc_zona || ' com população de: ' || populacao || 'e seu porte: ' || porte);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Imagem: ' || SQLERRM);
    
END;
/

BEGIN
    inserir_tb_tge_zona_procedure('Zona Norte', 150000, 'Grande');
    inserir_tb_tge_zona_procedure('Zona Sul', 98000, 'Média');
    inserir_tb_tge_zona_procedure('Zona Leste', 200000, 'Grande');
    inserir_tb_tge_zona_procedure('Zona Oeste', 75000, 'Média');
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
    inserir_tb_tge_sensores_procedure('CHP-002', 'YL69', 'Analógica', 'Umidade do Solo', 'SoilSense', 'Ativo', 'Analógica', '0-5V', 2.80);
    inserir_tb_tge_sensores_procedure('CHP-003', 'DHT11', 'Digital', 'Umidade do Ar', 'SensorCorp', 'Ativo', 'Digital', '0-1V', 3.10);
    inserir_tb_tge_sensores_procedure('CHP-004', 'DHT22', 'Digital', 'Umidade do Ar', 'SensorCorp', 'Ativo', 'Digital', '0-1V', 3.50);
    inserir_tb_tge_sensores_procedure('CHP-005', 'FC28', 'Analógica', 'Umidade do Solo', 'AgroTech', 'Ativo', 'Analógica', '0-3.3V', 2.60);
    inserir_tb_tge_sensores_procedure('CHP-006', 'HS1101', 'PWM', 'Umidade do Ar', 'ClimaSensor', 'Ativo', 'PWM', 'Modulada', 3.00);
    inserir_tb_tge_sensores_procedure('CHP-007', 'SEN0193', 'I2C', 'Condutividade do Solo', 'DFRobot', 'Ativo', 'Digital', '0-5V', 2.90);
END;
/

--Classificação de Impacto
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
    
    DBMS_OUTPUT.PUT_LINE('Classificação do Impacto inserida com sucesso: ' || p_nivel || ' - ' || p_desc_nivel);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Classificação do Impacto: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_impacto_classificacao_procedure(1, 'Sem Impacto');
    inserir_tb_tge_impacto_classificacao_procedure(2, 'Impacto Leve');
    inserir_tb_tge_impacto_classificacao_procedure(3, 'Impacto Moderado');
    inserir_tb_tge_impacto_classificacao_procedure(4, 'Impacto Relevante');
    inserir_tb_tge_impacto_classificacao_procedure(5, 'Impacto Grave');
    inserir_tb_tge_impacto_classificacao_procedure(6, 'Impacto Muito Grave');
    inserir_tb_tge_impacto_classificacao_procedure(7, 'Impacto Catastrófico');
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
    inserir_tb_tge_impacto_humano_procedure(1, 0, 'População preservada', 0);
    inserir_tb_tge_impacto_humano_procedure(2, 15, 'Ferimentos leves e apoio local', 0);
    inserir_tb_tge_impacto_humano_procedure(3, 80, 'Deslocamento e pequenos traumas', 0);
    inserir_tb_tge_impacto_humano_procedure(4, 200, 'Evacuação de área urbana parcial', 0);
    inserir_tb_tge_impacto_humano_procedure(5, 500, 'População em abrigos e feridos graves', 1);
    inserir_tb_tge_impacto_humano_procedure(6, 1200, 'Mortes registradas, sistema de saúde sobrecarregado', 1);
    inserir_tb_tge_impacto_humano_procedure(7, 5000, 'Região colapsada, ajuda humanitária internacional', 1);
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
        id_impacto_material,
        id_impacto_classificacao,
        danos_materiais,
        impacto_ambiental
    ) VALUES (
        NULL, -- será preenchido pela trigger
        p_id_impacto_classificacao,
        p_danos_materiais,
        p_impacto_ambiental
    );
      COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Impacto Material inserido com sucesso: ' || id_impacto_material || ' - ' || danos_materiais || 'e impacto ambiental' || p_impacto_ambiental);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir Impacto Material: ' || SQLERRM);
END;
/

BEGIN
    inserir_tb_tge_impacto_material_procedure(1, 'Nenhum dano', 'Ambiente preservado');
    inserir_tb_tge_impacto_material_procedure(2, 'Pequenos danos', 'Resíduos e sujeira localizada');
    inserir_tb_tge_impacto_material_procedure(3, 'Danificação de estruturas leves', 'Poluição localizada no solo ou água');
    inserir_tb_tge_impacto_material_procedure(4, 'Destruição parcial de edificações', 'Comprometimento de áreas urbanas e verdes');
    inserir_tb_tge_impacto_material_procedure(5, 'Colapso de estruturas e rodovias', 'Contaminação de solo e mananciais');
    inserir_tb_tge_impacto_material_procedure(6, 'Infraestrutura severamente comprometida', 'Desmatamento e destruição de ecossistemas locais');
    inserir_tb_tge_impacto_material_procedure(7, 'Destruição em massa', 'Colapso ecológico, perda de biodiversidade e risco ambiental global');
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
        NULL, -- será gerado pela trigger
        p_id_impacto_material,
        p_id_impacto_humano,
        p_impacto
    );
      COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Impacto inserido com sucesso: ' || p_impacto);
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
    inserir_tb_tge_impacto_procedure(7, 7, 'Impacto Catastrófico');
END;
/


select * from tb_tge_impacto
