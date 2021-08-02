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
		<form action="${path }/admin/productInsertEnd" method="post" enctype="multipart/form-data" onsubmit="return categoryCheck();">
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					카테고리
				</div>
				<div class="align-row choice-genre-area">
					<div class="choice-genre top-genre">
						<ul>
							<li>경제/경영</li>
							<li>사회</li>
							<li>종교</li>
							<li>소설</li>
							<li>시/에세이</li>
							<li>예술/대중문화</li>
							<li>인문</li>
							<li>역사/문화</li>
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
					<span class="show_genre4"></span>
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
				
					childList.push('정치/외교');
					gchildList=[];
					
						gchildList.push('정치일반')
					
						gchildList.push('각국정치')
					
						gchildList.push('외교/국제관계')
					
						map.set('정치/외교', gchildList);
					
				
					childList.push('행정/정책');
					gchildList=[];
					
						gchildList.push('행정학일반')
					
						gchildList.push('행정일반/관리')
					
						gchildList.push('정책/지방자치')
					
						map.set('행정/정책', gchildList);
					
				
					childList.push('국방/군사/경찰');
					gchildList=[];
					
						gchildList.push('국방/군사 일반')
					
						gchildList.push('전쟁 ')
					
						gchildList.push('경찰/범죄 ')
					
						map.set('국방/군사/경찰', gchildList);
					
				
					childList.push('법');
					gchildList=[];
					
						gchildList.push('법학일반')
					
						gchildList.push('민법/형법/상법')
					
						gchildList.push('소송/판례')
					
						gchildList.push('헌법')
						
						gchildList.push('국제법')
						
						gchildList.push('기타법/법률')
					
						map.set('법', gchildList);
					
				
					childList.push('사회학');
					gchildList=[];
					
						gchildList.push('사회학일반')
					
						gchildList.push('사회이론/사상')
					
						gchildList.push('각국사회/문화')
					
						gchildList.push('여성학')
					
						map.set('사회학', gchildList);
						
					childList.push('사회복지');
					gchildList=[];
					
						gchildList.push('사회문제일반')
					
						gchildList.push('사회복지이론')
					
						gchildList.push('여성복지')
					
						gchildList.push('노인복지')
						
						gchildList.push('아동복지')
						
						gchildList.push('장애인복지')
					
						map.set('사회복지', gchildList);
						
					childList.push('언론/신문/방송');
					gchildList=[];
					
						gchildList.push('언론일반')
					
						gchildList.push('언론이론')
					
						gchildList.push('신문/방송/출판')
					
						map.set('언론/신문/방송', gchildList);
					
				
				map.set('사회', childList);
			
				childList=[];
				
					
				
					childList.push('종교일반');
					gchildList=[];
					
						map.set('종교일반', gchildList);
					
				
					childList.push('기독교(개신교)');
					gchildList=[];
					
						map.set('기독교(개신교)', gchildList);
					
				
					childList.push('가톨릭');
					gchildList=[];
					
						map.set('가톨릭', gchildList);
					
				
					childList.push('불교');
					gchildList=[];
					
						map.set('불교', gchildList);
					
				
					childList.push('기타');
					gchildList=[];
					
						map.set('기타', gchildList);
					
				
				map.set('종교', childList);
			
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
				
					childList.push('인문일반');
					gchildList=[];
					
						gchildList.push('교양인문')
					
						gchildList.push('인문학이론')
					
						gchildList.push('독서/글쓰기')
					
						map.set('인문일반', gchildList);
					
				
					childList.push('심리');
					gchildList=[];
					
						gchildList.push('교양심리')
					
						gchildList.push('심리학일반')
					
						map.set('심리', gchildList);
					
				
					childList.push('교육학');
					gchildList=[];
					
						gchildList.push('교육학의이해')
					
						gchildList.push('교육학일반')
					
						map.set('교육학', gchildList);
					
				
					childList.push('철학');
					gchildList=[];
					
						gchildList.push('교양철학')
					
						gchildList.push('철학일반')
					
						gchildList.push('서양철학')
					
						gchildList.push('동양철학')
					
						gchildList.push('한국철학')
					
						map.set('철학', gchildList);
					
				
					childList.push('문학론');
					gchildList=[];
					
						gchildList.push('문학의이해')
					
						gchildList.push('문학이론')
					
						gchildList.push('문학사')
					
						gchildList.push('문학비평/평론')
					
						map.set('문학론', gchildList);
					
				
					childList.push('언어학/기호학');
					gchildList=[];
					
						gchildList.push('언어학일반')
					
						gchildList.push('기호학일반')
					
						map.set('언어학/기호학', gchildList);
					
				
					childList.push('종교학');
					gchildList=[];
					
						gchildList.push('종교학의이해')
					
						gchildList.push('종교사')
					
						gchildList.push('종교비평/비교종교학')
					
						map.set('종교학', gchildList);
					
				
					childList.push('신화');
					gchildList=[];
					
						gchildList.push('신화의 이해')
					
						gchildList.push('그리스로마신화')
					
						gchildList.push('서양신화')
					
						gchildList.push('동양신화')
						
						gchildList.push('한국신화')
					
						map.set('신화', gchildList);
					
				map.set('인문', childList);
				
				childList=[];
				
					childList.push('인문일반');
					gchildList=[];
					
						gchildList.push('역사의이해')
					
						gchildList.push('역사학이론/비평')
					
						gchildList.push('정치/경제사')
						
						gchildList.push('문명사')
						
						gchildList.push('고고학/문화인류학')
						
						gchildList.push('전쟁사')
						
						gchildList.push('인물사')
						
						gchildList.push('생활/풍속사')
						
						gchildList.push('문화사일반')
					
						map.set('인문일반', gchildList);
						
					childList.push('세계사');
					gchildList=[];
					
						gchildList.push('세계역사/문화일반')
					
						gchildList.push('시대별 역사/문화')
					
						map.set('세계사', gchildList);
						
					childList.push('서양사');
					gchildList=[];
					
						gchildList.push('서양역사/문화일반')
					
						map.set('서양사', gchildList);
						
					childList.push('동양사');
					gchildList=[];
					
						gchildList.push('동양역사/문화일반')
					
						map.set('동양사', gchildList);
						
					childList.push('한국사');
					gchildList=[];
					
						gchildList.push('한국사일반')
					
						gchildList.push('고중세사')
						
						gchildList.push('근현대사')
						
						gchildList.push('한국문화')
						
						gchildList.push('한국역사인물')
					
						map.set('한국사', gchildList);
					
				map.set('역사/문화', childList);
			

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
					if(this.innerHTML=='종교' || this.innerHTML=='시/에세이'){
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

