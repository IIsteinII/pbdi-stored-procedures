-- Active: 1715278801605@@127.0.0.1@5432@20241_fatec_ipi_pbdi_stored_procedures@public

DROP TABLE tb_cliente;
CREATE TABLE tb_cliente(
    cod_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL
);

DROP TABLE tb_pedido;
CREATE TABLE IF NOT EXISTS tb_pedido(
    cod_pedido SERIAL PRIMARY KEY,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR DEFAULT 'aberto',
    cod_cliente INT NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cod_cliente) REFERENCES
    tb_cliente(cod_cliente)
);

DROP TABLE tb_tipo_item;

CREATE TABLE tb_tipo_item(
    cod_tipo SERIAL PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL
);

INSERT INTO tb_tipo_item(descricao) VALUES ('Bebida'), ('Comida');

-- CREATE OR REPLACE PROCEDURE sp_calcula_media(
--     VARIADIC valores INT[]
-- )
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE
--     media NUMERIC(10,2) := 0;
--     valor INT;
-- BEGIN
--     FOREACH valor IN ARRAY valores LOOP
--         media := media + valor;
--     END LOOP;
--     RAISE NOTICE 'A média é: %', media / array_lenght(valores, 1);
-- END;
-- $$

-- CALL sp_calcula_media(1);


-- DROP PROCEDURE IF EXISTS sp_acha_maior;
-- CREATE OR REPLACE PROCEDURE sp_acha_maior(
--     OUT resultado INT,
--     IN valor1 INT,
--     IN valor2 INT
-- )
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     CASE
--         WHEN valor1 > valor2 THEN
--             $1 := valor1;
--         ELSE
--             resultado := valor2;
--     END CASE;
-- END;
-- $$

-- DO $$
-- DECLARE
--     resultado INT;
-- BEGIN
--     CALL sp_acha_maior (resultado, 2, 3);
--     RAISE NOTICE '% é o maior', resultado;
-- END;
-- $$

-- CREATE OR REPLACE PROCEDURE sp_acha_maior(
--     IN valor1 INT, 
--     IN valor2 INT
-- ) 
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     IF valor1 > valor2 THEN
--         RAISE NOTICE '% é o maior', $1;
--     ELSE
--         RAISE NOTICE '% é o maior', $2;
--     END IF;
-- END;
-- $$

-- CALL sp_acha_maior(2, 3);

--Procedure com parametros
-- CREATE OR REPLACE PROCEDURE sp_ola_usuario(nome VARCHAR(200))
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     RAISE NOTICE 'Olá(pelo nome), %', nome;
--     RAISE NOTICE 'Olá(pelo número), %', $1;
-- END;
-- $$;

-- CALL sp_ola_usuario('Pedro');

-- CREATE DATABASE "20241_fatec_ipi_pbdi_stored_procedures"

-- CREATE OR REPLACE PROCEDURE sp_ola_procedures()
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     RAISE NOTICE 'Olá, stored procedures';
-- END;
-- $$;

-- CALL sp_ola_procedures();