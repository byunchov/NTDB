DROP TABLE IF EXISTS CachedData;
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS BookCategories;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS Categories;

-- Create the Publishers table

CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(50) NOT NULL
);

-- Create the Authors table

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(50) NOT NULL
);

-- Create the Books table

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    ISBN NVARCHAR(20) NOT NULL,
    PublicationDate DATE NOT NULL,
    PublisherID INT NOT NULL,
	AuthorID INT NOT NULL,
    CONSTRAINT FK_Books_Publishers FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    CONSTRAINT FK_Books_Authors FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create the Categories table

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255) NOT NULL
);

-- Create the BookCategories table

CREATE TABLE BookCategories (
    BookID INT NOT NULL,
    CategoryID INT NOT NULL,
    CONSTRAINT PK_BookCategories PRIMARY KEY (BookID, CategoryID),
    CONSTRAINT FK_BookCategories_Books FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT FK_BookCategories_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create the Members table

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(50) NOT NULL,
    MembershipStatus NVARCHAR(50) NOT NULL
);

-- Create the Loans table

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    LoanDate DATE NOT NULL,
    ReturnDate DATE NULL,
    CONSTRAINT FK_Loans_Members FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    CONSTRAINT FK_Loans_Books FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Create cached table 
CREATE TABLE CachedData (
    CachedDataID INT PRIMARY KEY IDENTITY,
    BookTitle NVARCHAR(255),
    AuthorName NVARCHAR(255),
	LoanID INT NOT NULL,
    LoanStartDate DATE,
    LoanEndDate DATE,
    UserName NVARCHAR(255),
	CONSTRAINT FK_LoanID FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
)
