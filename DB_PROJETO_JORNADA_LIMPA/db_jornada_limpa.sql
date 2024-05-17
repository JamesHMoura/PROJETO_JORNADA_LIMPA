CREATE DATABASE db_jornadalimpa;
USE db_jornadalimpa;

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    produto VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2),
    tamanho VARCHAR(255) NOT NULL,
    material VARCHAR(255),
    cor VARCHAR(255) NOT NULL,
    foto VARCHAR(255),
    categoriaid BIGINT,
    usuarioid BIGINT,
    PRIMARY KEY(id));
    
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));

    
CREATE TABLE tb_usuario(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL,
	senha VARCHAR(255) NOT NULL,
    foto VARCHAR(255),
    PRIMARY KEY(id));
    
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_usuario
FOREIGN KEY(usuarioid) REFERENCES tb_usuario (id);

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categoria 
FOREIGN KEY(categoriaid) REFERENCES tb_categoria (id);

SELECT * FROM tb_produtos ;
DESCRIBE tb_produtos;


INSERT INTO tb_usuario(nome, usuario, senha, foto)
VALUES("Mike Thyson", "maikinhoboxeador@gmail.com","eulutobox123","foto");

INSERT INTO tb_categoria(tipo)
VALUES("camisa"),
("caneca")
;

INSERT INTO tb_produtos(produto, preco, tamanho, material, cor, foto,usuarioid, categoriaid)
VALUES("Camisa Fumar é Paia",55.90,"G", "Algodão", "Preta", "*Foto do produto*",1,1),
("Caneca nao beba",30.75,"200ml", "Porcelana", "Azul", "*Foto do produto*",1,2);

SELECT produto,preco,tipo,nome FROM tb_produtos INNER JOIN tb_categoria ON 
tb_produtos.categoriaid = tb_categoria.id INNER JOIN tb_usuario ON
tb_produtos.usuarioid = tb_usuario.id; 


    