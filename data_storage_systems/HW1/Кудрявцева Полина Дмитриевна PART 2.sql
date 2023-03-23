-- Create tables

CREATE TABLE HealthCamps ( 
	HealthCampId         INTEGER NOT NULL  PRIMARY KEY  ,
	CampStartDate        DATE NOT NULL    ,
	CampEndDate          DATE NOT NULL    ,
	Category1            VARCHAR(10) NOT NULL    ,
	Category2            VARCHAR(1) NOT NULL    ,
	Category3            SMALLINT NOT NULL    
 );

CREATE TABLE CityTypes ( 
	CityTypeId           INTEGER NOT NULL  PRIMARY KEY  ,
	CityType             VARCHAR(1) NOT NULL    
 );

CREATE TABLE EmployerCategories ( 
	EmployerCategoryId   INTEGER NOT NULL  PRIMARY KEY  ,
	EmployerCategory     TEXT NOT NULL    
 );

CREATE TABLE Patients ( 
	PatientID            INTEGER NOT NULL  PRIMARY KEY  ,
	Income               INTEGER     ,
	EducationScore       FLOAT     ,
	Age                  INTEGER     ,
	FirstInteraction     DATE NOT NULL DEFAULT CURRENT_DATE   ,
	CityTypeId           INTEGER     ,
	EmployerCategoryId   INTEGER     ,
	OnlineFollower       BOOLEAN NOT NULL DEFAULT 0   ,
	LinkedInShared       BOOLEAN NOT NULL DEFAULT 0   ,
	TwitterShared        BOOLEAN NOT NULL DEFAULT 0   ,
	FacebookShared       BOOLEAN NOT NULL DEFAULT 0   ,
	FOREIGN KEY ( CityTypeId ) REFERENCES CityTypes( CityTypeId )  ,
	FOREIGN KEY ( EmployerCategoryId ) REFERENCES EmployerCategories( EmployerCategoryId )  
 );

CREATE TABLE HealthCampAttendencies ( 
	ID                   INTEGER NOT NULL  PRIMARY KEY  ,
	PatientId            INTEGER NOT NULL    ,
	HealthCampId         INTEGER NOT NULL    ,
	Donation             INTEGER     ,
	HaelthScore          FLOAT     ,
	NumberOfStallVisited INTEGER     ,
	LastStallVisitedNumber INTEGER     ,
	FOREIGN KEY ( HealthCampId ) REFERENCES HealthCamps( HealthCampId )  ,
	FOREIGN KEY ( PatientId ) REFERENCES Patients( PatientID )  
 );
