CREATE OR REPLACE PROCEDURE updateStafflist(_first_name VARCHAR, _last_name VARCHAR, _email VARCHAR, _address_id INTEGER, _store_id INTEGER, _username VARCHAR)
LANGUAGE plpgsql
AS $$
	BEGIN
		INSERT INTO staff (first_name, last_name, email, address_id, store_id, username)
		VALUES (_first_name, _last_name, _email, _address_id, _store_id, _username);		
	END
$$;

CALL updateStafflist('Dylan','Smith', 'dylanissmoothasbutter@codingtemple.com', 1, 8, 'DSsmooth');

CREATE OR REPLACE FUNCTION staff_per_store(_store_id INTEGER) RETURNS INTEGER
AS $$
BEGIN
	SELECT count(*) FROM staff WHERE store_id = _store_id;
END
$$ LANGUAGE plpgsql;
	