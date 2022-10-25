USE ContactsDB;

CREATE TABLE States
(
	Id		  INT NOT NULL,
	StateName VARCHAR(40) NOT NULL,
	CONSTRAINT PK PRIMARY KEY (Id)
);

CREATE TABLE Contacts
(
	Id		  INT IDENTITY(1,1) NOT NULL,
	FirstName VARCHAR(50) NULL,
	LastName  VARCHAR(50) NULL,
	Email	  VARCHAR(50) NULL,
	Company	  VARCHAR(50) NULL,
	Title	  VARCHAR(50) NULL,
	CONSTRAINT PK_Contacts PRIMARY KEY (Id)

);

CREATE TABLE Addresses
(
	Id		      INT	 IDENTITY(1,1) NOT NULL,
	ContactId     INT                  NOT NULL,
	AddressType   VARCHAR(10)          NOT NULL,
	StreetAddress VARCHAR(50)		   NOT NULL,
	City		  VARCHAR(50)		   NOT NULL,
	StateId		  INT                  NOT NULL,
	PostalCode    VARCHAR(20)          NOT NULL,
	CONSTRAINT Pk_address PRIMARY KEY (Id),
	CONSTRAINT ContactsRel	FOREIGN KEY(ContactId) REFERENCES Contacts(Id) ON DELETE CASCADE,
	CONSTRAINT StateRel     FOREIGN KEY(StateId)   REFERENCES States(Id)
			  
);

