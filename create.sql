-- SQL script for creating the database schema for MetaLib (CS 665 Project)

-- Users Table
CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY AUTOINCREMENT, 
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Address VARCHAR(255), 
    Phone VARCHAR(20), 
    RegistrationDate DATE NOT NULL, 
    UserType VARCHAR(50) NOT NULL 
);

-- Books Table
CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY AUTOINCREMENT, 
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) NOT NULL UNIQUE,
    PublicationYear INTEGER, 
    Genre VARCHAR(100) NOT NULL,
    Publisher VARCHAR(255), 
    Edition VARCHAR(50),
    NumberOfCopies INTEGER NOT NULL 
);

-- Book_Status Table
CREATE TABLE Book_Status (
    BookID INTEGER PRIMARY KEY,
    Status VARCHAR(50) NOT NULL,
    Location VARCHAR(255),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Borrowing Table
CREATE TABLE Borrowing (
    BorrowID INTEGER PRIMARY KEY AUTOINCREMENT, 
    UserID INTEGER NOT NULL,
    BookID INTEGER NOT NULL,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Fines Table
CREATE TABLE Fines (
    FineID INTEGER PRIMARY KEY AUTOINCREMENT, 
    UserID INTEGER NOT NULL,
    BorrowID INTEGER NOT NULL,
    FineAmount REAL NOT NULL,
    FineDate DATE NOT NULL,
    PaymentDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BorrowID) REFERENCES Borrowing(BorrowID)
);

-- Events Table
CREATE TABLE Events (
    EventID INTEGER PRIMARY KEY AUTOINCREMENT, 
    EventName VARCHAR(255) NOT NULL,
    EventDate DATE NOT NULL,
    EventTime TIME, 
    Location VARCHAR(255),
    Description TEXT NOT NULL
);

-- Trigger to update the book status upon borrowing
CREATE TRIGGER UpdateBookStatusBorrowing
AFTER INSERT ON Borrowing
FOR EACH ROW
BEGIN
    UPDATE Book_Status SET Status = 'Borrowed' WHERE BookID = NEW.BookID;
END;

-- Trigger to update the book status upon returning
CREATE TRIGGER UpdateBookStatusReturning
AFTER UPDATE ON Borrowing
FOR EACH ROW WHEN NEW.ReturnDate IS NOT NULL
BEGIN
    UPDATE Book_Status SET Status = 'Available' WHERE BookID = NEW.BookID;
END;

--Trigger to create a book status when a book is created.
CREATE TRIGGER CreateBookStatus
AFTER INSERT ON Books
FOR EACH ROW
BEGIN
    INSERT INTO Book_Status (BookID, Status, Location) VALUES (NEW.BookID, 'Available', 'Library');
END;
