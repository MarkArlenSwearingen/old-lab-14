

CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
--Create the bookshelves table with a primary key and name column.
--expected result CREATE TABLE

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
--This sql statement is placing one row for each bookshelf value from the books table into the name column in the bookshelves table.
--expected results INSERT 0 8

ALTER TABLE books ADD COLUMN bookshelf_id INT;
-- Alter or modify the books table to include an additional column for bookshelf_id with an integer in anticipation of later making this column a foreign key
--expected results ALTER TABLE

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
--This is a more complicated SQL statement to update the newly added bookshelf_id column with the shelf.id from the bookshelves table.  A subquery is used with an alias of shelf as a table with a join between the books table bookshelf column with the bookshelves table name column.
--expected result UPDATE 10 where 10 is the number of rows updated.

ALTER TABLE books DROP COLUMN bookshelf;
--The final step is to remove/drop the column bookshelf since we have added the foreign key of bookshelf_id to the books tabel.
--expected result ALTER TABLE

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
--This sql command makes the bookshelf_id become an actual foreign key from the interger values inserted in anticipation of this step.
--expected results ALTER TABLE
