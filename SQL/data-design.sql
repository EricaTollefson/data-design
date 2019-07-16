-- The statement below sets the collation of the database to utf8
ALTER DATABASE etollefson CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS itinerary;
DROP TABLE IF EXISTS friend;
DROP TABLE IF EXISTS user;

-- create the 'user' entity
CREATE TABLE user (
	userId BINARY(16) NOT NULL,
	userFirstName VARCHAR(32) NOT NULL,
	userLastName VARCHAR(32) NOT NULL,
	userMiddleName VARCHAR(32),
	userEmail VARCHAR(128) NOT NULL,
	userAddress VARCHAR(97) NOT NULL,
	userPhone VARCHAR(32),
	userDateOfBirth DATE NOT NULL,
	userRewardsStatus VARCHAR(16) NOT NULL,
	userRewardsNumber TINYINT NOT NULL,
	UNIQUE(userEmail),
	UNIQUE(userRewardsNumber),
	PRIMARY KEY(userId)
);

-- create the friend entity
CREATE TABLE friend (
	friendId BINARY(16) NOT NULL,
	friendUserId BINARY(16) NOT NULL,
	friendFirstName VARCHAR(32) NOT NULL,
	friendLastName VARCHAR(32) NOT NULL,
	friendEmail VARCHAR(128) NOT NULL,
	friendTextNumber VARCHAR(32),
	friendFacebook VARCHAR(75),
	friendTwitter VARCHAR(75),
	INDEX(friendUserId),
	FOREIGN KEY(friendUserId) REFERENCES user(userId),
	PRIMARY KEY(friendId)
);

-- create the itinerary entity
CREATE TABLE itinerary (
	itineraryId BINARY(16) NOT NULL,
	itineraryUserId BINARY(16) NOT NULL,
	itineraryOutboundFlightDate DATE NOT NULL,
	itineraryOutboundFlightNumber TINYINT NOT NULL,
	itineraryOutboundFlightDepartureCity VARCHAR(4) NOT NULL,
	itineraryOutboundFlightArrivalCity VARCHAR(4) NOT NULL,
	itineraryOutboundFlightDepartureTime TIME NOT NULL,
	itineraryOutboundFlightArrivalTime TIME NOT NULL,
	itineraryOutboundFlightPrice DECIMAL(8,2) NOT NULL,
	itineraryInboundFlightDate DATE NOT NULL,
	itineraryInboundFlightNumber TINYINT NOT NULL,
	itineraryInboundFlightDepartureCity VARCHAR(4) NOT NULL,
	itineraryInboundFlightArrivalCity VARCHAR(4) NOT NULL,
	itineraryInboundFlightDepartureTime TIME NOT NULL,
	itineraryInboundFlightArrivalTime TIME NOT NULL,
	itineraryInboundFlightPrice DECIMAL(8,2) NOT NULL,
	itineraryTotalPrice DECIMAL(8,2) NOT NULL,
	INDEX(itineraryUserId),
	FOREIGN KEY(itineraryUserId) REFERENCES user(userId),
	PRIMARY KEY(itineraryId)
);
