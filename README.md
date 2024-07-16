# PostgreSQL DB 데이터 세팅관련 docker-compose 설정
### 부연 설명
> 매번 컨테이너를 생성하고 DB에 데이터를 세팅하는 반복 작업을 줄이고자
> docker-compose를 사용하여 컨테이너 실행 시 DB에 데이터를 세팅하는 설정을 만듦
### 🗒️파일 설명
- docker-compose.yml : 도커 컴포즈 파일(서비스 생성 및 실행)
- Dockerfile_ronfic_main : 도커파일(이미지 빌드)
- init.sh : PostgreSQL DB를 준비된 SQL문으로 초기화하기 위한 스크립트문
