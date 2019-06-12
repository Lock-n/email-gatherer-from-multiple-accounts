create table TDI_project_User(
	name varchar(100)    primary key,
	password varchar(50) not null
)

create table TDI_project_Email_Account(
     email			varchar(200) primary key,
     password			varchar(50) not null,
     server_send_address	varchar(150) not null,
     server_receive_address	varchar(150) not null,
     server_send_protocol	varchar(4) not null,
     server_receive_protocol	varchar(4) not null,
     server_send_port 		int not null,
     server_receive_port	int not null,
     name_user 			varchar(100) not null,
     constraint fk_TDI_project_User foreign key (name_user) references TDI_project_User(name)
)
