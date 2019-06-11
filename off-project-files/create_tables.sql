create table TDI_project_Email_Account(
    email	varchar(200),
    password		varchar(50) not null,
    server_address	varchar(150) not null,
    server_protocol	varchar(4) not null,
    server_port	 	int not null,
    name_user  		varchar(100) not null,
    constraint pk_TDI_project_Email_Account primary key (email, server_address),
    constraint fk_NameUSer foreign key (name_user)
    references TDI_project_User(name)
)


create table TDI_project_User(
name varchar(100) primary key,
password varchar(50) not null
)

