-- INSER��O

--Terrno Geografico
CREATE OR REPLACE PROCEDURE inserir_terreno_geografico (
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
    inserir_terreno_geografico('Plan�cie');
    inserir_terreno_geografico('Depress�o');
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
