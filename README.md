# CatchBug 물류관리 웹 개발 프로젝트

## 메인 브랜치에 푸쉬하시면 안돼여!!!!!!!!!!!!!!!!!

### 설정

1. [web.xml]()에 인코딩 필터 추가
2. lombok 추가 롬복 안될시 메이븐 디펜던시에서 lombok.jar 경로 복사후 실행해서 직접 설치
3. 부트스트랩 assets 추가
ㄴ

### 경로

1. src/webapp/resource //정적 파일 경로(html,css,js,img)
2. src/webapp/WEB-INF/views/static // header,aside,footer
3. src/webapp/WEB-INF/views/component // content 영역
#### content 영역 만들때   
`<%@ page contentType="text/html; charset=UTF-8" %>` 추가해주셔야 한글 안깨져요

