/*function is used when we need it to return values. Eg. select query"
/*function with no arguments*/
CREATE OR REPLACE FUNCTION testfunction()
    RETURNS TABLE ("id" integer, "name" varchar, "details" varchar)
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT cs.id, cs.new_address, cs.new_company_name FROM company_shareholder cs;
end;
$$;

alter function testfunction() owner to postgres; --automatically generated  --- postgres db can only access


select id from testfunction()



/* function with arguments */
CREATE OR REPLACE FUNCTION testfunction2(idd integer)
    RETURNS TABLE ("id" integer, "name" varchar, "details" varchar)
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT cs.id, cs.new_address, cs.new_company_name
        FROM company_shareholder cs
        WHERE cs.id=idd;
end;
$$;

select id from testfunction2(33);


alter function testfunction2() owner to postgres; --automatically generated  --- postgres db can only access


/*procedure is used when we do need returned values E.g.delete,insert" */
---PROCUEDURES---
CREATE OR REPLACE PROCEDURE DELETE_CUSTOMERS (id integer)
    LANGUAGE plpgsql
AS 
$$
BEGIN
    delete from customers c where c.id = id;
END;
$$;

alter procedure delete_customers(integer) owner to postgres; --automatically generated  --- postgres db can only access

CALL DELETE_CUSTOMERS(2);
