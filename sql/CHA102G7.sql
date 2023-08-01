create schema main;
use main;
drop schema main;

-- members 許彤
create table members (
	mem_id int primary key, 
	mem_email varchar(30),
	mem_password varchar(20),
	mem_name varchar(10),
	mem_gender tinyint ,
	mem_addr varchar(100),
	mem_grade int,
	mem_phone varchar(15),
	mem_point int,
	mem_sta tinyint,
	mem_group tinyint
);
insert into members(mem_id, mem_email, mem_password, mem_name, mem_gender,
mem_addr,mem_grade, mem_phone,mem_point,mem_sta,mem_group)
values 
(1, 'scheyenne0@de.vu', 'mL3\\jM5{S~}=aJ~A', 'Susette', 2, '67414 Del Mar Point', 68, '960-893-9953', 20, 0, 0),
(2, 'adoumic1@usatoday.com', 'uH7/o*@QzHo2', 'Ali', 0, '007 Springs Road', 16, '830-636-9221', 97, 0, 1),
(3, 'kwendover2@ebay.com', 'bC9~jN/_)7D6', 'Kirsteni', 0, '077 Morningstar Road', 32, '967-895-2141', 41, 2, 0),
(4, 'enoyes3@bloglovin.com', 'fT5)p737cLW+7', 'Eziechiele', 0, '2 Scofield Lane', 34, '726-251-4907', 57, 0, 0),
(5, 'udebenedetti4@youtube.com', 'lC8,47YXkM{mocgL', 'Uri', 0, '508 Fieldstone Drive', 4, '621-294-8538', 92, 1, 1),
(6, 'hfynes5@wikispaces.com', 'pF1$jmDy\\JIG0aT', 'Harmonie', 0, '2 Hanson Place', 32, '838-150-1172', 94, 2, 0),
(7, 'lwhitland6@blogtalkradio.com', 'zA9"CU2K8#k', 'Launce', 1, '399 Russell Trail', 97, '147-450-1456', 76, 0, 0),
(8, 'jmccrone7@nature.com', 'sN5&hr9xiwG', 'Jorrie', 1, '0909 Stang Alley', 34, '143-598-2680', 23, 0, 0),
(9, 'lcaplin8@feedburner.com', 'hN7#"pLv', 'Lisetta', 1, '519 Shasta Way', 5, '234-678-8055', 91, 0, 0),
(10, 'mcaffin9@wsj.com', 'zC7"aVq$CUSOX', 'Melanie', 2, '399 Mesta Park', 1, '881-556-7368', 16, 1,1);


create table hosts (
	host_id int primary key, 
	host_phone varchar(15),
	host_email varchar(30),
	host_password varchar(20),
	host_name varchar(10),
	host_sta tinyint comment''
);

INSERT INTO hosts (host_id, host_phone, host_email, host_password, host_name, host_sta)
VALUES 
  (1, '123-456-7890', 'host1@example.com', 'password1', 'Host 1', 1),
  (2, '987-654-3210', 'host2@example.com', 'password2', 'Host 2', 0),
  (3, '555-555-5555', 'host3@example.com', 'password3', 'Host 3', 1),
  (4, '111-222-3333', 'host4@example.com', 'password4', 'Host 4', 0),
  (5, '999-888-7777', 'host5@example.com', 'password5', 'Host 5', 1),
  (6, '444-555-6666', 'host6@example.com', 'password6', 'Host 6', 0),
  (7, '777-888-9999', 'host7@example.com', 'password7', 'Host 7', 1),
  (8, '222-111-4444', 'host8@example.com', 'password8', 'Host 8', 0),
  (9, '666-777-8888', 'host9@example.com', 'password9', 'Host 9', 1),
  (10, '333-444-5555', 'host10@example.com', 'password10', 'Host 10', 0);


select * from hosts;
 
 create table orders (
    ord_id int primary key,
    fk_mem_id int,
    points int,
    ord_fee int,
    recipient_phone varchar(15),
    ord_pay_sta tinyint,
    recipient_name varchar(10),
    recipient_addr varchar(30),
    ord_sta tinyint,
    total int,
    checktotal int,
    ord_time timestamp
    -- foreign key(fk_mem_id) references member.members(mem_id)
);
create table product(
prod_id int primary key
);

create table order_details(
	fk_ord_id int,
    fk_prod_id int,
    prod_qty int,
	prod_review varchar(50),
    prod_price int,
    prod_com_score decimal,
    primary key(fk_ord_id, fk_prod_id),
    foreign key(fk_ord_id) references orders(ord_id),
	foreign key(fk_prod_id) references product(prod_id)
    );
select * from orders;
insert into orders(ord_id, fk_mem_id, points, total, checktotal)
values (1, 7, 17, 117, 117);
select * from orders;


-- 揪團表格建立 宇航
create table `group`
(
	group_id int primary key, -- auto_increment
    mem_id int, -- not null
    sch_id int, -- not null
    members int default 0,-- not null
    min_member int not null,
    max_member int not null,
    amount int not null,
    theme varchar(32) not null,
    `starting` datetime not null,
    dep_date datetime not null,
    deadline datetime not null,
    group_desc varchar(200) not null,
    notice varchar(500) not null,
    group_sta tinyint not null default 0
    -- CONSTRAINT fk_group_member
--     foreign key (mem_id) references `MEMBER`(MEM_ID),
--     
--     CONSTRAINT fk_group_SCHEDULE
--     foreign key (SCH_ID) references `SCHEDULE`(SCH_ID)
);
insert into `group` values (
1, 1, 1, default, 10, 20,
100000, '緯育4月遊', '2023-03-22 00:00', '2023-05-15 00:00',
'2023-05-01 00:00', 'JAVA集訓營', '進入後肝可能變黑白的', default 
);
select * from `group`;


create table reg_form
(
	form_id int primary key, -- auto_increment
    group_id int , -- not null
    mem_id int , -- not null
    email varchar(32) not null,
    phone varchar(13) not null,
    join_member int not null default 1,
    reg_time datetime not null default current_timestamp
    
    -- CONSTRAINT fk_REG_FORM_MEMBER
--     foreign key (MEM_ID) references `MEMBER`(MEM_ID),
--     
--     CONSTRAINT fk_REG_FORM_GROUP
--     foreign key (GROUP_ID) references `GROUP`(GROUP_ID)
);
insert into reg_form values(
1, 1, 1, 'abc@gmail.com', '+886912345678', default, default
);
select * from reg_form;

create table member_detail
(
	detail_id int primary key, -- auto_increment
    form_id int , -- not null
    `name` varchar(32) not null,
    citizenship varchar(32) not null,
    idnumber char(10) not null,
    birthday date not null,
    gender enum('男','女') not null default '男'
--     CONSTRAINT fk_MEMBER_DETAIL_REG_FORM
--     foreign key (FORM_ID) references REG_FORM(FORM_ID)
);
insert into member_detail values(
1, 1, '李小明', '臺灣', 'A123456789', '2000-01-01',default
);
select * from member_detail;

create table group_rep
(
	group_rep_id int primary key, -- auto_increment
    mem_id int, --  not null
    group_id int,-- not null
    hosts_id int,
    reason varchar(500) not null,
    group_rep_sta TINYINT not null default 0
    -- CONSTRAINT fk_GROUP_REP_ID_MEMBER
--     foreign key (MEM_ID) references `MEMBER`(MEM_ID),
--     
--     CONSTRAINT fk_GROUP_REP_ID_GROUP
--     foreign key (GROUP_ID) references `GROUP`(GROUP_ID),
--     
--     CONSTRAINT fk_GROUP_REP_ID_HOST
--     foreign key (HOST_ID) references `HOST`(HOST_ID)
);
insert into group_rep values (
1, 1, 1, 1, 'QQ', default
);
select * from group_rep;

create table group_picture
(
	group_pic_id int primary key,
    group_id int, -- not null
    froup_pic MEDIUMBLOB
--     CONSTRAINT fk_GROUP_PICTURE_GROUP
--     foreign key (GROUP_ID) references `GROUP`(GROUP_ID)
);
insert into group_picture values (
1, 1, null
);
select * from group_picture;

-- attractions景點相關表格建立 劉力辰
create table attraction_type(
attr_type_id int primary key,
attr_type_name varchar(10)
);

insert into attraction_type(attr_type_id, attr_type_name)
values
(1,"第一類"),
(2,"第二類"),
(3,"第三類");
-- select * from attraction_type;
-- drop table attraction_type;

create table attractions (
attr_id int primary key,
attr_veri_sta tinyint,
attr_sta int,
attr_name varchar(20),
attr_addr varchar(100),
attr_lon float,
attr_lat float,
attr_illa varchar(500),
attr_type_id int,
-- constraint attr_type_id
-- foreign key(attr_type_id) references attraction_type(attr_type_id)

attr_buss_time varchar(100),
attr_cost_range tinyint,
attr_rep varchar(500)
);

INSERT INTO attractions (attr_id, attr_veri_sta, attr_sta, attr_name, attr_addr, attr_lon, attr_lat, attr_illa, attr_type_id, attr_buss_time, attr_cost_range, attr_rep)
VALUES 
  (1, 1, 3, 'Attraction 1', '123 Main St', 12.345, 67.890, 'Description for Attraction 1', 1, '9:00 AM - 5:00 PM', 2, 'Representative for Attraction 1'),
  (2, 0, 2, 'Attraction 2', '456 Park Ave', -45.678, 12.345, 'Description for Attraction 2', 3, '10:00 AM - 6:00 PM', 1, 'Representative for Attraction 2'),
  (3, 1, 1, 'Attraction 3', '789 Broad St', 98.765, -34.567, 'Description for Attraction 3', 2, '8:00 AM - 4:00 PM', 3, 'Representative for Attraction 3'),
  (4, 0, 3, 'Attraction 4', '567 Elm St', -12.345, -78.901, 'Description for Attraction 4', 1, '9:30 AM - 5:30 PM', 2, 'Representative for Attraction 4'),
  (5, 1, 2, 'Attraction 5', '234 Oak Ave', 23.456, 45.678, 'Description for Attraction 5', 3, '10:30 AM - 6:30 PM', 1, 'Representative for Attraction 5'),
  (6, 0, 1, 'Attraction 6', '678 Pine St', -56.789, 78.901, 'Description for Attraction 6', 2, '8:30 AM - 4:30 PM', 3, 'Representative for Attraction 6'),
  (7, 1, 3, 'Attraction 7', '890 Maple Ave', 34.567, -56.789, 'Description for Attraction 7', 1, '9:45 AM - 5:45 PM', 2, 'Representative for Attraction 7'),
  (8, 0, 2, 'Attraction 8', '123 Cherry St', -67.890, 98.765, 'Description for Attraction 8', 3, '10:45 AM - 6:45 PM', 1, 'Representative for Attraction 8'),
  (9, 1, 1, 'Attraction 9', '456 Plum Ave', 12.345, -12.345, 'Description for Attraction 9', 2, '8:45 AM - 4:45 PM', 3, 'Representative for Attraction 9'),
  (10, 0, 3, 'Attraction 10', '789 Orange St', -34.567, 23.456, 'Description for Attraction 10', 1, '9:15 AM - 5:15 PM', 2, 'Representative for Attraction 10');
  
select * from attractions;
-- drop table attractions;

insert into attractions(attr_id, attr_veri_sta, attr_sta, attr_name, attr_type_id)
values
(1,0,0,'attr_01',1),
(2,0,0,'attr_02',2),
(3,0,0,'attr_03',3),
(4,0,0,'attr_04',4);

-- create table members(
-- mem_id int primary key,
-- mem_name varchar(20)
-- );

-- insert into members(mem_id, mem_name)
-- values
-- (1,"Andy");

-- drop table member;
-- select * from member;

create table attraction_collections (
attr_id int,
mem_id int,
attr_col_illa varchar(500),
-- primary key (attr_id, mem_id),
-- foreign key(mem_id) references members(mem_id),
-- foreign key(attr_id) references attractions(attr_id)

);

insert into attraction_collections(fk_attr_id, fk_mem_id, attr_col_illa)
values
(1,1,"第一個會員的第一筆收藏");

-- select * from attraction_collections;
-- drop table attraction_collections;

-- drop table attraction_pictures;
create table attraction_pictures (
attr_pic_id int unsigned primary key,
attr_id int,
-- constraint fk_attr_id
-- foreign key(attr_id) references attractions(attr_id),
attr_pic_data mediumblob
);

insert into attraction_pictures(attr_pic_id, attr_id, attr_pic_data)
values
(1,1,LOAD_FILE('/tomcat.jpg'));
-- select attr_pic_id from attraction_pictures where fk_attr_id = 1;
-- delete from attraction_pictures where attr_pic_id = 1;
-- alter table attraction_pictures drop foreign key fk_attr_id;

create table attraction_comments(
attr_id int,
mem_id int,
attr_com_score decimal(2,1),
attr_com varchar(500)
-- foreign key(attr_id) references attractions(attr_id),
-- foreign key(mem_id) references members(mem_id)
);

insert into attraction_comments(attr_id, mem_id, attr_com_score, attr_com)
values
(1,1,0.1,"景點沒廁所");

-- select * from attraction_comments;
