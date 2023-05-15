drop schema if exists voorraadbeheer;
create schema voorraadbeheer;
use voorraadbeheer;
-- deletes database and creates new, use for resets only!

-- creates table for the departments, attributes can be added here
create table department(
	departmentID int primary key auto_increment,
    name varchar(50) NOT NULL,
    notes varchar(300)
);

-- creates table for the items, attributes can be added here
-- barcode and supplier code are strings as they shouldn't be used in equations
create table item(
	itemID int primary key auto_increment,
    barcode varchar(30) not null, 
    name varchar(50),
    count int not null,
    supplier varchar(50) not null,
    productCodeSupplier varchar(30),
    itemCountPerOrder int not null,
    notes varchar(300),
    departmentID int not null,
    constraint FK1_item_department
		foreign key (departmentID)
        references department(departmentID)
);

-- creates table for the perishable items, attributes can be added here
-- barcode and supplier code are strings as they shouldn't be used in equations
create table perishableItem(
	itemID int primary key auto_increment,
    barcode varchar(30) not null, 
    name varchar(50),
    count int not null,
    expirationDate date not null,
    supplier varchar(50) not null,
    productCodeSupplier varchar(30),
    itemCountPerOrder int not null,
    notes varchar(300),
    departmentID int not null,
    constraint FK2_perishableItem_department
		foreign key (departmentID)
        references department(departmentID)
);