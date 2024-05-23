-- Create the library database if it doesn't exist
CREATE DATABASE library;

-- Use the library database
USE library;

-- Create the Branch table
CREATE TABLE Branch(Branch_no int PRIMARY KEY,
    Manager_Id int,
    Branch_address VARCHAR(25),
    Contact_no VARCHAR(20));

-- Create the Employee table
CREATE table Employee(Eml_Id INT PRIMARY KEY,
    Eml_name VARCHAR(25),
    Position VARCHAR(20),
    Salary DECIMAL(10, 2),
    Branch_no int,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));

-- Create the Books table
CREATE table Books(
    Bkl VARCHAR(30) PRIMARY KEY,
    Book_title VARCHAR(35),
    Category VARCHAR(30),
    Rental_Price DECIMAL(20, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(30),
    Publisher VARCHAR(35));

-- Create the Customer table
CREATE TABLE Customer(
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(25),
    Customer_address VARCHAR(25),
    Reg_date DATE);

-- Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(25),
    Issue_date DATE,
    Bkl_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Bkl_book) REFERENCES Books(Bkl));

-- Create the ReturnStatus table
CREATE table ReturnStatus(
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(25),
    Return_date DATE,
    Bkl_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Bkl_book2) REFERENCES Books(Bkl));
  
  SHOW tables;
  
  -- Insert into to all tables are shown below.
insert INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
values (1, 101, 'WND tlpy', '0471-152234'),
       (2, 102, 'WND mndy', '0585-256578'),
       (3, 103, 'KOZ vada', '0455-955201'),
       (4, 104, 'KAN tlly', '04362-236542'),
       (5, 105, 'DEL ctry', '011-256874'),
       (6, 106, 'MUM sea', '022-369852');

INSERT into Employee (Eml_Id, Eml_name, Position, Salary, Branch_no)
values (101, 'Jonny mon', 'Manager', 60000, 1),
       (102, 'Nimmy m', 'Assistant Manager', 50000, 2),
       (103, 'Bibin kvn', 'Librarian', 45000, 3),
       (104,'Siji kl', 'Security', 30000, 4),
       (105, 'Alice Smith', 'Librarian', 45000, 1),
       (106, 'Bob Johnson', 'Assistant Librarian', 40000, 1),
       (107, 'Emily Brown', 'Clerk', 35000, 1),
       (108, 'James Wilson', 'Security', 30000, 1),
       (109, 'Emma Lee', 'Librarian', 45000, 2),
       (110, 'Mini Aju', 'Assistant Librarian', 45000, 1);

INSERT into Books (Bkl, Book_title, Category, Rental_Price, Status, Author, Publisher)
values ('978', 'To Kill a Mockingbird', 'Fiction', 10.99, 'yes', 'Harper Lee', 'Harper Perennial'),
       ('977', '1984', 'Science Fiction', 12.99, 'yes', 'George Orwell', 'Penguin Books'),
       ('979', 'The Catcher in the Rye', 'Fiction', 11.99, 'no', 'J.D. Salinger', 'Little, Brown and Company'),
       ('980', 'The cartoon', 'History', 12.99, 'no', 'Sangeeth R', 'Red and Company'),
       ('981', 'Pride and Prejudice', 'Fiction', 9.99, 'yes', 'Jane Austen', 'Penguin Classics'),
       ('982', 'The Great Gatsby', 'Fiction', 11.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
       ('983', 'To the Lighthouse', 'Fiction', 10.99, 'no', 'Virginia Woolf', 'Woolf Publishing');

insert INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
values (101, 'Johnson', '23 CSK ', '2021-06-13'),
       (102, 'Smith', '45 KNR nm', '2020-08-03'),
       (103, 'Carol kt', '56 Tly Pyn', '2023-10-28'),
       (104, 'Vibin menon', '56 KOK Era','2023-07-08'),
       (105, 'Ramesh Gupta', '12 DEL rd', '2021-09-15'),
       (106, 'Sneha Verma', '34 MUM st', '2022-01-05'),
       (107, 'Emma Thompson', '789 ABC Street', '2021-10-15'),
       (108, 'John Doe', '456 XYZ Avenue', '2021-12-20');

INSERT into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Bkl_book)
values (1, 101, 'To Kill a Mockingbird', '2024-05-15', '978'),
       (2, 102, '1984', '2024-05-20', '977'),
       (3, 103, 'The Catcher in the Rye', '2024-05-25', '979'),
       (4, 104,'The cartoon','2024-05-10','980'),
       (5, 101, '1984', '2024-06-01', '977'),
       (6, 103, 'To Kill a Mockingbird', '2024-06-05', '978'),
       (7, 102, 'The Catcher in the Rye', '2024-06-10', '979'),
       (8, 104, 'The cartoon', '2024-06-15', '980'),
       (9, 101, 'To Kill a Mockingbird', '2023-06-05', '978'),
       (10, 102, '1984', '2023-06-10', '977');

INSERT into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Bkl_book2)
values (1, 101, 'To Kill a Mockingbird', '2024-06-05', '978'),
       (2, 102, '1984', '2024-06-10', '977'),
       (3, 103, 'The Catcher in the Rye', '2024-06-15', '979'),
       (4, 104,'The cartoon', '2024-06-10','980'),
       (5, 105, 'Pride and Prejudice', '2024-06-15', '981'),
       (6, 106, 'The Great Gatsby', '2024-06-20', '982');

-- 1.Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

SELECT Eml_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Bkl_book = b.Bkl
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Eml_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE YEAR(i.Issue_date) = 2023 AND MONTH(i.Issue_date) = 6;

-- 9. Retrieve book_title from book table containing history.

SELECT Book_title
FROM Books
WHERE Category = 'History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;
