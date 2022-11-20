create table Chars
(chr CHAR(3) NOT NULL,
primary key (chr));

begin transaction;

insert into Chars VALUES ('1');
insert into Chars VALUES ('2');
insert into Chars VALUES ('3');
insert into Chars VALUES ('10');
insert into Chars VALUES ('11');
insert into Chars VALUES ('222');

commit;

select chr
from Chars
where chr > '2';