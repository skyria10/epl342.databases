--DATABASE CREATION
--Table creation
CREATE TABLE dbo.[p-Users] (
    UserID [int] NOT NULL PRIMARY KEY,
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    BDate [date] NOT NULL,
    Sex [int] NOT NULL,
    [Type] [int] NOT NULL,
    Username [NVARCHAR](50) NOT NULL,
    [Password] [NVARCHAR](50) NOT NULL,
    CreatedBy int NOT NULL,
    Manages int,
    WorksFor int
);

CREATE TABLE dbo.[p-Company] (
    RecordNum [int] NOT NULL PRIMARY KEY,
    [Name] [NVARCHAR](50) NOT NULL,
    EntryDate [date] NOT NULL,
    CreatedBy int NOT NULL

);

CREATE TABLE dbo.[p-Questionnaire] (
    QuestionnaireID [int] NOT NULL PRIMARY KEY,
    [Title] [NVARCHAR](50) NOT NULL,
    [URL] [NVARCHAR](50) NOT NULL,
    parentID int,
    CreatedBy int NOT NULL

);

CREATE TABLE dbo.[p-Question] (
    QuestionID [int] NOT NULL PRIMARY KEY,
    [Type] int NOT NULL,
    [Text] [NVARCHAR](50) NOT NULL,
    [Description] [NVARCHAR](500) NOT NULL -- specify more columns here
);

CREATE TABLE dbo.[p-MCAnswers] (
    QuestionID [int] NOT NULL PRIMARY KEY,
    [Answer] [NVARCHAR](50) NOT NULL,
    CONSTRAINT FK_MCAsnwersQuestions FOREIGN KEY ([QuestionID]) REFERENCES [p-Question](QuestionID) -- specify more columns here
);

CREATE TABLE dbo.[p-MCQuestions] (
    QuestionID [int] NOT NULL PRIMARY KEY,
    [SelectableAmount] int NOT NULL,
    CONSTRAINT FK_MCQuestionsQuestions FOREIGN KEY ([QuestionID]) REFERENCES [p-Question](QuestionID)
);

CREATE TABLE dbo.[p-FreeTextQuestion] (
    QuestionID [int] NOT NULL PRIMARY KEY,
    [Restriction] int NOT NULL,
    CONSTRAINT FK_FreeTextQuestionQuestions FOREIGN KEY ([QuestionID]) REFERENCES [p-Question](QuestionID)
);

CREATE TABLE dbo.[p-NumQuestions] (
    QuestionID [int] NOT NULL PRIMARY KEY,
    [min] int NOT NULL,
    [max] int NOT NULL CONSTRAINT FK_NumQuestionsQuestions FOREIGN KEY ([QuestionID]) REFERENCES [p-Question](QuestionID)
);

CREATE TABLE dbo.[p-Includes] (
    QuestionID [int] NOT NULL,
    QuestionnaireID [int] NOT NULL,
    CONSTRAINT FK_IncludesQuestion FOREIGN KEY ([QuestionID]) REFERENCES [p-Question](QuestionID),
    CONSTRAINT FK_IncludesQuestionnaire FOREIGN KEY ([QuestionnaireID]) REFERENCES [p-Questionnaire](QuestionnaireID) -- specify more columns here
);

--ADD CONSTRAINTS
ALTER TABLE
    dbo.[p-Users]
ADD
    CONSTRAINT FK_UsersUsersCreated FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[p-Users](UserID),
    CONSTRAINT FK_UsersUsersManages FOREIGN KEY ([Manages]) REFERENCES [dbo].[p-Users](UserID),
    CONSTRAINT FK_UsersCompany FOREIGN KEY ([WorksFor]) REFERENCES [dbo].[p-Company](RecordNum);

ALTER TABLE
    dbo.[p-Company]
ADD
    CONSTRAINT FK_CompanyUsers FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[p-Users](UserID);

ALTER TABLE
    dbo.[p-Questionnaire]
ADD
    CONSTRAINT FK_ParentIDQuestionaire FOREIGN KEY ([parentID]) REFERENCES [dbo].[p-Questionnaire](QuestionnaireID),
    CONSTRAINT FK_QuestionnaireUsers FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[p-Users](UserID);