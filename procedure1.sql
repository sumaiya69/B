set serveroutput on

create or replace procedure findProducer ( X in PRODUCER_INFO.NAME%type,Z out number) is
    producerID PRODUCER_INFO.producer_id%type;
begin
    SELECT producer_id into producerID from producer_info where name = X;
    SELECT count (*) into Z from movie_info where producer_id = producerID;
end;
/
declare
    producerName PRODUCER_INFO.NAME%type;
    TotalMovie number;
begin
    producerName:='Spilburg';
    findProducer(producerName, TotalMovie);
    dbms_output.put_line('Total no. of ' || producerName|| 'Movies = ' || TotalMovie );
end;
/