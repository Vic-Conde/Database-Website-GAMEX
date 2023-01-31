USE GAME_v1;
SET @hombre  = true,
    @mujer  = false;

SET @web  = true,
    @tienda  = false;

SET @util  = true,
    @noutil  = false;

INSERT INTO `PERFILES` 
    ( 
        idperfil,    
        nomperfil,
        rango
    ) 
VALUES
    ( 
        1,
        "Usuario",
        3
    ),
    ( 
        2,
        "Moderador",
        2
    ),
    ( 
        3,
        "Administrador",
        1
    );

INSERT INTO `USUARIOS` 
    ( 
        idusuario,    
        nomusuario,
        email,
        passwordusuario,
        fecnacimiento,
        telefono,
        direccion,
        bgenero,
        idperfil
    ) 
VALUES
    ( 
        1,
        "Pepe Villanueva",
        "pepevillanueva@gmail.com",
        "12345",
        "1990-05-10",
        "657678900",
        "Calle Las Margaritas Nº1 4D",
        @hombre,
        3
    ),
    ( 
        2,
        "Juan Agramonte",
        "juanagramonte@gmail.com",
        "1234",
        "1993-03-13",
        "600987234",
        "Calle Las Vecinitas Nº11 2D",
        @hombre,
        2
    ),
    ( 
        3,
        "Esteban Muñoz",
        "Em0620@gmail.com",
        "123",
        "2000-06-20",
        "677883519",
        "Avenida de Crespes Nº2 3A",
        @hombre,
        1
    ),
    ( 
        4,
        "Víctor Menendez",
        "mndz@gmail.com",
        "12",
        "1998-11-02",
        "626776890",
        "Calle Frontera de las nieves Nº22 1A",
        @hombre,
        1
    ),
    ( 
        5,
        "Sebastián Gómez",
        "sebasgmz@gmail.com",
        "121",
        "2006-01-12",
        "650442338",
        "Avenida de Guadalajara Nº3 1 izq",
        @hombre,
        1
    ),
    ( 
        6,
        "Mario De Frutos",
        "frutox@outlook.com",
        "2122",
        "2005-06-20",
        "680907060",
        "Calle Los Melones Nº13A 6A",
        @hombre,
        1
    ),
    ( 
        7,
        "Alejandra González",
        "gonza@yahoo.com",
        "01234",
        "2004-06-20",
        "609708060",
        "Calle Los Mandriles Nº3 4A",
        @mujer,
        1
    ),
    ( 
        8,
        "Alícia Jiménez",
        "al@yahoo.com",
        "012345",
        "2001-01-01",
        "617008690",
        "Camino de las Santas Pascuas Nº1 1B",
        @mujer,
        1
    );

INSERT INTO `NICKUSUARIOS` 
    ( 
        idusuario,    
        fecinicio,
        nomnick
    ) 
VALUES
    ( 
        4,
        "2022-07-14",
        "Señor V"
    ),
    ( 
        4,
        "2022-08-29",
        "VictorLord"
    ),
    ( 
        6,
        "2020-08-29",
        "Frutox05"
    ),
    ( 
        3,
        "2018-03-09",
        "Estebani"
    ),
    ( 
        3,
        "2020-05-12",
        "Bando"
    );

INSERT INTO `PEGIEDADES` 
    ( 
        idpegiedad,    
        titulopegiedad,
        imgpegiedad
    ) 
VALUES
    ( 
        1,
        "TODOS LOS PÚBLICOS",
        "images/pegiedad/01.jpg"
    ),
    ( 
        2,
        "TRES",
        "images/pegiedad/03.jpg"
    ),
    ( 
        3,
        "SIETE",
        "images/pegiedad/03.jpg"
    ),
    ( 
        4,
        "DOCE",
        "images/pegiedad/04.jpg"
    ),
    ( 
        5,
        "DIECISÉIS",
        "images/pegiedad/05.jpg"
    ),
    ( 
        6,
        "DIECIOCHO",
        "images/pegiedad/06.jpg"
    );

INSERT INTO `VIDEOJUEGOS` 
    ( 
        idvideojuego,    
        titulo,
        descripcion,
        feclanzamiento,
        idpegiedad
    ) 
VALUES
    ( 
        99,
        "The Last of Us",
        "Narrativa tremenda de zombies",
        "2013-06-14",
        6
    ),
    ( 
        100,
        "God of War 2018",
        "Secuela de God of War 3",
        "2018-04-20",
        6
    ),
    
    ( 
        101,
        "The Callisto Protocol",
        "Intento de sucesor espiritual de Dead Space",
        "2023-12-02",
        6
    ),
    ( 
        102,
        "NBA 2K23",
        "Saga de baloncesto de 2KGAMES 2023",
        "2022-09-09",
        2
    ),
    ( 
        103,
        "The Quarry",
        "Nueva propuesta de terror de los creadores de Until Dawn",
        "2022-06-10",
        6
    ),
    ( 
        104,
        "The Last of Us Parte 2",
        "Destrozo narrativo de la saga The Last of Us",
        "2020-06-19",
        6
    ),
    ( 
        105,
        "Pacman Championship",
        "Eres una bola amarilla que se come unos fantasmas en 3D",
        "2016-09-13",
        1
    ),
    ( 
        NULL,
        "Starfox",
        "Eres zorro galactico",
        "2020-03-03",
        1
    ),
    ( 
        1050,
        "Pacman",
        "Eres una bola amarilla que se come unos fantasmas",
        "2012-01-13",
        1
    );

INSERT INTO `IMAGENESVIDEOS` 
    ( 
        idimagenvideo,    
        nomimagenvideo,
        idvideojuego,
        iorden
    ) 
VALUES
    ( 
        1,
        "images/videojuegos/GOW/001.jpg",
        100,
        1
    ),
    ( 
        2,
        "images/videojuegos/GOW/002.jpg",
        100,
        2
    ),
    ( 
        3,
        "images/videojuegos/GOW/003.jpg",
        100,
        3
    ),
    ( 
        4,
        "images/videojuegos/TLOU/001.jpg",
        99,
        1
    ),
    ( 
        5,
        "images/videojuegos/TLOU/002.jpg",
        99,
        2
    ),
    ( 
        6,
        "images/videojuegos/TLOU/003.jpg",
        99,
        3
    ),
    ( 
        7,
        "images/videojuegos/TCP/001.jpg",
        101,
        1
    ),
    ( 
        8,
        "images/videojuegos/NBA2K23/001.jpg",
        102,
        1
    ),
    ( 
        9,
        "images/videojuegos/TLOU2/001.jpg",
        104,
        1
    ),
    ( 
        10,
        "images/videojuegos/PCMCH/001.jpg",
        105,
        1
    ),
    ( 
        11,
        "images/videojuegos/STRFX/001.jpg",
        106,
        1
    ),
    ( 
        12,
        "images/videojuegos/PCM/001.gif",
        1050,
        1
    ),
    ( 
        13,
        "images/videojuegos/TQY/001.jpg",
        103,
        1
    );

INSERT INTO `PEGICONTENIDOS` 
    ( 
        idpegicontenido,    
        titulopegicontenido,
        imgpegicontenido
    ) 
VALUES
    ( 
        1,
        "VIOLENCIA",
        "images/pegicontenidos/01.jpg"
    ),
    ( 
        2,
        "LENGUAJE SOEZ",
        "images/pegicontenidos/02.jpg"
    ),
    ( 
        3,
        "MIEDO",
        "images/pegicontenidos/03.jpg"
    ),
    ( 
        4,
        "JUEGO",
        "images/pegicontenidos/04.jpg"
    ),
    ( 
        5,
        "SEXO",
        "images/pegicontenidos/05.jpg"
    ),
    ( 
        6,
        "DROGAS",
        "images/pegicontenidos/06.jpg"
    ),
    ( 
        7,
        "DISCRIMINACIÓN",
        "images/pegicontenidos/07.jpg"
    ),
    ( 
        8,
        "INCLUYE COMPRAS",
        "images/pegicontenidos/08.jpg"
    ),
    ( 
        9,
        "EN LÍNEA",
        "images/pegicontenidos/09.jpg"
    );

INSERT INTO `ETIQUETAS` 
    ( 
        idpegicontenido,
        idvideojuego
    ) 
VALUES
    ( 
        1,
        100
    ),
    ( 
        2,
        100
    ),
    ( 
        1,
        99
    ),
    ( 
        2,
        99
    ),
    ( 
        9,
        99
    ),
    ( 
        1,
        101
    ),
    ( 
        3,
        101
    ),
    ( 
        8,
        102
    ),
    ( 
        9,
        102
    ),
    ( 
        1,
        103
    ),
    ( 
        3,
        103
    );

INSERT INTO `PLATAFORMAS` 
    ( 
        idplataforma,    
        nomplataforma,
        imgplataforma,
        descripcion
    ) 
VALUES
    ( 
        1,
        "Playstation 1",
        "images/plataformas/PSX/001.jpg",
        "Es la primera consola de videojuegos desarrollada, comercializada y descontinuada por Sony Computer Entertainment. Fue lanzado en Japón el 3 de diciembre de 1994, en América del Norte el 9 de septiembre de 1995, en Europa el 29 de septiembre de 1995 y en Australia el 15 de noviembre de 1995. Como consola de quinta generación, PlayStation compitió principalmente con Nintendo 64 y el Sega Saturn."
    ),
    ( 
        2,
        "Playstation 2",
        "images/plataformas/PS2/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        3,
        "Playstation 3",
        "images/plataformas/PS3/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        4,
        "Playstation 4",
        "images/plataformas/PS4/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        5,
        "Playstation 5",
        "images/plataformas/PS5/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        6,
        "Xbox",
        "images/plataformas/XBOX/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        7,
        "Xbox 360",
        "images/plataformas/X360/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        8,
        "Xbox One",
        "images/plataformas/XO/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        9,
        "Xbox Series X/S",
        "images/plataformas/XSXS/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        10,
        "Nintendo DS",
        "images/plataformas/NDS/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),( 
        11,
        "Nintendo Wii",
        "images/plataformas/WII/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        12,
        "Nintendo Switch",
        "images/plataformas/NS/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    ),
    ( 
        13,
        "PC",
        "images/plataformas/PC/001.jpg",
        "Es la segunda videoconsola de sobremesa descontinuada producida por Sony Computer Entertainment. Fue la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Fue lanzada por primera vez el 4 de marzo del año 2000 en Japón, y unos meses después en el resto del mundo. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas."
    );

INSERT INTO `VIDEOJUEGOSPLATAFORMAS` 
    ( 
        idvideojuego,
        idplataforma,
        fecinicio
    ) 
VALUES
    ( 
        100,
        4,
        "2018-04-20"
    ),
    ( 
        100,
        13,
        "2022-01-14"
    ),
    ( 
        99,
        3,
        "2013-06-14"
    ),
    ( 
        101,
        9,
        "2022-12-02"
    ),
    ( 
        101,
        8,
        "2022-12-02"
    ),
    ( 
        102,
        12,
        "2022-09-09"
    ),
    ( 
        103,
        5,
        "2022-06-10"
    ),
    ( 
        104,
        4,
        "2020-06-19"
    ),
    ( 
        105,
        13,
        "2016-09-13"
    );

INSERT INTO `RESERVASVIDEOJUEGOS` 
    ( 
        idreserva,
        idvideojuego,
        idplataforma,
        idusuario,
        fechorareserva,
        bsitio,
        precioreserva
    ) 
VALUES
    ( 
        1234,
        101,
        9,
        3,
        "2022-07-18 19:01:01",
        @web,
        20.00
    ),
    ( 
        1235,
        102,
        12,
        4,
        "2022-07-15 21:03:30",
        @tienda,
        3.00
    ),
    ( 
        1236,
        101,
        9,
        5,
        "2021-12-05 01:33:32",
        @web,
        3.00
    ),
    ( 
        1237,
        102,
        12,
        6,
        "2022-01-11 13:43:40",
        @tienda,
        5.00
    );

INSERT INTO `CRITICAS` 
    ( 
        idvideojuego,
        idplataforma,
        idusuario,
        titulo,
        comentario,
        fechoracomentario
    ) 
VALUES
    ( 
        101,
        9,
        5,
        "Es una soberana mierda",
        "Tiene pinta de juego de PS3 cuando va a salir para la PS5 y se ve FATAL",
        "2022-07-10 10:11:12"
    ),
    ( 
        102,
        12,
        4,
        "PINTAZA",
        "Los juegos de 2K no defraudan y con este de este año menos, menudos gráficos y jugabilidad nueva que tiene. Nada que envidiar a FIFA.",
        "2022-07-15 12:49:59"
    ),
    ( 
        99,
        3,
        3,
        "UNA OBRA EXCELENTE Y NO COMO SU SECUELA",
        "He tenido la suerte de probar este videojuego en 2021 y ME HE ENAMORADO. Lamentablemente probé el sucesor y este primero es una obra maestra",
        "2021-09-05 08:29:09"
    ),
    ( 
        100,
        4,
        7,
        "MAJESTUOSO",
        "Tremendo este juego, antes de su salida ya sabía que iba a ser una droga",
        "2018-11-25 18:19:00"
    ),
    ( 
        104,
        4,
        6,
        "ecfcwewcwc",
        "rvqetbrwn dgbrtbe egbeqtbetbetbeqtb ef eqbtgg",
        "2021-01-27 13:20:10"
    ),
    ( 
        99,
        3,
        8,
        "Fantabuloso",
        "Este título es una experiencia para todos los jugadores",
        "2019-05-05 01:22:50"
    );

INSERT INTO `VALORACIONES` 
    ( 
        idvideojuego,
        idplataforma,
        idusuario,
        idusuariovaloracion,
        butil,
        fechoravaloracion
    ) 
VALUES
    ( 
        101,
        9,
        5,
        6,
        @noutil,
        "2022-07-11 00:01:23"
    ),
    ( 
        102,
        12,
        4,
        3,
        @util,
        "2022-07-16 03:30:03"
    ),
    ( 
        102,
        12,
        4,
        6,
        @noutil,
        "2022-07-16 06:07:08"
    );

INSERT INTO `EDICIONES` 
    ( 
        idedicion,
        nomedicion
    )
VALUES
    ( 
        1,
        "Standard"
    ),
    ( 
        2,
        "DELUXE Edition"
    ),
    ( 
        3,
        "Collector's Edition"
    ),
    ( 
        4,
        "Gold Edition"
    );

INSERT INTO `PACKSCONEDICIONES` 
    ( 
        idvideojuego,
        idplataforma,
        idedicion,
        nomcaratula,
        precio
    )
VALUES
    ( 
        99,
        3,
        1,
        "Playstation 3",
        9.99
    ),
    ( 
        100,
        4,
        1,
        "Playstation 4",
        19.99
    ),
    ( 
        100,
        13,
        1,
        "PC",
        26.00
    ),
    ( 
        101,
        9,
        1,
        "Xbox Series X",
        69.99
    ),
    ( 
        102,
        12,
        4,
        "Nintendo Swicth",
        79.99
    ),
    ( 
        103,
        5,
        2,
        "Playstation 5",
        54.95
    ),
    ( 
        104,
        4,
        3,
        "Playstation 4",
        299.95
    ),
    ( 
        105,
        13,
        4,
        "PC",
        99.95
    ),
    ( 
        101,
        9,
        3,
        "Xbox Series X",
        89.99
    ),
    ( 
        99,
        3,
        2,
        "Playstation 3",
        29.99
    ),
    ( 
        103,
        5,
        4,
        "Playstation 5",
        84.95
    ),
    ( 
        102,
        12,
        2,
        "Nintendo Swicth",
        59.99
    ),
    ( 
        101,
        8,
        1,
        "Xbox One",
        59.99
    );
    
    INSERT INTO `COMPRAS` 
    ( 
        idvideojuego,
        idplataforma,
        idedicion,
        idusuario,
        fechoracompra,
        precio
    )
VALUES
    ( 
        99,
        3,
        1,
        4,
        "2022-01-06 09:00:00",
        9.99
    ),
    ( 
        99,
        3,
        1,
        5,
        "2022-02-16 10:03:56",
        9.99
    ),
    ( 
        100,
        4,
        1,
        6,
        "2021-11-22 17:34:23",
        19.99
    ),
    ( 
        101,
        9,
        3,
        3,
        "2022-07-20 20:09:13",
        89.99
    ),
    ( 
        99,
        3,
        1,
        7,
        "2015-08-24 01:12:03",
        9.99
    ),
    ( 
        100,
        4,
        1,
        3,
        "2021-11-22 17:34:23",
        19.99
    ),
    ( 
        101,
        9,
        3,
        3,
        "2022-07-22 13:04:03",
        69.99
    ),
    ( 
        101,
        9,
        3,
        4,
        "2022-01-04 10:04:33",
        69.99
    ),
    ( 
        102,
        12,
        4,
        3,
        "2021-11-23 11:44:03",
        59.99
    );
    
INSERT INTO `VOTACIONES` 
    ( 
        idvideojuego,
        idplataforma,
        idedicion,
        idusuario,
        votacion,
        fecvoto
    )
VALUES
    ( 
        99,
        3,
        1,
        4,
        100,
        "2022-01-13"
    ),
    ( 
        99,
        3,
        1,
        5,
        88,
        "2022-02-22"
    ),
    ( 
        100,
        4,
        1,
        6,
        100,
        "2021-11-25"
    ),
    ( 
        101,
        9,
        3,
        3,
        45,
        "2022-07-25"
    ),
    ( 
        101,
        9,
        3,
        4,
        35,
        "2022-01-05"
    ),
    ( 
        102,
        12,
        4,
        3,
        90,
        "2021-12-21"
    ) ;