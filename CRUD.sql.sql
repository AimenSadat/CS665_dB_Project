-- SQL script for performing CRUD operations on the MetaLib (CS 665 Project) database

-- Create Operation (Insert a new user)
INSERT INTO Users (FirstName, LastName, Email, Password, Address, Phone, RegistrationDate, UserType) VALUES
('Eva', 'Green', 'eva.green@gmsil.com', 'pasfjhcv11', '7th Tall Oak St', '316-987-6543', '2026-02-27', 'Member');

-- Create Operation (Insert a new book)
INSERT INTO Books (Title, Author, ISBN, PublicationYear, Genre, Publisher, Edition, NumberOfCopies) VALUES
('The Martian', 'Andy Weir', '9780553418026', 2014, 'Science Fiction', 'Crown Publishing Group', '1st', 10);

-- Create Operation (Insert a new borrowing record)
INSERT INTO Borrowing (UserID, BookID, BorrowDate, DueDate) VALUES
(5, 4, '2025-03-27', '2025-04-10');

-- Read Operation (Select all books)
SELECT * FROM Books;

-- Read Operation (Select all users)
SELECT * FROM Users;

-- Read Operation (Select borrowed books with user information)
SELECT Books.Title, Users.FirstName, Users.LastName, Borrowing.BorrowDate, Borrowing.DueDate
FROM Borrowing
JOIN Books ON Borrowing.BookID = Books.BookID
JOIN Users ON Borrowing.UserID = Users.UserID
WHERE Borrowing.ReturnDate IS NULL;

-- Read Operation (Select all fines)
SELECT * from Fines;

-- Update Operation (Update a book's status and location)
UPDATE Book_Status SET Status = 'Borrowed', Location = 'Checked Out' WHERE BookID = 2;

-- Update Operation (Update a user's address)
UPDATE Users SET Address = 'New Address' WHERE UserID = 1;

-- Update Operation (Mark a book as returned)
UPDATE Borrowing SET ReturnDate = '2025-11-01' WHERE BookID = 4 AND UserID = 1;

-- Update Operation (Update fine payment date)
UPDATE Fines SET PaymentDate = '2025-04-05' WHERE FineID = 1;

-- Delete Operation (Delete a user)
DELETE FROM Users WHERE UserID = 4;

-- Delete Operation (Delete a book)
DELETE FROM Books WHERE BookID = 1;

-- Delete Operation (Delete a fine)
DELETE FROM Fines WHERE FineID = 1;

-- Additional Operation: Join Books, Borrowing, and Users to see which books are borrowed and by whom
SELECT Books.Title, Books.Author, Users.FirstName, Users.LastName, Borrowing.BorrowDate, Borrowing.DueDate
FROM Books
JOIN Borrowing ON Books.BookID = Borrowing.BookID
JOIN Users ON Borrowing.UserID = Users.UserID;