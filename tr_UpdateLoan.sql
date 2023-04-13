CREATE TRIGGER tr_UpdateLoan
ON Loans
AFTER UPDATE
AS
BEGIN
    BEGIN TRANSACTION
        UPDATE CachedData
        SET BookTitle = b.Title,
            AuthorName = CONCAT(a.FirstName, ' ', a.LastName),
            LoanStartDate = i.LoanDate,
            LoanEndDate = i.ReturnDate,
            UserName = CONCAT(m.FirstName, ' ', m.LastName)
        FROM CachedData cd
        JOIN inserted i ON cd.LoanID = i.LoanID
        JOIN Books b ON i.BookID = b.BookID
        JOIN Authors a ON b.AuthorID = a.AuthorID
        JOIN Members m ON i.MemberID = m.MemberID

        IF @@ERROR <> 0
        BEGIN
            ROLLBACK TRANSACTION
            RAISERROR('Error occurred during update of CachedData table', 16, 1)
            RETURN
        END

    COMMIT TRANSACTION
END
