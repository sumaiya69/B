set serveroutput on
create or replace trigger find_info before insert or update of m_id on movie_info
for each row

declare
   erndMny number(30);
   bdgtMny number(30);
begin
   bdgtMny:= floor(:new.m_id*100000);
   :new.budget:= concat('Over Budget',bdgtMny);
   erndMny:= floor(:new.m_id*1000000);
   :new.earned_money:=erndMny;
end;
/
insert into movie_info(m_id,name,movie_type,producer_id,budget,earned_money) values(
    11,
    'The Jungle Book',
    'Thriller',
    '4',
     120000,
     2120100);