set serveroutput on
declare
f utl_file.file_type;
line varchar(1000);
producer_id producer_info.producer_id%type;
name producer_info.name%type;
age producer_info.salary%type;
gender producer_info.gender%type;
begin
f := utl_file.fopen('MY','new.csv','R');
if utl_file.is_open(f) then
utl_file.get_line(f,line,1000);
loop begin
utl_file.get_line(f,line,1000);
if line is null then exit;
end if;
producer_id:=  regexp_substr(line,'[^,]+',1,1) ;
name:= regexp_substr(line,'[^,]+',1,2) ;
age:= regexp_substr(line,'[^,]+',1,3) ;
gender:= regexp_substr(line,'[^,]+',1,4) ;
insert into producer_info values(producer_id,name,age,gender);
commit;
exception
when no_data_found then exit;
end;
end loop;
end if;
utl_file.fclose(f);
end;
/

