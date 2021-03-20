USE master
GO

IF NOT EXISTS(SELECT 1 FROM sys.databases WHERE name='ParksAcrossAmerica')
    CREATE DATABASE ParksAcrossAmerica
GO

USE ParksAcrossAmerica
GO

if not exists (select * from sysobjects where name='Contries' and xtype='U')
    Create Table Contries(
		CountryID	int				PRIMARY KEY IDENTITY,
		CountryName varchar(90)		NOT NULL
)

if not exists (select * from sysobjects where name='Parks' and xtype='U')
    Create Table Parks(
		-- colName		dataType		Attributes
		ParkID			int				PRIMARY KEY IDENTITY,
		ParkName		varchar(128)	NOT NULL,
		ParkNation		int				NOT NULL FOREIGN KEY (ParkNation) REFERENCES Contries(CountryID),
		ParkType		varchar(40)		NOT NULL
)

GO

INSERT INTO Contries(CountryName)
VALUES	('Canada'),
		('United States of America')

INSERT INTO Parks(ParkName, ParkNation, ParkType)
VALUES ('Akami-UapishkU-KakKasuak-Mealy Mountains', 1, 'National Park'),
('Aulavik', 1, 'National Park'),
('Auyuittuq', 1, 'National Park'),
('Banff', 1, 'National Park'),
('Bruce Peninsula', 1, 'National Park'),
('Cape Breton Highlands', 1, 'National Park'),
('Elk Island', 1, 'National Park'),
('Forillon', 1, 'National Park'),
('Fundy', 1, 'National Park'),
('Georgian Bay Island', 1, 'National Park'),
('Glacier', 1, 'National Park'),
('Grsslands', 1, 'National Park'),
('Gros Morne', 1, 'National Park'),
('Gulf Isalnds', 1, 'National Park'),
('Gwaii Haanas', 1, 'National Park'),
('Ivvavik', 1, 'National Park'),
('Jasper', 1, 'National Park'),
('Kejimkujik', 1, 'National Park'),
('Kluane', 1, 'National Park'),
('Kootenay', 1, 'National Park'),
('Kouchibouguac', 1, 'National Park'),
('La Maurcie', 1, 'National Park'),
('Mingan Archipelago', 1, 'National Park'),
('Mount Revelstoke', 1, 'National Park'),
('Naats"ihch"oh', 1, 'National Park'),
('Nahanni', 1, 'National Park'),
('Pacific Rim', 1, 'National Park'),
('Point Pelee', 1, 'National Park'),
('Pince Albert', 1, 'National Park'),
('Prince Edward Island', 1, 'National Park'),
('Pukaskwa', 1, 'National Park'),
('Qausuittuq', 1, 'National Park'),
('Quttinirpaaq', 1, 'National Park'),
('Riding Mountian', 1, 'National Park'),
('Rouge', 1, 'National Park'),
('Sable Island', 1, 'National Park'),
('Sirmilik', 1, 'National Park'),
('Terra Nova', 1, 'National Park'),
('Thaidene Nene', 1, 'National Park'),
('Thousand Isalnd', 1, 'National Park'),
('Torngat Mountains', 1, 'National Park'),
('Tuktut Nogait', 1, 'National Park'),
('Ukkusiksalik', 1, 'National Park'),
('Vuntut', 1, 'National Park'),
('Wapusk', 1, 'National Park'),
('Waterton Lakes', 1, 'National Park'),
('Wood Buffalo', 1, 'National Park'),
('Yoho', 1, 'National Park'),
('Acadia', 2, 'National Park'),
('American Samoa', 2, 'National Park'),
('Arches', 2, 'National Park'),
('Badlands', 2, 'National Park'),
('Big Bend', 2, 'National Park'),
('Biscayne', 2, 'National Park'),
('Black Canyon of the Gunnison', 2, 'National Park'),
('Bryce Canyon', 2, 'National Park'),
('Canyonlands', 2, 'National Park'),
('Capitol Reef', 2, 'National Park'),
('Carlsbad Caverns', 2, 'National Park'),
('Channel Islands', 2, 'National Park'),
('Congaree', 2, 'National Park'),
('Crater Lake', 2, 'National Park'),
('Cuyahoga', 2, 'National Park'),
('Death Valley', 2, 'National Park'),
('Denali', 2, 'National Park'),
('Dry tortugas', 2, 'National Park'),
('Everglades', 2, 'National Park'),
('Gates of the Arctic', 2, 'National Park'),
('Glacier', 2, 'National Park'),
('Glacier Bay', 2, 'National Park'),
('Grand Canyon', 2, 'National Park'),
('Grand Teton', 2, 'National Park'),
('Great Basin', 2, 'National Park'),
('Great Sand Dunes', 2, 'National Park'),
('Great Smokey', 2, 'National Park'),
('Guadalupe', 2, 'National Park'),
('Haleakala', 2, 'National Park'),
('Hawii', 2, 'National Park'),
('Hot Springs', 2, 'National Park'),
('Isle Royale', 2, 'National Park'),
('Joshua Tree', 2, 'National Park'),
('Katmai', 2, 'National Park'),
('Kenai Fjords', 2, 'National Park'),
('Kings Canyon', 2, 'National Park'),
('Kobuk Valley', 2, 'National Park'),
('Lake Clark', 2, 'National Park'),
('Lassen Volcanic', 2, 'National Park'),
('Mammoth Cave', 2, 'National Park'),
('Mesa Verda', 2, 'National Park'),
('Mount Rainer', 2, 'National Park'),
('North Cascades', 2, 'National Park'),
('Olypic', 2, 'National Park'),
('Ptrified Forest', 2, 'National Park'),
('Redwood', 2, 'National Park'),
('Rocky Mountain', 2, 'National Park'),
('Saguaro', 2, 'National Park'),
('Sequoia', 2, 'National Park'),
('Shenandoah', 2, 'National Park'),
('Therfore Roosevelt', 2, 'National Park'),
('Virgin Islands', 2, 'National Park'),
('Voyageurs', 2, 'National Park'),
('Wind Cave', 2, 'National Park'),
('Wrangell-St. Elias', 2, 'National Park'),
('Yellowstone', 2, 'National Park'),
('Yosemite', 2, 'National Park'),
('Zion', 2, 'National Park')

GO

SELECT *,
	case
		when ParkNation = 1 then 'Canada'
		when ParkNation = 2 then 'United States of America'
	end as CountryLocatedIn
FROM Parks

SELECT * FROM Users

SELECT * FROM Contries