CREATE TRIGGER tr_InsertLoan
ON Loans
AFTER INSERT
AS
BEGIN
    BEGIN TRANSACTION
        INSERT INTO CachedData (BookTitle, AuthorName, LoanID, LoanStartDate, LoanEndDate, UserName)
        SELECT b.Title, CONCAT(a.FirstName, ' ', a.LastName) , i.LoanID, i.LoanDate, i.ReturnDate, CONCAT(m.FirstName, ' ', m.LastName)
        FROM inserted i
        JOIN Books b ON i.BookID = b.BookID
        JOIN Authors a ON b.AuthorID = a.AuthorID
        JOIN Members m ON i.MemberID = m.MemberID

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK TRANSACTION
            RAISERROR('Error occurred during insert into CachedData table', 16, 1)
            RETURN
        END

    COMMIT TRANSACTION
END
