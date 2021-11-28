ALTER TABLE [p-Users]
DROP CONSTRAINT FK_UsersUsersCreated,FK_UsersUsersManages, FK_UsersCompany

ALTER TABLE [p-Company]
DROP CONSTRAINT FK_CompanyUsers

ALTER TABLE [p-MCAnswers]
DROP CONSTRAINT FK_MCAsnwersQuestions

ALTER TABLE [p-MCQuestions]
DROP CONSTRAINT FK_MCQuestionsQuestions

ALTER TABLE [p-FreeTextQuestion]
DROP CONSTRAINT FK_FreeTextQuestionQuestions

ALTER TABLE [p-NumQuestions]
DROP CONSTRAINT FK_NumQuestionsQuestions


ALTER TABLE [p-Questionnaire]
DROP CONSTRAINT FK_ParentIDQuestionaire,FK_QuestionnaireUsers

ALTER TABLE [p-Includes]
DROP CONSTRAINT FK_IncludesQuestion,FK_IncludesQuestionnaire



DROP TABLE dbo.[p-Users];

DROP TABLE dbo.[p-Company];

DROP TABLE dbo.[p-Questionnaire];

DROP TABLE dbo.[p-Question];

DROP TABLE dbo.[p-MCAnswers];

DROP TABLE dbo.[p-MCQuestions];

DROP TABLE dbo.[p-FreeTextQuestion];

DROP TABLE dbo.[p-NumQuestions];

DROP TABLE dbo.[p-Includes];
