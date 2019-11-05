
create database IF NOT EXISTS DUNGEONS_AND_FOOD;
USE DUNGEONS_AND_FOOD;

-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario` (
  `ID_Usuario` INT NOT NULL AUTO_INCREMENT,
  `Nm_Usuario` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Foto Perfil` VARCHAR(50) NULL,

  PRIMARY KEY (`ID_Usuario`));
-- -----------------------------------------------------
-- Table `Receita`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Receita` (
  `ID_Receita` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `Dificuldade` ENUM('FACIL', 'MEDIO', 'DIFICIL') NOT NULL,
  `Views` INT NOT NULL,
  `ID_Usuario` INT NOT NULL,
  PRIMARY KEY (`ID_Receita`),
  INDEX `fk_Receita_Usuario1_idx` (`ID_Usuario` ASC),
  CONSTRAINT `fk_Receita_Usuario1`
    FOREIGN KEY (`ID_Usuario`)
    REFERENCES `Usuario` (`ID_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingredientes` (
  `Id_Ingredientes` INT NOT NULL AUTO_INCREMENT,
  `nm_Ingredientes` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Ingredientes`));
-- -----------------------------------------------------
-- Table `Ingredientes_has_Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingredientes_has_Receita` (
  `Ingredientes_Id_Ingredientes` INT NOT NULL,
  `Receita_ID_Receita` INT NOT NULL,
  PRIMARY KEY (`Ingredientes_Id_Ingredientes`, `Receita_ID_Receita`),
  INDEX `fk_Ingredientes_has_Receita_Receita1_idx` (`Receita_ID_Receita` ASC),
  INDEX `fk_Ingredientes_has_Receita_Ingredientes1_idx` (`Ingredientes_Id_Ingredientes` ASC),
  CONSTRAINT `fk_Ingredientes_has_Receita_Ingredientes1`
    FOREIGN KEY (`Ingredientes_Id_Ingredientes`)
    REFERENCES `Ingredientes` (`Id_Ingredientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingredientes_has_Receita_Receita1`
    FOREIGN KEY (`Receita_ID_Receita`)
    REFERENCES `Receita` (`ID_Receita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comentario` (
  `Id_comentario` INT NOT NULL,
  `Conteudo` VARCHAR(500) NULL,
  `Tamanho` VARCHAR(250) NULL,
  `Data` DATE NULL,
  `Receita_ID_Receita` INT NOT NULL,
  `Receita_Comentario_Id_comentario` INT NOT NULL,
  PRIMARY KEY (`Id_comentario`),
  INDEX `fk_Comentario_Receita1_idx` (`Receita_ID_Receita` ASC, `Receita_Comentario_Id_comentario` ASC),
  CONSTRAINT `fk_Comentario_Receita1`
    FOREIGN KEY (`Receita_ID_Receita`)
    REFERENCES `Receita` (`ID_Receita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comentario` (
  `Id_comentario` INT NOT NULL,
  `Conteudo` VARCHAR(500) NULL,
  `Tamanho` VARCHAR(250) NULL,
  `Data` DATE NULL,
  `Receita_ID_Receita` INT NOT NULL,
  `Receita_Comentario_Id_comentario` INT NOT NULL,
  PRIMARY KEY (`Id_comentario`),
  INDEX `fk_Comentario_Receita1_idx` (`Receita_ID_Receita` ASC, `Receita_Comentario_Id_comentario` ASC),
  CONSTRAINT `fk_Comentario_Receita1`
    FOREIGN KEY (`Receita_ID_Receita`)
    REFERENCES `Receita` (`ID_Receita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Conteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Conteudo` (
  `ID_Conteudo` INT NOT NULL AUTO_INCREMENT,
  `Tamanho` INT NOT NULL,
  `Receita_ID_Receita` INT NOT NULL,
  `Receita_Comentario_Id_comentario` INT NOT NULL,
  `Receita_ID_Usuario` INT NOT NULL,
  PRIMARY KEY (`ID_Conteudo`, `Receita_ID_Receita`, `Receita_Comentario_Id_comentario`, `Receita_ID_Usuario`),
  INDEX `fk_Conteudo_Receita1_idx` (`Receita_ID_Receita` ASC, `Receita_Comentario_Id_comentario` ASC, `Receita_ID_Usuario` ASC),
  CONSTRAINT `fk_Conteudo_Receita1`
    FOREIGN KEY (`Receita_ID_Receita` , `Receita_ID_Usuario`)
    REFERENCES `Receita` (`ID_Receita` , `ID_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Imagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Imagem` (
  `ID_imagem` INT NOT NULL AUTO_INCREMENT,
  `Conteudo_ID_Conteudo` INT NOT NULL,
  `arquivo` INT NULL,
  PRIMARY KEY (`ID_imagem`),
  INDEX `fk_Imagem_Conteudo1_idx` (`Conteudo_ID_Conteudo` ASC),
  CONSTRAINT `fk_Imagem_Conteudo1`
    FOREIGN KEY (`Conteudo_ID_Conteudo`)
    REFERENCES `Conteudo` (`ID_Conteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Video` (
  `Id_Video` INT NOT NULL AUTO_INCREMENT,
  `Conteudo_ID_Conteudo` INT NOT NULL,
  `arquivo` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Video`),
  INDEX `fk_Video_Conteudo1_idx` (`Conteudo_ID_Conteudo` ASC),
  CONSTRAINT `fk_Video_Conteudo1`
    FOREIGN KEY (`Conteudo_ID_Conteudo`)
    REFERENCES `Conteudo` (`ID_Conteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Texto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Texto` (
  `ID_Texto` INT NOT NULL,
  `Conteudo_ID_Conteudo` INT NOT NULL,
  `conteúdo` VARCHAR(100) NULL,
  `Textocol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Texto`),
  INDEX `fk_Texto_Conteudo1_idx` (`Conteudo_ID_Conteudo` ASC),
  CONSTRAINT `fk_Texto_Conteudo1`
    FOREIGN KEY (`Conteudo_ID_Conteudo`)
    REFERENCES `Conteudo` (`ID_Conteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Avaliação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Avaliação` (
  `ID_Usuario` INT NOT NULL,
  `Receita_ID_Receita` INT NOT NULL,
  `avaliacao` ENUM('1', '2', '3', '4', '5') NULL,
  PRIMARY KEY (`ID_Usuario`, `Receita_ID_Receita`),
  INDEX `fk_Usuario_has_Receita_Receita1_idx` (`Receita_ID_Receita` ASC),
  INDEX `fk_Usuario_has_Receita_Usuario1_idx` (`ID_Usuario` ASC),
  CONSTRAINT `fk_Usuario_has_Receita_Usuario1`
    FOREIGN KEY (`ID_Usuario`)
    REFERENCES `Usuario` (`ID_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Receita_Receita1`
    FOREIGN KEY (`Receita_ID_Receita`)
    REFERENCES `Receita` (`ID_Receita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);






insert into ingredientes values(NULL,'portabella mushrooms');
insert into ingredientes values(NULL,'radishes');
insert into ingredientes values(NULL,'bourbon');
insert into ingredientes values(NULL,'beans');
insert into ingredientes values(NULL,'coconut milk');
insert into ingredientes values(NULL,'scallops');
insert into ingredientes values(NULL,'remoulade');
insert into ingredientes values(NULL,'butter');
insert into ingredientes values(NULL,'sherry');
insert into ingredientes values(NULL,'passion fruit');
insert into ingredientes values(NULL,'oranges');
insert into ingredientes values(NULL,'sour cream');
insert into ingredientes values(NULL,'bean sprouts');
insert into ingredientes values(NULL,'bruschetta');
insert into ingredientes values(NULL,'veal');
insert into ingredientes values(NULL,'curry leaves');
insert into ingredientes values(NULL,'kiwi');
insert into ingredientes values(NULL,'eggs');
insert into ingredientes values(NULL,'borscht');
insert into ingredientes values(NULL,'mint');
insert into ingredientes values(NULL,'squid');
insert into ingredientes values(NULL,'brunoise');
insert into ingredientes values(NULL,'mushrooms');
insert into ingredientes values(NULL,'cashew nut');
insert into ingredientes values(NULL,'English muffins');
insert into ingredientes values(NULL,'vegemite');
insert into ingredientes values(NULL,'Marsala');
insert into ingredientes values(NULL,'grouper');
insert into ingredientes values(NULL,'panko bread crumbs');
insert into ingredientes values(NULL,'succotash');
insert into ingredientes values(NULL,'chicken');
insert into ingredientes values(NULL,'turnips');
insert into ingredientes values(NULL,'black-eyed peas');
insert into ingredientes values(NULL,'rice wine');
insert into ingredientes values(NULL,'rhubarb');
insert into ingredientes values(NULL,'sea cucumbers');
insert into ingredientes values(NULL,'half-and-half');
insert into ingredientes values(NULL,'rum');
insert into ingredientes values(NULL,'grapes');
insert into ingredientes values(NULL,'peas');
insert into ingredientes values(NULL,'mesclun greens');
insert into ingredientes values(NULL,'snow peas');
insert into ingredientes values(NULL,'truffles');
insert into ingredientes values(NULL,'habanero chilies');
insert into ingredientes values(NULL,'sage');
insert into ingredientes values(NULL,'lobsters');
insert into ingredientes values(NULL,'rice paper');
insert into ingredientes values(NULL,'maple syrup');
insert into ingredientes values(NULL,'blackberries');
insert into ingredientes values(NULL,'cider');


insert into Usuario values(NULL,'fermin','nimref','fermin@gmail.com','fermin.png');
insert into Usuario values(NULL,'ismael','leamsi','ismael@gmail.com','ismael.png');
insert into Usuario values(NULL,'adolf','floda','adolf@gmail.com','adolf.png');
insert into Usuario values(NULL,'sherwood','doowrehs','sherwood@gmail.com','sherwood.png');
insert into Usuario values(NULL,'will','lliw','will@gmail.com','will.png');
insert into Usuario values(NULL,'sandy','ydnas','sandy@gmail.com','sandy.png');
insert into Usuario values(NULL,'brandon','nodnarb','brandon@gmail.com','brandon.png');
insert into Usuario values(NULL,'horacio','oicaroh','horacio@gmail.com','horacio.png');
insert into Usuario values(NULL,'rolland','dnallor','rolland@gmail.com','rolland.png');
insert into Usuario values(NULL,'oliver','revilo','oliver@gmail.com','oliver.png');
insert into Usuario values(NULL,'yong','gnoy','yong@gmail.com','yong.png');
insert into Usuario values(NULL,'coleman','nameloc','coleman@gmail.com','coleman.png');
insert into Usuario values(NULL,'colton','notloc','colton@gmail.com','colton.png');
insert into Usuario values(NULL,'damian','naimad','damian@gmail.com','damian.png');
insert into Usuario values(NULL,'lemuel','leumel','lemuel@gmail.com','lemuel.png');
insert into Usuario values(NULL,'hunter','retnuh','hunter@gmail.com','hunter.png');
insert into Usuario values(NULL,'josiah','haisoj','josiah@gmail.com','josiah.png');
insert into Usuario values(NULL,'scott','ttocs','scott@gmail.com','scott.png');
insert into Usuario values(NULL,'terrell','llerret','terrell@gmail.com','terrell.png');
insert into Usuario values(NULL,'aron','nora','aron@gmail.com','aron.png');
insert into Usuario values(NULL,'alonzo','oznola','alonzo@gmail.com','alonzo.png');
insert into Usuario values(NULL,'omer','remo','omer@gmail.com','omer.png');
insert into Usuario values(NULL,'wilford','drofliw','wilford@gmail.com','wilford.png');
insert into Usuario values(NULL,'clark','kralc','clark@gmail.com','clark.png');
insert into Usuario values(NULL,'jose','esoj','jose@gmail.com','jose.png');
insert into Usuario values(NULL,'martin','nitram','martin@gmail.com','martin.png');
insert into Usuario values(NULL,'carroll','llorrac','carroll@gmail.com','carroll.png');
insert into Usuario values(NULL,'demarcus','sucramed','demarcus@gmail.com','demarcus.png');
insert into Usuario values(NULL,'kurt','truk','kurt@gmail.com','kurt.png');
insert into Usuario values(NULL,'rusty','ytsur','rusty@gmail.com','rusty.png');
insert into Usuario values(NULL,'lon','nol','lon@gmail.com','lon.png');
insert into Usuario values(NULL,'blaine','enialb','blaine@gmail.com','blaine.png');
insert into Usuario values(NULL,'mohammad','dammahom','mohammad@gmail.com','mohammad.png');
insert into Usuario values(NULL,'ignacio','oicangi','ignacio@gmail.com','ignacio.png');
insert into Usuario values(NULL,'eddie','eidde','eddie@gmail.com','eddie.png');
insert into Usuario values(NULL,'dustin','nitsud','dustin@gmail.com','dustin.png');
insert into Usuario values(NULL,'tyson','nosyt','tyson@gmail.com','tyson.png');
insert into Usuario values(NULL,'lester','retsel','lester@gmail.com','lester.png');
insert into Usuario values(NULL,'javier','reivaj','javier@gmail.com','javier.png');
