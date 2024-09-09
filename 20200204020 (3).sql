CREATE TABLE Doctor_AddressTB
(
	DoctorID int IDENTITY(15,5) Primary KEY,
	Address VARCHAR(25) NOT NULL,
	City VARCHAR(25) NOT NULL,
	PostCode int NOT NULL
);

CREATE TABLE Clinic_AddressTB
(
	ClinicID int Primary Key,
	Services VARCHAR(25) NOT NULL,
	Rooms int NOT NULL,
	EntryFee int NOT NULL,
	Address VARCHAR(25),
	DoctorID INT Foreign key references Doctor_AddressTB(DoctorID)
);

Insert Into Doctor_AddressTB (Address,City,PostCode) values
	('Mohammadpur','Dhaka',1204),
	('Atibazar','Dhaka',1302),
	('Dhanmondi','Dhaka',1402),
	('Hair Street','Dhaka',1203)

Select * from Doctor_AddressTB

Insert into Clinic_AddressTB values (20,'Inpatient',4,1500,'Gulshan',20);
Insert into Clinic_AddressTB values (22,'Outpatient',5,400,'Dhanmondi',15);
Insert into Clinic_AddressTB values (26,'Hospice',6,1800,'Mohammadpur',30);
Insert into Clinic_AddressTB values (27,'Outpatient',3,650,'Gulshan',20);
Insert into Clinic_AddressTB values (31,'Inpatient',2,320,'Motijheel',30);
Insert into Clinic_AddressTB values (35,'Hospice',5,900,'Hair Street',25)

Select * from Clinic_AddressTB

Select * from Clinic_AddressTB where EntryFee Like '1%'

Select * from Clinic_AddressTB where Address like '_o%' and LEN(Address)>7

Select Services,Rooms from Clinic_AddressTB where DoctorID in (15,28,22,30,45)

Select MAX(Rooms) as RoomNo,MIN(DoctorID) as DocID,AVG(EntryFee) as AverageFee FROM Clinic_AddressTB Group by Services

Select DoctorID From Clinic_AddressTB where Services<>'Inpatient' or EntryFee<1500