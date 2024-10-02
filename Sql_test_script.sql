-----CREATE TABLES----

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);
---INSERT VALUES INTO AUTHORS-------

INSERT INTO Authors (author_id, name) VALUES (1, 'J.K. Rowling');
INSERT INTO Authors (author_id, name) VALUES (2, 'George Orwell');
INSERT INTO Authors (author_id, name) VALUES (3, 'J.R.R. Tolkien');
INSERT INTO Authors (author_id, name) VALUES (4, 'Agatha Christie');
INSERT INTO Authors (author_id, name) VALUES (5, 'Mark Twain');

---INSERT VALUES INTO BOOKS-------

INSERT INTO Books (book_id, title, author_id) VALUES (1, 'Harry Potter', 1);
INSERT INTO Books (book_id, title, author_id) VALUES (2, '1984', 2);
INSERT INTO Books (book_id, title, author_id) VALUES (3, 'The Hobbit', 3);
INSERT INTO Books (book_id, title, author_id) VALUES (4, 'Murder on the Orient Express', 4);
INSERT INTO Books (book_id, title, author_id) VALUES (5, 'The Adventures of Tom Sawyer', 5);

---INSERT VALUES INTO BORROWERS-------

INSERT INTO Borrowers (borrower_id, name) VALUES (1, 'Alice Johnson');
INSERT INTO Borrowers (borrower_id, name) VALUES (2, 'Bob Smith');
INSERT INTO Borrowers (borrower_id, name) VALUES (3, 'Charlie Brown');
INSERT INTO Borrowers (borrower_id, name) VALUES (4, 'Diana Prince');
INSERT INTO Borrowers (borrower_id, name) VALUES (5, 'Evan Wright');

---INSERT VALUES INTO LOANS-------

INSERT INTO Loans (loan_id, book_id, borrower_id, loan_date, return_date) 
VALUES (1, 1, 1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-15', 'YYYY-MM-DD'));
INSERT INTO Loans (loan_id, book_id, borrower_id, loan_date, return_date) 
VALUES (2, 2, 2, TO_DATE('2024-09-02', 'YYYY-MM-DD'), TO_DATE('2024-09-16', 'YYYY-MM-DD'));
INSERT INTO Loans (loan_id, book_id, borrower_id, loan_date, return_date) 
VALUES (3, 3, 3, TO_DATE('2024-09-03', 'YYYY-MM-DD'), TO_DATE('2024-09-17', 'YYYY-MM-DD'));
INSERT INTO Loans (loan_id, book_id, borrower_id, loan_date, return_date) 
VALUES (4, 4, 4, TO_DATE('2024-09-04', 'YYYY-MM-DD'), TO_DATE('2024-09-18', 'YYYY-MM-DD'));
INSERT INTO Loans (loan_id, book_id, borrower_id, loan_date, return_date) 
VALUES (5, 5, 5, TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('2024-09-19', 'YYYY-MM-DD'));

***DML OPERATIONS***

----INSERT DATA----
-- Insert into Authors
INSERT INTO Authors (author_id, name) VALUES (6, 'J.K. Rowling');

-- Insert into Books
INSERT INTO Books (book_id, title, author_id) VALUES (6, 'Harry Potter', 1);

-- Insert into Borrowers
INSERT INTO Borrowers (borrower_id, name) VALUES (6, 'Alice Johnson');

-- Insert into Loans
INSERT INTO Loans (loan_id, book_id, borrower_id, loan_date, return_date) 
VALUES (6, 6, 6, TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-15', 'YYYY-MM-DD'));

-----UPDATE DATA-----

UPDATE Books SET title = 'Harry Potter and the Sorcerer''s Stone' WHERE book_id = 1;

----DELETE DATA-----

DELETE FROM Loans WHERE loan_id = 1;

----SELECT DATA----

SELECT * FROM Authors;


*** JOINING ***

---inner join---

SELECT b.title, a.name AS author, br.name AS borrower, l.loan_date
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Loans l ON b.book_id = l.book_id
JOIN Borrowers br ON l.borrower_id = br.borrower_id;

*** DDL OPERATIONS***

----CREATE TABLE------

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100)
);

---ALTER TABLE---

ALTER TABLE Authors ADD birthdate DATE;

----DROP TABLE----

DROP TABLE Authors;

***DCL OPERATIONS***

---GRANT PREMISSION---
GRANT SELECT, INSERT ON Authors TO DIP;

---REVOKE PERMISSION---
REVOKE INSERT ON Authors FROM DIP;

***TCL OPERATION***

---COMMIT---
COMMIT;

---ROLLBACK---
ROLLBACK;












