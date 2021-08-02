<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
        
<section>
 <div class="admin-content_area">
                <div class="admin-content">
                    <div class="admin-content_title">
                        상품 조회/수정
                    </div>
                </div>
            </div>
       <form action="${path }/admin/productSelectList" method="post">
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					검색어
				</div>
				<div class="admin-search">
					<div>책 번호</div>
					<input type="number" name="bookNo">
				</div>
				<div class="admin-search">
					<div>책 제목</div>
					<input type="text" name="bookTitle">
				</div>
				<div class="admin-search">
					<div>저자</div>
					<input type="text" name="bookAuthor">
				</div>
				<div class="admin-search">
					<div>출판사</div>
					<input type="text" name="bookPublisher">
				</div>
			</div>
		</div>
		
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
				</div>
			</div>
			<input type="hidden" name="bookGenre" class="input_genre">
		</div>
		<button class="submit-btn">검색</button>
		</form>
            
            <div class="admin-content_area" style="margin-top: 45px;">
                <div class="admin-content">
                    <div class="admin-content_title">
                        상품목록 (총 ${count } 권)
                    </div>
                    <div class="search-table">
                    <c:if test="${list.size() >= 1}">
          			
	                    <table class="table table-border table-hover table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th style="width: 15%;">제목</th>
									<th style="width: 15%;">카테고리</th>
									<th style="width: 5%;">저자</th>
									<th style="width: 7%;">출판사</th>
									<th>정가</th>
									<th style="width: 5%;">출판일</th>
									<th style="width: 3%;">수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="l">
								<tr>
									<td style="	text-align: center;"><fmt:formatNumber value="${l.bookCode }" ></fmt:formatNumber></td>
									<td><a href="#"><c:out value="${l.bookTitle }" ></c:out></a></td>
									<td>
										${l.sort.lv1 }
										<c:if test="${l.sort.lv2 != null}">
											>${l.sort.lv2 }
										</c:if>
										<c:if test="${l.sort.lv3 != null}">
												>${l.sort.lv3 }
										</c:if>
										<c:if test="${l.sort.lv4 != null}">
											>${l.sort.lv4 }
										</c:if>
										
									
									
									</td>
									<td>${l.bookWriter }</td>
									<td>${l.bookPub }</td>
									<td style="	text-align: center;">${l.bookCost }</td>
									<td style="	text-align: center;"><fmt:formatDate value="${l.bookDate }" pattern="yyyy년MM월dd일"/></td>
									<td style="	text-align: center;"><a class="update-btn" href="bookEdit.jsp?bookNo=4">수정</a></td>
									
									<td style="	text-align: center;"><a class="update-btn" href="/bookin/book/bookDelete.kh?bookNo=4" style="background-color:#ff6b6b">삭제</a></td>
									
								</tr>
							</c:forEach>
							</tbody>
						</table>
                    </c:if>
                    <c:if test="${list.size() == 0}">
	                    <span class="no_Data">데이터가 없습니다</span>
                    </c:if>
                    
                    </div>
                     <div class="pageBar flex my-5">${pageBar}</div>
                </div>
            </div>
</section>
<script>
	window.onpageshow = function(event){
		if(event.persisted || (window.performance && window.performance.navigation.type==2)){
			console.log('뒤로가기')
			window.location.reload();
		}else{
			console.log('뒤로가기x')
			console.log(window.performance)
			console.log(window.performance.navigation.type)
		}
	}
	window.addEventListener("load",function(){
		const searchform=document.querySelector(".search-page-form")
		const formPageNo=document.querySelector('input[name="pageNo"]')
		const pageNo=document.querySelectorAll(".pagination > li > a")
		for(var i=0;i<pageNo.length;i++){
			if(pageNo[i].textContent=="이전"){
				pageNo[i].addEventListener("click",function(){
					formPageNo.value=this.parentElement.nextElementSibling.textContent-1
					searchform.submit();
				})
			}else if(pageNo[i].textContent=="다음"){
				pageNo[i].addEventListener("click",function(){
					formPageNo.value=parseInt(this.parentElement.previousElementSibling.textContent)+1
					searchform.submit();
				})
			}else{
				pageNo[i].addEventListener("click",function(){
					formPageNo.value=this.textContent		
					searchform.submit();
				})
			}
		}
		
		const cantDelete = document.querySelector(".cantDelete")
		cantDelete.addEventListener("click",function(){
			alert("주문목록에 있어 삭제할수 없습니다.")
		})
		
	})

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

