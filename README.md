# :iphone: Hworld

프로젝트 홈페이지  
http://ec2-15-164-221-8.ap-northeast-2.compute.amazonaws.com/

<br />

# 📃 프로젝트 정보

### 통신사 빌링 솔루션 및 휴대폰/악세서리 판매 플랫폼 
> 요금제/부가서비스에 관련된 서비스를 제공하고 월 별로 사용 요금을 청구

> 자체 쇼핑몰 구현해서 휴대폰 및 액세서리 구매

> 구매와 동시에 요금제 서비스 가입

### 1. 제작기간

> 2022.05.03 ~ 06.22

### 2. 참여 인원

> |                    Name                    |  Position   |
> | :----------------------------------------: | :---------: |
> |   [홍영우](https://github.com/YU3727)       | Back, Front |
> |   [홍석주](https://github.com/qwdfd1)       | Back, Front |
> |   [이진희](https://github.com/zinny912)     | Back, Front |
> |   [장하영](https://github.com/beaver10)     | Back, Front |   
> |   [김우희](https://github.com/WooheeKim)    | Back, Front |

### 3. 개발 내용
> 요금제 및 부가서비스 가입 서비스 구현

> 요금제 변경/해지 및 일시 정지 기능 구현

> 정기적으로 요금 계산 및 청구서 발급 기능 구현

> 휴대폰 및 액세서리 구매 서비스 구현

> 가입 유형 (신규 가입/기기 변경/번호 이동) 및 할인 유형(공시지원금/선택 약정) 별로 요금 다르게 책정하도록 구현

> 마이 페이지 (청구서 확인, 회원 정보 변경, 주문 내역, 문의 내역, 구매 후기, 회선 해지, 회원 탈퇴) 구현

> 고객지원 (공지사항, 1 : 1 문의, 자료실) 서비스 구현

> 관리자 페이지 (회원/회선 목록, 총 주문 목록, 상품 목록/리뷰, 상품/일반 문의 목록) 서비스 구현

### 4. 담당 업무

> 홍석주  : ERD 설계, 요금 계산(프로시저), 고객 지원

<br />

# 📚 사용 기술

### 1. Back-end

> Java
> Spring Boot
> Maven
> MyBatis  

### 2. Front-end

> Javascript
> JQuery
> BootStrap
> JSTL

<br />

# 📊 산출물

> ### [ERD](https://github.com/qwdfd1/Hworld/blob/master/document/%5BH%20world%5D%201%EC%A1%B0%20ERD.png)  
> ### [WBS](https://docs.google.com/spreadsheets/d/1xE4jRKLFEU27EqwXrsK8vfSPTPpoXk-l569Sb15y5Y4/edit?pli=1#gid=0)
> ### [테이블 정의서](https://docs.google.com/spreadsheets/d/15VTFBERtNjGcpZN2Rqf4JbR0gOryPjXt9aymFSTHnkQ/edit#gid=0)
> ### [기능](https://docs.google.com/spreadsheets/d/1xE4jRKLFEU27EqwXrsK8vfSPTPpoXk-l569Sb15y5Y4/edit?pli=1#gid=892840114)
> ### [요금 계산 공식](https://docs.google.com/spreadsheets/d/1xE4jRKLFEU27EqwXrsK8vfSPTPpoXk-l569Sb15y5Y4/edit?pli=1#gid=819264824)

<br />

# 🔑 핵심기능

### 1. 서비스 가입 유형 및 사용 요금제 별 요금 청구

> 사용자는 신규가입/기기변경/번호이동 유형 중 선택 가입.<br />
> 기기변경시 대표 회선의 약정 가입 경과 기간이 일정 기간 미만일 시 위약금/할인반환금 청구  

### 2. 대표 회선 설정 및 요금제 변경

> 기기 구매 및 모든 요금 관련 서비스를 이용하기위해선 해당 회선을 대표회선으로 설정 후 이용 가능
> 요금제 변경시에도 대표 회선의 약정 가입 경과 기간이 일정 기간 미만이어도 가격이 더 높은 요금제로 변경시에는 위약금 청구를 하지 않음



