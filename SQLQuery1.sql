CREATE DATABASE Travel2020
GO 
USE Travel2020
GO 

SELECT * FROM dbo.[User]

CREATE TABLE Country
(
	country_id INT PRIMARY KEY,
	country_name NVARCHAR(150),
	[descriptions] NVARCHAR(200)
)
GO 

INSERT dbo.Country
        ( country_id ,
          country_name ,
          [descriptions]
        )
VALUES  ( 1 , -- country_id - int
          N'Viet Nam' , -- country_name - nvarchar(150)
          N'Join Luxstay on your journey to conquer the world'  -- description - nvarchar(200)
        )
GO 

INSERT dbo.Country
        ( country_id ,
          country_name ,
          [descriptions]
        )
VALUES  ( 2 , -- country_id - int
          N'Singapore' , -- country_name - nvarchar(150)
          N'Make each trip an inspirational journey, and each room is a peaceful space in Singapore'  -- description - nvarchar(200)
        )
GO 

CREATE TABLE Destination
(
	city_id INT PRIMARY KEY IDENTITY(1,1),
	country_id INT,
	city_name NVARCHAR(500),
	descriptions NTEXT,
	img NTEXT
)
GO
ALTER TABLE dbo.Destination ADD CONSTRAINT FK_COUNTRY FOREIGN KEY (country_id) REFERENCES dbo.Country(country_id)
GO 

INSERT dbo.Destination
        ( city_name, descriptions, img )
VALUES  ( N'Halong Bay', -- city_name - nvarchar(500)
          'The karst seascape of Halong Bay is one of the world''s most spellbinding sea views and is a UNESCO World Heritage Site. Thousands of limestone islands sit within this bay in the Gulf of Tonkin, eroded into jagged pinnacles by wind and water action over millennia.

With the bay''s scenery best seen by boat, this is prime cruising territory. Opt for at least an overnight tour to see Halong Bay''s iconic views as a day trip doesn''t do it justice.

There are plenty of caves in the bay that can be entered including the Hang Sung Sot, with three mammoth caverns, and the Hang Dao Go, with superbly weird stalagmites and stalactites. For most people though, the highlight is simply cruising amid the karsts and soaking up the changing scenery of pinnacles as you pass by.', -- descriptions - ntext
          'https://cdn.luxstay.com/home/location/location_5_1559786196.png' -- img - ntext
          )
GO

INSERT dbo.Destination
        (  city_name, descriptions, img )
VALUES  ( 
			N'Ho Chi Minh City', -- city_name - nvarchar(500)
          'For big city fans, no visit to Vietnam is really complete without a visit to Ho Chi Minh City, the buzzing and crazy commercial hub of the country. The streets are an insane clog of motorbikes and cars, the restaurant and café scene is incredibly cosmopolitan, and the shopping is the best in the country.

At its center is Dong Khoi, a relatively small and easily navigable central district, which holds most of the city''s sights. Here, you''ll find the HCMC Museum, with a brilliant collection of artifacts that weaves together the story of the city, and the grand Notre Dame Cathedral, built in the late 19th century.

Check out the old district of Da Kao nearby for some of the best surviving examples of the city''s French colonial architecture and also to visit the Jade Emperor Pagoda with its dazzling array of Buddhist and Taoist religious iconography. Afterwards, the History Museum is a must-do for history fans with stacks of relics on display from various archaeological sites.

For many visitors, the two big-hitter attractions not to miss are just a little out of the center, along Nguyen Thi Minh Khai Street. The Reunification Palace, then known as Independence Palace, was the residence for South Vietnam''s president. It''s chiefly famous as the spot where North Vietnam''s tanks stopped on 30 April 1975, officially ending the war. It''s a completely fascinating place to visit complete with 1960s furnishings still in situ.

Nearby is the War Remnants Museum, which although very obviously biased, paints a disturbing picture of the brutality of war and the many atrocities committed by US Forces during their Vietnam campaign.', -- descriptions - ntext
          'https://www.planetware.com/wpimages/2020/04/vietnam-best-places-to-visit-ho-chi-minh-city.jpg'  -- img - ntext
          ) 
GO 

INSERT dbo.Destination
        ( city_name, descriptions, img )
VALUES  ( N'Hue', -- city_name - nvarchar(500)
          'One of Vietnam''s most historic towns, Hue is packed to the brim with relics from the reign of the 19th-century Nguyen emperors. Sitting along the banks of the gorgeous Perfume River, the Imperial Enclosure is a huge site set within walls that sprawl for 2.5 kilometers.

While touring the grounds check out the gorgeous Ngo Mon Gate, the Thai Hoa Palace with its finely lacquered interior detailing, the Dien Tho Residence where the Queen Mothers would live, and the Halls of Mandarins with its preserved ceiling murals. A dazzling number of historic sites lie outside the Imperial Enclosure walls as well.

One of the nicest ways of visiting a collection of outlying sites is by taking a riverboat cruise on the Perfume River. A day cruise can take you to visit several royal tombs along with some pagodas. If you''re short on time, the best tomb to visit is the Tomb of Tu Doc and the most important pagoda in the area is the Thien Mu Pagoda, with its tower that soars for 21 meters high.', -- descriptions - ntext
          'https://www.planetware.com/photos-large/VIE/vietnam-hue-imperial-palace-gate.jpg'  -- img - ntext
          )
GO

INSERT dbo.Destination
        ( city_name, descriptions, img )
VALUES  ( N'Sapa Countryside', -- city_name - nvarchar(500)
          'The verdant rice field countryside surrounding Sapa, bordered by the jagged peaks of the Hoang Lien Mountains (often still known by their French colonial era name of the Tonkinese Alps), are home to Vietnam''s most beautiful rural vistas.

The deep valleys here are home to a diverse mix of the country''s ethnic minorities, including the Hmong, Giay, and Red Dzao people, while the rippling hills are terraced with rice fields and overlooked by the country''s tallest peak, Fansipan Mountain.

This is the top trekking destination in Vietnam, with oodles of options to trek or day hike between tiny villages and experience the staggering mountain views. Sapa itself is the main base here - an old French hill station and now a bustling and forever growing tourist center that is a stark contrast to the sumptuous tranquil countryside right on its doorstep.', -- descriptions - ntext
          'https://www.planetware.com/photos-large/VIE/vietnam-sapa-countryside.jpg'  -- img - ntext
          )
GO 

INSERT dbo.Destination
        ( city_name, descriptions, img )
VALUES  ( N'Hanoi', -- city_name - nvarchar(500)
          'Vietnam''s capital is the frenetic heartbeat of the nation and a place that befuddles travelers as much as it charms them. The motorbike frenzy, pollution, and constant clamor of street vendors can get too much for some travelers, but if you want to dive into Vietnamese city life, Hanoi is the place to do it.

The old town quarter has plenty of dilapidated charm on offer, while history fans should make a beeline here simply to see the bundle of excellent museums.

The Vietnam Museum of Ethnology and Vietnam Fine Art Museum are both brilliant introductions to the diverse artistry of the country, while the Ho Chi Minh Mausoleum is an important tribute to the founder of modern Vietnam.', -- descriptions - ntext
          'https://www.planetware.com/photos-large/VIE/vietnam-hanoi-alleyway-scene.jpg'  -- img - ntext
          )
GO 

INSERT INTO dbo.Destination
        ( country_id ,
          city_name ,
          descriptions ,
          img
        )
VALUES  ( 2 , -- country_id - int
          N'Marina Bay Sands' , -- city_name - nvarchar(500)
          'The opulent Marina Bay Sands resort complex includes a high-end luxury hotel, a mall with a canal running through it, the ArtScience Museum, and the Marina Bay Sands Skypark Observation Deck—a vantage point for taking in the entire city. The Skypark''s viewing deck and infinity pool are found in the ship (yes, ship) that tops the hotel. Only hotel guests are allowed to use the infinity pool, but anyone can visit the observation deck.

From the Skypark, you can see the innovative double helix bridge, the port, the Gardens by the Bay (101 hectares of land converted into waterfront gardens), and the impressive skyline.

While up there on top of the city, guests can grab a snack or a coffee at the rooftop restaurant or pick up some keepsakes from the souvenir stand. You can purchase a photo of yourself green-screened in front of the massive hotel as it''s all lit up at night, but the cost is steep at 50 Singapore dollars—better to ask a fellow tourist to snap a photo of you if possible. The elegant opulence of the Marina Bay Sands exemplifies Singapore''s style and status as a major international city in Southeast Asia.' , -- descriptions - ntext
          'https://www.planetware.com/photos-large/SIN/singapore-marina-bay-sands.jpg'  -- img - ntext
        )
GO 

INSERT INTO dbo.Destination
        ( country_id ,
          city_name ,
          descriptions ,
          img
        )
VALUES  ( 2 , -- country_id - int
          N'Gardens by the Bay' , -- city_name - nvarchar(500)
          'Once you''ve glimpsed this beautifully designed green space (from the top of the Marina Bay Sands, perhaps) you won''t be able to stay away. Wander through the Bay East Garden, perfect for enjoying the vibrant plant life and escaping the city bustle for a moment.

You won''t want to miss Supertree Grove, where you''ll find a cluster of the iconic, futuristic structures designed to perform environmentally sustainable functions. Then, head to the Cloud Forest Dome to see the world''s tallest indoor waterfall and learn a bit about biodiversity. Check the website for ticket sale prices and tour times.' , -- descriptions - ntext
          'https://www.planetware.com/photos-large/SIN/singapore-gardens-by-the-bay.jpg'  -- img - ntext
        )
GO 

INSERT dbo.Destination
        ( country_id ,
          city_name ,
          descriptions ,
          img
        )
VALUES  ( 2 , -- country_id - int
          N'Botanic Gardens' , -- city_name - nvarchar(500)
          'Not to be confused with the Gardens on the Bay, the Botanic Gardens are also worth a visit. Singapore received its first UNESCO World Heritage nomination for its botanical gardens, and with good reason. The city can sometimes feel like a concrete jungle, albeit a clean and comfortable one, but the botanic gardens preserve pieces of Singapore''s wilder heritage.

Here, a walking trail leads to the gardens heritage trees, which are conserved as part of an effort to protect the city''s mature tree species. Make sure to visit the impressive National Orchid Garden as well.

Other popular things to do include visiting the eco-garden, eco-lake, bonsai garden, sculptures, and several other formal gardens.' , -- descriptions - ntext
          'https://www.planetware.com/photos-large/SIN/singapore-botanic-gardens.jpg'  -- img - ntext
        )
GO 

INSERT dbo.Destination
        ( country_id ,
          city_name ,
          descriptions ,
          img
        )
VALUES  ( 2 , -- country_id - int
          N'Singapore Zoo' , -- city_name - nvarchar(500)
          'Billing itself as the world''s best rainforest zoo, the Singapore Zoo is a pretty impressive place. The facility is clean and inviting, and the animals appear well treated, with plenty of lush vegetation and habitat space.

The orangutans are particularly impressive, and visitors can watch as babies and adults alike swing high above their platforms and snack on fruits. There is also a large chimpanzee family, zebras, meerkats, a komodo dragon, mole rats, white tigers, kangaroos, and many other creatures.

Guests can observe feedings for some of the animals. Allow at least three hours to make your way around the zoo.

If the zoo doesn''t satisfy your need for getting close to wildlife, there''s also the Night Safari, River Safari (including a giant panda forest), and the Jurong Bird Park. Park hopper passes are available if you plan to visit more than one of the wildlife parks.

For a unique and personal wildlife experience, try the Singapore Zoo Breakfast with the Orangutans. This hassle-free tour includes transportation from and to your hotel, allows you half day to explore the zoo, and has an optional upgrade to enjoy breakfast in the company of the zoo''s much-loved orangutans.' , -- descriptions - ntext
          'https://www.planetware.com/photos-large/SIN/singapore-zoo.jpg'  -- img - ntext
        )
GO 

SELECT * FROM dbo.Destination
WHERE country_id = 2

SELECT * FROM dbo.Destination WHERE city_id = 1

-- create table for places in a city
CREATE TABLE Destination_Detail
(
	id INT PRIMARY KEY IDENTITY(1,1),
	city_id INT,
	name NVARCHAR(150),
	img NTEXT,
	content NTEXT
)
GO 
ALTER TABLE dbo.Destination_Detail ADD CONSTRAINT FK_CITY_ID FOREIGN KEY (city_id) REFERENCES dbo.Destination(city_id)
GO 

INSERT dbo.Destination_Detail
        ( city_id, name, img, content )
VALUES  ( 5, -- city_id - int
          N'Imperial Citadel of Thang Long', -- name - nvarchar(150)
          'http://amazinghalongtour.com/1/userfiles/2/vietnam-hanoi-imperial-citadel.jpg', -- img - ntext
          'The Imperial Citadel of Thang Long is an intriguing relic of Vietnam’s history and, signifying its historical and cultural importance, is now a UNESCO World Heritage Site. Standing 40 metres high, the central flag tower is the most recognizable feature of the Imperial Citadel and is often used as a symbol of Hanoi. This was the centre of ancient Hanoi and served as the political centre for eight centuries. Located in Ba Dinh, the Imperial Citadel of Thang Long is close to many other tourist attractions.'  -- content - ntext
          )
GO 

INSERT dbo.Destination_Detail
        ( city_id, name, img, content )
VALUES  ( 5, -- city_id - int
          N'Ba Vi National Park', -- name - nvarchar(150)
          'https://vina.com/wp-content/uploads/2019/05/ba-vi-national-park.jpg', -- img - ntext
          'Ba Vi National Park is a nature reserve of stunning beauty located around two hours (48km) from downtown Hanoi. Famous for its three-peaked mountain that juts steeply up into the sky and is often topped by cloud, Ba Vi National Park has dramatic scenery and a diverse range of jungle plants and animals. At the summit of the tallest mountain is an 11th century temple offering expansive views of the surrounding countryside and on the forest floor are natural hot springs. '  -- content - ntext
          )
GO 

SELECT * FROM dbo.Destination_Detail

-- create table for detail places
SELECT * FROM dbo.Destination_Detail

CREATE TABLE Place
(
	id INT, 
	name NVARCHAR(150),
	content NTEXT, 
	video NVARCHAR(max)
)
GO
ALTER TABLE dbo.Place ADD CONSTRAINT FK_PLACE_ID FOREIGN KEY (id) REFERENCES dbo.Destination_Detail(id)
GO  

INSERT dbo.Place
        ( id, name, content, video )
VALUES  ( 1, -- id - int
          N'Imperial Citadel of Thang Long', -- name - nvarchar(150)
          'The ancient site was the political centre of the country for 13 consecutive centuries and served as the capital of Vietnam for eight centuries. A notable attraction in the Imperial Citadel of Thang Long was the Hanoi Flag Tower, a renovated 40-metre-tall stone fortress offering expansive views of Ba Dinh Square and Hanoi City Centre.', -- content - ntext
          N'MJwbPLDBxvM'  -- video - nvarchar(max)
          )
GO 

SELECT * FROM dbo.Place WHERE id = 1

SELECT * FROM dbo.Destination_Detail WHERE name = 'Imperial Citadel of Thang Long'
SELECT * FROM dbo.Destination WHERE city_id = 1
SELECT * FROM dbo.Place

CREATE TABLE [User]
(
	userid NVARCHAR(150) PRIMARY KEY,
	fullname NVARCHAR(300),
	email NVARCHAR(300),
	[password] NVARCHAR(50),
	[status] BIT
)
GO 
INSERT dbo.[User]
        ( userid ,
          fullname ,
          email ,
          [password] ,
          [status]
        )
VALUES  ( N'tieuhoa' , -- userid - nvarchar(150)
          N'Tiêu Trung Hòa' , -- fullname - nvarchar(300)
          N'tieutrunghoa1198@gmail.com' , -- email - nvarchar(300)
          N'123' , -- password - nvarchar(50)
          1  -- status - bit
        )
GO 

INSERT dbo.[User]
        ( userid ,
          fullname ,
          email ,
          [password] ,
          [status]
        )
VALUES  ( N'songmon' , -- userid - nvarchar(150)
          N'tieu hoa' , -- fullname - nvarchar(300)
          N'asd@gmail.com' , -- email - nvarchar(300)
          N'123' , -- password - nvarchar(50)
          0  -- status - bit
        )
GO 

INSERT dbo.[User]
        ( userid ,
          fullname ,
          email ,
          password ,
          status
        )
VALUES  ( N'admin' , -- userid - nvarchar(150)
          N'Tieu Trung Hoa' , -- fullname - nvarchar(300)
          N'admin@vitr.com' , -- email - nvarchar(300)
          N'admin' , -- password - nvarchar(50)
          1  -- status - bit
        )
GO 

SELECT * FROM dbo.[User]

DELETE FROM dbo.[User] WHERE userid = 'thienphu'

SELECT * FROM [dbo].[User] 
WHERE [status] = 1
AND userid = 'tieuhoa'
AND [password] = '123'

CREATE TABLE Feature
(
	fid INT PRIMARY KEY,
	url NVARCHAR(100)
)
GO 

CREATE TABLE User_Feature
(
	userid NVARCHAR(150),
	fid INT,
	CONSTRAINT PK_User_Feature PRIMARY KEY (userid, fid)
)
GO 

ALTER TABLE dbo.User_Feature ADD CONSTRAINT FK_USERID FOREIGN KEY (userid) REFERENCES dbo.[User](userid)
GO 
ALTER TABLE dbo.User_Feature ADD CONSTRAINT FK_FID FOREIGN KEY (fid) REFERENCES dbo.Feature(fid)
GO 

SELECT * FROM [dbo].[User] u
LEFT JOIN dbo.User_Feature uf ON uf.userid = u.userid
RIGHT JOIN dbo.Feature f ON f.fid = uf.fid
WHERE u.userid = 'admin'

SELECT * FROM dbo.Feature
SELECT * FROM dbo.User_Feature

SELECT * FROM dbo.Place

INSERT dbo.User_Feature
        ( userid, fid )
VALUES  ( N'username', -- userid - nvarchar(150)
          1  -- fid - int
          )
GO 


CREATE TABLE List_Fav
(
	userid NVARCHAR(150),
	destinationid INT
	CONSTRAINT PK_List_Fav PRIMARY KEY (userid, destinationid)
)
GO 
ALTER TABLE dbo.List_Fav ADD CONSTRAINT FK_userid_List_Fav FOREIGN KEY (userid) REFERENCES dbo.[User](userid)
GO 
ALTER TABLE dbo.List_Fav ADD CONSTRAINT FK_destinationid_List_Fav FOREIGN KEY (destinationid) REFERENCES dbo.Destination_Detail(id)
GO 

INSERT dbo.List_Fav
        ( userid, destinationid )
VALUES  ( N'tieuhoa', -- userid - nvarchar(150)
          1  -- destinationid - int
          )
GO 

INSERT dbo.List_Fav
        ( userid, destinationid )
VALUES  ( N'tieuhoa', -- userid - nvarchar(150)
          2  -- destinationid - int
          )
GO 

INSERT dbo.List_Fav
        ( userid, destinationid )
VALUES  ( N'nhathodimid', -- userid - nvarchar(150)
          2  -- destinationid - int
          )
GO 


SELECT * FROM dbo.Destination_Detail dt 
LEFT JOIN dbo.List_Fav lf ON lf.destinationid = dt.id
WHERE lf.userid = 'tieuhoa'

DELETE FROM dbo.List_Fav WHERE 
userid = 'tieuhoa' AND 
destinationid = 1

SELECT * FROM dbo.[User]

UPDATE dbo.[User]
SET [status] = 1 
WHERE userid = 'tieuhoa'

UPDATE dbo.[User]
SET password = ''
WHERE email = ''

SELECT * FROM dbo.[User] 

