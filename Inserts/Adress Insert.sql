DROP SEQUENCE address_add1;
CREATE SEQUENCE address_add1
    MINVALUE 0
    START WITH 1;
CREATE OR REPLACE TRIGGER address_id_add1_trigger
    BEFORE INSERT
    ON address
    FOR EACH ROW
BEGIN
    SELECT address_add1.nextval
    INTO :new.address_id
    FROM DUAL;
END;


INSERT INTO address (address_id, postCode, street, test_location, country) VALUES (0,13629,'Langestraße 24','Berlin','Germany');
INSERT INTO address (address_id, postCode, street, test_location, country) VALUES (0,91522,'New York Street 56','New York','USA');
INSERT INTO address (address_id, postCode, street, test_location, country) VALUES (0,90187,'Saas Street 31','Los Angeles','USA');
INSERT INTO address (address_id, postCode, street, test_location, country) VALUES (0,92364,'Old Town Road 42','Dublin','Ireland');

