CREATE DATABASE shopapp;
USE shopapp;
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) DEFAULT '',
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(200) DEFAULT '',
    password VARCHAR(100) NOT NUll DEFAULT '',
    created_at DATETIME,
    updatted_at DATETIME,
    is_active tinyint DEFAULT 1,
    date_of_birth DATE,
    facebook_account_id INT DEFAULT 0,
    google_account_id INT DEFAULT 0
);

alter TABLE users add column role_id int;
create roles(
    id INT PRIMARY key AUTO_INCREMENT,
    name VARCHAR(20) not NULL
);

alter TABLE users add FOREIGN key (role_id) references roles(id);

CREATE TABLE tokens(
    id INT PRIMARY KEY AUTO_INCREMENT,
    token VARCHAR(255) UNIQUE NOT NULL,
    token_type VARCHAR(50) NOT NULL,
    expiration_date DATETIME,
    revoked tinyint(1) NOT NULL,
    expired tinyint(1) NOT NULL,
    user_id INT ,
    FOREIGN KEY (user_id) references users(id)
);

--hỗ trợ đăng nhập qua google facebook
CREATE TABLE social_accounts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    provider VARCHAR(20) NOT NUll comment 'tên nhà social network',
    provider_id VARCHAR(50) NOT NUll,
    email VARCHAR(200) NOT NUll comment'email  tạo tài khoản',
    name VARCHAR(200) NOT NUll comment'tên người dùng',
    user_id INT,
    FOREIGN KEY (user_id) references users(ic)
);

--bảng danh mục sản phẩm
create TABLE category(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NUll comment'tên danh mục'
);

--bảng chứa thông tin sản phẩm 
create TABLE product(
    id INT PRIMARY key AUTO_INCREMENT,
    name VARCHAR(350),
    price float not NUll check(price>=0),
    thumnail  VARCHAR(300) DEFAULT''.
    description LONGTEXT DEFAULT'',
    created_at TIMESTAMP,
    updatted_at TIMESTAMP,
    category_id INT,
    FOREIGN key (category_id) references category(id)
);

--ảnh sản phẩm - product_images
create table product_images(
    id int PRIMARY key AUTO_INCREMENT,
    product_id int,
    FOREIGN key (product_id) references product(id),
    constraint fk_product_images_product_id
        FOREIGN key (product_id)
        references product(id) on delete cascade,
    image_url VARCHAR(300)
);

--đặt hàng-oder
create TABLE orders(
    id int PRIMARY key AUTO_INCREMENT,
    user_id int,
    FOREIGN key (user_id) references users(id),
    fullname VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(10) not null,
    address VARCHAR(200) not null,
    note VARCHAR(100) DEFAULT '',
    oder_date DATETIME DEFAULT current_timestamp,
    status VARCHAR(20),
    tatal_money float check(total_money>=0)
);

alter table orders add column 'shipping_method' VARCHAR(100);
alter table orders add column 'shipping_address' VARCHAR(200);
alter table orders add column 'shipping_date' DATE;
alter table orders add column 'shipping_number' VARCHAR(100);
alter table orders add column 'payment_method' VARCHAR(100);
--xóa 1 đơn hàng -> xóa mềm -> thêm trường active
alter table orders add column active tinyint(1);
--trạng thái đơn hàng chỉ được phép nhận "một số giá trị cụ thể"
alter table orders
modify column status enum('pending', 'processing', 'shipped', 'delivered', 'cancelled')
comment'trạng thái đơn hàng';

create table order_details(
    id int PRIMARY key AUTO_INCREMENT,
    order_id int,
    FOREIGN KEY (order_id) references orders(id),
    product_id int,
    FOREIGN key (product_id) references product(id),
    price float check(price >= 0),
    number_of_product int check(number_of_product > 0),
    total_money float check(total_money >= 0),
    color VARCHAR(20) DEFAULT ''
);