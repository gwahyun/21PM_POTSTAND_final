<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
        
<section>
	<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					상품 등록
				</div>
			</div>
		</div>
		<form action="${path }/admin/productInsertEnd" method="get" enctype="multipart/form-data" onsubmit="return categoryCheck();">
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					카테고리
				</div>
				<div class="align-row choice-genre-area">
					<div class="choice-genre top-genre">
						<ul>
							<li>여행/지도</li>
							<li>경제/경영</li>
							<li>컴퓨터/IT</li>
							<li>만화</li>
							<li>소설</li>
							<li>시/에세이</li>
							<li>예술/대중문화</li>
							<li>잡지</li>
						</ul>
					</div>
					<div class="choice-genre child-genre">
						<ul>
						</ul>
					</div>
					<div class="choice-genre g-child-genre">
						<ul>
						</ul>
					</div>
				</div>
				<div class="show_genre">
					<span class="show_genre1"></span>
					<span class="show_genre2"></span>
					<span class="show_genre3"></span>
				</div>
				
				<script>
					function categoryCheck(){
						if($(".show_genre1").html().length ==0){
							alert("카테고리 선택해 주세요");
							return false;
						}
					}
				</script>
			</div>
			<input type="hidden" name="bookGenre" class="input_genre">
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					책 제목
				</div>
				<div class="admin-input_text">
				<input type="text" name="bookTitle" required="">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					저자
				</div>
				<div class="admin-input_text">
				<input type="text" name="bookWriter">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					출판사
				</div>
				<div class="admin-input_text">
				<input type="text" name="bookPub" required="">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content ">
				<div class="admin-content_title">
					판매가
				</div>
				<div class="content_price">
					<input type="number" placeholder="숫자만 입력" name="bookCost">
					<span>원</span>
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					리스트에 보여질 소개(short)
				</div>
				<div class="admin-input_text">
				<input type="text" name="bookShort">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content ">
				<div class="admin-content_title">
					상품 이미지(이거 파일로 받을지 링크로 받을지)
				</div>
				<div class="img-up-text"><span>이미지 등록</span></div>
				<div class="admin-input_text">
					<input type="text" name="bookCover">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					출판일
				</div>
				<div class="admin-input_text">
					<input type="date" name="bookDate" required="">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					재고
				</div>
				<div class="admin-input_text">
					<input type="number" name="bookStock" required="">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					책 소개
				</div>
				<div class="admin-input_text">
				<textarea name="bookIntro"></textarea>
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					저자 소개
				</div>
				<div class="admin-input_text">
					<input type="text" name="writerIntro">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					출판사 서평
				</div>
				<div class="admin-input_text">
					<input type="text" name="pubReview">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					책 속으로
				</div>
				<div class="admin-input_text">
					<input type="text" name="bookExtract">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					목차
				</div>
				<div class="admin-input_text">
					<input type="text" name="bookIndex">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					추천평
				</div>
				<div class="admin-input_text">
					<input type="text" name="recommand">
				</div>
			</div>
		</div>
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					책 소개 영상
				</div>
				<div class="admin-input_text">
					<input type="text" name="introMv">
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		<input type="submit" class="submit-btn" value="등록">
		</form>
	</section>
    <script>
		
		window.addEventListener("load",function(){
			
			
			
			let map = new Map();
			let childList;
			let gchildList;
			let liList;
			
				childList=[];
				
					childList.push('국내여행');
					gchildList=[];
					
						gchildList.push('전국여행')
					
						gchildList.push('강원/영동')
					
						gchildList.push('충청도')
					
						gchildList.push('경상도/영남')
					
						gchildList.push('전라도/호남')
					
						gchildList.push('제주도')
					
						gchildList.push('서울/경기')
					
						map.set('국내여행', gchildList);
					
				
					childList.push('해외여행');
					gchildList=[];
					
						gchildList.push('세계여행')
					
						gchildList.push('유럽여행')
					
						gchildList.push('미국/캐나다/중남미')
					
						gchildList.push('일본여행')
					
						gchildList.push('중국여행')
					
						gchildList.push('인도/아시아여행')
					
						gchildList.push('기타여행')
					
						map.set('해외여행', gchildList);
					
				
					childList.push('테마여행');
					gchildList=[];
					
						gchildList.push('역사/문학기행')
					
						gchildList.push('배낭여행')
					
						gchildList.push('맛집여행')
					
						gchildList.push('체험학습/가족여행')
					
						gchildList.push('기타')
					
						map.set('테마여행', gchildList);
					
				
					childList.push('지도/지리');
					gchildList=[];
					
						gchildList.push('지리일반/지리학')
					
						gchildList.push('국내지도')
					
						gchildList.push('해외지도')
					
						map.set('지도/지리', gchildList);
					
				
				map.set('여행/지도', childList);
			
				childList=[];
				
					childList.push('경제');
					gchildList=[];
					
						gchildList.push('쉽게읽는 경제')
					
						gchildList.push('경제전망')
					
						gchildList.push('경제사상/이론')
					
						gchildList.push('한국경제')
					
						gchildList.push('국제경제')
					
						gchildList.push('금융/재정/화폐')
					
						map.set('경제', gchildList);
					
				
					childList.push('경영');
					gchildList=[];
					
						gchildList.push('경영일반/이론')
					
						gchildList.push('경영전략/혁신')
					
						gchildList.push('기업/경영자스토리')
					
						gchildList.push('경영실무')
					
						gchildList.push('인사/총무')
					
						gchildList.push('회계/재무')
					
						gchildList.push('생산/품질관리')
					
						gchildList.push('무역')
					
						gchildList.push('교통/통신/해운')
					
						gchildList.push('관광/호텔')
					
						gchildList.push('유통/물류')
					
						map.set('경영', gchildList);
					
				
					childList.push('마케팅/세일즈');
					gchildList=[];
					
						gchildList.push('마케팅일반')
					
						gchildList.push('마케팅전략')
					
						gchildList.push('광고/홍보')
					
						gchildList.push('영업/세일즈')
					
						gchildList.push('트렌드/미래예측')
					
						map.set('마케팅/세일즈', gchildList);
					
				
					childList.push('재테크/투자');
					gchildList=[];
					
						gchildList.push('재테크일반')
					
						gchildList.push('부동산/경매')
					
						gchildList.push('주식/증권')
					
						map.set('재테크/투자', gchildList);
					
				
					childList.push('창업/취업');
					gchildList=[];
					
						gchildList.push('창업/장사')
					
						gchildList.push('취업')
					
						map.set('창업/취업', gchildList);
					
				
				map.set('경제/경영', childList);
			
				childList=[];
				
					childList.push('웹/컴퓨터입문/활용');
					gchildList=[];
					
						gchildList.push('웹/홈페이지')
					
						gchildList.push('컴퓨터입문/활용')
					
						gchildList.push('컴퓨터게임')
					
						map.set('웹/컴퓨터입문/활용', gchildList);
					
				
					childList.push('IT 전문서');
					gchildList=[];
					
						gchildList.push('개발/OS/데이터베이스')
					
						gchildList.push('프로그래밍언어')
					
						gchildList.push('네트워크보안')
					
						gchildList.push('컴퓨터공학')
					
						map.set('IT 전문서', gchildList);
					
				
					childList.push('그래픽/멀티미디어');
					gchildList=[];
					
						gchildList.push('3DS/MAX')
					
						gchildList.push('그래픽일반/자료집 ')
					
						gchildList.push('그래픽툴/저작툴 ')
					
						gchildList.push('기타')
					
						map.set('그래픽/멀티미디어', gchildList);
					
				
					childList.push('오피스활용도서');
					gchildList=[];
					
						gchildList.push('MS Excel')
					
						gchildList.push('MS Word')
					
						gchildList.push('MS PowerPoint')
					
						gchildList.push('기타')
					
						map.set('오피스활용도서', gchildList);
					
				
					childList.push('컴퓨터수험서');
					gchildList=[];
					
						gchildList.push('정보처리')
					
						gchildList.push('컴퓨터활용능력')
					
						gchildList.push('워드프로세스')
					
						gchildList.push('컴퓨터수험서기타')
					
						map.set('컴퓨터수험서', gchildList);
					
				
				map.set('컴퓨터/IT', childList);
			
				childList=[];
				
					childList.push('교양만화');
					gchildList=[];
					
						map.set('교양만화', gchildList);
					
				
					childList.push('드라마');
					gchildList=[];
					
						map.set('드라마', gchildList);
					
				
					childList.push('성인만화');
					gchildList=[];
					
						map.set('성인만화', gchildList);
					
				
					childList.push('순정만화');
					gchildList=[];
					
						map.set('순정만화', gchildList);
					
				
					childList.push('스포츠만화');
					gchildList=[];
					
						map.set('스포츠만화', gchildList);
					
				
					childList.push('SF/판타지');
					gchildList=[];
					
						map.set('SF/판타지', gchildList);
					
				
					childList.push('액션/무협만화');
					gchildList=[];
					
						map.set('액션/무협만화', gchildList);
					
				
					childList.push('명랑/코믹만화');
					gchildList=[];
					
						map.set('명랑/코믹만화', gchildList);
					
				
					childList.push('공포/추리');
					gchildList=[];
					
						map.set('공포/추리', gchildList);
					
				
					childList.push('학원만화');
					gchildList=[];
					
						map.set('학원만화', gchildList);
					
				
					childList.push('웹툰/카툰에세이');
					gchildList=[];
					
						map.set('웹툰/카툰에세이', gchildList);
					
				
					childList.push('기타만화');
					gchildList=[];
					
						map.set('기타만화', gchildList);
					
				
					childList.push('일본어판 만화');
					gchildList=[];
					
						map.set('일본어판 만화', gchildList);
					
				
					childList.push('영문판 만화');
					gchildList=[];
					
						map.set('영문판 만화', gchildList);
					
				
				map.set('만화', childList);
			
				childList=[];
				
					childList.push('나라별 소설');
					gchildList=[];
					
						gchildList.push('한국소설')
					
						gchildList.push('영미소설')
					
						gchildList.push('일본소설')
					
						gchildList.push('중국소설')
					
						gchildList.push('러시아소설')
					
						gchildList.push('프랑스소설')
					
						gchildList.push('독일소설')
					
						gchildList.push('기타나라소설')
					
						map.set('나라별 소설', gchildList);
					
				
					childList.push('고전/문학');
					gchildList=[];
					
						gchildList.push('한국고전소설')
					
						gchildList.push('세계문학')
					
						gchildList.push('세계고전')
					
						map.set('고전/문학', gchildList);
					
				
					childList.push('장르소설');
					gchildList=[];
					
						gchildList.push('SF/판타지')
					
						gchildList.push('추리')
					
						gchildList.push('전쟁/역사')
					
						gchildList.push('로맨스')
					
						gchildList.push('무협')
					
						gchildList.push('공포/스릴러')
					
						map.set('장르소설', gchildList);
					
				
					childList.push('테마소설');
					gchildList=[];
					
						gchildList.push('인터넷소설')
					
						gchildList.push('영화/드라마소설')
					
						gchildList.push('가족/성장소설')
					
						gchildList.push('어른을 위한 동화')
					
						gchildList.push('라이트 노벨')
					
						map.set('테마소설', gchildList);
					
				
				map.set('소설', childList);
			
				childList=[];
				
					childList.push('한국시');
					gchildList=[];
					
						map.set('한국시', gchildList);
					
				
					childList.push('외국시');
					gchildList=[];
					
						map.set('외국시', gchildList);
					
				
					childList.push('인물 에세이');
					gchildList=[];
					
						map.set('인물 에세이', gchildList);
					
				
					childList.push('여행 에세이');
					gchildList=[];
					
						map.set('여행 에세이', gchildList);
					
				
					childList.push('성공 에세이');
					gchildList=[];
					
						map.set('성공 에세이', gchildList);
					
				
					childList.push('독서 에세이');
					gchildList=[];
					
						map.set('독서 에세이', gchildList);
					
				
					childList.push('명상 에세이');
					gchildList=[];
					
						map.set('명상 에세이', gchildList);
					
				
					childList.push('그림/포토 에세이');
					gchildList=[];
					
						map.set('그림/포토 에세이', gchildList);
					
				
					childList.push('연애/사랑 에세이');
					gchildList=[];
					
						map.set('연애/사랑 에세이', gchildList);
					
				
					childList.push('삶의 지혜/명언');
					gchildList=[];
					
						map.set('삶의 지혜/명언', gchildList);
					
				
				map.set('시/에세이', childList);
			
				childList=[];
				
					childList.push('예술일반');
					gchildList=[];
					
						gchildList.push('예술이야기')
					
						gchildList.push('예술론/예술사')
					
						gchildList.push('미학/예술철학')
					
						gchildList.push('예술사전/잡지')
					
						map.set('예술일반', gchildList);
					
				
					childList.push('미술');
					gchildList=[];
					
						gchildList.push('미술이야기')
					
						gchildList.push('미술론/미술사')
					
						gchildList.push('미술실기/기법')
					
						gchildList.push('공예/서예')
					
						gchildList.push('디자인')
					
						map.set('미술', gchildList);
					
				
					childList.push('음악');
					gchildList=[];
					
						gchildList.push('음악이야기')
					
						gchildList.push('음악이론/음악사')
					
						gchildList.push('장르별음악')
					
						gchildList.push('악기/악보집')
					
						map.set('음악', gchildList);
					
				
					childList.push('건축');
					gchildList=[];
					
						gchildList.push('건축이야기')
					
						gchildList.push('건축이론/건축사')
					
						gchildList.push('건축가')
					
						map.set('건축', gchildList);
					
				
					childList.push('만화/애니메이션');
					gchildList=[];
					
						gchildList.push('만화 일반')
					
						gchildList.push('만화 작법/기법')
					
						gchildList.push('애니메이션 일반')
					
						map.set('만화/애니메이션', gchildList);
					
				
					childList.push('사진');
					gchildList=[];
					
						gchildList.push('사진일반')
					
						gchildList.push('사진작가/사진집')
					
						gchildList.push('사진이론과 실기')
					
						map.set('사진', gchildList);
					
				
					childList.push('연극/영화');
					gchildList=[];
					
						gchildList.push('연극일반')
					
						gchildList.push('연극이론/비평')
					
						gchildList.push('연극사/연극이론')
					
						gchildList.push('영화사/영화이론')
					
						gchildList.push('희곡/시나리오')
					
						gchildList.push('영화제작/비평')
					
						map.set('연극/영화', gchildList);
					
				
					childList.push('TV/대중문화');
					gchildList=[];
					
						gchildList.push('미디어/광고')
					
						gchildList.push('드라마 극본')
					
						gchildList.push('시나리오/희곡 작법')
					
						gchildList.push('문화비평')
					
						map.set('TV/대중문화', gchildList);
					
				
				map.set('예술/대중문화', childList);
			
				childList=[];
				
					childList.push('여성/패션/리빙');
					gchildList=[];
					
						gchildList.push('여성/패션')
					
						gchildList.push('건강/요리')
					
						gchildList.push('리빙/인테리어')
					
						gchildList.push('결혼/육아')
					
						map.set('여성/패션/리빙', gchildList);
					
				
					childList.push('인문/사회/종교');
					gchildList=[];
					
						gchildList.push('시사/사회')
					
						gchildList.push('경제/경영')
					
						gchildList.push('종교')
					
						gchildList.push('행정/고시/정치')
					
						map.set('인문/사회/종교', gchildList);
					
				
					childList.push('문예/교양지');
					gchildList=[];
					
						gchildList.push('문예')
					
						gchildList.push('출판')
					
						gchildList.push('교양')
					
						map.set('문예/교양지', gchildList);
					
				
					childList.push('자연/공학');
					gchildList=[];
					
						gchildList.push('기계/자동차')
					
						gchildList.push('의학/건강')
					
						gchildList.push('농학/원예')
					
						gchildList.push('자연과학')
					
						gchildList.push('기타')
					
						map.set('자연/공학', gchildList);
					
				
					childList.push('컴퓨터/게임/그래픽');
					gchildList=[];
					
						gchildList.push('그래픽')
					
						gchildList.push('컴퓨터')
					
						gchildList.push('웹')
					
						gchildList.push('게임(Game)')
					
						map.set('컴퓨터/게임/그래픽', gchildList);
					
				
					childList.push('어학/교육');
					gchildList=[];
					
						gchildList.push('아동학습')
					
						gchildList.push('중고학습')
					
						gchildList.push('어학')
					
						gchildList.push('방송교재')
					
						map.set('어학/교육', gchildList);
					
				
					childList.push('예술/대중문화');
					gchildList=[];
					
						gchildList.push('영화/공연')
					
						gchildList.push('사진')
					
						gchildList.push('음악/미술')
					
						gchildList.push('방송/연예')
					
						gchildList.push('기타')
					
						map.set('예술', gchildList);
					
				
					childList.push('취미/여행');
					gchildList=[];
					
						gchildList.push('레저/스포츠')
					
						gchildList.push('여행')
					
						gchildList.push('바둑/낚시/등산')
					
						gchildList.push('기타')
					
						map.set('취미/여행', gchildList);
					
				
					childList.push('외국잡지');
					gchildList=[];
					
						gchildList.push('Fashion & Living')
					
						gchildList.push('Entertainment')
					
						gchildList.push('News & Economy')
					
						gchildList.push('Art & Design')
					
						gchildList.push('기타외국잡지')
					
						map.set('외국잡지', gchildList);
					
				
				map.set('잡지', childList);
			

			let ch_genre_li;
			const top_genre_list = document.querySelectorAll(".top-genre li");
			const child_genre_list=document.querySelector(".child-genre>ul")
			const g_child_genre_list=document.querySelector(".g-child-genre>ul")
			const show_genre1 = document.querySelector(".show_genre1");
			const show_genre2 = document.querySelector(".show_genre2");
			const show_genre3 = document.querySelector(".show_genre3");
			const show_genre = document.querySelector(".show_genre");
			const input_genre = document.querySelector(".input_genre");
			let isTwo;
			
				for(var i=0;i<top_genre_list.length;i++){
				top_genre_list[i].addEventListener("click",function(){
					isTwo = false;
					show_genre.style.visibility='hidden'
					for(var j=0;j<top_genre_list.length;j++){
						top_genre_list[j].style.color="rgba(0,0,0,0.8)";
					}
					this.style.color="#ff9f43";
					if(this.innerHTML=='만화' || this.innerHTML=='시/에세이'){
						isTwo=true;
					}
					ch_genre_li=map.get(this.innerHTML);
					show_genre1.innerHTML=this.innerHTML;
					while ( child_genre_list.hasChildNodes() ) { 
						child_genre_list.removeChild( child_genre_list.firstChild ); 
					}
					while ( g_child_genre_list.hasChildNodes() ) { 
						g_child_genre_list.removeChild( g_child_genre_list.firstChild ); 
					}
					liList=[];
					for(var j=0;j<ch_genre_li.length;j++){
						var tem_li= document.createElement("li");	
						var tem_text=document.createTextNode(ch_genre_li[j]);
						tem_li.appendChild(tem_text);
						liList.push(tem_li);
						child_genre_list.appendChild(tem_li);
					}
					
					if(isTwo){
						for(var j=0;j<liList.length;j++){
							liList[j].addEventListener('click',function(){
								let cli = this.parentElement.children;
								for(var k=0;k<cli.length;k++){
									cli[k].style.color="rgba(0,0,0,0.8)";
								}
								this.style.color="#ff9f43";
								show_genre2.innerHTML=' > '+this.innerHTML
								input_genre.value=this.innerHTML;
								show_genre3.innerHTML=""
								show_genre.style.visibility='visible'
							});
						}
					}else{
						for(var j=0;j<liList.length;j++){
							liList[j].addEventListener('click',function(){
								let cli = this.parentElement.children;
								for(var k=0;k<cli.length;k++){
									cli[k].style.color="rgba(0,0,0,0.8)";
								}
								this.style.color="#ff9f43";
								if(this.innerHTML=="예술/대중문화"){
									ch_genre_li=map.get('예술');
								}else{									
									ch_genre_li=map.get(this.innerHTML);
								}
								show_genre2.innerHTML=' > '+this.innerHTML
								while ( g_child_genre_list.hasChildNodes() ) { 
									g_child_genre_list.removeChild( g_child_genre_list.firstChild ); 
								}
								liList=[];
								for(var k=0;k<ch_genre_li.length;k++){
									var tem_li= document.createElement("li");	
									var tem_text=document.createTextNode(ch_genre_li[k]);
									tem_li.appendChild(tem_text);
									liList.push(tem_li);
									g_child_genre_list.appendChild(tem_li);
								}
								
								for(var k=0;k<liList.length;k++){
									liList[k].addEventListener('click',function(){
										let gcli = this.parentElement.children;
										for(var q=0;q<gcli.length;q++){
											gcli[q].style.color="rgba(0,0,0,0.8)";
										}
										this.style.color="#ff9f43";
										show_genre3.innerHTML=' > '+this.innerHTML
										input_genre.value=this.innerHTML;
										show_genre.style.visibility='visible'
									})
								}
							});
						}
					}
					
					
				});
			}
		});
	</script>
		
</body>
</html>

