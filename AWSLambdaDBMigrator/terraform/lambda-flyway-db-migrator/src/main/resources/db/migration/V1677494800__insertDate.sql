insert into products values( 1, 'Apple', 1000);
insert into products values( 2, 'Samsung', 800);
insert into products values( 3, 'Lenovo', 500);
insert into products values( 4, 'Oneplus', 800);
insert into products values( 5, 'Xiaomi', 300);
 
insert into orders
SELECT s, floor(random() * 5 + 1)::int ,
floor(random() * 10 + 1)::int ,
(timestamp '2019-09-20 10:00:00' +
random() * (timestamp '2019-09-22 20:00:00' - timestamp '2019-09-20 10:00:00'))::timestamp(0) without time zone
from generate_series(1,20) as s ;
commit;
