CREATE DATABASE cardealership;

USE cardealership;

-- Dealerships table
CREATE TABLE Dealerships (
    DealershipID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

-- Vehicles table
CREATE TABLE Vehicles (
    VehicleVIN INT PRIMARY KEY,
    Year INT NOT NULL,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    VehicleType VARCHAR(50) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    Odometer INT NOT NULL,
    Price DOUBLE NOT NULL
);

-- Inventory table (associates dealerships with vehicles)
CREATE TABLE Inventory (
    DealershipID INT NOT NULL,
    VehicleVIN INT NOT NULL,
    PRIMARY KEY (DealershipID, VehicleVIN),
    FOREIGN KEY (DealershipID) REFERENCES Dealerships(DealershipID),
    FOREIGN KEY (VehicleVIN) REFERENCES Vehicles(VehicleVIN)
);

-- SalesContract table
CREATE TABLE SalesContract (
    SalesContractID INT AUTO_INCREMENT PRIMARY KEY,
    ContractDate VARCHAR(60) NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerEmail VARCHAR(100) NOT NULL,
    VehicleVIN INT NOT NULL,
    VehicleColor VARCHAR(50) NOT NULL,
    VehicleMiles INT NOT NULL,
    VehiclePrice DOUBLE NOT NULL,
    SalesContractTaxes DOUBLE NOT NULL,
    SalesContractRecordingFee DOUBLE NOT NULL,
    SalesContractProcessingFee DOUBLE NOT NULL,
    TotalPrice DOUBLE NOT NULL,
    MonthlyPayment DOUBLE NOT NULL,
    isFinance BOOLEAN NOT NULL,
    FOREIGN KEY (VehicleVIN) REFERENCES Vehicles(VehicleVIN)
);

-- LeaseContract table 
CREATE TABLE LeaseContract (
    LeaseContractID INT AUTO_INCREMENT PRIMARY KEY,
    ContractDate VARCHAR(60) NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerEmail VARCHAR(100) NOT NULL,
    VehicleVIN INT NOT NULL,
    VehicleColor VARCHAR(50) NOT NULL,
    VehicleMiles INT NOT NULL,
    VehiclePrice DOUBLE NOT NULL,
    LeaseContractExpectedFinalValue DOUBLE NOT NULL,
    LeaseContractLeaseFee DOUBLE NOT NULL,
    TotalPrice DOUBLE NOT NULL,
    MonthlyPayment DOUBLE NOT NULL,
    FOREIGN KEY (VehicleVIN) REFERENCES Vehicles(VehicleVIN)
);

-- Insert Dealership data
INSERT INTO Dealerships (Name, Address, Phone)
VALUES
('D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555'),
('Prestige Auto Hub', '555 Luxury Blvd', '202-345-6789'),
('Elite Motors', '505 Prestige Blvd', '909-555-7891');

-- Insert Vehicles data
INSERT INTO Vehicles (VehicleVIN, Year, Make, Model, VehicleType, Color, Odometer, Price)
VALUES
(10001, 2019, 'Toyota', 'Camry', 'Sedan', 'Blue', 15000, 25000.0),
(10002, 2020, 'Honda', 'Civic', 'Sedan', 'Red', 12000, 22000.0),
(10003, 2018, 'Nissan', 'Altima', 'Sedan', 'Black', 20000, 24000.0),
(10004, 2020, 'Chevrolet', 'Malibu', 'Sedan', 'Gray', 10000, 23000.0),
(10005, 2019, 'Ford', 'Focus', 'Hatchback', 'White', 13000, 21000.0),
(10006, 2021, 'Hyundai', 'Elantra', 'Hatchback', 'Green', 7000, 18000.0),
(10007, 2022, 'Mazda', 'Mazda3', 'Hatchback', 'Blue', 5000, 20000.0),
(10008, 2023, 'Volkswagen', 'Jetta', 'Sedan', 'Red', 6000, 26000.0),
(10009, 2017, 'Subaru', 'Impreza', 'Sedan', 'Black', 17000, 21000.0),
(10010, 2022, 'Kia', 'Forte', 'Sedan', 'Gray', 8000, 22000.0),
(10011, 2018, 'Chevrolet', 'Cruze', 'Sedan', 'White', 25000, 19000.0),
(10012, 2019, 'Toyota', 'Yaris', 'Hatchback', 'Blue', 12000, 17000.0),
(10013, 2021, 'Ford', 'Fusion', 'Sedan', 'Black', 10000, 28000.0),
(10014, 2020, 'Lexus', 'IS', 'Sedan', 'Silver', 14000, 30000.0),
(10015, 2023, 'BMW', '3 Series', 'Sedan', 'Blue', 4000, 40000.0),
(10016, 2019, 'Audi', 'A3', 'Sedan', 'White', 15000, 35000.0),
(10017, 2021, 'Mercedes-Benz', 'C-Class', 'Sedan', 'Black', 10000, 45000.0),
(10018, 2020, 'Volvo', 'S60', 'Sedan', 'Green', 11000, 38000.0),
(10019, 2022, 'Acura', 'TLX', 'Sedan', 'Gray', 9000, 42000.0),
(10020, 2023, 'Cadillac', 'ATS', 'Sedan', 'Silver', 6000, 35000.0),
(10021, 2018, 'Chevrolet', 'Malibu', 'Sedan', 'White', 28000, 25000.0),
(10022, 2020, 'GMC', 'Terrain', 'SUV', 'Black', 21000, 29000.0),
(10023, 2022, 'Mercedes-Benz', 'C-Class', 'Sedan', 'Black', 11000, 45000.0),
(10024, 2021, 'Volkswagen', 'Golf', 'Hatchback', 'Blue', 13000, 27000.0),
(10025, 2019, 'Subaru', 'Outback', 'Wagon', 'Green', 24000, 29000.0),
(10026, 2020, 'Lexus', 'RX 350', 'SUV', 'Silver', 15000, 48000.0),
(10027, 2023, 'Mazda', 'CX-5', 'SUV', 'Red', 8000, 32000.0),
(10028, 2018, 'Kia', 'Sorento', 'SUV', 'White', 26000, 22000.0),
(10029, 2022, 'Ford', 'Bronco', 'Off-road', 'Yellow', 9000, 43000.0),
(10030, 2019, 'Nissan', 'Altima', 'Sedan', 'Gray', 27000, 19500.0),
(10031, 2021, 'Hyundai', 'Tucson', 'SUV', 'Black', 10000, 35000.0),
(10032, 2020, 'Toyota', 'Camry', 'Sedan', 'Blue', 17000, 28000.0),
(10033, 2023, 'Tesla', 'Model Y', 'Electric', 'White', 4000, 58000.0),
(10034, 2017, 'Chevrolet', 'Impala', 'Sedan', 'Silver', 30000, 19000.0),
(10035, 2018, 'Ford', 'Focus', 'Hatchback', 'Red', 22000, 18000.0),
(10036, 2021, 'Jeep', 'Grand Cherokee', 'SUV', 'Green', 14000, 42000.0),
(10037, 2020, 'Volvo', 'XC60', 'SUV', 'Blue', 15000, 47000.0),
(10038, 2022, 'Acura', 'MDX', 'SUV', 'Black', 9000, 53000.0),
(10039, 2023, 'Honda', 'Accord', 'Sedan', 'White', 7000, 41000.0),
(10040, 2019, 'Toyota', 'RAV4', 'SUV', 'Gray', 20000, 25000.0),
(10041, 2021, 'BMW', '7 Series', 'Sedan', 'Silver', 12000, 74000.0),
(10042, 2018, 'Mercedes-Benz', 'GLE', 'SUV', 'Black', 18000, 50000.0),
(10043, 2020, 'Audi', 'Q7', 'SUV', 'Red', 15000, 61000.0),
(10044, 2021, 'Hyundai', 'Palisade', 'SUV', 'Green', 14000, 46000.0);

-- Insert Inventory data (connecting DealershipID with VehicleVIN)
INSERT INTO Inventory (DealershipID, VehicleVIN)
VALUES
(1, 10001), (1, 10002), (1, 10003), (1, 10004), (1, 10005), (1, 10006),
(2, 10007), (2, 10008), (2, 10009), (2, 10010), (2, 10011), (2, 10012),
(3, 10013), (3, 10014), (3, 10015), (3, 10016), (3, 10017), (3, 10018),
(3, 10019), (3, 10020), (3, 10021), (3, 10022), (3, 10023), (3, 10024),
(3, 10025), (3, 10026), (3, 10027), (3, 10028), (3, 10029), (3, 10030),
(3, 10031), (3, 10032), (3, 10033), (3, 10034), (3, 10035), (3, 10036),
(3, 10037), (3, 10038), (3, 10039), (3, 10040), (3, 10041), (3, 10042),
(3, 10043), (3, 10044);

-- Insert SalesContract data (with matching VehicleVINs)
INSERT INTO SalesContract (ContractDate, CustomerName, CustomerEmail, VehicleVIN, VehicleColor, VehicleMiles, VehiclePrice, SalesContractTaxes, SalesContractRecordingFee, SalesContractProcessingFee, TotalPrice, MonthlyPayment, isFinance)
VALUES
('2024-01-01', 'John Doe', 'johndoe@email.com', 10001, 'Blue', 15000, 25000.0, 500.0, 100.0, 50.0, 25500.0, 450.0, 0),
('2024-02-01', 'Jane Smith', 'janesmith@email.com', 10002, 'Red', 12000, 22000.0, 440.0, 80.0, 40.0, 22520.0, 400.0, 1),
('2024-03-01', 'Robert Johnson', 'robertjohnson@email.com', 10003, 'Black', 20000, 24000.0, 480.0, 90.0, 45.0, 24515.0, 425.0, 0),
('2024-04-01', 'Emily Davis', 'emilydavis@email.com', 10004, 'Gray', 10000, 23000.0, 460.0, 85.0, 42.5, 23522.5, 410.0, 1),
('2024-05-01', 'Michael Brown', 'michaelbrown@email.com', 10005, 'White', 13000, 21000.0, 420.0, 75.0, 37.5, 21432.5, 390.0, 1);



-- Insert LeaseContract data (with matching VehicleVINs)
INSERT INTO LeaseContract (ContractDate, CustomerName, CustomerEmail, VehicleVIN, VehicleColor, VehicleMiles, VehiclePrice, LeaseContractExpectedFinalValue, LeaseContractLeaseFee, TotalPrice, MonthlyPayment)
VALUES
('2024-01-01', 'Alice Johnson', 'alicejohnson@email.com', 10003, 'Black', 20000, 24000.0, 2000.0, 300.0, 25000.0, 400.0),
('2024-02-01', 'David Martinez', 'davidmartinez@email.com', 10018, 'Green', 11000, 38000.0, 4000.0, 500.0, 41000.0, 650.0),
('2024-03-01', 'Sophia White', 'sophiawhite@email.com', 10030, 'Gray', 27000, 19500.0, 1500.0, 200.0, 21000.0, 325.0),
('2024-04-01', 'James Wilson', 'jameswilson@email.com', 10022, 'Black', 21000, 29000.0, 3000.0, 400.0, 31000.0, 500.0),
('2024-05-01', 'Olivia Harris', 'oliviaharris@email.com', 10038, 'Black', 9000, 53000.0, 7000.0, 800.0, 61000.0, 950.0);
