-- --------------------------------------------------------------------------
-- Datatypes - STRINGS
-- --------------------------------------------------------------------------
DROP    TABLE IF EXISTS StringA;
CREATE  TABLE StringA(
    c           CHAR(1),            -- Max is 255
    b           BINARY(1)           -- Max is 255, Just like CHAR but stores BINARY
);
INSERT INTO StringA VALUES ("A","A");
SELECT * FROM StringA;




DROP    TABLE IF EXISTS StringB;
CREATE  TABLE StringB(
    vc          VARCHAR(3000),      -- Max is 65536
    vb          VARBINARY(3000)     -- Max is 65536, Just like CHAR but stores BINARY
);
INSERT INTO StringB VALUES ("A","A");
SELECT * FROM StringB;




DROP    TABLE IF EXISTS BlobTypes;
CREATE  TABLE BlobTypes(
    b1          TINYBLOB,          -- Max is 255            bytes of data - Binary Large Objects 
    b2          BLOB(400),         -- Max is 65535          bytes of data     
    b3          MEDIUMBLOB,        -- Max is 16,777,215     bytes of data   
    b4          LONGBLOB           -- Max is 4,294,967,295  bytes of data  
);
INSERT INTO BlobTypes VALUES ("A","A","A","A");
SELECT * FROM BlobTypes;




DROP    TABLE IF EXISTS TextTypes;
CREATE  TABLE TextTypes(
    t1          TINYTEXT,          -- Max is 255            length of text
    t2          TEXT(400),         -- Max is 65535          length of text   
    t3          MEDIUMTEXT,        -- Max is 16,777,215     length of text
    t4          LONGTEXT           -- Max is 4,294,967,295  length of text
);
INSERT INTO TextTypes VALUES ("A","A","A","A");
SELECT * FROM TextTypes;




DROP    TABLE IF EXISTS EnumType;
CREATE  TABLE EnumType(
    e          ENUM('RED','GREEN','BLUE')          -- Select one from 65535 defined items
);
INSERT INTO EnumType VALUES ("RED");
INSERT INTO EnumType VALUES ("YELLOW");
INSERT INTO EnumType VALUES ("BLUE");
INSERT INTO EnumType VALUES ("BLUE");
INSERT INTO EnumType VALUES ("BLUE");
SELECT * FROM EnumType;
SELECT DISTINCT * FROM EnumType;
SELECT * FROM EnumType WHERE e = 'RED';




DROP    TABLE IF EXISTS SetType;
CREATE  TABLE SetType(
    s          SET('RED','GREEN','BLUE')          -- Select up to 64 items - IS CSV ??
);
INSERT INTO SetType VALUES ('RED');
INSERT INTO SetType VALUES ('RED,BLUE');
SELECT * FROM SetType;
SELECT * FROM SetType WHERE FIND_IN_SET( 'BLUE', s ) > 0;



-- --------------------------------------------------------------------------
-- Datatypes - Numeric
-- --------------------------------------------------------------------------
DROP    TABLE IF EXISTS BitType;
CREATE  TABLE BitType(
    bi           BIT,            -- Max is 64
    bo           BOOLEAN
);
INSERT INTO BitType VALUES (0,False);
INSERT INTO BitType VALUES (1,True);
SELECT * FROM BitType;
SELECT HEX(bi),bo FROM BitType;

SELECT ORD(bi),bo,
CASE
    WHEN bo =1 THEN "TRUE"
    WHEN bo<>1 THEN "FALSE"
    ELSE "UNDEFINED"
END AS B
FROM BitType;



-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
-- NEW COURCE
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------



CREATE  TABLE Tasks(
    ID              INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Days            BIT(7),
    Task            VARCHAR(200)
);
INSERT INTO Tasks VALUES (1,B'1100110','Buy soda');
INSERT INTO Tasks VALUES (2,B'0100111','Meeting with ...');
INSERT INTO Tasks VALUES (3,B'0101010','Go to GYM');
SELECT * FROM Tasks;
SELECT BIN(Days) FROM Tasks;
SELECT Task, REVERSE(EXPORT_SET(days,'1','0','',7)) FROM Tasks;
SELECT Task, REVERSE(EXPORT_SET(days,'*',' ',' ',7)) AS S_S_M_T_W_T_F FROM Tasks;



DROP    TABLE IF EXISTS IntTypes;
CREATE  TABLE IntTypes(
    i1          TINYINT,                -- -128,                    127
    i1u         TINYINT     UNSIGNED,   --  0,                      255
    i2          INTEGER,                -- -2147483648,             2147483647
    i2u         INTEGER     UNSIGNED,   --  0,                      4294967295
    i3          SMALLINT,               -- -32768,                  32767
    i3u         SMALLINT    UNSIGNED,   --  0,                      65535
    i4          MEDIUMINT,              -- -8388608,                8388607
    i4u         MEDIUMINT   UNSIGNED,   --  0,                      16777215
    i5          BIGINT,                 -- -9223372036854775808,    9223372036854775807
    i5u         BIGINT      UNSIGNED    --  0,                      18446744073709551615
);
-- INSERT INTO IntTypes VALUES ("A","A","A","A");
SELECT * FROM IntTypes;




DROP    TABLE IF EXISTS FloatType;
CREATE  TABLE FloatType(
    f1           FLOAT(7,5),            -- 4 bytes (32bit)
    f2           FLOAT(3),              -- 0 to 24 is float, 25 to 53 is double
    d1           DOUBLE(7,5),           -- 8 bytes (64bit)
                                        -- 7 digits, 5 decimal
                                        -- Not the same as DECIMAL
                                        -- Seems better not use it for financial data
    d2           DECIMAL(6,5)           -- Fixed point - 0.0001 to 99.9999
);

INSERT INTO FloatType VALUES (1,1,1,1);
INSERT INTO FloatType VALUES (2,2,2,2);
SELECT * FROM FloatType;
SELECT FORMAT(f1,3),FORMAT(f2,4) FROM FloatType;



-- --------------------------------------------------------------------------
-- UNSIGNED for FLOAT and DOUBLE
-- --------------------------------------------------------------------------
-- Starting from MySQL version 8.0.17, UNSIGNED is deprecated for the FLOAT a
-- nd DOUBLE data types. (https://blog.devart.com/mysql-data-types.html)



-- --------------------------------------------------------------------------
-- How to store phone number
-- --------------------------------------------------------------------------
-- For a phone number in MySQL, VARCHAR is more preferable to integers as som
-- etimes there may be special symbols or characters. In addition, VARCHAR si
-- mplifies validation. (https://blog.devart.com/mysql-data-types.html)



-- --------------------------------------------------------------------------
-- CHAR vs VARCHAR
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
-- TEXT vs VARCHAR
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
-- WHEN TO USE FLOAT, DOUBLE OR DECIMAL
-- --------------------------------------------------------------------------
-- To sum up, decimals are better to use for fixed amounts, such as monetary 
-- and financial information (price, salary, etc,), while float and double – 
-- for approximate calculations where rounding values might have a negative i
-- mpact. (https://blog.devart.com/mysql-data-types.html)