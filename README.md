# :iphone: Hworld1

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

### 4. 역할 분담

> 홍석주  : : ERD 설계, 요금 계산(프로시저), 고객 지원

<br />

# 📚 사용 기술

### 1. Back-end

> python3  
> Django  
> Django-rest-framwork

### 2. Front-end

> React.js  
> Node.js

<br />

# 📊 ERD & Structure

<details>
<summary>ERD</summary>
<div markdown="1" style="padding-left: 15px;">
<img src="https://user-images.githubusercontent.com/68724828/186067947-f255f9a4-d92d-45cd-ab7c-419ec92943f8.png" width="800px"/>
</div>
</details>

<br />

<details>
<summary>Structure</summary>
<div markdown="1" style="padding-left: 15px;">
<img src="https://user-images.githubusercontent.com/68724828/186079270-28793ba1-466e-421f-baf2-563b890c926f.png" />
</div>
</details>

<br />

# 🔑 핵심기능

### 1. 여행장소 검색

> 사용자가 여행장소를 검색하면 DB에서 여행장소를 검색하고  
> DB에 없는 장소이면 네이버지도에서 검색하여 최상단의 장소의 정보를 가져오고 DB에 저장합니다.  
> [코드 보러가기](https://github.com/kimphysicsman/MyLittelTrip_backend/blob/5aa46e9ed2065045df17cc45baa41a9a2901b46b/recommend/functions/parsing.py#L64)

### 2. 최단 여행경로 찾기 & 여행일정 만들기

> 사용자가 입력한 여행장소들을 바탕으로 여행일정을 만듭니다.  
> [코드 보러가기](https://github.com/kimphysicsman/MyLittelTrip_backend/blob/5aa46e9ed2065045df17cc45baa41a9a2901b46b/recommend/functions/schedule.py#L14)

<br />

# 📕 기타 자료

### 1. 기획문서

> [MyLittleTrip - Notion](https://www.notion.so/kimphysicsman/MLT-My-Little-Trip-716433a2fc8940d9870bd83b63570646?v=0c42e849923d4449aade69046bf597d1)

### 2. 여행추천 알고리즘

> [Travel_recommedation - Github](https://github.com/kimphysicsman/Travel_recommedation)

### 3. 발표영상

<table>
  <tbody>
    <tr>
      <td>
        <p align="center"> 22.08.05 발표 </p>
        <a href="https://www.youtube.com/watch?v=6B0DSjvsqj0&t=1s" title="MyLittleTrip 중간발표">
          <img align="center" src="https://user-images.githubusercontent.com/68724828/186087151-e0f0ebed-08c1-4a99-9af0-a8c48c536205.png" width="300" >
        </a>
      </td>
      <td>
        <p align="center"> 22.08.16 발표 </p>
        <a href="https://youtu.be/9eoYpRqTZUU" title="MyLittleTrip 최종발표">
          <img align="center" src="https://user-images.githubusercontent.com/68724828/186087151-e0f0ebed-08c1-4a99-9af0-a8c48c536205.png" width="300" >
        </a>
      </td>
    </tr>
  </tbody>
</table>
