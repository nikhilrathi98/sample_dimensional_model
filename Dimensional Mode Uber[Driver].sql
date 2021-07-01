CREATE TABLE [dim_payment] (
  [paymentID] int PRIMARY KEY IDENTITY(1, 1),
  [customerID] int,
  [payments_mode] nvarchar(255)
)
GO

CREATE TABLE [customer] (
  [customerID] int PRIMARY KEY,
  [fname] nvarchar(255),
  [lname] nvarchar(255),
  [dob] nvarchar(255)
)
GO

CREATE TABLE [dim_location] (
  [location_id] int,
  [landmark_name] nvarchar(255),
  [add_line_1] nvarchar(255),
  [add_line_2] nvarchar(255),
  [city] nvarchar(255),
  [state] nvarchar(255),
  [zipCode] numeric
)
GO

CREATE TABLE [dim_trip] (
  [rideID] int PRIMARY KEY,
  [vehicle_type] int,
  [travelling_date] date,
  [requested_trip_time] timestamp,
  [trip_waiting_time] timestamp,
  [trip_start_time] timestamp,
  [trip_completion_time] timestamp,
  [total_trip_cost] money,
  [payments_mode] nvarchar(255)
)
GO

CREATE TABLE [dim_Driver_details] (
  [driverID] int PRIMARY KEY,
  [fname] nvarchar(255),
  [lname] nvarchar(255),
  [dob] nvarchar(255),
  [current_VehicleID] nvarchar(255)
)
GO

CREATE TABLE [Driver_Reservation] (
  [reservationID] int,
  [customerID] int,
  [insID] int,
  [location_id] int,
  [driverID] int,
  [vehicleID] int,
  [rideID] int,
  [paymentID] int,
  [pickup_location] nvarchar(255),
  [dropoff_location] nvarchar(255),
  [travelling_date] date,
  [requested_trip_time] timestamp,
  [trip_start_time] timestamp,
  [trip_waiting_time] timestamp,
  [trip_completion_time] timestamp,
  [total_trip_cost] money,
  [driver_rating] int,
  [customer_rating] int,
  [Reviews] nvarchar(255),
  PRIMARY KEY ([reservationID])
)
GO

CREATE TABLE [dim_Vehicle_details] (
  [vehicleID] int PRIMARY KEY,
  [vehicle_type] nvarchar(255),
  [model] nvarchar(255),
  [make] nvarchar(255),
  [last_servicing_date] datetime,
  [insID] int
)
GO

CREATE TABLE [dim_vehicle_Insurance] (
  [insID] int PRIMARY KEY,
  [ins_description] nvarchar(255),
  [start_Date] datetime,
  [expiration_Date] datetime
)
GO

ALTER TABLE [dim_payment] ADD FOREIGN KEY ([payments_mode]) REFERENCES [dim_trip] ([payments_mode])
GO

ALTER TABLE [dim_payment] ADD FOREIGN KEY ([customerID]) REFERENCES [Driver_Reservation] ([customerID])
GO

ALTER TABLE [customer] ADD FOREIGN KEY ([customerID]) REFERENCES [dim_payment] ([customerID])
GO

ALTER TABLE [dim_location] ADD FOREIGN KEY ([location_id]) REFERENCES [Driver_Reservation] ([location_id])
GO

ALTER TABLE [dim_trip] ADD FOREIGN KEY ([travelling_date]) REFERENCES [Driver_Reservation] ([travelling_date])
GO

ALTER TABLE [dim_trip] ADD FOREIGN KEY ([requested_trip_time]) REFERENCES [Driver_Reservation] ([requested_trip_time])
GO

ALTER TABLE [dim_trip] ADD FOREIGN KEY ([trip_start_time]) REFERENCES [Driver_Reservation] ([trip_start_time])
GO

ALTER TABLE [dim_trip] ADD FOREIGN KEY ([trip_waiting_time]) REFERENCES [Driver_Reservation] ([trip_waiting_time])
GO

ALTER TABLE [dim_trip] ADD FOREIGN KEY ([trip_completion_time]) REFERENCES [Driver_Reservation] ([trip_completion_time])
GO

ALTER TABLE [dim_trip] ADD FOREIGN KEY ([total_trip_cost]) REFERENCES [Driver_Reservation] ([total_trip_cost])
GO

ALTER TABLE [dim_trip] ADD FOREIGN KEY ([rideID]) REFERENCES [Driver_Reservation] ([rideID])
GO

ALTER TABLE [dim_Driver_details] ADD FOREIGN KEY ([current_VehicleID]) REFERENCES [Driver_Reservation] ([driverID])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([pickup_location]) REFERENCES [dim_location] ([add_line_1])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([pickup_location]) REFERENCES [dim_location] ([add_line_2])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([pickup_location]) REFERENCES [dim_location] ([city])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([pickup_location]) REFERENCES [dim_location] ([state])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([pickup_location]) REFERENCES [dim_location] ([zipCode])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([dropoff_location]) REFERENCES [dim_location] ([add_line_1])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([dropoff_location]) REFERENCES [dim_location] ([add_line_2])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([dropoff_location]) REFERENCES [dim_location] ([city])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([dropoff_location]) REFERENCES [dim_location] ([state])
GO

ALTER TABLE [Driver_Reservation] ADD FOREIGN KEY ([dropoff_location]) REFERENCES [dim_location] ([zipCode])
GO

ALTER TABLE [dim_Vehicle_details] ADD FOREIGN KEY ([vehicleID]) REFERENCES [Driver_Reservation] ([vehicleID])
GO

ALTER TABLE [dim_Vehicle_details] ADD FOREIGN KEY ([vehicleID]) REFERENCES [dim_Driver_details] ([current_VehicleID])
GO

ALTER TABLE [dim_vehicle_Insurance] ADD FOREIGN KEY ([insID]) REFERENCES [Driver_Reservation] ([insID])
GO

ALTER TABLE [dim_vehicle_Insurance] ADD FOREIGN KEY ([insID]) REFERENCES [dim_Vehicle_details] ([insID])
GO

