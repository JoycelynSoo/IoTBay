CREATE TABLE Orders (
    OrderID INT PRIMARY KEY
);

CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    ShipmentStatus  VARCHAR(50),
    ShipmentMethod VARCHAR(255),
    ShipmentDate DATE,
    ShipmentAddress VARCHAR(255)
);

INSERT INTO APP.Orders (OrderID)
VALUES (1001), (1002), (1003), (1004);

INSERT INTO APP.Shipments (ShipmentID, ShipmentStatus, ShipmentMethod, ShipmentDate, ShipmentAddress)
VALUES 
    (1001, 'Pending', 'Express', '2024-05-20', '15 Smith Street, North Sydney, NSW, 2060, Australia'),
    (1002, 'Processing', 'Standard', '2024-05-21', '27 Johnson Avenue, South Melbourne, VIC, 3000, Australia'),
    (1003, 'Shipped', 'Priority', '2024-05-22', '42 King Street, East Brisbane, QLD, 4000, Australia'),
    (1004, 'Delivered', 'Express', '2024-05-23', '55 Queen Street, West Perth, WA, 6000, Australia');