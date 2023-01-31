DROP DATABASE IF EXISTS GAME_v1;

CREATE DATABASE GAME_v1 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE GAME_v1;

CREATE TABLE `PERFILES`
( 
    idperfil            TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nomperfil           VARCHAR (40)         NOT NULL,
    rango               TINYINT UNSIGNED     NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `USUARIOS`
( 
    idusuario           MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nomusuario          VARCHAR (30)        NOT NULL,
    email               VARCHAR (30) UNIQUE NOT NULL,
passwordusuario         VARCHAR (30)        NOT NULL,
    fecnacimiento       DATE                NOT NULL,
    telefono            CHAR (9)            NOT NULL,
    direccion           VARCHAR (40)        NOT NULL,
    bgenero             BOOLEAN             NOT NULL,
    idperfil            TINYINT UNSIGNED    NOT NULL,
    CONSTRAINT fk_USUARIOS_idperfil
        FOREIGN KEY ( idperfil ) 
        REFERENCES PERFILES ( idperfil )
) ENGINE = InnoDB;

CREATE TABLE `NICKUSUARIOS`
( 
    idusuario           MEDIUMINT UNSIGNED   NOT NULL,
    fecinicio           DATE PRIMARY KEY     NOT NULL,
    nomnick             VARCHAR (30) UNIQUE  NOT NULL,
    CONSTRAINT fk_NICKUSUARIOS_idusuario
        FOREIGN KEY ( idusuario ) 
        REFERENCES USUARIOS ( idusuario )
) ENGINE = InnoDB;

CREATE TABLE `PEGIEDADES`
( 
    idpegiedad          TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    titulopegiedad      VARCHAR (20)       NOT NULL,
    imgpegiedad         VARCHAR (30)       NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `VIDEOJUEGOS`
( 
    idvideojuego        MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    titulo              VARCHAR (115)       NOT NULL,
    descripcion         TEXT (500)          NOT NULL,
    feclanzamiento      DATE                NOT NULL,
    idpegiedad          TINYINT UNSIGNED    NOT NULL,
    CONSTRAINT fk_VIDEOJUEGOS_idpegiedad
        FOREIGN KEY ( idpegiedad ) 
        REFERENCES PEGIEDADES ( idpegiedad )
) ENGINE = InnoDB;

CREATE TABLE `IMAGENESVIDEOS`
( 
    idimagenvideo       MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nomimagenvideo      VARCHAR (40) UNIQUE NOT NULL ,
    idvideojuego        MEDIUMINT UNSIGNED  NOT NULL,
    iorden              TINYINT UNSIGNED    NOT NULL,
    CONSTRAINT fk_IMAGENESVIDEOS_idvideojuego
        FOREIGN KEY ( idvideojuego ) 
        REFERENCES VIDEOJUEGOS ( idvideojuego )
) ENGINE = InnoDB;

CREATE TABLE `PEGICONTENIDOS`
( 
    idpegicontenido     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    titulopegicontenido VARCHAR (20)       NOT NULL,
    imgpegicontenido    VARCHAR (30)       NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `ETIQUETAS`
( 
    idpegicontenido     TINYINT UNSIGNED,
    idvideojuego        MEDIUMINT UNSIGNED  NOT NULL,
    PRIMARY KEY ( idpegicontenido, idvideojuego ),
    CONSTRAINT fk_ETIQUETAS_idpegicontenido
        FOREIGN KEY ( idpegicontenido ) 
        REFERENCES PEGICONTENIDOS ( idpegicontenido ),
    CONSTRAINT fk_ETIQUETAS_idvideojuego
        FOREIGN KEY ( idvideojuego ) 
        REFERENCES VIDEOJUEGOS ( idvideojuego )
) ENGINE = InnoDB;

CREATE TABLE `PLATAFORMAS`
( 
    idplataforma        TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nomplataforma       VARCHAR (15) UNIQUE NOT NULL,
    imgplataforma       VARCHAR (31)        NOT NULL,
    descripcion         TEXT                NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `VIDEOJUEGOSPLATAFORMAS`
( 
    idvideojuego        MEDIUMINT UNSIGNED  NOT NULL,
    idplataforma        TINYINT UNSIGNED    NOT NULL,
    fecinicio           DATE                NOT NULL,
    PRIMARY KEY ( idvideojuego, idplataforma ),
    CONSTRAINT fk_VIDEOJUEGOSPLATAFORMAS_idvideojuego
        FOREIGN KEY ( idvideojuego ) 
        REFERENCES VIDEOJUEGOS ( idvideojuego ),
    CONSTRAINT fk_VIDEOJUEGOSPLATAFORMAS_idplataforma
        FOREIGN KEY ( idplataforma ) 
        REFERENCES PLATAFORMAS ( idplataforma )
) ENGINE = InnoDB;

CREATE TABLE `RESERVASVIDEOJUEGOS`
( 
    idreserva           SMALLINT  UNSIGNED      PRIMARY KEY,
    idvideojuego        MEDIUMINT UNSIGNED      NOT NULL,
    idplataforma        TINYINT   UNSIGNED      NOT NULL,
    idusuario           MEDIUMINT UNSIGNED      NOT NULL,
    UNIQUE ( idvideojuego, idplataforma, idusuario ),
    fechorareserva      DATETIME                NOT NULL,
    bsitio              BOOLEAN                 NOT NULL,
    precioreserva       FLOAT ( 4, 2 ) UNSIGNED NOT NULL,
    CONSTRAINT fk_RESERVASVIDEOJUEGOS_idvideojuego_idplataforma
        FOREIGN KEY ( idvideojuego, idplataforma ) 
        REFERENCES VIDEOJUEGOSPLATAFORMAS ( idvideojuego, idplataforma ),
    CONSTRAINT fk_RESERVASVIDEOJUEGOS_idusuario
        FOREIGN KEY ( idusuario ) 
        REFERENCES USUARIOS ( idusuario )
) ENGINE = InnoDB;

CREATE TABLE `CRITICAS`
( 
    idvideojuego        MEDIUMINT UNSIGNED  NOT NULL,
    idplataforma        TINYINT UNSIGNED    NOT NULL,
    idusuario           MEDIUMINT UNSIGNED  NOT NULL,
    PRIMARY KEY ( idvideojuego, idplataforma, idusuario ),
    titulo              VARCHAR (30)        NOT NULL,
    comentario          TINYTEXT            NOT NULL,
    fechoracomentario   DATETIME            NOT NULL,
    CONSTRAINT fk_CRITICAS_idvideojuego_idplataforma
        FOREIGN KEY ( idvideojuego, idplataforma ) 
        REFERENCES VIDEOJUEGOSPLATAFORMAS ( idvideojuego, idplataforma ),
    CONSTRAINT fk_CRITICAS_idusuario
        FOREIGN KEY ( idusuario ) 
        REFERENCES USUARIOS ( idusuario )
  
) ENGINE = InnoDB;

CREATE TABLE `VALORACIONES`
( 
    idvideojuego        MEDIUMINT UNSIGNED  NOT NULL,
    idplataforma        TINYINT   UNSIGNED  NOT NULL,
    idusuario           MEDIUMINT UNSIGNED  NOT NULL, 
    idusuariovaloracion MEDIUMINT UNSIGNED  NOT NULL,
    butil               BOOLEAN             NOT NULL,
    fechoravaloracion   DATETIME            NOT NULL,
    CONSTRAINT ck_idusuariovaloracion_idusuario
        CHECK ( idusuariovaloracion != idusuario ),
    PRIMARY KEY ( idvideojuego, idplataforma, idusuario, idusuariovaloracion ),
    CONSTRAINT fk_VALORACIONES_idvideojuego_idplataforma_idusuario
        FOREIGN KEY ( idvideojuego, idplataforma, idusuario ) 
        REFERENCES CRITICAS ( idvideojuego, idplataforma, idusuario ),
    CONSTRAINT fk_VALORACIONES_idusuariovaloracion
        FOREIGN KEY ( idusuariovaloracion ) 
        REFERENCES USUARIOS ( idusuario )
  
) ENGINE = InnoDB;

CREATE TABLE `EDICIONES`
( 
    idedicion           TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nomedicion          VARCHAR (30)        NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `PACKSCONEDICIONES`
( 
    idvideojuego        MEDIUMINT UNSIGNED      NOT NULL,
    idplataforma        TINYINT UNSIGNED        NOT NULL,
    idedicion           TINYINT UNSIGNED        NOT NULL,
    PRIMARY KEY ( idvideojuego, idplataforma, idedicion ),
    nomcaratula         VARCHAR (40)            NOT NULL,
    precio              FLOAT ( 5, 2 ) UNSIGNED NOT NULL,
    CONSTRAINT fk_PACKSCONEDICIONES_idvideojuego_idplataforma
        FOREIGN KEY ( idvideojuego, idplataforma ) 
        REFERENCES VIDEOJUEGOSPLATAFORMAS ( idvideojuego, idplataforma ),
    CONSTRAINT fk_VALORACIONES_idedicion
        FOREIGN KEY ( idedicion ) 
        REFERENCES EDICIONES ( idedicion )
  
) ENGINE = InnoDB;

CREATE TABLE `COMPRAS`
( 
    idvideojuego        MEDIUMINT UNSIGNED  NOT NULL,
    idplataforma        TINYINT UNSIGNED    NOT NULL,
    idedicion           TINYINT UNSIGNED    NOT NULL,
    idusuario           MEDIUMINT UNSIGNED  NOT NULL,
    fechoracompra       DATETIME            NOT NULL,
    PRIMARY KEY ( idvideojuego, idplataforma, idedicion, idusuario, fechoracompra ),
    precio              FLOAT ( 5, 2 )      NOT NULL,
    CONSTRAINT fk_COMPRAS_idvideojuego_idplataforma_idedicion
        FOREIGN KEY ( idvideojuego, idplataforma, idedicion ) 
        REFERENCES PACKSCONEDICIONES ( idvideojuego, idplataforma, idedicion )
  
) ENGINE = InnoDB;

CREATE TABLE `VOTACIONES`
( 
    idvideojuego        MEDIUMINT UNSIGNED  NOT NULL,
    idplataforma        TINYINT   UNSIGNED  NOT NULL,
    idedicion           TINYINT   UNSIGNED  NOT NULL,
    idusuario           MEDIUMINT UNSIGNED  NOT NULL,
    votacion            TINYINT   UNSIGNED  NOT NULL,
    fecvoto             DATE                NOT NULL,
    PRIMARY KEY ( idvideojuego, idplataforma, idedicion, idusuario),
    CONSTRAINT fk_VOTACIONES_idvideojuego_idplataforma_idedicion_idusuario
        FOREIGN KEY ( idvideojuego, idplataforma, idedicion, idusuario ) 
        REFERENCES COMPRAS ( idvideojuego, idplataforma, idedicion, idusuario )
  
) ENGINE = InnoDB;