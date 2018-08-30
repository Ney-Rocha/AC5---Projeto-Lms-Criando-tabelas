CREATE TABLE ATIVIDADES{
    ID INT IDENTITY,
    TITULO CHAR(50) NOT NULL,
    DESCRICAO VARCHAR(200),
    CONTEUDO VARCHAR(150) NOT NULL,
    TIPO CHAR(20) NOT NULL,
    EXTRAS CHAR(50),
    IDPROFESSOR INT NOT NULL

    CONSTRAINT PK_ID_ATIVIDADES PRIMARY KEY(ID)
};

CREATE TABLE ATIVIDADE_VINCULADA{
    ID INT IDENTITY,
    ID_ATIVIDADE INT NOT NULL,
    ID_PROFESSOR INT NOT NULL,
    ID_DICIPLINA_OFERTADA INT NOT NULL,
    ROTULO CHAR(10) NOT NULL,
    STATUS CHAR(20) NOT NULL,
    DT_INICIO_RESPOSTAS DATETIME NOT NULL,
    DT_FIM_RESPOSTAS DATETIME NOT NULL,

    CONSTRAINT PK_ID_ATIVIDADE_VINCULADA PRIMARY KEY(ID),
    CONSTRAINT FK_ID_ATIVIDADE FOREIGN KEY(ID_ATIVIDADE) REFERENCES ATIVIDADES(ID),
    -- CONSTRAINT FK_ID_PROFESSOR FOREIGN KEY(ID_PROFESSOR) REFERENCES PROFESSOR(ID),
    -- CONSTRAINT FK_ID_DICIPLINA_OFERTADA FOREIGN KEY(ID_DICIPLINA_OFERTADA) REFERENCES DiciplinaOfertada(ID),
    CONSTRAINT UQ_ROTULO_ID_ATIVIDADE_DICIPLINA_OFERTADA UNIQUE(ID_ATIVIDADE,ID_DICIPLINA_OFERTADA,ROTULO),
    CONSTRAINT CK_STATUS CHECK(STATUS IN 'Disponibilizada','Aberta','Fechada','Encerrada','Prorrogada')
};