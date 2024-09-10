# PostgreSQL DB 데이터 세팅관련 docker-compose 설정
### 부연 설명
> 매번 컨테이너를 생성하고 DB에 데이터를 세팅하는 반복 작업을 줄이고자
> docker-compose를 사용하여 컨테이너 실행 시 DB에 데이터를 세팅하는 설정
### 🗒️파일 설명
- docker-compose.yml : 도커 컴포즈 파일(서비스 생성 및 실행)
- Dockerfile_ronfic_main : 도커파일(이미지 빌드)
- init.sh : PostgreSQL DB를 준비된 SQL문으로 초기화하기 위한 스크립트문

### 🗒️기타 설명
- restore.sql이라는 복원 sql문은 용량이 커서 따로 관리
- PostgrSQL 도커 컨테이너 최초 실행 시 /docker-entrypoint-initdb.d 경로에 있는 SQL문을 자동으로 실행시켜 초기 DB 설정을 할 수 있음
  - 주의해야할 점
    - sql문 실행 순서를 정해야함(정하지 않으면 다른 테이블이 없어서 에러가 나고 실행이 중지됨)
      - 순서는 파일명으로 정해야함 ex)01_restore.sql, 02_create_ddl.sql ...
    - sql문의 파일 형식이 일반 텍스트 형식인 Plain이거나 쉘(.sh) 스크립트이어야만 가능(그 외는 실행이 안됨)
- 지원하지 않는 형식으로 복원을 진행할 경우 init.sh처럼 커스텀 스크립트를 만들어서 복원을 진행해야 함

## 🖥️docker-compose 명령어
- docker-compose up -d : 백그라운드에서 도커 컴포즈 실행 > 이미지 빌드 후 도커 컨테이너 실행
- docker-compose down -v : Docker Compose를 사용하여 관리되는 컨테이너, 네트워크, 볼륨 및 기타 관련 설정을 종료하고 제거
- docker-compose up --build : docker-compose up 실행 시 Docker 이미지를 빌드, 만약 이미지가 존재하고 Dockerfile 또는 이미지 빌드에 필요한 파일에 변경이 있을 경우, 새로운 이미지를 빌드하여 이를 기반으로 컨테이너를 실행
