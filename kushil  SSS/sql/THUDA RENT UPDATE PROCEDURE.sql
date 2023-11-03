SET SERVEROUTPUT ON;
CREATE or replace PROCEDURE rentpay
         (p_payment in number) 
          IS
            v_RENT_AMOUNT NUMBER(7);
             v_RENT_PENALTY NUMBER(7);
             V_date_1 date;
            V_PENALTY NUMBER(6);
        
          cursor RENT_PENALTY is
            select total_price,DATE_1 from  (select t.*,
       (select sum(t2.RENT_AMOUNT+nvl(t2.penalty,0))
        from thuda_1 t2
        where t2.DATE_1 <= t.DATE_1
       ) as total_price
from thuda_1 t)  where total_price >= p_payment;
             BEGIN
             OPEN RENT_PENALTY; 
             
             FETCH RENT_PENALTY INTO V_RENT_PENALTY,V_date_1; 
             
    
       DBMS_OUTPUT.PUT_LINE(p_payment||'  '||v_RENT_PENALTY||'   ' ||V_date_1);
    
       DBMS_OUTPUT.PUT_LINE('v_RENT_AMOUNT'||v_RENT_AMOUNT);
       UPDATE thuda_1 set  RENT_AMOUNT= 0 
        , PENALTY = 0 
        where  date_1<V_date_1 ;
                     
        UPDATE thuda_1 set  RENT_AMOUNT=case when V_RENT_PENALTY >=(PENALTY+p_payment)then (V_RENT_PENALTY-PENALTY-p_payment) else 0 end 
        , PENALTY = case when PENALTY >= (V_RENT_PENALTY-p_payment)then (V_RENT_PENALTY-p_payment)
        when PENALTY < (V_RENT_PENALTY-p_payment)then PENALTY 
        else 0 end
        where  date_1=V_date_1 ;
           END ;
-------------------------
 begin
         RENTPAY(2000);
         end;
		   
		   
		   
		   
		   
----------------------------------------DDL
CREATE table thuda_1(

DATE_1            DATE ,
RENT_AMOUNT       NUMBER(6) ,
PENALTY           NUMBER(4) )



---------------------------DML

insert into thuda values(TO_DATE('01-01-2023','dd-mm-yyyy'),1000,100);
insert into thuda values(TO_DATE('01-02-2023','dd-mm-yyyy'),1000,50);
insert into thuda(date_1,RENT_AMOUNT) values(TO_DATE('01-04-2023','dd-mm-yyyy'),1000);