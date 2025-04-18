-- SQL script for inserting sample data into the MetaLib (CS 665 Project) database

-- Inserting Users
INSERT INTO Users (FirstName, LastName, Email, Password, Address, Phone, RegistrationDate, UserType) VALUES
('Aimen', 'Sadat', 'a.sadat@gmail.com', 'pjscwjAC23', '2909 N oliver St', '316-670-9825', '2025-03-15', 'Admin'),
('Ali', 'Tashfeen', 'a.tashfeen@gmail.com.com', 'jcwen;', 'Eaglerock Village Appartments', '316 270-5846', '2025-13-16', 'Admin'),
('Amy', 'Green', 'amygreen@gmail.com', 'dhcf;wuehnf;ow', '234 N Pine Hill Ln', '316-123-4567', '2025-3-26', 'Member'),
('Ana', 'Brown', 'ana.brown@example.com', 'sbfrj', '10 Tall Oks Rd', '311-23-2433', '2025-03-22', 'Librarian');
('Leo', 'Mathew','leao.meth@gamil.com', 'asjfjtredksk','Alberster Apt', '316-567-4567', '2015-03-22', 'Member' )
-- Inserting Books
INSERT INTO Books (Title, Author, ISBN, PublicationYear, Genre, Publisher, Edition, NumberOfCopies) VALUES
('Jannat Kay Pattay', 'Nimra Ahmed', '978-9696024107', 2009,'Clasic', '1st' 6),
 ('Peer e Kamil (S.A.W.W)', 'Humera Ahmed', '758-5566765457' 2010, 'Classic', 'Scribner', '1st', 5),
 ('Meri Zaat Zarra-e-Benishan','Humera' '978-9696024084', 197, 'Classic', 'Scribner', '1st', 5),
 ('The Forty Rules of Love', 'Elif Shafaq' '978-0670068521', 2013, 'Romance', 'T. Egerton', '1st', 4),
 ('The Alchemist', '978-0061122415', ' Polo Cheolo' , 2006, 'Fiction', 'J. B. Lippincott & Co.', '1st', 3),
 ('Harry Potter and the Sorcerer Stone', 'J.K Rowling', '978-0747532699', '1997-06-26', 1960, 'Fiction', 'J. B. Lippincott & Co.', '1st', 3),
 ('The New York Trilogy', 'Jane Austin','978-0140106191',  1999, 'Dystopian', 'Secker & Warburg', '1st', 2)

-- Inserting Book_Status
INSERT INTO Book_Status (BookID, Status, Location) VALUES
(1, 'Available', 'Shelf A1'),
(2, 'Available', 'Shelf B2'),
(3, 'Borrowed', 'Checked Out'),
(4, 'Available', 'Shelf C3');
(5, 'Available', 'Shelf D4');
(6, 'Borrowed', 'Shelf A2');
(7, 'Available', 'Shelf D2')

-- Inserting Borrowings
INSERT INTO Borrowing (UserID, BookID, BorrowDate, DueDate, ReturnDate) VALUES
(3, 3, '2025-03-29', '2025-04-24', NULL);
(2, 6, '2025-03-30', '2025-04-24', NULL);

-- Inserting Fines
INSERT INTO Fines (UserID, BorrowID, FineAmount, FineDate, PaymentDate) VALUES
(3, 1, 2.50, '2025-03-25', NULL);

-- Inserting Events
INSERT INTO Events (EventName, EventDate, EventTime, Location, Description) VALUES
('Book Club Meeting', '2025-05-15', '18:00:00', 'Library Meeting Room', 'Monthly book club meeting.'),
('Author Visit', '2025-05-10', '15:00:00', 'Library Auditorium', 'Meet the Author event with local writer Jane Austin.');
