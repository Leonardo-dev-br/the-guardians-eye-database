/*
Turma: 2TDSPX
Grupo: MONT CLIO
Nome Projeto: THE GUARDIANS EYE
Integrantes: LEONARDO P SANTOS - RM557541
             PEDRO H LIMA SANTOS - RM558243
             VITOR GOMES - RM558244
*/


/*
                                                                         SEÇÃO DE DROPS
DROP TABLE tb_tge_desastre CASCADE CONSTRAINTS;

DROP TABLE tb_tge_desastre_sensores CASCADE CONSTRAINTS;

DROP TABLE tb_tge_desastre_vant CASCADE CONSTRAINTS;

DROP TABLE tb_tge_desastre_zona CASCADE CONSTRAINTS;

DROP TABLE tb_tge_deslizamento CASCADE CONSTRAINTS;

DROP TABLE tb_tge_grupo_desastre CASCADE CONSTRAINTS;

DROP TABLE tb_tge_imagens_capturadas CASCADE CONSTRAINTS;

DROP TABLE tb_tge_impacto CASCADE CONSTRAINTS;

DROP TABLE tb_tge_impacto_classificacao CASCADE CONSTRAINTS;

DROP TABLE tb_tge_impacto_humano CASCADE CONSTRAINTS;

DROP TABLE tb_tge_impacto_material CASCADE CONSTRAINTS;

DROP TABLE tb_tge_incendio_florestal CASCADE CONSTRAINTS;

DROP TABLE tb_tge_inundacao CASCADE CONSTRAINTS;

DROP TABLE tb_tge_local CASCADE CONSTRAINTS;

DROP TABLE tb_tge_seca CASCADE CONSTRAINTS;

DROP TABLE tb_tge_sensores CASCADE CONSTRAINTS;

DROP TABLE tb_tge_subgrupo_desastre CASCADE CONSTRAINTS;

DROP TABLE tb_tge_terreno_desastre CASCADE CONSTRAINTS;

DROP TABLE tb_tge_terreno_geografico CASCADE CONSTRAINTS;

DROP TABLE tb_tge_usuario CASCADE CONSTRAINTS;

DROP TABLE tb_tge_vant CASCADE CONSTRAINTS;

DROP TABLE tb_tge_vant_imagens CASCADE CONSTRAINTS;

DROP TABLE tb_tge_zona CASCADE CONSTRAINTS;



                                                              
DROP SEQUENCE tb_tge_desastre_id_desastre_seq;

DROP SEQUENCE tb_tge_desas_sensor_id_de_seq;

DROP SEQUENCE tb_tge_desas_vant_id_des_seq;

DROP SEQUENCE tb_tge_des_zona_id_des_seq;

DROP SEQUENCE tb_tge_desliza_id_desliza_seq;

DROP SEQUENCE tb_tge_grupo_des_id_grupo_seq;

DROP SEQUENCE tb_tge_img_cap_id_img_cap_seq;

DROP SEQUENCE tb_tge_impacto_id_impacto_seq;

DROP SEQUENCE tb_tge_im_class_id_im_class_seq;

DROP SEQUENCE tb_tge_im_hu_id_impac_seq;

DROP SEQUENCE tb_tge_impacto_mat_id_imp_seq;

DROP SEQUENCE tb_tge_inc_flo_id_inc_seq;

DROP SEQUENCE tb_tge_inun_id_inundacao_seq;

DROP SEQUENCE tb_tge_local_id_local_seq;

DROP SEQUENCE tb_tge_seca_id_seca_seq;

DROP SEQUENCE tb_tge_sensores_id_sensor_seq;

DROP SEQUENCE tb_tge_sub_des_id_sub_seq;

DROP SEQUENCE tb_tge_terreno_des_id_ter_seq;

DROP SEQUENCE tb_tge_terre_geo_id_terre_seq;

DROP SEQUENCE tb_tge_usuario_id_usuario_seq;

DROP SEQUENCE tb_tge_vant_id_vant_seq;

DROP SEQUENCE tb_tge_vant_imagens_id_vant_im;

DROP SEQUENCE tb_tge_zona_id_zona_seq;


DROP PROCEDURE inserir_tb_tge_terreno_geografico_procedure;

DROP PROCEDURE inserir_tb_tge_usuario_procedure;

DROP PROCEDURE inserir_tb_tge_local_procedure;

DROP PROCEDURE inserir_tb_tge_subgrupo_desastre_procedure;

DROP PROCEDURE inserir_tb_tge_vant_procedure;

DROP PROCEDURE inserir_tb_tge_imagens_capturadas_procedure;

DROP PROCEDURE inserir_tb_tge_zona_procedure;

DROP PROCEDURE inserir_tb_tge_sensores_procedure;

DROP PROCEDURE inserir_tb_tge_impacto_classificacao_procedure;

DROP PROCEDURE inserir_tb_tge_impacto_humano_procedure;

DROP PROCEDURE inserir_tb_tge_impacto_material_procedure;

DROP PROCEDURE inserir_tb_tge_impacto_procedure;

DROP PROCEDURE inserir_tb_tge_desastre_procedure;

DROP PROCEDURE inserir_tb_tge_terreno_desastre_procedure;

DROP PROCEDURE inserir_tb_tge_grupo_desastre_procedure;

DROP PROCEDURE inserir_tb_tge_vant_imagens_procedure;

DROP PROCEDURE inserir_tb_tge_desastre_vant_procedure;

DROP PROCEDURE inserir_tb_tge_desastre_zona_procedure;

DROP PROCEDURE inserir_tb_tge_incendio_florestal_procedure;

DROP PROCEDURE inserir_tb_tge_deslizamento_procedure;

DROP PROCEDURE inserir_tb_tge_inundacao_procedure;

DROP PROCEDURE inserir_tb_tge_seca_procedure;

DROP PROCEDURE inserir_tb_tge_desastre_sensores_procedure;

*/



CREATE TABLE tb_tge_desastre (
    id_desastre       INTEGER NOT NULL,
    id_local          INTEGER NOT NULL,
    id_impacto        INTEGER NOT NULL,
    id_grupo_desastre INTEGER NOT NULL,
    id_usuario        INTEGER NOT NULL,
    cobrade           INTEGER NOT NULL,
    data_ocorrencia   DATE NOT NULL
);

ALTER TABLE tb_tge_desastre ADD CONSTRAINT tb_tge_desastre_id_desastre_pk PRIMARY KEY ( id_desastre );

CREATE TABLE tb_tge_desastre_sensores (
    id_desastre_sensor INTEGER NOT NULL,
    id_sensor          INTEGER NOT NULL,
    id_desastre        INTEGER NOT NULL
);

ALTER TABLE tb_tge_desastre_sensores ADD CONSTRAINT tb_tge_desen_id_desas_sen_pk PRIMARY KEY ( id_desastre_sensor );

CREATE TABLE tb_tge_desastre_vant (
    id_desastre_vant INTEGER NOT NULL,
    id_desastre      INTEGER NOT NULL,
    id_vant          INTEGER NOT NULL
);

ALTER TABLE tb_tge_desastre_vant ADD CONSTRAINT tb_tge_devant_id_desas_vant_pf PRIMARY KEY ( id_desastre_vant );

CREATE TABLE tb_tge_desastre_zona (
    id_desastre_zona INTEGER NOT NULL,
    id_zona          INTEGER NOT NULL,
    id_desastre      INTEGER NOT NULL
);

ALTER TABLE tb_tge_desastre_zona ADD CONSTRAINT tb_tge_dezon_id_desastre_zona PRIMARY KEY ( id_desastre_zona );

CREATE TABLE tb_tge_deslizamento (
    id_deslizamento          INTEGER NOT NULL,
    id_impacto_classificacao INTEGER NOT NULL,
    umidade_solo             NUMBER(5, 2) NOT NULL
);

ALTER TABLE tb_tge_deslizamento ADD CONSTRAINT tb_tge_desl_id_deslizamento_pk PRIMARY KEY ( id_deslizamento );

CREATE TABLE tb_tge_grupo_desastre (
    id_grupo_desastre INTEGER NOT NULL,
    id_subgrupo       INTEGER NOT NULL,
    grupo             VARCHAR2(50) NOT NULL
);

ALTER TABLE tb_tge_grupo_desastre ADD CONSTRAINT tb_tge_grupo_id_gru_des_pk PRIMARY KEY ( id_grupo_desastre );

CREATE TABLE tb_tge_imagens_capturadas (
    id_imagem  INTEGER NOT NULL,
    hospedagem VARCHAR2(150) NOT NULL,
    tamanho    VARCHAR2(75) NOT NULL
);

ALTER TABLE tb_tge_imagens_capturadas ADD CONSTRAINT tb_tge_ima_cap_id_imagem_pk PRIMARY KEY ( id_imagem );

CREATE TABLE tb_tge_impacto (
    id_impacto          INTEGER NOT NULL,
    id_impacto_material INTEGER NOT NULL,
    id_impacto_humano   INTEGER NOT NULL,
    impacto             VARCHAR2(50) NOT NULL
);

ALTER TABLE tb_tge_impacto ADD CONSTRAINT tb_tge_impacto_impacto_pk PRIMARY KEY ( id_impacto );

CREATE TABLE tb_tge_impacto_classificacao (
    id_impacto_classificacao INTEGER NOT NULL,
    nivel                    INTEGER NOT NULL,
    desc_nivel               VARCHAR2(50) NOT NULL
);

ALTER TABLE tb_tge_impacto_classificacao ADD CONSTRAINT tb_tge_ic_id_impacto_class_pk PRIMARY KEY ( id_impacto_classificacao );

CREATE TABLE tb_tge_impacto_humano (
    id_impacto_humano        INTEGER NOT NULL,
    id_impacto_classificacao INTEGER NOT NULL,
    quantidade_afetados      INTEGER NOT NULL,
    estado_afetados          VARCHAR2(150) NOT NULL,
    suporte_internacional    INTEGER NOT NULL
);


ALTER TABLE tb_tge_impacto_humano ADD CONSTRAINT tb_tge_im_id_impacto_humano_pk PRIMARY KEY ( id_impacto_humano );

CREATE TABLE tb_tge_impacto_material (
    id_impacto_material      INTEGER NOT NULL,
    id_impacto_classificacao INTEGER NOT NULL,
    danos_materiais          VARCHAR2(75) NOT NULL,
    impacto_ambiental        VARCHAR2(150) NOT NULL
);

ALTER TABLE tb_tge_impacto_material ADD CONSTRAINT tb_tge_im_id_impa_material_pk PRIMARY KEY ( id_impacto_material );

CREATE TABLE tb_tge_incendio_florestal (
    id_incendio              INTEGER NOT NULL,
    id_impacto_classificacao INTEGER NOT NULL,
    causa                    VARCHAR2(75) NOT NULL,
    tipo_incendio            VARCHAR2(75) NOT NULL
);

ALTER TABLE tb_tge_incendio_florestal ADD CONSTRAINT tb_tge_incflo_id_incendio_pk PRIMARY KEY ( id_incendio );

CREATE TABLE tb_tge_inundacao (
    id_inundacao             INTEGER NOT NULL,
    id_impacto_classificacao INTEGER NOT NULL,
    causa                    VARCHAR2(250) NOT NULL,
    metros                   NUMBER(5, 2) NOT NULL
);

ALTER TABLE tb_tge_inundacao ADD CONSTRAINT tb_tge_inun_id_inundacao_pk PRIMARY KEY ( id_inundacao );

CREATE TABLE tb_tge_local (
    id_local  INTEGER NOT NULL,
    cep       INTEGER NOT NULL,
    endereco  VARCHAR2(125) NOT NULL,
    municipio VARCHAR2(75) NOT NULL,
    numero    INTEGER NOT NULL,
    longitude NUMBER(10, 8) NOT NULL,
    latitude NUMBER(11, 8) NOT NULL
);

ALTER TABLE tb_tge_local ADD CONSTRAINT tb_tge_local_id_local_pk PRIMARY KEY ( id_local );

CREATE TABLE tb_tge_seca (
    id_seca                  INTEGER NOT NULL,
    id_impacto_classificacao INTEGER NOT NULL,
    temperatura              NUMBER(5, 2) NOT NULL,
    medida                   VARCHAR2(5) NOT NULL,
    umidade_solo             NUMBER(5, 2) NOT NULL
);

ALTER TABLE tb_tge_seca ADD CONSTRAINT tb_tge_seca_id_seca_pk PRIMARY KEY ( id_seca );

CREATE TABLE tb_tge_sensores (
    id_sensor               INTEGER NOT NULL,
    chip                    VARCHAR2(75) NOT NULL,
    modelo                  VARCHAR2(75) NOT NULL,
    interface               VARCHAR2(75),
    utilidade               VARCHAR2(75) NOT NULL,
    fabricante              VARCHAR2(50) NOT NULL,
    estado                  VARCHAR2(50) NOT NULL,
    saida                   VARCHAR2(25) NOT NULL,
    tipo_saida              VARCHAR2(25),
    media_tensao_registrada NUMBER(15, 2) NOT NULL
);

ALTER TABLE tb_tge_sensores ADD CONSTRAINT tb_tge_sensores_id_sensor_pk PRIMARY KEY ( id_sensor );

CREATE TABLE tb_tge_subgrupo_desastre (
    id_subgrupo INTEGER NOT NULL,
    subgrupo    VARCHAR2(75) NOT NULL,
    tipo        VARCHAR2(75),
    subtipo     VARCHAR2(75)
);

ALTER TABLE tb_tge_subgrupo_desastre ADD CONSTRAINT tb_tge_subde_id_subgrupo_pk PRIMARY KEY ( id_subgrupo );

CREATE TABLE tb_tge_terreno_desastre (
    id_terreno_desastre NUMBER NOT NULL,
    id_desastre         INTEGER NOT NULL,
    id_terreno          INTEGER NOT NULL
);

ALTER TABLE tb_tge_terreno_desastre ADD CONSTRAINT tb_tge_td_id_terreno_desa_pk PRIMARY KEY ( id_terreno_desastre );

CREATE TABLE tb_tge_terreno_geografico (
    id_terreno INTEGER NOT NULL,
    terreno    VARCHAR2(50) NOT NULL
);

ALTER TABLE tb_tge_terreno_geografico ADD CONSTRAINT tb_tge_tgeo_id_terreno_pk PRIMARY KEY ( id_terreno );

CREATE TABLE tb_tge_usuario (
    id_usuario   INTEGER NOT NULL,
    nome_usuario VARCHAR2(35) NOT NULL,
    sobrenome    VARCHAR2(100) NOT NULL,
    cpf          INTEGER NOT NULL,
    cargo        VARCHAR2(50) NOT NULL,
    funcao       VARCHAR2(100) NOT NULL,
    email        VARCHAR2(125) NOT NULL,
    senha        VARCHAR2(28) NOT NULL
);

ALTER TABLE tb_tge_usuario ADD CONSTRAINT tb_tge_usuario_id_usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE tb_tge_vant (
    id_vant           INTEGER NOT NULL,
    fabricante        VARCHAR2(75) NOT NULL,
    modelo            VARCHAR2(75) NOT NULL,
    tempo_voo         DATE NOT NULL,
    distancia_maxima  NUMBER(5, 2) NOT NULL,
    velocidade_maxima NUMBER(5, 2) NOT NULL,
    peso              NUMBER(5, 2),
    camera            VARCHAR2(75)
);

ALTER TABLE tb_tge_vant ADD CONSTRAINT tb_tge_vant_id_vant_pk PRIMARY KEY ( id_vant );

CREATE TABLE tb_tge_vant_imagens (
    id_vant_imagem INTEGER NOT NULL,
    id_imagem      INTEGER NOT NULL,
    id_vant        INTEGER NOT NULL
);

ALTER TABLE tb_tge_vant_imagens ADD CONSTRAINT tb_tge_vi_id_vant_imagem_pk PRIMARY KEY ( id_vant_imagem );

CREATE TABLE tb_tge_zona (
    id_zona   INTEGER NOT NULL,
    desc_zona VARCHAR2(50) NOT NULL,
    populacao INTEGER NOT NULL,
    porte     VARCHAR2(50) NOT NULL
);

ALTER TABLE tb_tge_zona ADD CONSTRAINT tb_tge_zona_id_zona_pk PRIMARY KEY ( id_zona );

ALTER TABLE tb_tge_desastre_zona
    ADD CONSTRAINT tb_tge_des_id_desastre_fk FOREIGN KEY ( id_desastre )
        REFERENCES tb_tge_desastre ( id_desastre );

ALTER TABLE tb_tge_deslizamento
    ADD CONSTRAINT tb_tge_des_id_impacto_class_fk FOREIGN KEY ( id_impacto_classificacao )
        REFERENCES tb_tge_impacto_classificacao ( id_impacto_classificacao );

ALTER TABLE tb_tge_desastre_sensores
    ADD CONSTRAINT tb_tge_desas_id_desastre_fk FOREIGN KEY ( id_desastre )
        REFERENCES tb_tge_desastre ( id_desastre );

ALTER TABLE tb_tge_desastre_vant
    ADD CONSTRAINT tb_tge_desas_vant_id_vant_fk FOREIGN KEY ( id_vant )
        REFERENCES tb_tge_vant ( id_vant );

ALTER TABLE tb_tge_terreno_desastre
    ADD CONSTRAINT tb_tge_desastre_id_dasastre_fk FOREIGN KEY ( id_desastre )
        REFERENCES tb_tge_desastre ( id_desastre );

ALTER TABLE tb_tge_desastre_vant
    ADD CONSTRAINT tb_tge_desastre_id_desastre_fk FOREIGN KEY ( id_desastre )
        REFERENCES tb_tge_desastre ( id_desastre );

ALTER TABLE tb_tge_desastre
    ADD CONSTRAINT tb_tge_grudes_id_gru_desas_fk FOREIGN KEY ( id_grupo_desastre )
        REFERENCES tb_tge_grupo_desastre ( id_grupo_desastre );

ALTER TABLE tb_tge_grupo_desastre
    ADD CONSTRAINT tb_tge_grudes_id_subgrupo_fk FOREIGN KEY ( id_subgrupo )
        REFERENCES tb_tge_subgrupo_desastre ( id_subgrupo );

ALTER TABLE tb_tge_impacto
    ADD CONSTRAINT tb_tge_im_id_imp_material_fk FOREIGN KEY ( id_impacto_material )
        REFERENCES tb_tge_impacto_material ( id_impacto_material );

ALTER TABLE tb_tge_impacto
    ADD CONSTRAINT tb_tge_imp_id_impacto_human_fk FOREIGN KEY ( id_impacto_humano )
        REFERENCES tb_tge_impacto_humano ( id_impacto_humano );

ALTER TABLE tb_tge_desastre
    ADD CONSTRAINT tb_tge_impacto_id_impacto_fk FOREIGN KEY ( id_impacto )
        REFERENCES tb_tge_impacto ( id_impacto );

ALTER TABLE tb_tge_impacto_humano
    ADD CONSTRAINT tb_tge_imphu_id_imp_class_fk FOREIGN KEY ( id_impacto_classificacao )
        REFERENCES tb_tge_impacto_classificacao ( id_impacto_classificacao );

ALTER TABLE tb_tge_impacto_material
    ADD CONSTRAINT tb_tge_impmat_id_imp_class_fk FOREIGN KEY ( id_impacto_classificacao )
        REFERENCES tb_tge_impacto_classificacao ( id_impacto_classificacao );

ALTER TABLE tb_tge_incendio_florestal
    ADD CONSTRAINT tb_tge_incflo_id_im_class_fk FOREIGN KEY ( id_impacto_classificacao )
        REFERENCES tb_tge_impacto_classificacao ( id_impacto_classificacao );

ALTER TABLE tb_tge_inundacao
    ADD CONSTRAINT tb_tge_inun_id_imp_class_fk FOREIGN KEY ( id_impacto_classificacao )
        REFERENCES tb_tge_impacto_classificacao ( id_impacto_classificacao );

ALTER TABLE tb_tge_desastre
    ADD CONSTRAINT tb_tge_local_id_local_fk FOREIGN KEY ( id_local )
        REFERENCES tb_tge_local ( id_local );

ALTER TABLE tb_tge_seca
    ADD CONSTRAINT tb_tge_seca_id_imp_class_fk FOREIGN KEY ( id_impacto_classificacao )
        REFERENCES tb_tge_impacto_classificacao ( id_impacto_classificacao );

ALTER TABLE tb_tge_desastre_sensores
    ADD CONSTRAINT tb_tge_sensores_id_sensor_fk FOREIGN KEY ( id_sensor )
        REFERENCES tb_tge_sensores ( id_sensor );

ALTER TABLE tb_tge_terreno_desastre
    ADD CONSTRAINT tb_tge_tergeo_id_terreno_fk FOREIGN KEY ( id_terreno )
        REFERENCES tb_tge_terreno_geografico ( id_terreno );

ALTER TABLE tb_tge_desastre
    ADD CONSTRAINT tb_tge_usuario_id_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES tb_tge_usuario ( id_usuario );

ALTER TABLE tb_tge_vant_imagens
    ADD CONSTRAINT tb_tge_vant_id_imagem_fk FOREIGN KEY ( id_imagem )
        REFERENCES tb_tge_imagens_capturadas ( id_imagem );

ALTER TABLE tb_tge_vant_imagens
    ADD CONSTRAINT tb_tge_vant_id_vant_fk FOREIGN KEY ( id_vant )
        REFERENCES tb_tge_vant ( id_vant );

ALTER TABLE tb_tge_desastre_zona
    ADD CONSTRAINT tb_tge_zona_id_zona_fk FOREIGN KEY ( id_zona )
        REFERENCES tb_tge_zona ( id_zona );

CREATE SEQUENCE tb_tge_desastre_id_desastre_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_desastre_id_desastre_seq BEFORE
    INSERT ON tb_tge_desastre
    FOR EACH ROW
    WHEN ( new.id_desastre IS NULL )
BEGIN
    :new.id_desastre := tb_tge_desastre_id_desastre_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_desas_sensor_id_de_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_desas_sensor_id_de_seq BEFORE
    INSERT ON tb_tge_desastre_sensores
    FOR EACH ROW
    WHEN ( new.id_desastre_sensor IS NULL )
BEGIN
    :new.id_desastre_sensor := tb_tge_desas_sensor_id_de_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_desas_vant_id_des_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_desas_vant_id_des_seq BEFORE
    INSERT ON tb_tge_desastre_vant
    FOR EACH ROW
    WHEN ( new.id_desastre_vant IS NULL )
BEGIN
    :new.id_desastre_vant := tb_tge_desas_vant_id_des_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_des_zona_id_des_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_des_zona_id_des_seq BEFORE
    INSERT ON tb_tge_desastre_zona
    FOR EACH ROW
    WHEN ( new.id_desastre_zona IS NULL )
BEGIN
    :new.id_desastre_zona := tb_tge_des_zona_id_des_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_desliza_id_desliza_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_desliza_id_desliza_seq BEFORE
    INSERT ON tb_tge_deslizamento
    FOR EACH ROW
    WHEN ( new.id_deslizamento IS NULL )
BEGIN
    :new.id_deslizamento := tb_tge_desliza_id_desliza_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_grupo_des_id_grupo_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_grupo_des_id_grupo_seq BEFORE
    INSERT ON tb_tge_grupo_desastre
    FOR EACH ROW
    WHEN ( new.id_grupo_desastre IS NULL )
BEGIN
    :new.id_grupo_desastre := tb_tge_grupo_des_id_grupo_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_img_cap_id_img_cap_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_img_cap_id_img_cap_seq BEFORE
    INSERT ON tb_tge_imagens_capturadas
    FOR EACH ROW
    WHEN ( new.id_imagem IS NULL )
BEGIN
    :new.id_imagem := tb_tge_img_cap_id_img_cap_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_impacto_id_impacto_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_impacto_id_impacto_trg BEFORE
    INSERT ON tb_tge_impacto
    FOR EACH ROW
    WHEN ( new.id_impacto IS NULL )
BEGIN
    :new.id_impacto := tb_tge_impacto_id_impacto_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_im_class_id_im_class_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_im_class_id_im_class_seq BEFORE
    INSERT ON tb_tge_impacto_classificacao
    FOR EACH ROW
    WHEN ( new.id_impacto_classificacao IS NULL )
BEGIN
    :new.id_impacto_classificacao := tb_tge_im_class_id_im_class_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_im_hu_id_impac_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_im_hu_id_impac_seq BEFORE
    INSERT ON tb_tge_impacto_humano
    FOR EACH ROW
    WHEN ( new.id_impacto_humano IS NULL )
BEGIN
    :new.id_impacto_humano := tb_tge_im_hu_id_impac_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_impacto_mat_id_imp_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_impacto_mat_id_imp_seq BEFORE
    INSERT ON tb_tge_impacto_material
    FOR EACH ROW
    WHEN ( new.id_impacto_material IS NULL )
BEGIN
    :new.id_impacto_material := tb_tge_impacto_mat_id_imp_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_inc_flo_id_inc_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_inc_flo_id_inc_seq BEFORE
    INSERT ON tb_tge_incendio_florestal
    FOR EACH ROW
    WHEN ( new.id_incendio IS NULL )
BEGIN
    :new.id_incendio := tb_tge_inc_flo_id_inc_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_inun_id_inundacao_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_inun_id_inundacao_seq BEFORE
    INSERT ON tb_tge_inundacao
    FOR EACH ROW
    WHEN ( new.id_inundacao IS NULL )
BEGIN
    :new.id_inundacao := tb_tge_inun_id_inundacao_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_local_id_local_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_local_id_local_seq BEFORE
    INSERT ON tb_tge_local
    FOR EACH ROW
    WHEN ( new.id_local IS NULL )
BEGIN
    :new.id_local := tb_tge_local_id_local_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_seca_id_seca_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_seca_id_seca_seq BEFORE
    INSERT ON tb_tge_seca
    FOR EACH ROW
    WHEN ( new.id_seca IS NULL )
BEGIN
    :new.id_seca := tb_tge_seca_id_seca_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_sensores_id_sensor_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_sensores_id_sensor_seq BEFORE
    INSERT ON tb_tge_sensores
    FOR EACH ROW
    WHEN ( new.id_sensor IS NULL )
BEGIN
    :new.id_sensor := tb_tge_sensores_id_sensor_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_sub_des_id_sub_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_sub_des_id_sub_seq BEFORE
    INSERT ON tb_tge_subgrupo_desastre
    FOR EACH ROW
    WHEN ( new.id_subgrupo IS NULL )
BEGIN
    :new.id_subgrupo := tb_tge_sub_des_id_sub_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_terreno_des_id_ter_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_terreno_des_id_ter_seq BEFORE
    INSERT ON tb_tge_terreno_desastre
    FOR EACH ROW
    WHEN ( new.id_terreno_desastre IS NULL )
BEGIN
    :new.id_terreno_desastre := tb_tge_terreno_des_id_ter_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_terre_geo_id_terre_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_terre_geo_id_terre_seq BEFORE
    INSERT ON tb_tge_terreno_geografico
    FOR EACH ROW
    WHEN ( new.id_terreno IS NULL )
BEGIN
    :new.id_terreno := tb_tge_terre_geo_id_terre_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_usuario_id_usuario_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_usuario_id_usuario_seq BEFORE
    INSERT ON tb_tge_usuario
    FOR EACH ROW
    WHEN ( new.id_usuario IS NULL )
BEGIN
    :new.id_usuario := tb_tge_usuario_id_usuario_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_vant_id_vant_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_vant_id_vant_seq BEFORE
    INSERT ON tb_tge_vant
    FOR EACH ROW
    WHEN ( new.id_vant IS NULL )
BEGIN
    :new.id_vant := tb_tge_vant_id_vant_seq.nextval;
END;
/

CREATE SEQUENCE tb_tge_vant_imagens_id_vant_im START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_vant_imagens_id_vant_im BEFORE
    INSERT ON tb_tge_vant_imagens
    FOR EACH ROW
    WHEN ( new.id_vant_imagem IS NULL )
BEGIN
    :new.id_vant_imagem := tb_tge_vant_imagens_id_vant_im.nextval;
END;
/

CREATE SEQUENCE tb_tge_zona_id_zona_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_tge_zona_id_zona_seq BEFORE
    INSERT ON tb_tge_zona
    FOR EACH ROW
    WHEN ( new.id_zona IS NULL )
BEGIN
    :new.id_zona := tb_tge_zona_id_zona_seq.nextval;
END;
/