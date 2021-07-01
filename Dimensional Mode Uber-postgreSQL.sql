CREATE TABLE "dim_payment" (
  "paymentID" SERIAL PRIMARY KEY,
  "customerID" int,
  "payments_mode" varchar
);

CREATE TABLE "customer" (
  "customerID" int PRIMARY KEY,
  "fname" varchar,
  "lname" varchar,
  "dob" varchar
);

CREATE TABLE "dim_location" (
  "location_id" int,
  "landmark_name" varchar,
  "add_line_1" varchar,
  "add_line_2" varchar,
  "city" varchar,
  "state" varchar,
  "zipCode" numeric
);

CREATE TABLE "dim_trip" (
  "rideID" int PRIMARY KEY,
  "vehicle_type" int,
  "travelling_date" date,
  "requested_trip_time" timestamp,
  "trip_waiting_time" timestamp,
  "trip_start_time" timestamp,
  "trip_completion_time" timestamp,
  "total_trip_cost" money,
  "payments_mode" varchar
);

CREATE TABLE "dim_Driver_details" (
  "driverID" int PRIMARY KEY,
  "fname" varchar,
  "lname" varchar,
  "dob" varchar,
  "current_VehicleID" varchar
);

CREATE TABLE "Driver_Reservation" (
  "reservationID" int,
  "customerID" int,
  "insID" int,
  "location_id" int,
  "driverID" int,
  "vehicleID" int,
  "rideID" int,
  "paymentID" int,
  "pickup_location" varchar,
  "dropoff_location" varchar,
  "travelling_date" date,
  "requested_trip_time" timestamp,
  "trip_start_time" timestamp,
  "trip_waiting_time" timestamp,
  "trip_completion_time" timestamp,
  "total_trip_cost" money,
  "driver_rating" int,
  "customer_rating" int,
  "Reviews" varchar,
  PRIMARY KEY ("reservationID")
);

CREATE TABLE "dim_Vehicle_details" (
  "vehicleID" int PRIMARY KEY,
  "vehicle_type" varchar,
  "model" varchar,
  "make" varchar,
  "last_servicing_date" datetime,
  "insID" int
);

CREATE TABLE "dim_vehicle_Insurance" (
  "insID" int PRIMARY KEY,
  "ins_description" varchar,
  "start_Date" datetime,
  "expiration_Date" datetime
);

ALTER TABLE "dim_payment" ADD FOREIGN KEY ("payments_mode") REFERENCES "dim_trip" ("payments_mode");

ALTER TABLE "dim_payment" ADD FOREIGN KEY ("customerID") REFERENCES "Driver_Reservation" ("customerID");

ALTER TABLE "customer" ADD FOREIGN KEY ("customerID") REFERENCES "dim_payment" ("customerID");

ALTER TABLE "dim_location" ADD FOREIGN KEY ("location_id") REFERENCES "Driver_Reservation" ("location_id");

ALTER TABLE "dim_trip" ADD FOREIGN KEY ("travelling_date") REFERENCES "Driver_Reservation" ("travelling_date");

ALTER TABLE "dim_trip" ADD FOREIGN KEY ("requested_trip_time") REFERENCES "Driver_Reservation" ("requested_trip_time");

ALTER TABLE "dim_trip" ADD FOREIGN KEY ("trip_start_time") REFERENCES "Driver_Reservation" ("trip_start_time");

ALTER TABLE "dim_trip" ADD FOREIGN KEY ("trip_waiting_time") REFERENCES "Driver_Reservation" ("trip_waiting_time");

ALTER TABLE "dim_trip" ADD FOREIGN KEY ("trip_completion_time") REFERENCES "Driver_Reservation" ("trip_completion_time");

ALTER TABLE "dim_trip" ADD FOREIGN KEY ("total_trip_cost") REFERENCES "Driver_Reservation" ("total_trip_cost");

ALTER TABLE "dim_trip" ADD FOREIGN KEY ("rideID") REFERENCES "Driver_Reservation" ("rideID");

ALTER TABLE "dim_Driver_details" ADD FOREIGN KEY ("current_VehicleID") REFERENCES "Driver_Reservation" ("driverID");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("pickup_location") REFERENCES "dim_location" ("add_line_1");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("pickup_location") REFERENCES "dim_location" ("add_line_2");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("pickup_location") REFERENCES "dim_location" ("city");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("pickup_location") REFERENCES "dim_location" ("state");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("pickup_location") REFERENCES "dim_location" ("zipCode");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("dropoff_location") REFERENCES "dim_location" ("add_line_1");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("dropoff_location") REFERENCES "dim_location" ("add_line_2");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("dropoff_location") REFERENCES "dim_location" ("city");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("dropoff_location") REFERENCES "dim_location" ("state");

ALTER TABLE "Driver_Reservation" ADD FOREIGN KEY ("dropoff_location") REFERENCES "dim_location" ("zipCode");

ALTER TABLE "dim_Vehicle_details" ADD FOREIGN KEY ("vehicleID") REFERENCES "Driver_Reservation" ("vehicleID");

ALTER TABLE "dim_Vehicle_details" ADD FOREIGN KEY ("vehicleID") REFERENCES "dim_Driver_details" ("current_VehicleID");

ALTER TABLE "dim_vehicle_Insurance" ADD FOREIGN KEY ("insID") REFERENCES "Driver_Reservation" ("insID");

ALTER TABLE "dim_vehicle_Insurance" ADD FOREIGN KEY ("insID") REFERENCES "dim_Vehicle_details" ("insID");

