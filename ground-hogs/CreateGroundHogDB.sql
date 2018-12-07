# CS-420 Team-3
# Author Keshab Panthi
# GroundHogDB
DROP DATABASE IF EXISTS groundHogs_db;
CREATE DATABASE groundHogs_db;
GRANT ALL PRIVILEGES ON groundHogs_db.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
USE groundHogs_db;

##############################################################################################################################################
######################################################       TABLES         ##################################################################
##############################################################################################################################################
#This table will have frequently asked questions stored
CREATE TABLE GGG_FAQ -- Codes, and description.
(
	questionId BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	question VARCHAR(500) NOT NULL,
    answer VARCHAR(500) DEFAULT 'This question has not been answered yet!',
    votes BIGINT DEFAULT 1
);
#This table will have frequently asked questions stored
CREATE TABLE GGG_SalesItem -- Codes, and description.
(
	itemId BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	itemName VARCHAR(500) NOT NULL,
    itemDescription VARCHAR(500) NOT NULL DEFAULT 'No description available for this product',
    itemPrice DECIMAL(6,4) NOT NULL,
    imagePath VARCHAR(500) DEFAULT 'NoImage.png',
    itemType VARCHAR(20) DEFAULT 'Food'
);


#This table will hold the reviews
CREATE TABLE GGG_Review 
(
	reviewId BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    itemId BIGINT NOT NULL,
	userName VARCHAR(500) NOT NULL,
    reviewMessage VARCHAR(500) NOT NULL,
    rating INT NOT NULL
);
#This table will have frequently asked questions stored
CREATE TABLE GGG_Workshop -- Codes, and description.
(
	workshopId BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	workshopName VARCHAR(50) NOT NULL,
    workshopDescription VARCHAR(500) NOT NULL DEFAULT 'No description available for this product',
	workshopDay VARCHAR (20) NOT NULL,
    workshopTime VARCHAR (20) NOT NULL,
    workshopCapacity INT DEFAULT 20,
    workshopRegistration INT DEFAULT 0
);

##############################################################################################################################################
######################################################       Stored Procedures         #######################################################
##############################################################################################################################################
DELIMITER $$


CREATE PROCEDURE SP_GetReviews(
	IN itemIdIn INT
)
BEGIN
		SELECT userName,reviewMessage, rating
		FROM GGG_Review
        WHERE itemId=itemIdIn
		ORDER BY reviewId; 
END $$


CREATE PROCEDURE SP_GetWorkshops()
BEGIN
	SELECT workshopId, workshopName, workshopDescription, workshopDay, workshopTime, workshopCapacity, workshopRegistration
	FROM GGG_Workshop;
END $$

CREATE PROCEDURE SP_RegisterToWorkshop(
	IN workshopIdIn INT
)
BEGIN
	UPDATE GGG_Workshop SET workshopRegistration=workshopRegistration+1
	WHERE workshopId=workshopIdIn;
END $$


CREATE PROCEDURE SP_AddFAQ(
	IN questionIn VARCHAR(500)
)
BEGIN
	INSERT INTO GGG_FAQ (question)
    VALUES(questionIn);
END $$


CREATE PROCEDURE SP_AddAVote(
	IN questionIdIn INT
)
BEGIN
	UPDATE GGG_FAQ
    SET votes=votes+1
    WHERE questionId=questionIdIn;
END $$

CREATE PROCEDURE SP_GetFAQ(
	IN countIn INT
)
BEGIN
	IF countIn>0 THEN
		SELECT questionId, question, answer, votes
		FROM GGG_FAQ
		ORDER BY votes DESC LIMIT countIn;
	ELSE
			SELECT questionId, question, answer, votes
			FROM GGG_FAQ
			ORDER BY votes DESC;

    END IF;
        
END $$

CREATE PROCEDURE SP_GetSalesItem(
	IN itemIdIn INT
)
BEGIN
		SELECT si.itemId, si.itemName, si.itemDescription,si.itemPrice,si.imagePath,AVG(COALESCE(review.rating, 0)) AS Rating,COUNT(review.itemId) AS Reviews
		FROM GGG_SalesItem si
        LEFT JOIN GGG_Review review ON review.itemId=si.itemId 
    	WHERE si.itemId=itemIdIn
        GROUP BY si.itemId LIMIT 1;
END $$

CREATE PROCEDURE SP_GetInventory(
	IN IsFoodChecked BIGINT,
    IN IsAccessoriesChecked BIGINT,
    IN IsCareProducts BIGINT,
    IN startPrice DECIMAL,
    IN endPrice DECIMAL
)
BEGIN
        SELECT si.itemId, si.itemName, si.itemDescription,si.itemPrice,si.imagePath,AVG(COALESCE(review.rating, 0)) AS Rating,COUNT(review.itemId) AS Reviews
		FROM GGG_SalesItem si
        LEFT OUTER JOIN GGG_Review review ON review.itemId=si.itemId 
    	WHERE ((si.itemType='Food' AND IsFoodChecked=true) OR (si.itemType='Accessories' AND IsAccessoriesChecked=true)OR(si.itemType='CareProducts' AND IsCareProducts=true)) AND (si.itemPrice>=startPrice AND si.itemPrice <=endPrice)
        GROUP BY si.itemId;
END $$



DELIMITER ;
##############################################################################################################################################
#########################################################       Dummy Data         ###########################################################
##############################################################################################################################################
INSERT INTO GGG_FAQ(question,answer,votes)
VALUES
	('Can I take my groundhog for a walk when it is snowing?','Sure you can, but make sure your groundhog is wearing one of the jacket like productId=3',100),
    ('My groundhog just delivered a baby with teeth, is it normal?','Unlike people, groundhog do take birth with teeths. I recommend using productId=4 and productId=2 when cleaning those tiny teeths',5),
    ('Which item should I use to groom groundhog\'s hair?','Use productId=1. My groundhog also uses it and she is very happy with it.',3),
    ('How long do groundhog live?','Most of them live upto 20 years',4),
    ('Can I please get direct line to talk with groundhog trainer?','Sure, 773-234-5351',300),
    ('Do you guys open even on Thanks giving day?', 'Yes we are!',3),
    ('Is there parking available?', 'Yes there is free parking just behind our office',20),
    ('Is it good idea to show cartoon to groundhog', 'No! it is bad idea, instead give them the toys like productId=6',8),
    ('Do you guys also shell groundhogs?','Sorry! we do not !',1),
    ('I lost my receipt, can I still return the unused product?','Please send us the unused product; however, there will be 10% charges on the items without receipts',7),
    ('Last time I purchased lipstick for my ground hog with color code 256, but I no longer see that item. Is there another product that is close?', 'Sorry we no longer product lipstick-256, however you may purchase productId=14',2);
INSERT INTO GGG_SalesItem(itemName, itemDescription,itemPrice,itemType,imagePath)
VALUES
	('KAYTEE Fiesta Gourmet Food for Groundhogs, 25 lbs.','An exciting mixture of quality fruits, nuts, vegetables, specialty seeds and grains.
Variety of ingredients with different shapes and sizes provide an enticing and stimulating eating experience for your groundhog.','33.79','Food', 'food1.png'),
    ('KAYTEE Timothy Complete Groundhog Food','A nutritionally fortified daily diet made with fiber-rich, sun-cured Timothy hay and other essential ingredients necessary for your groundhog. Timothy Hay aids the natural digestive process by providing a high quality source of fiber and because it''s lower in protein and calcium levels, also decreases the likelihood of health issues. Pelleted for easy feeding.','5.39','Food', 'food2.png'),
    ('KAYTEE Forti-Diet Pro Health','A nutritionally enhanced daily diet that provides the essential nutrients your groundhog needs for a long, healthy life.','3.99','Food', 'food3.png'),
    ('KAYTEE Forti-Diet Pro Health','Natural antioxidants support a healthy immune system. With probiotics & pre-biotics to aid in digestive health.','4.99','Food', 'food4.png'),
    ('Great Choice® Nutritious','This food combines quality grains, protein sources, and supplemental nutrients to help support growth and health.','6.99','Food', 'food5.png'),
    ('Top Paw Fashion Bomber Jacket','Give your little one a great look for fall and early winter with this Top Paw Sweater & Coat. This great looking garment is actually two garments as one, as the outer coat snaps on and off to reveal a comfy sweater underneath. Such great and versatile look for your furry friend.','34.99','Accessories', 'acc1.png'),
    ('Nylon Groundhog Leash','This Nylon Leash is the perfect leash for your rambunctious groundhog. Sturdy and reliable, your daily walks will be enjoyable for both you and your four-legged best friend.','9.49','Accessories', 'acc2.png'),
    ('DeShedding Brush','This handy tool reduces your groundhog''s loose hair from shedding up to 90% with regular use. No more groundhog hair in your house!','24.98','Accessories', 'acc3.png'),
    ('Pet Stroller/Folding Travel Carriage','This stroller is loaded! It features mesh windows for your pet to look out of while remaining in a calm and safe environment, soft bedding, multiple zippered entry points for you to gain access to your pet, a storage compartment to keep pet supplies and toys and even a cup holder for the human doing all the pushing!','89.95','Accessories', 'acc4.png'),
    ('Prince Bowl','This Prince Bowl looks great and is a sturdy, steady bowl at mealtime. This bowl features clean design on the outside, and a rubber bottom ring that keeps it in place while your groundhog is eating.','8.99','Accessories', 'acc5.png'),
    ('Herbs Balm','Groundhog herbs balm is 100% natural. It is applied to the groundhog''s outer fur, which makes it softer, shinier, and less likely to shed. ','24.98','CareProducts', 'care1.png'),
    ('Item Name40','for misc purposes','11.1','CareProducts', 'care2.png'),
	('Item Name41','for misc purposes','11.1','CareProducts', 'care3.png'),
    ('Item Name42','for misc purposes','11.1','CareProducts', 'care4.png'),
    ('Item Name43','for misc purposes','11.1','CareProducts', 'care5.png');
    
INSERT INTO GGG_Review(itemId,userName,reviewMessage,rating)
VALUES (1,'Keshab','This is a nice product!. Definitely use it!!',5),
(1,'James','I love this. It does what it is supposed to',4),
(1,'Keath','I''ve bought this kind several times. It works well for my groundhog. ',4),
(1,'Bella','I highly recommend to take a closer look, preferably in person. I did not like this.',2),
(1,'Liz','I do not recommend this product. Completely useless.',1),
(1,'Roma','I had to buy another one as soon as I tried it out for my pet. It is that great!',5),
(2,'George','Our groundhog is happy, we are happy! She loves the food!',5),
(2,'Maria','The groundhog seems to like it. This is what we usually get. Lasts ok.',4),
(2,'Sam','This is a quality product. ',5),
(2,'Tom',' Bought this product for my groundhog Bruce but he''ll only eat it if I wet it for him. An alright product but a little low on fiber...',2),
(2,'Rishi','Great price, hoggie loves it!',5),
(2,'Beth','It did not last long, I had to buy another one but it is great',5),
(3,'Kane','This is a nice product use it',5),
(3,'John','I love shopping here, my pet loves everything!',4),
(3,'Keith','Sadly this didn''t work for me. My groundhog is one of a kind, makes it super hard to shop for.',3),
(3,'Frank','Excellent product. Highly recommend!',3),
(3,'Paul','So so. I guess it just did not work for my groundhog, too picky.',3),
(3,'Isabel','They love this bag of amazingness. They get the nutrients they need while eat healthy and be happy. Will buy again, great brand to keep.',5)
;

INSERT INTO GGG_Workshop ( workshopName, workshopDescription, workshopDay, workshopTime)
VALUES ('Proper Introductions', 'You likely realize that first impressions count when meeting someone new. The same holds true for groundhogs. A botched introduction could lead to a cool relationship, or worse, between groundhogs. ', 'Monday', '6:00PM-8:00PM'),
		('Groundhog Confidence Building', 'Is your groundhog shy around people or environmental changes? In this class, we will learn to read our groundhog\s stress signals, teach our groundhog to go to their safe place to relax, establish successful introductions to new people and build their confidence. ', 'Wednesday', '6:00PM-8:00PM'),
        ('Your New Groundhog Cub', 'Did you just get a groundhog cub? This workshop is designed to give you a jump start on dealing with cub problems! Issues that will be addressed include: housebreaking, crate training, jumping, and social development.', 'Saturday', '1:00PM-4:00PM');

