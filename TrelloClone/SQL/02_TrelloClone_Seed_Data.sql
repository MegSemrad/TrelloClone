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
  (10, 'Wheat', '#F5DEB3'),;
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
