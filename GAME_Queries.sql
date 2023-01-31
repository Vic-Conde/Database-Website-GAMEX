--01 El número de videojuegos que tengo por plataforma
--Ordenado por plataformas alfabéticamente
SELECT `nomplataforma` AS plataformas, COUNT( `VIDEOJUEGOSPLATAFORMAS`.`idplataforma` ) AS totalJuegosPorPlataforma
FROM `PLATAFORMAS`
INNER JOIN `VIDEOJUEGOSPLATAFORMAS`
ON `PLATAFORMAS`.`idplataforma` = `VIDEOJUEGOSPLATAFORMAS`.`idplataforma`
GROUP BY `nomplataforma`
ORDER BY `plataformas`;

-- 02 La edad de los usuarios ( sin diferenciar usuario de moderador o de administrador ), su nombre, que no se han puesto un nick y cuya dirección sea una calle
--Ordenados de mayor a menor edad
SELECT `nomusuario` AS usuarios, `direccion`, `nomnick` AS nick, TIMESTAMPDIFF( YEAR, `fecnacimiento`, NOW() ) AS edad
FROM `USUARIOS`
LEFT JOIN `NICKUSUARIOS`
ON `USUARIOS`.`idusuario` = `NICKUSUARIOS`.`idusuario`
WHERE `nomnick` is NULL
AND `direccion` LIKE "%Calle%"
ORDER BY `edad` DESC;

--03 Juegos exclusivos de una sola plataforma
SELECT DISTINCT `titulo`, COUNT( `VIDEOJUEGOSPLATAFORMAS`.`idplataforma` ) AS exclusivo
FROM `VIDEOJUEGOS`
INNER JOIN `VIDEOJUEGOSPLATAFORMAS`
ON `VIDEOJUEGOS`.`idvideojuego` = `VIDEOJUEGOSPLATAFORMAS`.`idvideojuego`
INNER JOIN `PLATAFORMAS`
ON `VIDEOJUEGOSPLATAFORMAS`.`idplataforma` = `PLATAFORMAS`.`idplataforma` 
GROUP BY `VIDEOJUEGOSPLATAFORMAS`.`idplataforma`
HAVING exclusivo = 1;

-- 04 Qué usuarios son menores de edad y qué videojuegos han comprado
--Ordenados alfabéticamente por usuario
SELECT `nomusuario` AS usuarioMenorEdad, `titulo` AS videojuegoComprado
FROM `USUARIOS`
INNER JOIN `COMPRAS`
ON `USUARIOS`.`idusuario` = `COMPRAS`.`idusuario`
INNER JOIN `VIDEOJUEGOS`
ON`COMPRAS`.`idvideojuego` = `VIDEOJUEGOS`.`idvideojuego`
WHERE TIMESTAMPDIFF( YEAR, `fecnacimiento`, NOW()  ) < 18
ORDER BY `usuarioMenorEdad`;

-- 05 La suma de las compras de cada usuario, con el nombre del usuario, pero que ese usuario tenga un perfil llamado 'Usuario' y que la suma de sus compras sea mayor a 9.99
--Ordenado por la mayor cantidad de dinero gastado

SELECT `nomusuario` AS usuarioCliente, SUM( `precio` ) AS dineroGastado
FROM `USUARIOS`
INNER JOIN `COMPRAS`
ON `USUARIOS`.`idusuario` = `COMPRAS`.`idusuario`
INNER JOIN `PERFILES`
ON `PERFILES`.`idperfil` = `USUARIOS`.`idperfil`
WHERE `nomperfil` = "Usuario"
GROUP BY `nomusuario`
HAVING dineroGastado > 9.99
ORDER BY dineroGastado DESC;

-- 06 Los nombres de los usuarios que han comprado, el videojuego obtenido, pero no repetida la misma compra y la edad recomendada para dicho videojuego, pero solo si son mayores de edad.
--Ordenados alfabéticamente
SELECT DISTINCT `nomusuario` AS usuarioMayorEdad, `titulo` AS videojuegoComprado, `titulopegiedad` AS edadRecomendada
FROM `USUARIOS`
INNER JOIN `COMPRAS`
ON `USUARIOS`.`idusuario` = `COMPRAS`.`idusuario`
INNER JOIN `VIDEOJUEGOS`
ON `VIDEOJUEGOS`.`idvideojuego` = `COMPRAS`.`idvideojuego`
INNER JOIN `PEGIEDADES`
ON `PEGIEDADES`.`idpegiedad`= `VIDEOJUEGOS`.`idpegiedad`  
WHERE TIMESTAMPDIFF( YEAR, `fecnacimiento`, NOW()  ) >= 18
ORDER BY `usuarioMayorEdad`;

-- 07 Las críticas, el videojuego, el usuario de la crítica y saber si la valoración ha sido útil o no útil
--Ordenados por usuario alfabéticamente

SELECT `comentario`, `VIDEOJUEGOS`.`titulo` AS videojuegos, `nomusuario` AS usuarios,
      CASE 
        WHEN butil = 1 THEN "útil"
        ELSE "no útil"
       END AS valoración
FROM `USUARIOS`, `VALORACIONES`, `CRITICAS`, `VIDEOJUEGOS`
WHERE `USUARIOS`.`idusuario` = `VALORACIONES`.`idusuario`
AND `VALORACIONES`.`idvideojuego` = `CRITICAS`.`idvideojuego`
AND `CRITICAS`.`idvideojuego` = `VIDEOJUEGOS`.`idvideojuego`
ORDER BY `usuarios`;

-- 08 Quiero saber quién es el usuario o usuarios más viejos ( ya que se puede nacer a la vez ), pero que NO sea moderador o administrador y además que no tenga nick
--Ordenardo alfabéticamente por usuario
SELECT `nomusuario` AS usuarioMasViejoSinNick
FROM `USUARIOS`
LEFT JOIN `NICKUSUARIOS`
ON `NICKUSUARIOS`.`idusuario` = `USUARIOS`.`idusuario`
INNER JOIN `PERFILES`
ON `PERFILES`.`idperfil` = `USUARIOS`.`idperfil`
WHERE `fecnacimiento` = ( SELECT MIN( `fecnacimiento` )
                          FROM `USUARIOS`
                          INNER JOIN `PERFILES`
                          ON `USUARIOS`.`idperfil` = `PERFILES`.`idperfil`
                          LEFT JOIN `NICKUSUARIOS`
                          ON `NICKUSUARIOS`.`idusuario` = `USUARIOS`.`idusuario`
                          WHERE `nomperfil` != "Administrador"
                          AND `nomperfil` != "Moderador"
                          AND `nomnick`is NULL )
GROUP BY `nomperfil`
ORDER BY `usuarioMasViejoSinNick`;

-- 09 La diferencia de la media general del precio de los packs con la media de los packs en cada plataforma, pero cuyo resultado no sea negativo
--Ordernado alfabéticamente
SELECT `nomplataforma` AS plataformas, ( SELECT AVG( `precio` ) 
                                         FROM `PACKSCONEDICIONES`
                                         GROUP BY `nomplataforma`) - ( SELECT AVG( `precio` )
                                                                       FROM `PACKSCONEDICIONES` AS T2
                                                                       INNER JOIN `PLATAFORMAS`
                                                                       ON `T2`.`idplataforma` = `PLATAFORMAS`.`idplataforma`
                                                                       WHERE `T1`.`idplataforma` = `T2`.`idplataforma`
                                                                       GROUP BY `nomplataforma`) AS diferencia
FROM `PACKSCONEDICIONES` AS T1
INNER JOIN `PLATAFORMAS`
ON `T1`.`idplataforma` = `PLATAFORMAS`.`idplataforma`
GROUP BY `nomplataforma`
HAVING diferencia > 0
ORDER BY `nomplataforma`;

-- 10 Las críticas que correspondan al 2022 o al 2021, los usuarios y los nicks de los usuarios si los tienen o no, pero con el nick más actual.
--No quiero los nicks antiguos
SELECT `comentario`,`nomusuario`, `nomnick`
FROM `NICKUSUARIOS` AS T1
RIGHT JOIN `USUARIOS`
ON `T1`.`idusuario` = `USUARIOS`.`idusuario`
INNER JOIN `CRITICAS`
ON `CRITICAS`.`idusuario` = `USUARIOS`.`idusuario`
WHERE ( `fecinicio` = ( SELECT MAX( `fecinicio` ) 
                      FROM `NICKUSUARIOS` AS T2
                      WHERE `T1`.`idusuario` = `T2`.`idusuario`)
OR `fecinicio` is NULL )
AND ( YEAR( `fechoracomentario` ) = 2021
OR YEAR( `fechoracomentario` ) = 2022 );

-- 11 Las 3 mayores votaciones, con sus usuarios y con el título de los videojuegos que han sido votados
--Ordenados por mayor votación
WITH T1 AS (
    SELECT `votacion`
    FROM `VOTACIONES`
    WHERE `votacion` <> ( SELECT MAX( `votacion` )
                           FROM `VOTACIONES`)
), T2 AS (
    SELECT `votacion`
    FROM `T1`
    WHERE `votacion` <> ( SELECT MAX( `votacion` )
                           FROM T1 )
)
SELECT `nomusuario` AS usuariosVotantes, `titulo` AS videojuegosVotados, `votacion`
FROM `USUARIOS`
INNER JOIN `VOTACIONES`
ON `USUARIOS`.`idusuario` = `VOTACIONES`.`idusuario`
INNER JOIN `VIDEOJUEGOS`
ON `VIDEOJUEGOS`.`idvideojuego` = `VOTACIONES`.`idvideojuego`
WHERE `votacion` >= ( SELECT MAX( `votacion` )
                       FROM T2 )
ORDER BY `votacion` DESC;