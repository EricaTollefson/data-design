-- The statement below sets the collation of the database to utf8
ALTER DATABASE etollefson CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!
DROP TABLE IF EXISTS itinerary;
DROP TABLE IF EXISTS friend;
DROP TABLE IF EXISTS user;

-- the CREATE TABLE function is a function that takes tons of arguments to layout the table's schema
-- create the 'user' entity
CREATE TABLE user (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	userId BINARY(16) NOT NULL,
	userFirstName VARCHAR(32) NOT NULL,
	userLastName VARCHAR(32) NOT NULL,
	userMiddleName VARCHAR(32),
	userEmail VARCHAR(128) NOT NULL,
	-- to make something optional, exclude the not null
	userAddress CHAR(97) NOT NULL,
	userPhone VARCHAR(32),
	userDateOfBirth DATE NOT NULL,
	userRewardsStatus VARCHAR(16) NOT NULL,
	userRewardsNumber TINYINT NOT NULL,
	-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(userEmail),
	UNIQUE(userRewardsNumber),
	-- this officiates the primary key for the entity
	PRIMARY KEY(userId)
);

-- create the friend entity
CREATE TABLE friend (
	-- this is for yet another primary key...
	friendId BINARY(16) NOT NULL,
	-- this is for a foreign key
	friendUserId BINARY(16) NOT NULL,
	friendFirstName VARCHAR(32) NOT NULL,
	friendLastName VARCHAR(32) NOT NULL,
	friendEmail VARCHAR(128) NOT NULL,
	friendTextNumber VARCHAR(32),
	friendFacebook CHAR(75),
	friendTwitter CHAR(75),
	-- this creates an index before making a foreign key
	INDEX(friendUserId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(friendUserId) REFERENCES user(userId),
	-- and finally create the primary key
	PRIMARY KEY(friendId)
);

-- create the itinerary entity
CREATE TABLE itinerary (
	-- this is for the primary key
	itineraryId BINARY(16) NOT NULL,
	-- this is for a foreign key
	itineraryUserId BINARY(16) NOT NULL,
	itineraryOutboundFlightDate DATE NOT NULL,
	itineraryOutboundFlightNumber TINYINT NOT NULL,
	itineraryOutboundFlightDepartureCity CHAR(4) NOT NULL,
	itineraryOutboundFlightArrivalCity CHAR(4) NOT NULL,
	itineraryOutboundFlightDepartureTime TIME NOT NULL,
	itineraryOutboundFlightArrivalTime TIME NOT NULL,
	itineraryOutboundFlightPrice DECIMAL(8,2) NOT NULL,
	itineraryInboundFlightDate DATE NOT NULL,
	itineraryInboundFlightNumber TINYINT NOT NULL,
	itineraryInboundFlightDepartureCity CHAR(4) NOT NULL,
	itineraryInboundFlightArrivalCity CHAR(4) NOT NULL,
	itineraryInboundFlightDepartureTime TIME NOT NULL,
	itineraryInboundFlightArrivalTime TIME NOT NULL,
	itineraryInboundFlightPrice DECIMAL(8,2) NOT NULL,
	itineraryTotalPrice DECIMAL(8,2) NOT NULL,
	-- this creates an index before making a foreign key
	INDEX(itineraryUserId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(itineraryUserId) REFERENCES user(userId),
	-- and finally create the primary key
	PRIMARY KEY(itineraryId)
);
