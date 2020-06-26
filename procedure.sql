set serveroutput on

create or replace procedure findProducer ( X in PRODUCER_INFO.NAME%type, Y out number, Z out number) is
   producerID PRODUCER_INFO.PRODUCER_ID%type;
begin
   SELECT producer_id into producerID from producer_info where name = X;
   SELECT budget into Y from movie_info where producer_id=producerID;
   SELECT earned_money into Z from movie_info where producer_id=producerID;
end;


declare
   producerName PRODUCER_INFO.NAME%type;
   bdgtMny number(10);
   erndMny number(15);
begin
   producerName:='Spilburg';
   findProducer(producerName, bdgtMny, erndMny);
   dbms_output.put_line('movie Project is '||producerName || 'Budget Money' || bdgtMny || 'Earned Money'|| erndMny);
end;
/
   