Create database ParfumShop

use ParfumShop

create table Categories(
	ID int primary key identity,
	Name nvarchar(50) not null,
)

Create table Brands(
	ID int primary key identity,
	BrandName nvarchar(50) not null,
	Category_ID int foreign key references Categories(ID)
)

Create table Marks(
	ID int primary key identity,
	MarkName nvarchar(50) not null,
	Brand_ID int foreign key references Brands(ID)
)

Create table Products(
	ID int primary key identity,
	ProductName nvarchar(30) not null,
	Image nvarchar(150) not null,
	Price int not null,
	Count int not null,
	Volume int not null,
	MarkID int foreign key references Marks(ID)
)

select br.BrandName,Sum(p.Price) as 'Total Price' from Brands br
join Marks m on br.ID=m.Brand_ID
join Products p on m.ID=p.ID
group by br.BrandName


