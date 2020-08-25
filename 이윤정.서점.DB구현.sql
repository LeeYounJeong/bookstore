-- c:\DEV> sqlplus -s system/oracle < 이윤정.서점.DB구현.sql

drop user leeyounjeong cascade;

create user leeyounjeong IDENTIFIED BY leeyounjeong default tablespace users;
grant connect, resource TO leeyounjeong;

CREATE TABLE leeyounjeong.USERS(
   USER_ID VARCHAR2(50) PRIMARY KEY,
   USER_NAME VARCHAR2(50) NOT NULL,
   USER_PWD VARCHAR2(50) NOT NULL,
   PHONE_NUM VARCHAR2(50) NOT NULL,
   ADDRESS VARCHAR2(100) NOT NULL,
   REG_DATE date default sysdate
);

CREATE TABLE leeyounjeong.BOOKS(
    ISBN NUMBER PRIMARY KEY,
    BOOK_TITLE VARCHAR2(100),
    BOOK_PRICE NUMBER,
    AUTHOR VARCHAR2(50),
    PUB_NAME VARCHAR2(50),
    PUB_DATE VARCHAR2(50),
    BOOK_TYPE VARCHAR2(20),
    BOOK_INFO VARCHAR2(1000)
);   

CREATE TABLE leeyounjeong.QAS (
   QA_NUM NUMBER PRIMARY KEY,
   QA_TITLE VARCHAR2(50) NOT NULL,
   QA_CONTENT VARCHAR2(1000) NOT NULL,
   QA_DATE DATE default sysdate,
   QA_ANSWER VARCHAR2(1000),
   USER_ID VARCHAR2(50), CONSTRAINT QAS_USERS_FK FOREIGN KEY(USER_ID) REFERENCES leeyounjeong.USERS(USER_ID) ON DELETE CASCADE
);
     
create sequence leeyounjeong.qanum_seq
    increment by 1
    start with 1
    minvalue 1
    maxvalue 1000
    cycle
    nocache;


CREATE TABLE leeyounjeong.DELIVERIES(
    DELIVERY_NUM VARCHAR2(50) PRIMARY KEY
);
 

CREATE TABLE leeyounjeong.ORDERS(
    ORDER_NUM VARCHAR2(50) PRIMARY KEY,
    ORDER_PAY VARCHAR2(50),
    ORDER_DATE DATE default sysdate,
    ORDER_REQ VARCHAR2(100),
    ORDER_CNT NUMBER NOT NULL,
    USER_ID VARCHAR2(50), CONSTRAINT ORDERS_USERS_FK FOREIGN KEY(USER_ID) REFERENCES leeyounjeong.USERS(USER_ID) ON DELETE CASCADE,
    ISBN NUMBER, CONSTRAINT ORDERS_BOOKS_FK FOREIGN KEY(ISBN) REFERENCES leeyounjeong.BOOKS(ISBN) ON DELETE SET NULL,
    DELIVERY_NUM VARCHAR2(50), CONSTRAINT ORDERS_DELIVERIES_FK FOREIGN KEY(DELIVERY_NUM) REFERENCES leeyounjeong.DELIVERIES(DELIVERY_NUM) ON DELETE CASCADE
);
   
CREATE TABLE leeyounjeong.BOOK_IMGS(
    ISBN NUMBER PRIMARY KEY, CONSTRAINT BOOK_IMGS_BOOKS_FK FOREIGN KEY(ISBN) REFERENCES leeyounjeong.BOOKS(ISBN) ON DELETE CASCADE,
    BOOK_IMG_NAME VARCHAR2(50)
);


--USER TABLE
select*from leeyounjeong.users;

INSERT INTO leeyounjeong.users VALUES(
   'user',   
   '최한석',
   'user',
   '010-4563-6321',
   '서울시 영등포구',
   sysdate
);

INSERT INTO leeyounjeong.users VALUES(
   'park2',
   '박정진',
   'park2',
   '010-4230-2354',
   '서울시 강남구',
   sysdate
);


INSERT INTO leeyounjeong.users VALUES(
   'ccc1002',
   '임은영',
   '10003',
   '010-4932-6934',
   '서울시 서초구',
   sysdate
);


INSERT INTO leeyounjeong.users VALUES(
   'ddd1003',   
   '신대범',   
   '10004',
   '010-5493-4576',
   '서울시 강서구',
   sysdate
);


INSERT INTO leeyounjeong.users VALUES(
   'eee1004',   
   '오나나',
   '10005',
   '010-9684-4823',
   '서울시 강동구',
   sysdate
);

INSERT INTO leeyounjeong.users VALUES(
   'admin',   
   '관리자',
   'admin',
   '010-9684-4823',
   '인천시 부평구',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'shin',   
   '신대밤',
   '123',
   '010-8742-9634',
   '서울시 강서구',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'qwer',   
   '김지연',
   'qwer',
   '010-7954-7962',
   '부산광역시 동구',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'asdf',   
   '이가연',
   'asdf',
   '010-1525-7156',
   '서울시 강동구',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'zxcv',   
   '이시윤',
   'zxcv',
   '010-7415-3495',
   '인천광역시 남동구',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'pouij',   
   '오나진',
   'pouij',
   '010-9642-8416',
   '경기도 성남시',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'mlpo',   
   '김유나',
   'mlpo',
   '010-9314-7521',
   '경기도 일산',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'rtyu1003',   
   '최근석',
   'rtyu1003',
   '010-2466-6245',
   '경기도 수원시',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'ubgd1524',   
   '최유리',
   'ubgd1524',
   '010-9344-2574',
   '강원도 강릉시',
   sysdate
);
INSERT INTO leeyounjeong.users VALUES(
   'dfgdf89',   
   '이윤정',
   'dfgdf89',
   '010-3158-3489',
   '인천광역시 남동구',
   sysdate
);

--QAS TABLE
select*from leeyounjeong.qas;

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '신작 언제들어오나용?', '새로 나오는 신작 언제 입고되는 지 궁금해요!!!!!!!! 알려주세욧!!!!', '2020-04-15' , '답변대기', 'user'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '배송 언제올까요?ㅠㅠ', '어제 입금했는데 빨리 받아보고 싶어요....','2020-04-15', '답변대기', 'park2'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '저자명 알고싶어요ㅎㅎ', '이번에 어둠의 눈 구입했는데요 이거 저자명 좀 알려주세용^^', '2020-04-14','답변대기','ccc1002'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '오프라인매장 없나요?', '온라인말고 오프라인 매장을 없을까요?', '2020-04-14', '답변대기', 'ddd1003'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '결제문의하고싶어요', '어제 카드결제했는데 카드사엔 결제내역이 없더라구요.. 제대로 결제된 것 맞나요?', '2020-04-13' ,'답변대기', 'eee1004'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '비밀번호 어케바꿔요?', '비밀번호 어케바꿔요?', '2020-04-13' ,'답변대기', 'shin'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '회원탈퇴시켜주세요.', '회원탈퇴시켜주세요.', '2020-04-13' , '답변대기','qwer'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '배송조회 어케해여', '배송조회 어케해여', '2020-04-13' ,'답변대기', 'qwer'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '배송 빨리좀..', '배송 빨리좀..', '2020-04-13' , '답변대기','asdf'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '관리자 누구에여?', '관리자 누구에여?', '2020-04-13' , '답변대기', 'user'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '펭수', '펭수 책 언제들어와여?', '2020-04-13' , '답변대기','ddd1003'
);

insert into leeyounjeong.qas
values(leeyounjeong.qanum_seq.nextval, '비번수정어디서해여?', '비번수정어디서해여?', '2020-04-13' ,'답변대기',  'eee1004'
);

--BOOKS TABLE
select*from leeyounjeong.books;

INSERT INTO leeyounjeong.books VALUES(
   9791165074064,
   'JDK2.3웹프로그래밍 초급부터 중급까지',
   27000,
   '최한석',
   '쌍용출판사',
   '2020-04-23',
   '국내도서',
   'JSP 초보자를 위한 웹 개발 기초 및 JSP 2.3/서블릿 3.1/표현 언어 3.0에 추가된 내용 설명 뿐 아니라 JDBC를 이용한 DB연동'
);

INSERT INTO leeyounjeong.books VALUES(
   9788937462672,
   '설민석의 조선왕조실록',
   19800,
   '설민석',
   '세계사',
   '2016-07-20',
   '국내도서',
   '대한민국 스타강사의 한 번쯤 꼭 들어보고 싶은 인문 역사 강의 27명 조선의 리더들을 설민석표 강연으로 풀어낸 지식 콘서트'
);

INSERT INTO leeyounjeong.books VALUES(
   9791190382175,
   '축구를 하며 생각한 것들',
   16200,
   '손흥민',
   '브레인스토어',
   '2019-07-12',
   '국내도서',
   '“YOU KNOW WHAT? I’M GONNA WIN!” 꿈 많은 춘천의 축구 소년에서 오늘의 손세이셔널이 되기까지 거침없이 질주해 온 손흥민이 처음 돌아본 자신의 이야기 『축구를 하며 생각한 것들』'
);

INSERT INTO leeyounjeong.books VALUES(
   9791163031500,
   '신의 방정식',
   15000,
   '데이비드 스팁',
   '동아엠앤비',
   '2020-03-30',
   '국내도서',
   '『신의 방정식 오일러 공식』은 수학 공식의 중요성을 알리는 데 앞장서고 있는 전 세계 수학자들이 모여 오일러 공식을 선정하고 직접 집필한 기획 도서이다.'
);

INSERT INTO leeyounjeong.books VALUES(
   9791163031501,
   '혼자 공부하는 자바',
   21600,
   '신용권',
   '한빛미디어',
   '2019-06-10',
   '국내도서',
   '이 책은 독학으로 자바를 배우는 입문자가 ‘꼭 필요한 내용을 제대로’ 학습할 수 있도록 구성했다.'
);

INSERT INTO leeyounjeong.books VALUES(
   9791163031502,
   '일의 기쁨과 슬픔',
   14000,
   '장류진',
   '창비',
   '2019-10-25',
   '국내도서',
   '여기 실린 8편의 소설은 주로 이삼십대 젊은 직장인들의 이야기를 다룬다.일상의 무게에 힘겨워하는 청년들의 아픔을 세심하게 그려내는 동시에 그럼에도 불구하고 끝내 반짝이는 우리 삶의 소중한 순간들을 아름답게 담아낸다.'
);

INSERT INTO leeyounjeong.books VALUES(
   9791243776554,
   'The Body',
   17500,
   '빌 브라이슨',
   'Doubleday',
   '2019-10-15',
   '해외도서',
   '영국 「선데이 타임스」 올해의 과학책, 미국 「워싱턴 포스트」 올해의 논픽션! 『거의 모든 것의 역사』 빌 브라이슨이 안내하는 몸에 대한 거의 모든 이야기.'
);

INSERT INTO leeyounjeong.books VALUES(
   9791162223321,
   '공부머리 독서법',
   14850,
   '최승필',
   '책구루',
   '2018-05-17',
   '국내도서',
   '12년 동안 아이들과 함께 독서 논술 수업을 하면서 축적한 노하우를 집약한 독서교육 지침서. 가정에서 실현 가능한 독서법만을 모아 실제 사례와 데이터를 바탕으로 직접 효과를 본 내용들을 알차게 채웠다.'
);

INSERT INTO leeyounjeong.books VALUES(
   9759254821467,
   'Sapiens',
   9900,
   '유발 하라리',
   'Vintage Books',
   '2015-04-30',
   '해외도서',
   '인간의 역사와 미래에 대한 가장 논쟁적이고 대담한 대서사 . 문명의 배를 타고 진화의 바다를 항해한 인류는 이제 어디로 나아갈 것인가!'
);

INSERT INTO leeyounjeong.books VALUES(
   9784521512348,
   '언어의 온도',
   12420,
   '이기주',
   '말글터',
   '2016-08-19',
   '국내도서',
   '말과 글에는 나름의 온도가 있다. 따뜻함과 차가움의 정도가 저마다 다르다. 적당히 온기 있는 언어는 슬픔을 감싸 안아준다. 세상살이에 지칠 때 어떤 이는 친구와 이야기를 주고받으며 고민을 털어내고, 어떤 이는 책을 읽으며 작가가 건네는 문장에서 위안을 얻는다.'
);

--BOOK_IMGS TABLE
select*from leeyounjeong.book_imgs;

INSERT INTO leeyounjeong.book_imgs VALUES(
   9791165074064,
   '1.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9788937462672,
   '2.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9791190382175,
   '3.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9791163031500,
   '5.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9791163031501,
   '6.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9791163031502,
   '7.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9791243776554,
   '8.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9791162223321,
   '9.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9759254821467,
   '11.png'
);

INSERT INTO leeyounjeong.book_imgs VALUES(
   9784521512348,
   '12.png'
);

commit;