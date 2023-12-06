create database db_tonypizzaria_ryan;

use db_tonypizzaria_ryan;

create table categoria
(
	id integer primary key auto_increment,
    nome varchar(50) not null
);

create table sub_categoria
(
	id integer primary key auto_increment,
    nome varchar(50) not null
);

create table categoria_sub_categoria
(
	id integer primary key auto_increment,
	id_categoria integer not null,
    id_sub_categoria integer not null,
    
    foreign key (id_categoria) references categoria(id),
    foreign key (id_sub_categoria) references sub_categoria(id)
);

create table produto
(
	id integer primary key auto_increment,
    nome varchar(50) not null,
    preco double not null,
    descricao varchar(100),
    avaliacao double,
    qt_disponivel integer not null    
);

create table sub_categoria_produto
(
	id integer primary key auto_increment,
	id_produto integer not null,
	id_sub_categoria integer not null,
	
	foreign key (id_sub_categoria) references sub_categoria(id),
	foreign key (id_produto) references produto(id)
);

create table imagens_produtos
(
	id integer primary key auto_increment,
    url varchar(260) not null,
	id_produto integer not null,
    
	foreign key (id_produto) references produto(id)
);

create table endereco
(
	id integer primary key auto_increment,
    logradouro varchar(150) not null,
    cidade varchar(100) not null,
    uf varchar(2) not null,
    cep bigint not null
);

create table usuario
(
	id integer primary key auto_increment,
    nome varchar(100) not null,
    telefone bigint,
    email varchar(70) not null,
    senha varchar(20) not null,
    cpf bigint not null,
    foto_perfil varchar(100)
);

create table usuario_endereco
(
	id integer primary key auto_increment,
	id_usuario integer not null,
	id_endereco integer not null,
	
	foreign key (id_endereco) references endereco(id),
	foreign key (id_usuario) references usuario(id)
);

create table produto_favorito
(
	id integer primary key auto_increment,
	id_usuario integer not null,
	id_produto integer not null,
    
    foreign key (id_usuario) references usuario(id),
    foreign key (id_produto) references produto(id)
);

create table comentario
(
	id integer primary key auto_increment,
    id_usuario integer not null,
	id_produto integer not null,
    estrelas double,
    titulo varchar(50) not null,
    data_comentario date not null,
    comentario varchar(250),
    
    foreign key (id_usuario) references usuario(id),
    foreign key (id_produto) references produto(id)
);

create table pagamento
(
	id integer primary key auto_increment,
    tipo varchar(50) not null,
    banco varchar(50),
	n_cartao bigint,
    codigo_verificao_cartao integer,
    id_usuario integer not null,
    
    foreign key (id_usuario) references usuario(id)
);

create table pedido
(
	id integer primary key auto_increment,
    data_pedido date not null,
    frete double not null,
    total double not null,
    qt_itens integer not null,
    id_usuario_endereco integer not null,
    
    foreign key (id_usuario_endereco) references usuario_endereco(id)
);

create table pedido_produto
(
	id integer primary key auto_increment,
	id_pedido integer not null,
	id_produto integer not null,
    
    foreign key (id_produto) references produto(id),
    foreign key (id_pedido) references pedido(id)
);

create table pagamento_info
(
	id integer primary key auto_increment,
    id_pagamento integer not null,
    id_pedido integer not null,
    data_pagamento datetime not null,
    
    foreign key (id_pagamento) references pagamento(id),
    foreign key (id_pedido) references pedido(id)
);