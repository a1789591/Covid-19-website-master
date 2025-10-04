Select UserInfo.firstName AS firstName, UserInfo.lastName AS lastName, Accounts.emailAddress AS emailAddress, Addresses.number AS streetNumber,
Addresses.streetName AS streetName, Addresses.city AS city, Addresses.stateName AS stateName, Addresses.country AS country
FROM UserInfo JOIN Accounts ON UserInfo.userID=Accounts.userID JOIN Addresses ON Addresses.addressID=Accounts.addressID
WHERE Accounts.userID= "ruixin123";


SELECT * FROM Accounts;
SELECT * FROM UserInfo;
SELECT * FROM Addresses;

INSERT INTO Accounts VALUES("ruixin666","qwer",0,3,"test1@test1.test1","123456789");

INSERT INTO UserInfo VALUES("ruixin666","Ruixin","Wu");

INSERT INTO Accounts VALUES("ruixin111","qwer",1,3,"test@test.test","123456789");
INSERT INTO VenueInfo Values("ruixin111","ruixin Wu","123456");

DELETE FROM Accounts WHERE userID="ruixin123";

UPDATE Accounts JOIN UserInfo ON Accounts.UserID=UserInfo.UserID JOIN Addresses ON Accounts.addressId=Addresses.addressId
SET Accounts.emailAddress='ruixin123@gmail.com',
UserInfo.firstName="Ruixin",
UserInfo.lastName="Wu",
Addresses.number="100",
Addresses.streetName="Xudong",
Addresses.city="Wuhan",
Addresses.stateName="Hubei",
Addresses.country="China"
WHERE Accounts.UserID="ruixin123";

UPDATE Accounts SET Accounts.passwordHash="$2b$10$RwnzFWyudoQ6sigfiIcIqOo2mvqswZhB3pek4CsRj9rjrI4GvrOeW" WHERE Accounts.userID="ruixin123";

UPDATE Accounts SET Accounts.passwordHash="$2b$10$RwnzFWyudoQ6sigfiIcIqOo2mvqswZhB3pek4CsRj9rjrI4GvrOeW" WHERE Accounts.userID="ruixin123";

UPDATE Accounts JOIN VenueInfo ON Accounts.UserID=VenueInfo.UserID JOIN Addresses ON Accounts.addressId=Addresses.addressId
SET Accounts.emailAddress='jetlow345@gmail.com',
Accounts.contact=0122179233,
VenueInfo.venueName="If Only",
Addresses.number="100",
Addresses.streetName="Xander",
Addresses.city="Kuala Lumpur",
Addresses.stateName="Adelaide",
Addresses.country="Australia"
WHERE Accounts.UserID="acemarco1311";

Select VenueInfo.venueName AS venueName, Accounts.contact AS contact, Accounts.emailAddress AS emailAddress, Addresses.number AS streetNumber, Addresses.streetName AS streetName, Addresses.city AS city, Addresses.stateName AS stateName, Addresses.country AS country FROM VenueInfo JOIN Accounts ON VenueInfo.userID=Accounts.userID JOIN Addresses ON Addresses.addressID=Accounts.addressID WHERE Accounts.userID="acemarco1311";


SELECT * FROM Accounts JOIN UserInfo ON Accounts.userID=UserInfo.userID JOIN VenueInfo ON Accounts.userID=VenueInfo.userID JOIN Addresses ON Accounts.addressID=Addresses.addressID GROUP BY Accounts.UserID;

SELECT * FROM Accounts;

Select VenueInfo.userID AS venueID,VenueInfo.venueName AS venueName, Accounts.contact AS contact, Accounts.emailAddress AS emailAddress, Addresses.number AS streetNumber, Addresses.streetName AS streetName, Addresses.city AS city, Addresses.stateName AS stateName, Addresses.country AS country FROM VenueInfo JOIN Accounts ON VenueInfo.userID=Accounts.userID JOIN Addresses ON Addresses.addressID=Accounts.addressID;

Select UserInfo.userID AS userID, UserInfo.firstName AS firstName, UserInfo.lastName AS lastName,Accounts.contact AS contact, Accounts.emailAddress AS emailAddress, Addresses.number AS streetNumber, Addresses.streetName AS streetName, Addresses.city AS city, Addresses.stateName AS stateName, Addresses.country AS country FROM UserInfo JOIN Accounts ON UserInfo.userID=Accounts.userID JOIN Addresses ON Addresses.addressID=Accounts.addressID;

SELECT Accounts.emailAddress AS emailAddress, Accounts.contact AS contact, Addresses.number AS streetNumber,  Addresses.streetName AS streetName, Addresses.city AS city, Addresses.stateName AS stateName, Addresses.country AS country FROM Accounts JOIN Addresses ON Accounts.addressID=Addresses.addressID WHERE Accounts.userID=?;

SELECT CheckInRecords.dateAdded as time, CheckInRecords.userID as userID, concat(UserInfo.firstName, ' ' , UserInfo.lastName) as userName, concat(Addresses.number , ', ' , Addresses.streetName, ', ' , Addresses.city ,', ' , Addresses.stateName , ', ' , Addresses.country) as userAddress, Accounts.emailAddress as userEmail, Accounts.contact as userContact FROM CheckInRecords JOIN Accounts ON CheckInRecords.userID = Accounts.userID JOIN UserInfo ON  CheckInRecords.userID = UserInfo.userID JOIN Addresses ON Accounts.addressID = Addresses.addressID WHERE CheckInRecords.checkInCode ORDER BY CheckInRecords.dateAdded DESC;

SELECT CheckInRecords.dateAdded as time, CheckInRecords.userID as userID, concat(UserInfo.firstName,' ',UserInfo.lastName) as userName, concat(Addresses.number , ', ' , Addresses.streetName, ', ' , Addresses.city ,', ' , Addresses.stateName , ', ' , Addresses.country) as userAddress, Accounts.emailAddress as userEmail, Accounts.contact as userContact FROM CheckInRecords JOIN Accounts ON CheckInRecords.userID=Accounts.userID JOIN UserInfo On CheckInRecords.userID=UserInfo.userID JOIn Addresses ON Accounts.addressID = Addresses.addressID ORDER BY CheckInRecords.dateAdded DESC;

select CheckInRecords.dateAdded as dateAdded, CheckInRecords.userID as userID, CheckInRecords.latitude as latitude, CheckInRecords.longitude as longitude, VenueInfo.venueName as venue FROM CheckInRecords LEFT OUTER JOIN VenueInfo ON CheckInRecords.checkInCode = VenueInfo.checkInCode;