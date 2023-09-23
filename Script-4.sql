CREATE OR REPLACE FUNCTION adder(num1 INTEGER, num2 INTEGER) RETURNS INTEGER
LANGUAGE plpgsql AS $$
	BEGIN
		RETURN num1 + num2;
	END
$$;

SELECT adder(10, 11);
SELECT adder(100, 5);

SELECT (10,2);

CREATE OR REPLACE FUNCTION squared(num INTEGER) RETURNS INTEGER AS $$
BEGIN
	RETURN num * num;
END;
$$ LANGUAGE plpgsql

SELECT adder(10,11);
SELECT adder(100,5);

SELECT POWER(10,2);

CREATE OR REPLACE FUNCTION addLateFee(
	customer_id INTEGER,
	staff_id INTEGER,
	rental_id INTEGER, 
	fee NUMERIC(4,2)
) RETURNS INTEGER AS $$
	BEGIN
		INSERT INTO payment(
			customer_id,
			staff_id,
			rental_id,
			amount,
			payment_date
		)	VALUES (
			customer_id,
			staff_id,
			rental_id,
			fee,
			NOW()
		);
		RETURN customer_id;
	END
$$ LANGUAGE plpgsql;

SELECT * FROM rental
WHERE return_date IS NULL;

SELECT * FROM customer
WHERE customer_id = SELECT(addLateFee(22,1,12222,3));

SELECT * FROM payment
WHERE customer_id = 22;

CREATE OR REPLACE PROCEDURE updateReturnDate(
	rental_id INTEGER,
	customer_id INTEGER
	) LANGUAGE plpgsql AS $$
		BEGIN
			UPDATE rental
		SET return_date = NOW()
		WHERE rental_id = rental_id AND customer_id = customer_id;
		commit;
		END
	$$;

SELECT * FROM rental
WHERE rental_id = 12222;

CALL updateReturnDate(12222, 22);

CALL updateReturnDate(11496, 155);

SELECT * FROM customer;

CREATE PROCEDURE updateEmail(_customer_id INTEGER, _email VARCHAR)
AS $$
	BEGIN
		UPDATE customer
		SET email = _email
		WHERE customer_id = _customer_id;
		COMMIT; 
	END
$$ LANGUAGE plpgsql;

CALL updateEmail(1, 'marysmith@gmail.com');

CREATE PROCEDURE store(_store_id INTEGER, _address_id INTEGER, manager_staff_id INTEGER)
LANGUAGE plpgsql
AS $$
	BEGIN
		INSERT INTO store(store_id, manager_staff_id, address_id)
		VALUES (_store_id,_manager_staff_id,_address_id);
	END
$$;
	
CREATE PROCEDURE addActor(_first_name VARCHAR, _last_name VARCHAR)
LANGUAGE plpgsql AS $$
	BEGIN 
		INSERT INTO actor(first_name, last_name)
		VALUES (_first_name, _last_name);
	END
$$;

CALL addActor('Sean','Currie');

SELECT * FROM actor
WHERE first_name = 'Sean' AND last_name = 'Currie';

SELECT * FROM actor
WHERE first_name = 'Tom' AND last_name = 'Hardy';

CALL addActor('Tom','Hardy');



	
		