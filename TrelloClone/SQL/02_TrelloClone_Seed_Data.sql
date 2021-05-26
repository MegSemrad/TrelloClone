USE[TrelloCLone];
GO


SET IDENTITY_INSERT [User] ON
INSERT INTO [User]
  ([Id], [UserName], [Email], [FirebaseUserId])
VALUES 
  (1, 'Adam', 'a@a.com', 'pANKHUYfrPUXYk1ehTAfKBc7idA2'), 
  (2, 'Beth', 'b@b.com', '5Sg0kYTNKlUi5IgGEEDeusri7uQ2');
SET IDENTITY_INSERT [User] OFF


SET IDENTITY_INSERT [Color] ON
INSERT INTO [Color]
  ([Id], [Name], [Code])
VALUES 
  (1, 'LightPink', '#FFB6C1'), 
  (2, 'Tan', '#D2B48C'),
  (3, 'Peach', '#FFDAB9'),
  (4, 'Lemon Chiffon', '#FFFACD'),
  (5, 'CornflowerBlue', '#6495ED'),
  (6, 'Dark Sea Green', '#8FBC8F'),
  (7, 'Honey Dew', '#F0FFF0'),
  (8, 'LightBlue', '#ADD8E6'),
  (9, 'Thistle', '#D8BFD8'),
  (10, 'Wheat', '#F5DEB3');
SET IDENTITY_INSERT [Color] OFF


SET IDENTITY_INSERT [Label] ON
INSERT INTO [Label]
  ([Id], [UserId], [Name])
VALUES 
  (1, 1, 'Personal'), 
  (2, 1, 'Work'),
  (3, 1, 'House'),
  (4, 1, 'School'),
  (5, 1, 'Groceries');
SET IDENTITY_INSERT [Label] OFF


SET IDENTITY_INSERT [Board] ON
INSERT INTO [Board]
  ([Id], [UserId], [ColorId], [Name])
VALUES 
  (1, 1, 9, 'Weekly To Do''s');
SET IDENTITY_INSERT [Board] OFF


SET IDENTITY_INSERT [List] ON
INSERT INTO [List]
  ([Id], [BoardId], [Name])
VALUES 
   (1, 1, 'School Work'), 
   (2, 1, 'Errands');
SET IDENTITY_INSERT [List] OFF


SET IDENTITY_INSERT [Card] ON
INSERT INTO [Card]
  ([Id], [ListId], [Name], [Description])
VALUES 
  (1, 1, 'History', 'Work to complete before history class on Friday'),  
  (2, 2, 'Groceries', 'Grocery items to pick up'); 
SET IDENTITY_INSERT [Card] OFF


SET IDENTITY_INSERT [CardChecklist] ON
INSERT INTO [CardChecklist]
  ([Id], [CardId], [Name])
VALUES 
  (1, 2, 'Kroger'),  
  (2, 2, 'Costco'),
  (3, 1, 'Research Project'),
  (4, 1, 'Homework'); 
SET IDENTITY_INSERT [CardChecklist] OFF


SET IDENTITY_INSERT [ChecklistItem] ON
INSERT INTO [ChecklistItem]
  ([Id], [CardChecklistId], [Name], [IsChecked])
VALUES 
  (1, 2, 'Paper towels', 0),  
  (2, 2, 'Eggs', 1),
  (3, 3, 'Research for research project', 1),
  (4, 3, 'Write research project paper', 0),
  (5, 1, 'Bread', 1),
  (6, 1, 'Avocados', 0),
  (7, 4, 'Worksheet', 0),
  (8, 4, 'Read chapter 9', 1); 
SET IDENTITY_INSERT [ChecklistItem] OFF


SET IDENTITY_INSERT [CardLabel] ON
INSERT INTO [CardLabel]
  ([Id], [LabelId], [CardId])
VALUES 
  (1, 4, 1),  
  (2, 3, 2),
  (3, 5, 2); 
SET IDENTITY_INSERT [CardLabel] OFF
