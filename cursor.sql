set serveroutput on
declare
     cursor pro is select name,producer_id from producer_info;
     proRecord pro%rowtype;
     cursor mov is select name, m_id from movie_info where producer_id=proRecord.producer_id;
     movReord mov%rowtype;
     cursor act is select id_act from act where m_id=movReord.m_id;
     actRecord act%rowtype;

begin
     open pro;
     loop
           fetch pro into proRecord;
           exit when pro%notfound;
           dbms_output.put_line(proRecord.name || ' : ');
     open mov;
     loop
          fetch mov into movRecord;
          exit when mov%notfound;
          dbms_output.put_line('  >' || movRecord.name); 
     open act;
     loop
                fetch act into actRecord;
                exit when act%notfound;
                dbms_output.put_line('  -' || actRecord.id_act);
      end loop;    
      close act;
    end loop;
    close mov;
end loop;
close pro;

end;
/