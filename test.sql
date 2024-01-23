CREATE TABLE community_replies (
reply_no number(4),
user_no number(3),
reply_content varchar2(1000)  not null,
reply_deleted char(1) default 'N',
reply_create_date date default sysdate,
reply_updatd_date date default sysdate,
heart_number number(3),
danger_count number(4),
parents_reply_no number(4)

constraint reply_no_pk primary key (reply_no),
constraint user_no_FK foreign key(user_no)
                                (유저테이블에서 유저번호),
constraint heart_number_FK foreign key(heart_no)
                                ???
);

insert into community_replies(reply_no, user_no, reply_content)
values
(reply_seq.nextval, 1, 'ㅁㄴㅇㄻㄴㅇ');

GRANT CREATE ANY TABLE TO HTA;


create table community_replies_heart(
heart_no number(4),
user_no number(3),
reply_no number(4)

constraint
);

create sequence reply_seq
increment by 1
start with 1
minvalue 1
maxvalue 9999;



CREATE TABLE pick_me (
pick_no number(4),
user_no number(4),
join_content_no,

constraint pick_no_pk primary key (pick_no),
constraint user_no_fk foreign key(user_no)
                                (유저테이블에서 유저번호),
constraint join_content_no_fk foreign key(join_content_no)
                                (참여하기 글에서 글 번호)
);

create sequence pick_seq
increment by 1
start with 1
minvalue 1
maxvalue 9999;


CREATE TABLE big_address (
big_address_no number(2),
big_address_name varchar2(255) not null,

constraint big_address_no_pk primary key(big_address_no)
);

big_address_seq

INSERT INTO big_address (big_address_no, big_address_name)
VALUES (big_address_seq.nextval, '서울특별시');


CREATE TABLE small_address (
small_address_no number(3) as,
small_address_name varchar2(255) not null,

constraint address_no_pk primary key(address_no)
);






