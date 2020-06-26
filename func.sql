CREATE OR REPLACE FUNCTION totalMovie
RETURN number IS
   total1 number(5) := 0;
BEGIN
   SELECT count(*) into total1
   FROM movie_info;
   RETURN total1;
END;
/

CREATE OR REPLACE FUNCTION totalActors
RETURN number IS
   total2 number(5) := 0;
BEGIN
   SELECT count(*) into total2
   FROM actor_info;
   RETURN total2;
END;
/


CREATE OR REPLACE FUNCTION totalMoviesAndActors
RETURN number IS
   total number(5) := 0;
BEGIN
   total := totalMovie()+totalActors();
   RETURN total;
END;


DECLARE
   t number(5);
BEGIN
   t := totalMoviesAndActors();
   dbms_output.put_line('Total No. Of Movies & Actors :' || t);
END;
/

