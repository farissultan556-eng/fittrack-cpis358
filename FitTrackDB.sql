-- FitTrack Database Script for CPIS-358 Assignment 3 (SQL Server / LocalDB)
CREATE DATABASE FitTrackDB;
GO

USE FitTrackDB;
GO

-- Users Table (for Signup & Login)
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Workouts Table (for CRUD Operations: Insert, Select, Update, Delete, Search)
CREATE TABLE Workouts (
    WorkoutID INT IDENTITY(1,1) PRIMARY KEY,
    WorkoutDay NVARCHAR(50) NOT NULL,
    MuscleGroup NVARCHAR(100) NOT NULL,
    Duration NVARCHAR(50) NOT NULL,
    Intensity NVARCHAR(50) NOT NULL
);
GO

-- Sample Users
INSERT INTO Users (FullName, Email, Password) VALUES
('Faris Almutairi', 'faris@fittrack.com', '123456'),
('Ahmad Ghandourah', 'ahmad@fittrack.com', '123456');
GO

-- Sample Workouts
INSERT INTO Workouts (WorkoutDay, MuscleGroup, Duration, Intensity) VALUES
('Sunday', 'Push (Chest, Shoulders, Triceps)', '60 Mins', 'High'),
('Monday', 'Pull (Back, Biceps)', '60 Mins', 'High'),
('Tuesday', 'Legs & Core', '60 Mins', 'High'),
('Wednesday', 'Active Recovery & Cardio', '30 Mins', 'Moderate');
GO
