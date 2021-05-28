USE [master]
GO
IF db_id('TrelloClone') IS NULL
    CREATE DATABASE TrelloClone
GO
USE [TrelloClone]
GO
DROP TABLE IF EXISTS [User];
DROP TABLE IF EXISTS [Color];
DROP TABLE IF EXISTS [Label];
DROP TABLE IF EXISTS [Board];
DROP TABLE IF EXISTS [List];
DROP TABLE IF EXISTS [Card];
DROP TABLE IF EXISTS [CardChecklist];
DROP TABLE IF EXISTS [ChecklistItem];
DROP TABLE IF EXISTS [CardLabel];
GO 

CREATE TABLE [User] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [UserName] NVARCHAR(50) NOT NULL,
  [Email] NVARCHAR(60) NOT NULL,
  [FirebaseUserId] NVARCHAR(28) NOT NULL,
  CONSTRAINT UQ_FirebaseUserId UNIQUE(FirebaseUserId)
)
CREATE TABLE [Color] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  [Code] NVARCHAR(30) NOT NULL
)
CREATE TABLE [Label] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [UserId] INTEGER NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  CONSTRAINT FK_Label_User FOREIGN KEY (UserId) REFERENCES [User](Id),
)
CREATE TABLE [Board] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [UserId] INTEGER NOT NULL,
  [ColorId] INTEGER NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  CONSTRAINT FK_Board_User FOREIGN KEY (UserId) REFERENCES [User](Id),
  CONSTRAINT FK_Board_Color FOREIGN KEY (ColorId) REFERENCES Color(Id)
) 
CREATE TABLE [List] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [BoardId] INTEGER NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  CONSTRAINT FK_List_Board FOREIGN KEY (BoardId) REFERENCES Board(Id)
) 
CREATE TABLE [Card] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [ListId] INTEGER NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  CONSTRAINT FK_Card_List FOREIGN KEY (ListId) REFERENCES List(Id)
)
CREATE TABLE [CardChecklist] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [CardId] INTEGER NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  CONSTRAINT FK_CardChecklist_Card FOREIGN KEY (CardId) REFERENCES Card(Id)
)
CREATE TABLE [ChecklistItem] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [CardChecklistId] INTEGER NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  [IsChecked] BIT NOT NULL,
  CONSTRAINT FK_ChecklistItem_CardChecklist FOREIGN KEY (CardChecklistId) REFERENCES CardChecklist(Id)
)
CREATE TABLE [CardLabel] (
  [Id] INTEGER IDENTITY PRIMARY KEY NOT NULL,
  [CardId] INTEGER NOT NULL,
  [LabelId] INTEGER NOT NULL,
  CONSTRAINT FK_CardLabel_Card FOREIGN KEY (CardId) REFERENCES Card(Id),
  CONSTRAINT FK_CardLabel_Label FOREIGN KEY (LabelId) REFERENCES Label(Id)
)
GO
