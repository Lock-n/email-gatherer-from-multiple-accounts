create table TDI_project_Email_Account(
	 email	varchar(200),
     password		varchar(50) not null,
     server_address	varchar(150) not null,
     server_protocol	varchar(4) not null,
     server_port	 int not null,
     constraint pk_TDI_project_Email_Account primary key (email, server_address)
)


create table TDI_project_User(
name varchar(100) primary key,
password varchar(50) not null
)


create table TDI_project_User_Email_Accounts(
email varchar(200) not null,
name_user    varchar(100) not null,
server_address varchar(150) not null,
constraint fk_TDI_project_Email_Account foreign key (email, server_address) references TDI_project_Email_Account (email, server_address),
constraint fk_TDI_project_User foreign key (name_user) references TDI_project_User (name),
constraint pk_TDI_project_User_Email_Accounts primary key (email, name_user)
)
