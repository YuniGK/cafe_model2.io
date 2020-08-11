/*
-- c_cafe Table Create SQL
CREATE TABLE c_cafe
(
    c_idx      INT, 
    c_name     VARCHAR2(100) NOT NULL, 
    c_addr     VARCHAR2(300) NOT NULL, 
    c_tel      VARCHAR2(100) NOT NULL, 
    c_price    VARCHAR2(100) NOT NULL, 
    c_park     VARCHAR2(100) NOT NULL, 
    c_time     VARCHAR2(100) NOT NULL, 
    c_hday     VARCHAR2(100) NOT NULL, 
    c_uri      VARCHAR2(100), 
    c_map      VARCHAR2(100) NOT NULL, 
    c_photo    VARCHAR2(100) NOT NULL, 
    c_menu1    VARCHAR2(100) NOT NULL, 
    c_menu2    VARCHAR2(100), 
    c_menu3    VARCHAR2(100), 
    c_menu4    VARCHAR2(100), 
    c_tag        VARCHAR2(100) NOT NULL, 
    CONSTRAINT C_CAFE_PK PRIMARY KEY (c_idx)
);

CREATE SEQUENCE c_cafe_seq;

-- c_cafe Table Create SQL
CREATE TABLE c_member
(
    m_idx        INT              , 
    m_id         VARCHAR2(100)    NOT NULL, 
    m_pwd        VARCHAR2(100)    NOT NULL, 
    m_name       VARCHAR2(100)    NOT NULL, 
    m_gender     VARCHAR2(100)    NOT NULL, 
    m_tel        VARCHAR2(100)    NOT NULL, 
    m_email      VARCHAR2(100)    NOT NULL, 
    m_photo      VARCHAR2(100)    , 
    m_grade      VARCHAR2(100)    NOT NULL, 
    m_ip         VARCHAR2(100)    NOT NULL, 
    m_regdate    DATE             , 
    CONSTRAINT C_MEMBER_PK PRIMARY KEY (m_idx)
);

CREATE SEQUENCE c_member_seq;

CREATE TABLE c_review
(
    r_idx        INT              , 
    r_cot        VARCHAR2(1000)    NOT NULL, 
    m_idx        INT               NOT NULL, 
    c_idx        INT               NOT NULL, 
    r_grade      INT               NOT NULL, 
    r_pwd        VARCHAR2(100)     NOT NULL, 
    r_ip         VARCHAR2(100)     NOT NULL, 
    r_regdate    DATE             , 
    CONSTRAINT C_REVIEW_PK PRIMARY KEY (r_idx)
);

CREATE SEQUENCE c_review_seq;

ALTER TABLE c_review
    ADD CONSTRAINT FK_cafe_c_idx FOREIGN KEY (c_idx)
        REFERENCES c_cafe (c_idx)
        on delete cascade;

ALTER TABLE c_review
    ADD CONSTRAINT FK_member_m_idx FOREIGN KEY (m_idx)
        REFERENCES c_member (m_idx)
        on delete cascade;

-- c_cafe Table Create SQL
CREATE TABLE c_hits
(
    s_idx    INT    , 
    s_num    INT    NOT NULL, 
    c_idx    INT    NOT NULL, 
    CONSTRAINT C_HITS_PK PRIMARY KEY (s_idx)
);

CREATE SEQUENCE c_hits_seq;

ALTER TABLE c_hits
    ADD CONSTRAINT FK_h_cafe_c_idx FOREIGN KEY (c_idx)
        REFERENCES c_cafe (c_idx)
        on delete cascade;
 
insert into c_member values(c_member_SEQ.nextval,'admins','admins','관리자','여성','010-111-1111','admin@gamil.com', 'no_file.jpg','관리자','127.0.0.1',sysdate);

delete from c_member where m_idx = 18;

select * from c_member;
select * from c_cafe;
select * from c_review;
select * from c_hits;
select * from detail_review_view;

-- 리뷰 + 회원 조인
create or replace view detail_review_view as
select m.m_idx m_idx, m.m_id m_id, m.m_pwd m_pwd, m.m_name m_name, m.m_gender m_gender, m.m_tel m_tel, m.m_email m_email, m.m_photo m_photo, m.m_grade m_grade, m.m_ip m_ip, m.m_regdate m_regdate, r.r_idx r_idx, r.r_cot r_cot, r.c_idx c_idx, r.r_grade r_grade, r.r_pwd r_pwd, r.r_regdate r_regdate
from c_review r left outer join c_member m on r.m_idx = m.m_idx
order by r.r_idx desc

-- 평점 평균
select r.r_cot r_cot,
(select avg(r_grade) from c_review where c_idx = 1) avg
from 
   (select * from c_review where c_idx=1) r
where rownum = 1

select *
from (select rownum c_idx,c_name,c_addr,c_tel,c_price,c_park,c_time,c_hday,c_uri,c_map,c_photo,c_menu1,c_menu2,c_menu3,c_menu4,c_tag  from c_cafe)
where rownum <20

select *
from c_cafe
where c_idx between 11 and 20

-- 평점 각 점수별 합계
select
	   nvl(avg(case r_grade when 1 then count(*) end), 0) bad,
	   nvl(avg(case r_grade when 2 then count(*) end), 0) notBad,
	   nvl(avg(case r_grade when 3 then count(*) end), 0) soso,
	   nvl(avg(case r_grade when 4 then count(*) end), 0) likes,
	   nvl(avg(case r_grade when 5 then count(*) end), 0) god
from c_review
where c_idx=10
group by r_grade

insert into c_cafe values(c_cafe_seq.nextval, '젠주', '28721 강원 강릉시 창해로14번길 16지번견소동', '033-651-4007', 4000, 
								'가능', '매일 08:00 - 24:00', '연중무휴', null, '37.772914,128.9446399', 
								'cafe1.jpg', '꼰빠냐,5300', '아메리카노,4200', null, null, 
								'루프탑,바다뷰');
								
insert into c_cafe values(c_cafe_seq.nextval, '바다정원', '24770 강원도 고성군 토성면 용촌리 75-36', '033-636-1096', 6000, 
								'가능', '매일 10:00 - 22:00', '연중무휴', 'http://www.seasidegarden.co.kr/', '38.230962,128.5798764', 
								'cafe2.jpg', '아메리카노,5000', '콜드부루 아메리카노,6000', null, null, 
								'루프탑,키즈존,원두막,테라스');
								
insert into c_cafe values(c_cafe_seq.nextval, '툇마루', '24770 강원도 강릉시 초당동 266-3', '033-922-7175', 4000, 
								'불가', '매일 11:00 - 21:00', '화요일 휴무', 'http://www.instagram.com/cafe_toenmaru', '37.7877828,128.9113856', 
								'cafe3.jpg', '아메리카노,3500', '툇마루커피,5500', null, null, 
								'젤라또,초당두부,흑임자');
								
insert into c_cafe values(c_cafe_seq.nextval, '테라로사 커피공장', '25623 강원도 강릉시 구정면 어단리 973-1', '033-648-2760', 6000, 
								'가능', '매일 09:00 - 21:00', '연중무휴', 'http://www.terarosa.com/', '37.6960542,128.8896992', 
								'cafe4.jpg', '아메리카노,4500', '카페라테,5000', null, null, 
								'핸드드립,테라스');	
																							
insert into c_cafe values(c_cafe_seq.nextval, '플리즈웨잇', '25053 강원도 양양군 현남면 인구리 636-5', '1577-8647', 8000, 
								'가능', '평일 11:00 - 22:00', '연중무휴', 'http://www.yyroad.co.kr', '37.9686013,128.7596703', 
								'cafe5.jpg', '아메리카노,4500', '아이스바라떼,7500', null, null, 
								'단체석,반려동물 동반,펍,야자수');	
								
insert into c_cafe values(c_cafe_seq.nextval, '나인블럭', '12768 경기도 광주시 중대동 160-2', '031-761-1295', 8000, 
								'가능', '평일 09:00 - 22:00', '연중무휴', 'http://www.9block.co.kr/', '37.4032755,127.2211737', 
								'cafe6.jpg', '아메리카노,7000', null, null, null, 
								'단체석');								
								
insert into c_cafe values(c_cafe_seq.nextval, '단궁', '11518 경기도 양주시 백석읍 기산리 182-2', '031-871-3700', 10000, 
								'가능', '평일 12:00 - 20:00', '연중무휴', 'http://www.dangung.com/', '37.7759844,126.9567382', 
								'cafe7.jpg', '아메리카노,10000', null, null, null, 
								'단체석');
								
insert into c_cafe values(c_cafe_seq.nextval, '포러데이 팔당', '12277 경기도 남양주시 와부읍 팔당리 774', '031-577-2505', 6000, 
								'가능', '매일 10:00 - 02:00', '연중무휴', null, '37.5563997,127.2341516', 
								'cafe8.jpg', '아메리카노,6000', null, null, null, 
								''단체석,반려동물 동반');								
								
insert into c_cafe values(c_cafe_seq.nextval, '더티트렁크', '10880 경기도 파주시 문발동 75-6', '031-871-3700', 6000, 
								'가능', '매일 09:00 - 22:00', '연중무휴', 'http://www.instagram.com/dirty_trunk_korea', '37.7275583,126.700827', 
								'cafe9.jpg', '아메리카노,4500', null, null, null, 
								'단체석');		
								
insert into c_cafe values(c_cafe_seq.nextval, '고당', '12282 경기도 남양주시 조안면 조안리 192-11', '031-576-8090', 10000, 
								'가능', '매일 11:00 - 22:00', '연중무휴', 'http://www.godangcnb.com', '37.5360706,127.3003635', 
								'cafe10.jpg', '에티오피아,9000', null, null, null, 
								'단체석,한옥');																					
													
insert into c_cafe values(c_cafe_seq.nextval, '이삼옥', '21393 인천광역시 부평구 부평동 211-179', '032-511-2359', 4000, 
								'불가', '매일 10:00 ~ 23:00', '매달 첫째주 화요일 휴무', 'https://www.instagram.com/23r.cafe/', '37.4943627,126.7226238', 
								'cafe11.jpg', '아메리카노,5000', '이삼옥 아인슈페너,4000', null, null, 
								'단체석');		
								
insert into c_cafe values(c_cafe_seq.nextval, '매화마름', '23049 인천광역시 강화군 길상면 초지리 428-1', '070-4193-4889', 6000, 
								'가능', '평일 10:00 ~ 19:00', '연중무휴', 'https://www.instagram.com/maehwamareum123/', '37.6362311,126.5175486', 
								'cafe12.jpg', '핸드드립류,5000', '전통차,6000', null, null, 
								'단체석,전통차');																										

insert into c_cafe values(c_cafe_seq.nextval, '뻘다방', '23123 인천광역시 옹진군 영흥면 선재리 148-2', '032-889-8300', 6000, 
								'가능', '매일 10:00 ~ 20:30', '매주 화요일 휴무', 'https://www.instagram.com/ppeoldabang', '37.234127,126.529162', 
								'cafe13.jpg', '아메리카노,6500', '모히또,15000', null, null, 
								'단체석,바다뷰');		
								
insert into c_cafe values(c_cafe_seq.nextval, '엄브로앤커피x레옹과마카롱', '22186 인천광역시 미추홀구 용현동 622-17', '010-8887-6223', 4000, 
								'가능', '매일 12:00 ~ 21:00', '매주 일요일 휴무', 'http://instagram.com/leon_and_macaron', '37.4513501,126.633087', 
								'cafe14.jpg', '아메리카노,3500', null, null, null, 
								'디저트');	
								
insert into c_cafe values(c_cafe_seq.nextval, '비랑', '22190 인천광역시 미추홀구 용현동 627-506', '032-887-3561', 4000, 
								'불가', '매일 10:00 ~ 22:00', '매달 첫째주 월요일 휴무', 'https://www.instagram.com/cafe_birang/', '37.4509778,126.6346871', 
								'cafe15.jpg', '아메리카노,4000', '카페라떼,5000', null, null, 
								'단체석');																																																																																																																																																																																																																																									
																						insert into c_cafe values
(c_cafe_seq.nextval, '5to7', '04768 서울 성동구 서울숲2길 44-13', '070-4127-7616', 10000, 
                        '불가', '매일 11:30 - 21:00', '매주 월,화', 'http://www.instagram.com/5to7__seongsuvintage', '36.6105628,131.1765599', 
                        'cafe16.jpg', '초코블랜딩,6000', '5to7슈페너,8000', null, null, 
                        '애견동반가능,단체석');   

insert into c_cafe values
(c_cafe_seq.nextval, '&other', '04768 서울 성동구 서울숲2길 40-10' , '070-8777-9724', 8000, 
                        '불가', '매일 10:30 - 23:00', '연중무휴',
 'https://cafenother.modoo.at', '37.5462542,127.0406077', 
                        'cafe17.jpg', '아메리카노,7000 ', '아이스앤드,7500', null, null, 
                        '행사대관,웨딩,돌잔치');   

insert into c_cafe values
(c_cafe_seq.nextval, '그린랩', '04768 서울 성동구 서울숲2길 18-11' , '02-499-5833', 6000, 
                        '불가', '매일 12:00 - 19:00', '매주 월,화',
 'https://www.instagram.com/greenlab_seoulforest/', '37.5469743,127.0385196', 
                        'cafe18.jpg', '자몽비니거,6000 ', '레몬애플비니거,6000', '패션후르츠비니거,6000', 
		null, '루프탑');   

insert into c_cafe values
(c_cafe_seq.nextval, '할아버지공장', '04781 서울 성동구 성수이로7가길 9' , '02-499-5833', 8000, 
                        '불가', '매일 12:00 - 19:00', '연중무휴',
 'https://www.instagram.com/grandpa.factory/', '37.5410878,127.0527159', 
                        'cafe19.jpg', '커피,5000 ', '파스타,19000', '지중해에이드,8000', 
		null, 'Dining');   

insert into c_cafe values
(c_cafe_seq.nextval, 'KANTO', '04781 서울 성동구 연무장길 20' , '010-8386-3657', 6000, 
                        '불가', '매일 11:00 ~ 21:00', '연중무휴',
 'http://instagram.com/kanto_cafe', '37.5434087,127.0493122', 
                        'cafe20.jpg', '블랙세트,17500', '블랙크림,6500', '블랙파운드,5000',  
		null, '지하'); 
		
insert into c_cafe values(c_cafe_seq.nextval, '모모스커피', '46311 부산광역시 금정구 부곡동 873-98', '051-512-7034', 5000, 
								'불가', '매일 10:00 - 21:30', '연중무휴', null, '35.2192686,129.0842482', 
								'cafe21.jpg', '오늘의 핸드드립 핫,5000', '에스프레소 핫,4800', null, null, 
								'한옥,월드 바리스타 챔피언쉽 우승자');
								
insert into c_cafe values(c_cafe_seq.nextval, '신기산업', 49084 부산광역시 영도구 청학동 148-203 ', '070-8230-1116', 6000, 
								'가능', '매일 11:00-23:00', '연중무휴', 'http://sinki.co.kr/', '35.0904646,129.0612129', 
								'cafe22.jpg', '신기라떼,7000', '카페라떼,6000', null, null, 
								'부산항대교,루프탑,부산항,테라스');
								
insert into c_cafe values(c_cafe_seq.nextval, '엣지993', '48098 부산광역시 해운대구 중동 993-3', '033-922-7175', 7000, 
								'가능', '매일 11:00~22:00', '연중무휴', 'http://edge993.co.kr/', '35.1564176,129.1730262', 
								'cafe23.jpg', '나나라떼,7500', '엣지 꼬레아노,7000', null, null, 
								'해운대,바닷가,펜션');
								
insert into c_cafe values(c_cafe_seq.nextval, '헤이든', '25623 부산 기장군 일광면 동백리 449', '051-727-4717', 6000, 
								'가능', '매일 10:30~22:00', '연중무휴', null, '35.2829065,129.2543218', 
								'cafe24.jpg', '아메리카노,5500', '헤이든말차커피,7500', null, null, 
								'소나무디자인로고,자연친화적');	
																							
insert into c_cafe values(c_cafe_seq.nextval, '웨이브온', '46037 부산 기장군 장안읍 해맞이로 286', '051-727-1660', 7000, 
								'가능', '평일 11:00 - 24:00', '연중무휴', 'http://www.waveoncoffee.com/', '35.3222464,129.2673818', 
								'cafe25.jpg', '카페 라떼,6000', '브루잉 커피,7000', null, null, 
								'오션뷰,파도,바다');	
																																																																			
																																																																																																																																																																																																		
insert into c_member values(c_member_SEQ.nextval,'test','test','김유나','남성','010-111-1111','test@gamil.com', 'no_file.jpg','일반','127.0.0.1',sysdate);
insert into c_member values(c_member_SEQ.nextval,'test1','test1','이바나나','여성','010-111-1111','test1@gamil.com', 'no_file.jpg','일반','127.0.0.1',sysdate);
insert into c_member values(c_member_SEQ.nextval,'test2','test2','박서기','남성','010-111-1111','test2@gamil.com', 'no_file.jpg','일반','127.0.0.1',sysdate);
insert into c_member values(c_member_SEQ.nextval,'test3','test3','곽보라','남성','010-111-1111','test@gamil.com', 'no_file.jpg','일반','127.0.0.1',sysdate);
insert into c_member values(c_member_SEQ.nextval,'test4','test4','신해일','여성','010-111-1111','test1@gamil.com', 'no_file.jpg','일반','127.0.0.1',sysdate);
insert into c_member values(c_member_SEQ.nextval,'test5','test5','유산슬','남성','010-111-1111','test2@gamil.com', 'no_file.jpg','일반','127.0.0.1',sysdate);

*/

/*
-- drop sequence c_hits_seq;

-- DROP VIEW detail_review_view

-- alter table c_review
   drop constraint FK_member_m_idx

-- 하나만 조회
select *
from (select *
from c_review
where c_idx = 10
order by r_regdate desc)
where rownum = 1

-- 리뷰 점수별
select r.*,
(select count(*) from c_review where c_idx = 10) sum,
(select count(*) from c_review where c_idx = 10 AND r_grade = 1) bad,
(select count(*) from c_review where c_idx = 10 AND r_grade = 2) notBad,
(select count(*) from c_review where c_idx = 10 AND r_grade = 3) soso,
(select count(*) from c_review where c_idx = 10 AND r_grade = 4) likes,
(select count(*) from c_review where c_idx = 10 AND r_grade = 5) god
from c_review r

-- 
select r_grade, count(*) count
from c_review
where c_idx=10
group by r_grade

select
	   case r_grade when 1 then count(*) end bad,
	   case r_grade when 2 then count(*) end notBad,
	   case r_grade when 3 then count(*) end soso,
	   case r_grade when 4 then count(*) end likes,
	   case r_grade when 5 then count(*) end god
from c_review
where c_idx=10

group by r_gradeselect
	   nvl(case r_grade when 1 then count(*) end, 0)) bad,
	   nvl(case r_grade when 2 then count(*) end, 0) notBad,
	   nvl(case r_grade when 3 then count(*) end, 0) soso,
	   nvl(case r_grade when 4 then count(*) end, 0) likes,
	   nvl(case r_grade when 5 then count(*) end, 0) god,
	   count(*)
from c_review
where c_idx=10
group by r_grade

//수정하기
select 
    r.*, 
   (bad+notBad+soso+likes+god) as total
from     
(
   select
         nvl(avg(case r_grade when 1 then count(*) end), 0) bad,
         nvl(avg(case r_grade when 2 then count(*) end), 0) notBad,
         nvl(avg(case r_grade when 3 then count(*) end), 0) soso,
         nvl(avg(case r_grade when 4 then count(*) end), 0) likes,
         nvl(avg(case r_grade when 5 then count(*) end), 0) god
   from c_review
   where c_idx=2
   group by r_grade
) r

select *
from (select rownum c_idx,c_name,c_addr,c_tel,c_price,c_park,c_time,c_hday,c_uri,c_map,c_photo,c_menu1,c_menu2,c_menu3,c_menu4,c_tag  from c_cafe)
where rownum <10

select * from c_cafe
where c_addr like '%서울%' 




select a.* from 
		(
		   select ROWNUM as RNUM, b.* 
		   from
		   ( 
		       select * from c_cafe
		               where c_addr like '%부산%' 
		       order by c_idx desc
		    ) b 
		) a
		where  a.RNUM  between 1 and  5



*/
