-- Add sample publishers
INSERT INTO Publishers (PublisherID, Name, Address, Email, Phone)
VALUES (1, 'Penguin Random House', '123 Main St, New York, NY 10001', 'info@penguinrandomhouse.com', '(212) 555-1212'),
       (2, 'HarperCollins Publishers', '456 Broadway, New York, NY 10013', 'info@harpercollins.com', '(212) 555-1212'),
       (3, 'Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', 'info@simonandschuster.com', '(212) 555-1212');

-- Add sample authors
INSERT INTO Authors (AuthorID, FirstName, LastName, Email, Phone)
VALUES (1, 'J.K.', 'Rowling', 'jkrowling@gmail.com', '(212) 555-1212'),
       (2, 'Stephen', 'King', 'sking@gmail.com', '(212) 555-1212'),
       (3, 'Dan', 'Brown', 'dbrown@gmail.com', '(212) 555-1212');

-- Add sample categories
INSERT INTO Categories (CategoryID, Name, Description)
VALUES (1, 'Fiction', 'Books that are not true'),
       (2, 'Non-fiction', 'Books that are true'),
       (3, 'Mystery', 'Books that are suspenseful and involve a crime');

-- Add sample books
INSERT INTO Books (BookID, Title, ISBN, PublicationDate, PublisherID, AuthorID)
VALUES (1, 'Harry Potter and the Philosopher''s Stone', '978-1-4088-6239-2', '1997-06-26', 1, 1),
       (2, 'The Shining', '978-0-385-12167-5', '1977-01-28', 2, 3),
       (3, 'The Da Vinci Code', '978-0-385-50420-8', '2003-03-18', 3, 2);

-- Add sample book categories
INSERT INTO BookCategories (BookID, CategoryID)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (3, 3);

-- Add sample members
INSERT INTO Members (MemberID, FirstName, LastName, Email, Phone, MembershipStatus)
VALUES (1, 'John', 'Doe', 'johndoe@gmail.com', '(212) 555-1212', 'Active'),
       (2, 'Jane', 'Doe', 'janedoe@gmail.com', '(212) 555-1212', 'Active'),
       (3, 'Bob', 'Smith', 'bobsmith@gmail.com', '(212) 555-1212', 'Inactive');

-- Add sample loans
INSERT INTO Loans (LoanID, MemberID, BookID, LoanDate, ReturnDate)
VALUES (1, 1, 1, '2022-01-01', NULL),
       (2, 1, 2, '2022-02-01', '2022-02-08'),
       (3, 2, 3, '2022-03-01', NULL);
