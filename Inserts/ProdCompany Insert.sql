DROP SEQUENCE prodComp_add1;
CREATE SEQUENCE prodComp_add1
    MINVALUE 0
    START WITH 1;
CREATE OR REPLACE TRIGGER comp_id_add1_trigger
    BEFORE INSERT
    ON prodCompany
    FOR EACH ROW
BEGIN
    SELECT prodComp_add1.nextval
    INTO :new.comp_id
    FROM DUAL;
END;


INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (0, 'The Dalt Wisney Company', 2);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (0, 'Warner Sis.', 4);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (0, 'Parodont Pictures', 3);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (0, '21st Century Fox', 1);
