CREATE SCHEMA IF NOT EXISTS `bd_handball` DEFAULT CHARACTER SET utf8 ;
USE `bd_handball` ;

-- -----------------------------------------------------
-- Table `bd_handball`.`sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`sexo` (
  `idsexo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idsexo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`rol` (
  `idrol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` BIGINT NULL,
  `nombre1` VARCHAR(45) NULL,
  `nombre2` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `identificacion` BIGINT NULL,
  `telefono` INT NULL,
  `correo` VARCHAR(100) NULL,
  `foto` VARCHAR(250) NULL,
  `pass` VARCHAR(150) NULL,
  `fk_sexo` INT NULL,
  `fk_rol` INT NULL,
  `estado` INT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC),
  UNIQUE INDEX `identificacion_UNIQUE` (`identificacion` ASC),
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC),
  INDEX `llave_sexo_usuario_idx` (`fk_sexo` ASC),
  INDEX `llave_rol_usuario_idx` (`fk_rol` ASC),
  CONSTRAINT `llave_sexo_usuario`
    FOREIGN KEY (`fk_sexo`)
    REFERENCES `bd_handball`.`sexo` (`idsexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llave_rol_usuario`
    FOREIGN KEY (`fk_rol`)
    REFERENCES `bd_handball`.`rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`categoria_equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`categoria_equipo` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`posicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`posicion` (
  `idposicion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idposicion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`categoria_jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`categoria_jugador` (
  `idcategoria_jugador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategoria_jugador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`equipo` (
  `idequipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(250) NULL,
  `fk_categoria` INT NULL,
  PRIMARY KEY (`idequipo`),
  INDEX `llave_equipo_categoria_equipo_idx` (`fk_categoria` ASC),
  CONSTRAINT `llave_equipo_categoria_equipo`
    FOREIGN KEY (`fk_categoria`)
    REFERENCES `bd_handball`.`categoria_equipo` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`jugador` (
  `idjugador` INT NOT NULL AUTO_INCREMENT,
  `nombre1` VARCHAR(45) NULL,
  `nombre2` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `identificacion` BIGINT NULL,
  `correo` VARCHAR(100) NULL,
  `telefono` INT NULL,
  `foto` VARCHAR(250) NULL,
  `fk_sexo` INT NULL,
  `fk_equipo` INT NULL,
  `fk_posicion` INT NULL,
  `fk_categoria` INT NULL,
  `cantidad_amarilla` INT NULL,
  `cantidad_roja` INT NULL,
  `estado` INT NULL,
  PRIMARY KEY (`idjugador`),
  INDEX `llave_sexo_jugador_idx` (`fk_sexo` ASC),
  INDEX `llave_posicion_jugador_idx` (`fk_posicion` ASC),
  INDEX `llave_categoria_jugador_idx` (`fk_categoria` ASC),
  INDEX `llave_equipo_jugador_idx` (`fk_equipo` ASC),
  CONSTRAINT `llave_sexo_jugador`
    FOREIGN KEY (`fk_sexo`)
    REFERENCES `bd_handball`.`sexo` (`idsexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llave_posicion_jugador`
    FOREIGN KEY (`fk_posicion`)
    REFERENCES `bd_handball`.`posicion` (`idposicion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llave_categoria_jugador`
    FOREIGN KEY (`fk_categoria`)
    REFERENCES `bd_handball`.`categoria_jugador` (`idcategoria_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llave_equipo_jugador`
    FOREIGN KEY (`fk_equipo`)
    REFERENCES `bd_handball`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`fase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`fase` (
  `idfase` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `estado` INT NULL,
  PRIMARY KEY (`idfase`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`partidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`partidos` (
  `idpartidos` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `h_inicio` VARCHAR(45) NULL,
  `h_final` VARCHAR(45) NULL,
  `fk_equipo1` INT NULL,
  `fk_equipo2` INT NULL,
  `fk_fase` INT NULL,
  PRIMARY KEY (`idpartidos`),
  INDEX `llave_equipo1_partido_idx` (`fk_equipo1` ASC),
  INDEX `llave_equipo2_partido_idx` (`fk_equipo2` ASC),
  INDEX `llave_fase_partido_idx` (`fk_fase` ASC),
  CONSTRAINT `llave_equipo1_partido`
    FOREIGN KEY (`fk_equipo1`)
    REFERENCES `bd_handball`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llave_equipo2_partido`
    FOREIGN KEY (`fk_equipo2`)
    REFERENCES `bd_handball`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `llave_fase_partido`
    FOREIGN KEY (`fk_fase`)
    REFERENCES `bd_handball`.`fase` (`idfase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`resultado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`resultado` (
  `idresultados` INT NOT NULL AUTO_INCREMENT,
  `fk_partido` INT NULL,
  `goles_equipo1` INT NULL,
  `goles_equipo2` INT NULL,
  PRIMARY KEY (`idresultados`),
  INDEX `llave_resultado_partido_idx` (`fk_partido` ASC),
  CONSTRAINT `llave_resultado_partido`
    FOREIGN KEY (`fk_partido`)
    REFERENCES `bd_handball`.`partidos` (`idpartidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`clasificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`clasificacion` (
  `idclasificacion` INT NOT NULL AUTO_INCREMENT,
  `fk_equipo` INT NULL,
  `puntos` INT NULL,
  PRIMARY KEY (`idclasificacion`),
  INDEX `llave_equipo_clasificacion_idx` (`fk_equipo` ASC),
  CONSTRAINT `llave_equipo_clasificacion`
    FOREIGN KEY (`fk_equipo`)
    REFERENCES `bd_handball`.`equipo` (`idequipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`resultado_final`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`resultado_final` (
  `idresultado_final` INT NOT NULL AUTO_INCREMENT,
  `fk_resultado` INT NULL,
  `resultado` VARCHAR(250) NULL,
  PRIMARY KEY (`idresultado_final`),
  INDEX `llave_resultado_final_idx` (`fk_resultado` ASC),
  CONSTRAINT `llave_resultado_final`
    FOREIGN KEY (`fk_resultado`)
    REFERENCES `bd_handball`.`resultado` (`idresultados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`menu` (
  `idmenu` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `icono` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  `estado` INT NULL,
  PRIMARY KEY (`idmenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_handball`.`submenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_handball`.`submenu` (
  `idsubmenu` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `icono` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  `fk_menu` INT NULL,
  `estado` INT NULL,
  PRIMARY KEY (`idsubmenu`),
  INDEX `llave_menu_submenu_idx` (`fk_menu` ASC),
  CONSTRAINT `llave_menu_submenu`
    FOREIGN KEY (`fk_menu`)
    REFERENCES `bd_handball`.`menu` (`idmenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;