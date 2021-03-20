USE master
GO

IF NOT EXISTS(SELECT 1 FROM sys.databases WHERE name='ParksAcrossAmerica')
    CREATE DATABASE ParksAcrossAmerica
GO

USE ParksAcrossAmerica
GO


if not exists (select * from sysobjects where name='Parks' and xtype='U')
    Create Table Parks(
		-- colName		dataType		Attributes
		ParkID			int				PRIMARY KEY IDENTITY,
		ParkName		varchar(128)	NOT NULL,
		ParkNation		varchar(100)	NOT NULL,
		ParkType		varchar(40)		NOT NULL
)

GO

INSERT INTO Parks(ParkName, ParkNation, ParkType)
VALUES ('Akami-UapishkU-KakKasuak-Mealy Mountains', 'Canada', 'National Park'),
('Aulavik', 'Canada', 'National Park'),
('Auyuittuq', 'Canada', 'National Park'),
('Banff', 'Canada', 'National Park'),
('Bruce Peninsula', 'Canada', 'National Park'),
('Cape Breton Highlands', 'Canada', 'National Park'),
('Elk Island', 'Canada', 'National Park'),
('Forillon', 'Canada', 'National Park'),
('Fundy', 'Canada', 'National Park'),
('Georgian Bay Island', 'Canada', 'National Park'),
('Glacier', 'Canada', 'National Park'),
('Grsslands', 'Canada', 'National Park'),
('Gros Morne', 'Canada', 'National Park'),
('Gulf Isalnds', 'Canada', 'National Park'),
('Gwaii Haanas', 'Canada', 'National Park'),
('Ivvavik', 'Canada', 'National Park'),
('Jasper', 'Canada', 'National Park'),
('Kejimkujik', 'Canada', 'National Park'),
('Kluane', 'Canada', 'National Park'),
('Kootenay', 'Canada', 'National Park'),
('Kouchibouguac', 'Canada', 'National Park'),
('La Maurcie', 'Canada', 'National Park'),
('Mingan Archipelago', 'Canada', 'National Park'),
('Mount Revelstoke', 'Canada', 'National Park'),
('Naats"ihch"oh', 'Canada', 'National Park'),
('Nahanni', 'Canada', 'National Park'),
('Pacific Rim', 'Canada', 'National Park'),
('Point Pelee', 'Canada', 'National Park'),
('Pince Albert', 'Canada', 'National Park'),
('Prince Edward Island', 'Canada', 'National Park'),
('Pukaskwa', 'Canada', 'National Park'),
('Qausuittuq', 'Canada', 'National Park'),
('Quttinirpaaq', 'Canada', 'National Park'),
('Riding Mountian', 'Canada', 'National Park'),
('Rouge', 'Canada', 'National Park'),
('Sable Island', 'Canada', 'National Park'),
('Sirmilik', 'Canada', 'National Park'),
('Terra Nova', 'Canada', 'National Park'),
('Thaidene Nene', 'Canada', 'National Park'),
('Thousand Isalnd', 'Canada', 'National Park'),
('Torngat Mountains', 'Canada', 'National Park'),
('Tuktut Nogait', 'Canada', 'National Park'),
('Ukkusiksalik', 'Canada', 'National Park'),
('Vuntut', 'Canada', 'National Park'),
('Wapusk', 'Canada', 'National Park'),
('Waterton Lakes', 'Canada', 'National Park'),
('Wood Buffalo', 'Canada', 'National Park'),
('Yoho', 'Canada', 'National Park'),
('Acadia', 'United States of America','National Park'),
('American Samoa', 'United States of America','National Park'),
('Arches', 'United States of America','National Park'),
('Badlands', 'United States of America','National Park'),
('Big Bend', 'United States of America','National Park'),
('Biscayne', 'United States of America','National Park'),
('Black Canyon of the Gunnison', 'United States of America','National Park'),
('Bryce Canyon', 'United States of America','National Park'),
('Canyonlands', 'United States of America','National Park'),
('Capitol Reef', 'United States of America','National Park'),
('Carlsbad Caverns', 'United States of America','National Park'),
('Channel Islands', 'United States of America','National Park'),
('Congaree', 'United States of America','National Park'),
('Crater Lake', 'United States of America','National Park'),
('Cuyahoga', 'United States of America','National Park'),
('Death Valley', 'United States of America','National Park'),
('Denali', 'United States of America','National Park'),
('Dry tortugas', 'United States of America','National Park'),
('Everglades', 'United States of America','National Park'),
('Gates of the Arctic', 'United States of America','National Park'),
('Glacier', 'United States of America','National Park'),
('Glacier Bay', 'United States of America','National Park'),
('Grand Canyon', 'United States of America','National Park'),
('Grand Teton', 'United States of America','National Park'),
('Great Basin', 'United States of America','National Park'),
('Great Sand Dunes', 'United States of America','National Park'),
('Great Smokey', 'United States of America','National Park'),
('Guadalupe', 'United States of America','National Park'),
('Haleakala', 'United States of America','National Park'),
('Hawii', 'United States of America','National Park'),
('Hot Springs', 'United States of America','National Park'),
('Isle Royale', 'United States of America','National Park'),
('Joshua Tree', 'United States of America','National Park'),
('Katmai', 'United States of America','National Park'),
('Kenai Fjords', 'United States of America','National Park'),
('Kings Canyon', 'United States of America','National Park'),
('Kobuk Valley', 'United States of America','National Park'),
('Lake Clark', 'United States of America','National Park'),
('Lassen Volcanic', 'United States of America','National Park'),
('Mammoth Cave', 'United States of America','National Park'),
('Mesa Verda', 'United States of America','National Park'),
('Mount Rainer', 'United States of America','National Park'),
('North Cascades', 'United States of America','National Park'),
('Olypic', 'United States of America','National Park'),
('Ptrified Forest', 'United States of America','National Park'),
('Redwood', 'United States of America','National Park'),
('Rocky Mountain', 'United States of America','National Park'),
('Saguaro', 'United States of America','National Park'),
('Sequoia', 'United States of America','National Park'),
('Shenandoah', 'United States of America','National Park'),
('Therfore Roosevelt', 'United States of America','National Park'),
('Virgin Islands', 'United States of America','National Park'),
('Voyageurs', 'United States of America','National Park'),
('Wind Cave', 'United States of America','National Park'),
('Wrangell-St. Elias', 'United States of America','National Park'),
('Yellowstone', 'United States of America','National Park'),
('Yosemite', 'United States of America','National Park'),
('Zion', 'United States of America','National Park')

GO

SELECT * FROM Parks

SELECT * FROM Users