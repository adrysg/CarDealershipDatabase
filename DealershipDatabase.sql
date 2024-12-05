DROP DATABASE IF EXISTS cardealership;

CREATE DATABASE IF NOT EXISTS cardealership;

USE cardealership;

CREATE TABLE Dealerships (
    DealershipID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

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

CREATE TABLE Inventory (
    DealershipID INT NOT NULL,
    VehicleVIN INT NOT NULL,
    PRIMARY KEY (DealershipID, VehicleVIN), -- Ensures each dealership-VIN combination is unique
    FOREIGN KEY (DealershipID) REFERENCES Dealerships(DealershipID),
    FOREIGN KEY (VehicleVIN) REFERENCES Vehicles(VehicleVIN)
);

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
    FOREIGN KEY (VehicleVIN) REFERENCES Vehicles(VehicleVIN) -- Ensures the vehicle exists in inventory before it can be sold
);

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

INSERT INTO Dealerships (Name, Address, Phone)
VALUES
('D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555'),
('Eagle Eye Motors', '456 Falcon Drive', '313-555-7890'),
('Sunset Auto Sales', '789 Horizon Lane', '415-234-5678'),
('Budget Friendly Cars', '321 Economy Ave', '623-987-6543'),
('Prestige Auto Hub', '555 Luxury Blvd', '202-345-6789'),
('Family Car Depot', '987 Maple St', '765-432-1098'),
('Highway Heroes Motors', '102 Freeway Rd', '876-543-2109'),
('Green Light Cars', '246 Traffic Way', '342-567-8910'),
('Urban Wheels Center', '678 Cityscape Ave', '929-111-2233'),
('Mountain Peak Autos', '333 Summit Drive', '310-222-3344'),
('Ocean View Cars', '111 Coastal Rd', '858-444-5566'),
('Elite Motors', '505 Prestige Blvd', '909-555-7891'),
('Velocity Auto Sales', '753 Speed Ave', '619-777-8888');


INSERT INTO vehicles (VIN, Year, Make, Model, VehicleType, Color, Odometer, Price)
VALUES
(10048, 2022, 'Mercedes-Benz', 'C-Class', 'Sedan', 'Black', 11000, 45000.0),
(10049, 2021, 'Volkswagen', 'Golf', 'Hatchback', 'Blue', 13000, 27000.0),
(10050, 2019, 'Subaru', 'Outback', 'Wagon', 'Green', 24000, 29000.0),
(10051, 2020, 'Lexus', 'RX 350', 'SUV', 'Silver', 15000, 48000.0),
(10052, 2023, 'Mazda', 'CX-5', 'SUV', 'Red', 8000, 32000.0),
(10053, 2018, 'Kia', 'Sorento', 'SUV', 'White', 26000, 22000.0),
(10054, 2022, 'Ford', 'Bronco', 'Off-road', 'Yellow', 9000, 43000.0),
(10055, 2019, 'Nissan', 'Altima', 'Sedan', 'Gray', 27000, 19500.0),
(10056, 2021, 'Hyundai', 'Tucson', 'SUV', 'Black', 10000, 35000.0),
(10057, 2020, 'Toyota', 'Camry', 'Sedan', 'Blue', 17000, 28000.0),
(10058, 2023, 'Tesla', 'Model Y', 'Electric', 'White', 4000, 58000.0),
(10059, 2017, 'Chevrolet', 'Impala', 'Sedan', 'Silver', 30000, 19000.0),
(10060, 2018, 'Ford', 'Focus', 'Hatchback', 'Red', 22000, 18000.0),
(10061, 2021, 'Jeep', 'Grand Cherokee', 'SUV', 'Green', 14000, 42000.0),
(10062, 2020, 'Volvo', 'XC60', 'SUV', 'Blue', 15000, 47000.0),
(10063, 2022, 'Acura', 'MDX', 'SUV', 'Black', 9000, 53000.0),
(10064, 2023, 'Honda', 'Accord', 'Sedan', 'White', 7000, 41000.0),
(10065, 2019, 'Toyota', 'RAV4', 'SUV', 'Gray', 20000, 25000.0),
(10066, 2021, 'BMW', '7 Series', 'Sedan', 'Silver', 12000, 74000.0),
(10067, 2018, 'Mercedes-Benz', 'GLE', 'SUV', 'Black', 18000, 50000.0),
(10068, 2020, 'Audi', 'Q7', 'SUV', 'Red', 15000, 61000.0),
(10069, 2021, 'Hyundai', 'Sonata', 'Sedan', 'Blue', 13000, 27000.0);



INSERT INTO Inventory (DealershipID, VehicleVIN)
VALUES
(1, 10070),
(1, 10071),
(1, 10072),
(2, 10073),
(2, 10074),
(2, 10075),
(2, 10076),
(3, 10077),
(3, 10078),
(3, 10079),
(1, 10080),
(1, 10081),
(1, 10082),
(2, 10083),
(2, 10084),
(2, 10085),
(3, 10086),
(3, 10087),
(3, 10088),
(1, 10089),
(1, 10090),
(2, 10091);


INSERT INTO SalesContract (ContractDate, CustomerName, CustomerEmail, VehicleVIN, VehicleColor, VehicleMiles, VehiclePrice, SalesContractTaxes, SalesContractRecordingFee, SalesContractProcessingFee, TotalPrice, MonthlyPayment, isFinance)
VALUES
('2024-11-18', 'Elijah Martin', 'elijah.martin@email.com', 10035, 'Black', 18000, 9100.0, 630.0, 28.0, 120.0, 9495.0, 460.78, TRUE),
('2024-11-19', 'Isabella Thompson', 'isabella.thompson@email.com', 10036, 'Yellow', 25000, 9400.0, 650.0, 30.0, 130.0, 9815.0, 474.32, FALSE),
('2024-11-20', 'William Harris', 'william.harris@email.com', 10037, 'Blue', 30000, 9700.0, 670.0, 32.0, 140.0, 10115.0, 491.75, TRUE),
('2024-11-21', 'Sophia Lewis', 'sophia.lewis@email.com', 10038, 'Red', 20000, 8900.0, 620.0, 26.0, 110.0, 9275.0, 447.85, FALSE),
('2024-11-22', 'Mason Walker', 'mason.walker@email.com', 10039, 'Green', 15000, 9200.0, 640.0, 27.0, 115.0, 9515.0, 459.67, TRUE),
('2024-11-23', 'Ella Carter', 'ella.carter@email.com', 10040, 'Silver', 18000, 8600.0, 590.0, 24.0, 100.0, 8885.0, 428.93, FALSE),
('2024-11-24', 'Lucas White', 'lucas.white@email.com', 10041, 'White', 22000, 9000.0, 620.0, 26.0, 120.0, 9345.0, 450.22, TRUE),
('2024-11-25', 'Mila Thompson', 'mila.thompson@email.com', 10042, 'Blue', 12000, 8500.0, 580.0, 22.0, 95.0, 8745.0, 422.15, FALSE),
('2024-11-26', 'Ethan Anderson', 'ethan.anderson@email.com', 10043, 'Red', 30000, 9700.0, 670.0, 32.0, 140.0, 10115.0, 491.75, TRUE),
('2024-11-27', 'Aria Martin', 'aria.martin@email.com', 10044, 'Black', 15000, 9100.0, 630.0, 28.0, 120.0, 9495.0, 460.78, TRUE),
('2024-11-28', 'Henry Scott', 'henry.scott@email.com', 10045, 'Yellow', 25000, 9400.0, 650.0, 30.0, 130.0, 9815.0, 474.32, FALSE),
('2024-11-29', 'Lily Cooper', 'lily.cooper@email.com', 10046, 'Green', 18000, 8900.0, 620.0, 26.0, 110.0, 9275.0, 447.85, TRUE),
('2024-11-30', 'Owen Parker', 'owen.parker@email.com', 10047, 'Silver', 22000, 8600.0, 590.0, 24.0, 100.0, 8885.0, 428.93, FALSE);



INSERT INTO LeaseContract (ContractDate, CustomerName, CustomerEmail, VehicleVIN, VehicleColor, VehicleMiles, VehiclePrice, LeaseContractExpectedFinalValue, LeaseContractLeaseFee, TotalPrice, MonthlyPayment)
VALUES 
('2024-07-20', 'James Peterson', 'james.peterson@gmail.com', 65231, 'Yellow', 10000, 27999.0, 13999.50, 1959.93, 15959.43, 471.47),
('2024-12-05', 'Charlotte White', 'charlotte.white@yahoo.com', 92134, 'Blue', 22000, 32999.0, 16499.50, 2309.93, 18809.43, 555.97),
('2024-04-18', 'William King', 'william.king@outlook.com', 81473, 'Orange', 12000, 38999.0, 19499.50, 2729.93, 22229.43, 657.43),
('2024-02-27', 'Ava Harris', 'ava.harris@hotmail.com', 57362, 'Purple', 9000, 25999.0, 12999.50, 1819.93, 14819.43, 437.07),
('2024-09-03', 'Henry Thomas', 'henry.thomas@gmail.com', 72394, 'Red', 7500, 47999.0, 23999.50, 3359.93, 27359.43, 808.77),
('2024-01-12', 'Mia Walker', 'mia.walker@live.com', 65918, 'Black', 18000, 34999.0, 17499.50, 2449.93, 19949.43, 589.37),
('2024-08-08', 'Ethan Hall', 'ethan.hall@ymail.com', 84726, 'Green', 13000, 29999.0, 14999.50, 2099.93, 17099.43, 505.97),
('2024-06-14', 'Amelia Scott', 'amelia.scott@example.com', 93827, 'White', 4000, 35999.0, 17999.50, 2519.93, 20519.43, 605.63),
('2024-11-23', 'Lucas Young', 'lucas.young@gmail.com', 41783, 'Gray', 27000, 41999.0, 20999.50, 2939.93, 23939.43, 705.63),
('2024-10-10', 'Harper Lee', 'harper.lee@yahoo.com', 52873, 'Blue', 15000, 47999.0, 23999.50, 3359.93, 27359.43, 808.77);