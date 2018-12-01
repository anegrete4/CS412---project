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
    imagePath VARCHAR(500) DEFAULT 'NoImage.jpg',
    itemType VARCHAR(20) DEFAULT 'Food'
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
		SELECT itemId, itemName, itemDescription,itemPrice,imagePath
		FROM GGG_SalesItem 
        WHERE itemId=itemIdin LIMIT 1;
END $$

CREATE PROCEDURE SP_GetInventory(
	IN IsFoodChecked BIGINT,
    IN IsAccessoriesChecked BIGINT,
    IN IsCareProducts BIGINT
)
BEGIN
        SELECT itemId, itemName, itemDescription,itemPrice,imagePath
		FROM GGG_SalesItem 
		WHERE (itemType='Food' AND IsFoodChecked=true) OR (itemType='Accessories' AND IsAccessoriesChecked=true)OR(itemType='CareProducts' AND IsCareProducts=true);
END $$



DELIMITER ;
##############################################################################################################################################
#########################################################       Dummy Data         ###########################################################
##############################################################################################################################################
INSERT INTO GGG_FAQ(question,answer,votes)
VALUES
	('Can I take my groundhog for a walk when it is snowing?','Sure you can, but make sure your groundhog is wearing one of the jacket like productId=3',10),
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
INSERT INTO GGG_SalesItem(itemName, itemDescription,itemPrice,itemType)
VALUES
	('Item Name1','for misc purposes','12.2','Food'),
    ('Item Name2','for misc purposes','12.2','Food'),
    ('Item Name3','for misc purposes','12.2','Food'),
    ('Item Name4','for misc purposes','12.2','Food'),
    ('Item Name5','for misc purposes','12.2','Food'),
    ('Item Name6','for misc purposes','12.2','Food'),
    ('Item Name7','for misc purposes','12.2','Food'),
    ('Item Name8','for misc purposes','12.2','Food'),
    ('Item Name9','for misc purposes','12.2','Food'),
    ('Item Name10','for misc purposes','12.2','Food'),
	('Item Name11','for misc purposes','12.2','Food'),
    ('Item Name12','for misc purposes','12.2','Food'),
    ('Item Name13','for misc purposes','12.2','Food'),
    ('Item Name14','for misc purposes','12.2','Food'),
    ('Item Name15','for misc purposes','13.2','Accessories'),
    ('Item Name16','for misc purposes','13.2','Accessories'),
    ('Item Name17','for misc purposes','13.2','Accessories'),
    ('Item Name18','for misc purposes','13.2','Accessories'),
    ('Item Name19','for misc purposes','13.2','Accessories'),
    ('Item Name20','for misc purposes','13.2','Accessories'),
	('Item Name21','for misc purposes','13.2','Accessories'),
    ('Item Name22','for misc purposes','13.2','Accessories'),
    ('Item Name23','for misc purposes','13.2','Accessories'),
    ('Item Name24','for misc purposes','13.2','Accessories'),
    ('Item Name25','for misc purposes','13.2','Accessories'),
    ('Item Name26','for misc purposes','13.2','Accessories'),
    ('Item Name27','for misc purposes','13.2','Accessories'),
    ('Item Name28','for misc purposes','13.2','Accessories'),
    ('Item Name29','for misc purposes','13.2','Accessories'),
    ('Item Name30','for misc purposes','13.2','Accessories'),
	('Item Name31','for misc purposes','13.2','Accessories'),
    ('Item Name32','for misc purposes','13.2','Accessories'),
    ('Item Name33','for misc purposes','13.2','Accessories'),
    ('Item Name34','for misc purposes','13.2','Accessories'),
    ('Item Name35','for misc purposes','13.2','Accessories'),
    ('Item Name36','for misc purposes','13.2','Accessories'),
    ('Item Name37','for misc purposes','13.2','Accessories'),
    ('Item Name38','for misc purposes','13.2','Accessories'),
    ('Item Name39','for misc purposes','11.1','CareProducts'),
    ('Item Name40','for misc purposes','11.1','CareProducts'),
	('Item Name41','for misc purposes','11.1','CareProducts'),
    ('Item Name42','for misc purposes','11.1','CareProducts'),
    ('Item Name43','for misc purposes','11.1','CareProducts'),
    ('Item Name44','for misc purposes','11.1','CareProducts'),
    ('Item Name45','for misc purposes','11.1','CareProducts'),
    ('Item Name46','for misc purposes','11.1','CareProducts'),
    ('Item Name47','for misc purposes','11.1','CareProducts'),
    ('Item Name48','for misc purposes','11.1','CareProducts'),
    ('Item Name49','for misc purposes','11.1','CareProducts'),
    ('Item Name50','for misc purposes','12.2','Food');
    
INSERT INTO GGG_Workshop ( workshopName, workshopDescription, workshopDay, workshopTime)
VALUES ('Groundhogs Grooming Session', 'We help visitors to train on doasdjflkajslkfjk asjfkjaskjf', 'Monday', '6:00PM-8:00PM'),
		('Groundhogs Blooming Session', 'We help visitors to train on doasdjflkajslkfjk asjfkjaskjf', 'Wednesday', '6:00PM-8:00PM'),
        ('Groundhogs Lomming Session', 'We help visitors to train on doasdjflkajslkfjk asjfkjaskjf', 'Thursday', '6:00PM-8:00PM');

