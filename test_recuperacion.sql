USE recuperacion;

INSERT INTO `Movimiento` (`direccion`, `anillo`, `cantidad`) VALUES ('MR', 'I', '2');

INSERT INTO `Movimiento` (`direccion`, `anillo`, `cantidad`) VALUES ('INV', 'I', '2');

DELETE FROM `Movimiento` WHERE `id`='2';

INSERT INTO `Movimiento` (`direccion`, `anillo`, `cantidad`) VALUES ('MR', 'E', '3');

INSERT INTO `Movimiento` (`direccion`, `anillo`, `cantidad`) VALUES ('INV', 'E', '3');

DELETE FROM `Movimiento` WHERE `id`='4';

