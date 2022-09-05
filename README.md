# CatchBug 물류관리 웹 개발 프로젝트

## 프로젝트를 위한 라이브러리 추가

파일 업로드

- https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload -->

제이슨 데이터 처리

- json-lib,jackson-databind

데이터베이스 접근,사용

- Srping-jdbc,commons dbcp, mybatis, mybatis-spring

Getter,Setter메소드 사용

- lombok

일대일 상담 채팅창 구현을 위한 소켓

- spring-websocket

결제모듈 사용을 위한 API

- jitpack

로그인 이메일인증 디펜던시

- java mail

## 각자 만들어온 프론트 내용 추가 하는 방법

1. 네비게이션 a태그 수정 적용 안된것들은 클릭해보시면 #해당내용으로 해놨습니다

   - [가맹점 네비게이션 수정](src/main/webapp/WEB-INF/views/mainInclude/sidebar_user.jsp)
   - [관리자 네비게이션 수정](src/main/webapp/WEB-INF/views/mainInclude/sidebar_master.jsp)

2. jsp파일 각 해당하는 폴더에 추가

- company :
  회사소개 (src/main/webapp/WEB-INF/views/company/)
- account :
  회원 관련 (src/main/webapp/WEB-INF/views/account/)
- board :
  게시판관련(src/main/webapp/WEB-INF/views/board/)
- factory :
  관리자관련(src/main/webapp/WEB-INF/views/factory/)
- franc :
  가맹점 관련(src/main/webapp/WEB-INF/views/franc/)
- mainInclude :
  정적 페이지 header,footer 관련(src/main/webapp/WEB-INF/views/mainInclude/)

## 각자 만드신 기능들은 나중에 dev 브랜치에 병합 하면 되서 일단 자기 브랜치에!.

### 설정

1. [web.xml]()에 인코딩 필터 추가
2. lombok 추가 롬복 안될시 메이븐 디펜던시에서 lombok.jar 경로 복사후 실행해서 직접 설치
3. 부트스트랩 assets 추가

### 경로

1. src/webapp/resource //정적 파일 경로(html,css,js,img)
2. src/webapp/WEB-INF/views/static // header,aside,footer
3. src/webapp/WEB-INF/views/component // content 영역

### 에러

1. [부트스트랩 assets의 js 파일들 x 표시 뜰 경우](https://needneo.tistory.com/108) : `src/main/webapp/resources/assets/vendor/**/*.js` 경로 추가하기

2. content 영역 만들때  
   `<%@ page contentType="text/html; charset=UTF-8" %>` 추가해주셔야 한글 안깨져요
