CREATE DATABASE Aircraftfleetmanagement;
use Aircraftfleetmanagement;
CREATE Table Aircraft(
    Aircraftid INT(20) PRIMARY KEY,
    model varchar(50),
    manufacturer varchar(50), capacity INT,
    status ENUM('Active','Grounded','In_Maintenance') DEFAULT 'Active'
);
desc Aircraft;

CREATE Table Flight(
    FlightID INT (20) PRIMARY KEY, Route VARCHAR(100),
    DepartureTime DATETIME, ArrivalTime DATETIME, AircraftID INT(20),
    FOREIGN KEY(Aircraftid) REFERENCES Aircraft(Aircraftid)
);
desc Flight;

CREATE Table Crew(
    CrewID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100), Role ENUM('pilot','Flight Attendant','Ground Crew')
    certification VARCHAR(100), contactInfo VARCHAR(100)
);
desc Crew;

CREATE Table Passenger(
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100),
    BookingReference VARCHAR(50)

);
desc Passenger;

CREATE Table Booking(
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    FlightID INT(20) NOT NULL,
    PassengerID INT(20) NOT NULL,
    SeatNumber VARCHAR(10),
    BookingStatus ENUM('Confirmed','Canceled') DEFAULT 'Confirmed',
    FOREIGN KEY(PassengerID) REFERENCES Passenger(PasengerID),
    FOREIGN KEY(FlightID) REFERENCES Flight(FlightID)
);
desc Booking;