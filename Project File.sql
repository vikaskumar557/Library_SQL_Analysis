use library_managment_system;

# questions
#1.show all books
select book_name from books;

#2.show only books name and prices
select book_Name,price from books;

#3.find book a price greaterthan 500
select*from books
where price>=500;

#4.show member who live in delhi
select* from members
where City="delhi" ;

#5.sort book by price
select book_Name,price  from books
order by price asc;

#6.show each books withit authors name
select b.book_Name,a.Author_Name
from books  b
inner join Authors  a
on b.Author_id= a.Author_id;

#7.count the total number of books each category
select category , count(Book_Name)as countbook from books
group by Category;

#8.find the average price of books each category
select Book_Name , avg(price)as Avgbook from books
group by Book_Name;

#9.show member who have borrowed at least one book 
select distinct m.member_name ,i.Return_Date 
from members  as m
inner join issue_return as i
on m.Member_id=i.Member_id;

#10.find the top 5 most expense books
select Book_Name,price from books
order by price desc
limit 5;

#11.find the author who has written the highest number of books
select a.author_Name, 
count(b.book_id) as total_book from authors as a
inner join books as b
on a.author_id=b.author_id
group by a.author_id,a.author_name 
order by total_book desc
limit 1;

#12.find member who borrowed more the 5 books
select m.Member_name ,count(*) as totalbook
from members as m
join issue_return as i
on m.Member_ID = i.Member_ID
group by m.member_name
having count(*)>5;

#13.show book that have never been issue 
select b.book_name from books as b
left join issue_return as i
on b.Book_ID=i.Book_ID
where i.Book_ID is null;


#14.find the most borrowed books 
select b.book_name ,i.return_date
from books as b
inner join issue_return as i
on b.book_id=i.book_id
order by Return_Date desc
limit 1;

#15.show the top 3 member who borrowed the most books
select m.member_name ,count(i.book_id) as totalborrowed
from members as m
inner join issue_return as i
on m.member_id=i.member_id
group by m.member_id ,m.member_name
order by totalborrowed desc
limit 3;

