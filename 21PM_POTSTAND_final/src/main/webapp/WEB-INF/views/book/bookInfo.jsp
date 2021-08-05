<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${loginMember}" name="loginMember"/>
</jsp:include>
<style>
	.point > label {
	  cursor: pointer;
	  width: 70px;
	  height: 70px;
	  margin-top: auto;
	  background-image: url(${path}/resources/img/star_off.png);
	  background-repeat: no-repeat;
	  background-position: center;
	  background-size: 76%;
	  transition: .3s;
	}
	
	.point > input:checked ~ label,
	.point > input:checked ~ label ~ label {
		background-image: url(${path}/resources/img/star_on.png);
	}
	
	
	.point > input:not(:checked) ~ label:hover,
	.point > input:not(:checked) ~ label:hover ~ label {
		background-image: url(${path}/resources/img/star_on.png);
	}
	
	.emoji-wrapper {
	  width: 100%;
	  text-align: center;
	  height: 100px;
	  overflow: hidden;
	  position: absolute;
	  top: 0;
	  left: 0;
	}
	
	.emoji-wrapper:before,
	.emoji-wrapper:after{
	  content: "";
	  height: 15px;
	  width: 100%;
	  position: absolute;
	  left: 0;
	  z-index: 1;
	}
	
	.emoji-wrapper:before {
	  top: 0;
	  background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(255,255,255,1) 35%,rgba(255,255,255,0) 100%);
	}
	
	.emoji-wrapper:after{
	  bottom: 0;
	  background: linear-gradient(to top, rgba(255,255,255,1) 0%,rgba(255,255,255,1) 35%,rgba(255,255,255,0) 100%);
	}
	
	.emoji {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  transition: .3s;
	}
	
	.emoji > svg {
	  margin: 15px 0; 
	  width: 70px;
	  height: 70px;
	  flex-shrink: 0;
	}
	
	#point-1:checked ~ .emoji-wrapper > .emoji { transform: translateY(-100px); }
	#point-2:checked ~ .emoji-wrapper > .emoji { transform: translateY(-200px); }
	#point-3:checked ~ .emoji-wrapper > .emoji { transform: translateY(-300px); }
	#point-4:checked ~ .emoji-wrapper > .emoji { transform: translateY(-400px); }
	#point-5:checked ~ .emoji-wrapper > .emoji { transform: translateY(-500px); }
	
	.feedback {
	  width: 100%;
	  padding: 30px;
	  display: flex;
	  flex-direction: column;
	  flex-wrap: wrap;
	  align-items: center;
}
</style>
<section class="text-gray-600 body-font overflow-hidden">
	<!-- 페이지 컨테이너 시작 -->
	<div class="container px-5 py-10 mx-auto">
		<!-- 책 상세 상단 시작 -->
        <div class="lg:w-4/5 mx-auto flex flex-wrap">
			<img alt="ecommerce" class="lg:w-1/2 w-full lg:h-auto h-64 object-cover object-center rounded" 
          	src=
          	 <c:if test="${bookInfo.bookCover.contains('http') }">
	              			<c:out value="${bookInfo.getBookCover()}"/>
	              		</c:if>
              			<c:if test="${!bookInfo.bookCover.contains('http') }">
              				${path }/resources/upload/book/${bookInfo.bookCover }
	              		</c:if>
          	/>
          	<div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
            	<h2 class="text-sm title-font text-gray-500 tracking-widest"><c:out value="${bookInfo.getBookPub()}"/></h2>
            	<h1 class="text-gray-900 text-3xl title-font font-medium mb-1"><c:out value="${bookInfo.getBookTitle()}"/></h1>
            	<div class="flex mb-4">
              		<span class="flex items-center">
              			<c:if test="${reviewAvg==0 }">
              				<c:forEach begin="0" end="4" step="1">
              					<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
              				</c:forEach>
              			</c:if>
              			<c:if test="${reviewAvg==1 }">
              				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
              				<c:forEach begin="0" end="3" step="1">
              					<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
              				</c:forEach>			
              			</c:if>
              			<c:if test="${reviewAvg==2 }">
              				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
              				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
              				<c:forEach begin="0" end="2" step="1">
              					<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
              				</c:forEach>
              			</c:if>
              			<c:if test="${reviewAvg==3 }">
              				<c:forEach begin="0" end="2" step="1">
              					<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
              				</c:forEach>
              				<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
              				<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
              			</c:if>
              			<c:if test="${reviewAvg==4 }">
              				<c:forEach begin="0" end="3" step="1">
              					<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
              				</c:forEach>
              				<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
              			</c:if>
              			<c:if test="${reviewAvg==5 }">
              				<c:forEach begin="0" end="4" step="1">
              					<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
              				</c:forEach>
              			</c:if>
	                	<span class="text-gray-600 ml-3">리뷰 ${reviewCount } 건</span>
              		</span>
              		<span class="flex ml-3 pl-3 py-2 border-l-2 border-gray-200 space-x-2s">
                		<a class="text-gray-500">
							<svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
							class="w-5 h-5" viewBox="0 0 24 24">
                    			<path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"></path>
                  			</svg>
                		</a>
                		<a class="text-gray-500">
                  			<svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  			class="w-5 h-5" viewBox="0 0 24 24">
                    			<path d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 
                    			13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z"></path>
                  			</svg>
                		</a>
                		<a class="text-gray-500">
                  			<svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  			 class="w-5 h-5" viewBox="0 0 24 24">
                    			<path d="M21 11.5a8.38 8.38 0 01-.9 3.8 8.5 8.5 0 01-7.6 4.7 8.38 8.38 0 01-3.8-.9L3 
                    			21l1.9-5.7a8.38 8.38 0 01-.9-3.8 8.5 8.5 0 014.7-7.6 8.38 8.38 0 013.8-.9h.5a8.48 8.48 
                    			0 018 8v.5z"></path>
                  			</svg>
                		</a>
              		</span>
            	</div>
            	<div class=" flex mt-6 items-center pb-5 border-b-2 border-gray-100 mb-5">
              		<div class="flex items-center">
                		<span class="mr-3">정가</span>
                		<div class="relative">
                  			<span class="absolute right-0 top-0 h-full w-10 text-center text-gray-600 pointer-events-none 
                  			flex items-center justify-center">
                  			</span>
                		</div>
                		<span  class="title-font font-medium text-2xl text-gray-900">
                			<input id="bookCost" type="hidden" value="${bookInfo.getBookCost() }">
                			<input name="bookCode" type="hidden" value="${bookInfo.bookCode }">
                			<fmt:formatNumber type="currency" value="${bookInfo.getBookCost()}"/>
                		</span>
              		</div>
            	</div>
            	<div class="flex mt-6 items-center pb-5 border-b-2 border-gray-100 mb-5">
              		<div class="flex items-center">
                		<span class="mr-3">적립금</span>
                		<div class="relative">
                  			<span class="absolute right-0 top-0 h-full w-10 text-center text-gray-600 pointer-events-none 
                  			flex items-center justify-center"></span>
                		</div>
                		<div id ="savings" class="mr-3"></div>원(정가의 5%)
              		</div>
            	</div>
            	<div class="flex mt-6 items-center pb-5 border-b-2 border-gray-100 mb-5">
              		<div class="flex items-center">
                		<span class="mr-3">배송비</span>
                		<div class="relative">
                  			<span class="absolute right-0 top-0 h-full w-10 text-center text-gray-600 pointer-events-none
                  			 flex items-center justify-center">
                  			</span>
                		</div>
                		3000원
              		</div>
            	</div>
            	<div class="flex mt-6 items-center pb-5 border-b-2 border-gray-100 mb-5">
              		<div class="flex items-center">
	                	<span class="mr-3">수량</span>
	                	<div class="relative">
                    			<input id="bookAmount" type="number" value="1">
                		</div>
              		</div>
            	</div>
				<div class="flex items-center justify-evenly">
              		<div class="flex justify-center items-center">
		                <span class="mr-3 align-middle">총액</span>
		                <span id="sumPrice" class="title-font font-medium text-2xl text-gray-900"></span>원
					            
              		</div>
              		<button class=" flex text-white bg-gray-300 border-0 py-4 px-4 focus:outline-none rounded"
              		onclick="fn_book_bookHeart(event)">
                		<svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 
                		h-10 fill-current <c:if test="${heartCheck!=null }">text-red-500</c:if>" viewBox="0 0 24 24" id="heartBtn">
                  			<path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 
                  			1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z"></path>
                		</svg>
              		</button>
              		<button onclick="goCart();" class="flex text-white bg-gray-300 border-0 py-4 px-4 focus:outline-none rounded">
                		<svg  class="fill-current text-white w-10" viewBox="0 -31 512.00033 512" 
                		xmlns="http://www.w3.org/2000/svg">
                  			<g stroke>
                    			<path d="m166 300.003906h271.003906c6.710938 0 12.597656-4.4375 
                    			14.414063-10.882812l60.003906-210.003906c1.289063-4.527344.40625-9.390626-2.433594-13.152344-2.84375-3.75-7.265625-5.964844-11.984375-5.964844h-365.632812l-10.722656-48.25c-1.523438-6.871094-7.617188-11.75-14.648438-11.75h-91c-8.289062 
                    			0-15 6.710938-15 15 0 8.292969 6.710938 15 15 15h78.960938l54.167968 243.75c-15.9375 
                    			6.929688-27.128906 22.792969-27.128906 41.253906 0 24.8125 20.1875 45 45 45h271.003906c8.292969 0 
                    			15-6.707031 15-15 0-8.289062-6.707031-15-15-15h-271.003906c-8.261719 
                    			0-15-6.722656-15-15s6.738281-15 15-15zm0 0"/>
                    			<path d="m151 405.003906c0 24.816406 20.1875 45 45.003906 45 24.8125 0 45-20.183594 45-45 
                      			0-24.8125-20.1875-45-45-45-24.816406 0-45.003906 20.1875-45.003906 45zm0 0"/>
                    			<path d="m362.003906 405.003906c0 24.816406 20.1875 45 45 45 24.816406 0 45-20.183594 45-45 
                    			0-24.8125-20.183594-45-45-45-24.8125 0-45 20.1875-45 45zm0 0"/>
                  			</g>
                		</svg>
              		</button>
              		<c:if test="${bookInfo.bookStock != 0 }">
	              		<button class="flex text-white bg-red-500 border-0 py-5 px-10 focus:outline-none hover:bg-red-600 
	              		rounded text-xl" onclick="fn_directPayment();">구매하기</button>
              		</c:if>
              		<c:if test="${bookInfo.bookStock == 0 }">
           				<button onclick="request(${bookInfo.bookCode})" class=" flex text-white bg-gray-300 border-0 py-5 px-10 focus:outline-none rounded hover:bg-blue-600 
	              		rounded text-xl">입고요청</button>
              		</c:if>
            	</div>
          	</div>
		</div>
        <!-- 구분선 -->
        <div class="border-b-4 border-red-500 mt-10"></div>
        <div class="mx-10 mb-2 p-5">
          	<c:if test="${bookInfo.getIntroMv()!=null}">
	          	<h1 class="sm:text-3xl text-2xl font-medium title-font text-gray-900 my-10">북트레일러</h1>
	          	<h3 class="leading-relaxed text-xl"><iframe src="${bookInfo.getIntroMv()}"></iframe></h3>
          	</c:if>
          	<c:if test="${bookInfo.getBookIntro()!=null}">
	          	<h1 class="sm:text-3xl text-2xl font-medium title-font text-gray-900 my-10">책소개</h1>
          		<h3 class="leading-relaxed text-xl"><c:out value="${bookInfo.getBookIntro()}" escapeXml="false"/></h3>
          	</c:if>
          	<c:if test="${bookInfo.getWriterIntro()!=null}">
          		<div class="border-b-4 border-gray-300 my-10"></div>
          		<h1 class="sm:text-3xl text-2xl font-medium title-font text-gray-900 my-10"> 저자 소개</h1>
          		<h3 class="leading-relaxed text-xl"><c:out value="${bookInfo.getWriterIntro()}" escapeXml="false"/></h3>
          	</c:if>
          	<!-- 상세소개 내부 구분선 -->
          	<c:if test="${bookInfo.getBookIndex()!=null}">
          		<div class="border-b-4 border-gray-300 my-10"></div>
          		<h1 class="sm:text-3xl text-2xl font-medium title-font text-gray-900 my-10">목차</h1>
          		<h3 class="leading-relaxed text-xl"><c:out value="${bookInfo.getBookIndex()} " escapeXml="false"/></h3>
          	</c:if>
			<!-- 상세소개 내부 구분선 -->
	        <c:if test="${bookInfo.getPubReview()!=null}">
	          	<div class="border-b-4 border-gray-300 my-10"></div>
          		<h1 class="sm:text-3xl text-2xl font-medium title-font text-gray-900 my-10">출판사 서평</h1>
          		<h3 class="leading-relaxed text-xl"><c:out value="${bookInfo.getPubReview()}" escapeXml="false"/></h3>
         	</c:if>
          	<!-- 상세소개 내부 구분선 -->
          	<c:if test="${bookInfo.getRecommand()!=null}">
          		<div class="border-b-4 border-gray-300 my-10"></div>
          		<h1 class="sm:text-3xl text-2xl font-medium title-font text-gray-900 my-10"> 추천의 말</h1>
          		<h3 class="leading-relaxed text-xl"><c:out value="${bookInfo.getRecommand()}" escapeXml="false"/></h3>
          	</c:if>
          	<!-- 상세소개 내부 구분선 -->
          	<c:if test="${bookInfo.getBookExtract()!=null}">
          		<div class="border-b-4 border-gray-300 my-10"></div>
          		<h1 class="sm:text-3xl text-2xl font-medium title-font text-gray-900 my-10">책 속으로</h1>
          		<h3 class="leading-relaxed text-xl"><c:out value="${bookInfo.getBookExtract()}" escapeXml="false"/></h3>
          	</c:if>
          	<!-- review 보여주고 쓰는 화면 -->
          	<div class="border-b-4 border-gray-300 my-10"></div>
          	<h1 class="sm:text-3xl text-2xl font-medium title-font text-gray-900 my-10">리뷰</h1>
          	<div class="flex items-center justify-center w-3/4">
          		<div class="flex flex-col text-center items-center justify-center w-1/4">
          			<h4 class="m-2 text-xl">구매자 별점</h4>
          			<div class="text-center text-4xl text-black font-bold m-2"><h2>${reviewAvg }</h2></div>
          			<div class="flex m-2">
          				<c:if test="${reviewAvg==1 }">
		        			<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
		        			<c:forEach begin="0" end="3">
		        				<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        			</c:forEach>
		        		</c:if>
		        		<c:if test="${reviewAvg==2 }">
			        	<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
			        	<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
		        		<c:forEach begin="0" end="2">
		        			<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        		</c:forEach>
		        			</c:if>
		        		<c:if test="${reviewAvg==3 }">
		        			<c:forEach begin="0" end="2">
		        				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
		        			</c:forEach>
		        			<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        			<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        		</c:if>
		        		<c:if test="${reviewAvg==4 }">
		        			<c:forEach begin="0" end="3">
		        				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
		        			</c:forEach>
		        			<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
		        		</c:if>
		        		<c:if test="${reviewAvg==5 }">
		        			<c:forEach begin="0" end="4">
		        				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1" >
		        			</c:forEach>
		        		</c:if>
          			</div>
          			<div>
	          			<ul>
	          				<li class="text-gray-500 font-bold flex items-center justify-center">
	          					<span>
	          						<svg class="hi-solid hi-star inline-block w-5 h-5" fill="currentColor" viewBox="0 0 20 
	          						20" xmlns="http://www.w3.org/2000/svg">
	          							<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 
	          							00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 
	          							3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 
	          							2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 
	          							8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
	          					</span>
	          					5
	          					<span class="ml-1 border w-24 h-3 flex">
	          						<span class="score_bar bg-gray-500 h-full" style="width: ${point5}%;"></span>
	          					</span>   						
	          				</li>
	          				<li class="text-gray-500 font-bold flex items-center justify-center">
	          					<span>
	          						<svg class="hi-solid hi-star inline-block w-5 h-5" fill="currentColor" viewBox="0 0 20 
	          						20" xmlns="http://www.w3.org/2000/svg">
	          							<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 
	          							00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 
	          							3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 
	          							2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 
	          							8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
	          					</span>
	          					4
	          					<span class="ml-1 border w-24 h-3 flex">
	          						<span class="score_bar bg-gray-500 h-full" style="width: ${point4}%;"></span>
	          					</span>
	          				</li>
	          				<li class="text-gray-500 font-bold flex items-center justify-center">
	          					<span>
	          						<svg class="hi-solid hi-star inline-block w-5 h-5" fill="currentColor" viewBox="0 0 20 
	          						20" xmlns="http://www.w3.org/2000/svg">
	          							<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 
	          							00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 
	          							3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 
	          							2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 
	          							8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
	          					</span>
	          					3
	          					<span class="ml-1 border w-24 h-3 flex">
	          						<span class="score_bar bg-gray-500 h-full" style="width: ${point3}%;"></span>
	          					</span>
	          				</li>
	          				<li class="text-gray-500 font-bold flex items-center justify-center">
	          					<span>
	          						<svg class="hi-solid hi-star inline-block w-5 h-5" fill="currentColor" viewBox="0 0 20 
	          						20" xmlns="http://www.w3.org/2000/svg">
	          							<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 
	          							00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 
	          							3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 
	          							2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 
	          							8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
	          					</span>
	          					2
	          					<span class="ml-1 border w-24 h-3 flex">
	          						<span class="score_bar bg-gray-500 h-full" style="width: ${point2}%;"></span>
	          					</span>
	          				</li>
	          				<li class="text-gray-500 font-bold flex items-center justify-center">
	          					<span>
	          						<svg class="hi-solid hi-star inline-block w-5 h-5" fill="currentColor" viewBox="0 0 20 
	          						20" xmlns="http://www.w3.org/2000/svg">
	          							<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 
	          							00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 
	          						3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 
	          							2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 
	          							8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
	          					</span>
	          					1
	          					<span class="ml-1 border w-24 h-3 flex">
	          						<span class="score_bar bg-gray-500 h-full" style="width: ${point1}%;"></span>
	          					</span>
	          				</li>
	          			</ul>
          			</div>
          			<div class="border-t-2 mt-4">
          				<h4 class="text-gray-500"><span class="font-bold">${reviewCount }</span>명이 평가함</h4>
          			</div>
          		</div> 
          		<div class="flex flex-col items-center justify-center w-3/4">
          			<div id="reviewMsg" class="flex items-center">
          				<h4 class="text-2xl text-gray-500 font-semibold p-4">이 책을 평가해주세요!</h4>
          			</div>
          			<div id="reviewRating" class="flex justify-center m-4 w-3/4 h-60">
          				<div class="flex justify-center container w-full h-full">
							<div class="flex justify-center feedback w-full h-full">
							  	<div class="point flex w-full justify-center overflow-hidden flex-row-reverse h-full
							  	relative">
							  		<input type="hidden" name="memberId" value="${loginMember.memberId }"/>
									<input type="radio" name="point" id="point-5" value="5" class="hidden"/>
									<label for="point-5"></label>
									<input type="radio" name="point" id="point-4" value="4" class="hidden"/>
									<label for="point-4"></label>
									<input type="radio" name="point" id="point-3" value="3" class="hidden"/>
									<label for="point-3"></label>
									<input type="radio" name="point" id="point-2" value="2" class="hidden"/>
									<label for="point-2"></label>
									<input type="radio" name="point" id="point-1" value="1" class="hidden"/>
									<label for="point-1"></label>
									<div class="emoji-wrapper">
								  		<div class="emoji">
											<svg class="point-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
												<circle cx="256" cy="256" r="256" fill="#ffd93b"/>
												<path d="M512 256c0 141.44-114.64 256-256 256-80.48 0-152.32-37.12-199.28-95.28 43.92 35.52 99.84 56.72 160.72 56.72 141.36 0 256-114.56 256-256 0-60.88-21.2-116.8-56.72-160.72C474.8 103.68 512 175.52 512 256z" fill="#f4c534"/>
												<ellipse transform="scale(-1) rotate(31.21 715.433 -595.455)" cx="166.318" cy="199.829" rx="56.146" ry="56.13" fill="#fff"/>
												<ellipse transform="rotate(-148.804 180.87 175.82)" cx="180.871" cy="175.822" rx="28.048" ry="28.08" fill="#3e4347"/>
												<ellipse transform="rotate(-113.778 194.434 165.995)" cx="194.433" cy="165.993" rx="8.016" ry="5.296" fill="#5a5f63"/>
												<ellipse transform="scale(-1) rotate(31.21 715.397 -1237.664)" cx="345.695" cy="199.819" rx="56.146" ry="56.13" fill="#fff"/>
												<ellipse transform="rotate(-148.804 360.25 175.837)" cx="360.252" cy="175.84" rx="28.048" ry="28.08" fill="#3e4347"/>
												<ellipse transform="scale(-1) rotate(66.227 254.508 -573.138)" cx="373.794" cy="165.987" rx="8.016" ry="5.296" fill="#5a5f63"/>
												<path d="M370.56 344.4c0 7.696-6.224 13.92-13.92 13.92H155.36c-7.616 0-13.92-6.224-13.92-13.92s6.304-13.92 13.92-13.92h201.296c7.696.016 13.904 6.224 13.904 13.92z" fill="#3e4347"/>
											</svg>
											<svg class="point-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
												<circle cx="256" cy="256" r="256" fill="#ffd93b"/>
												<path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
												<path d="M328.4 428a92.8 92.8 0 0 0-145-.1 6.8 6.8 0 0 1-12-5.8 86.6 86.6 0 0 1 84.5-69 86.6 86.6 0 0 1 84.7 69.8c1.3 6.9-7.7 10.6-12.2 5.1z" fill="#3e4347"/>
												<path d="M269.2 222.3c5.3 62.8 52 113.9 104.8 113.9 52.3 0 90.8-51.1 85.6-113.9-2-25-10.8-47.9-23.7-66.7-4.1-6.1-12.2-8-18.5-4.2a111.8 111.8 0 0 1-60.1 16.2c-22.8 0-42.1-5.6-57.8-14.8-6.8-4-15.4-1.5-18.9 5.4-9 18.2-13.2 40.3-11.4 64.1z" fill="#f4c534"/>
												<path d="M357 189.5c25.8 0 47-7.1 63.7-18.7 10 14.6 17 32.1 18.7 51.6 4 49.6-26.1 89.7-67.5 89.7-41.6 0-78.4-40.1-82.5-89.7A95 95 0 0 1 298 174c16 9.7 35.6 15.5 59 15.5z" fill="#fff"/>
												<path d="M396.2 246.1a38.5 38.5 0 0 1-38.7 38.6 38.5 38.5 0 0 1-38.6-38.6 38.6 38.6 0 1 1 77.3 0z" fill="#3e4347"/>
												<path d="M380.4 241.1c-3.2 3.2-9.9 1.7-14.9-3.2-4.8-4.8-6.2-11.5-3-14.7 3.3-3.4 10-2 14.9 2.9 4.9 5 6.4 11.7 3 15z" fill="#fff"/>
												<path d="M242.8 222.3c-5.3 62.8-52 113.9-104.8 113.9-52.3 0-90.8-51.1-85.6-113.9 2-25 10.8-47.9 23.7-66.7 4.1-6.1 12.2-8 18.5-4.2 16.2 10.1 36.2 16.2 60.1 16.2 22.8 0 42.1-5.6 57.8-14.8 6.8-4 15.4-1.5 18.9 5.4 9 18.2 13.2 40.3 11.4 64.1z" fill="#f4c534"/>
												<path d="M155 189.5c-25.8 0-47-7.1-63.7-18.7-10 14.6-17 32.1-18.7 51.6-4 49.6 26.1 89.7 67.5 89.7 41.6 0 78.4-40.1 82.5-89.7A95 95 0 0 0 214 174c-16 9.7-35.6 15.5-59 15.5z" fill="#fff"/>
												<path d="M115.8 246.1a38.5 38.5 0 0 0 38.7 38.6 38.5 38.5 0 0 0 38.6-38.6 38.6 38.6 0 1 0-77.3 0z" fill="#3e4347"/>
												<path d="M131.6 241.1c3.2 3.2 9.9 1.7 14.9-3.2 4.8-4.8 6.2-11.5 3-14.7-3.3-3.4-10-2-14.9 2.9-4.9 5-6.4 11.7-3 15z" fill="#fff"/>
											</svg>
											<svg class="point-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
												<circle cx="256" cy="256" r="256" fill="#ffd93b"/>
												<path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
												<path d="M336.6 403.2c-6.5 8-16 10-25.5 5.2a117.6 117.6 0 0 0-110.2 0c-9.4 4.9-19 3.3-25.6-4.6-6.5-7.7-4.7-21.1 8.4-28 45.1-24 99.5-24 144.6 0 13 7 14.8 19.7 8.3 27.4z" fill="#3e4347"/>
												<path d="M276.6 244.3a79.3 79.3 0 1 1 158.8 0 79.5 79.5 0 1 1-158.8 0z" fill="#fff"/>
												<circle cx="340" cy="260.4" r="36.2" fill="#3e4347"/>
												<g fill="#fff">
													<ellipse transform="rotate(-135 326.4 246.6)" cx="326.4" cy="246.6" rx="6.5" ry="10"/>
													<path d="M231.9 244.3a79.3 79.3 0 1 0-158.8 0 79.5 79.5 0 1 0 158.8 0z"/>
												</g>
												<circle cx="168.5" cy="260.4" r="36.2" fill="#3e4347"/>
												<ellipse transform="rotate(-135 182.1 246.7)" cx="182.1" cy="246.7" rx="10" ry="6.5" fill="#fff"/>
											</svg>
											<svg class="point-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
												<circle cx="256" cy="256" r="256" fill="#ffd93b"/>
												<path d="M407.7 352.8a163.9 163.9 0 0 1-303.5 0c-2.3-5.5 1.5-12 7.5-13.2a780.8 780.8 0 0 1 288.4 0c6 1.2 9.9 7.7 7.6 13.2z" fill="#3e4347"/>
												<path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
												<g fill="#fff">
													<path d="M115.3 339c18.2 29.6 75.1 32.8 143.1 32.8 67.1 0 124.2-3.2 143.2-31.6l-1.5-.6a780.6 780.6 0 0 0-284.8-.6z"/>
													<ellipse cx="356.4" cy="205.3" rx="81.1" ry="81"/>
												</g>
												<ellipse cx="356.4" cy="205.3" rx="44.2" ry="44.2" fill="#3e4347"/>
												<g fill="#fff">
													<ellipse transform="scale(-1) rotate(45 454 -906)" cx="375.3" cy="188.1" rx="12" ry="8.1"/>
													<ellipse cx="155.6" cy="205.3" rx="81.1" ry="81"/>
												</g>
												<ellipse cx="155.6" cy="205.3" rx="44.2" ry="44.2" fill="#3e4347"/>
												<ellipse transform="scale(-1) rotate(45 454 -421.3)" cx="174.5" cy="188" rx="12" ry="8.1" fill="#fff"/>
											</svg>
											<svg class="point-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
												<circle cx="256" cy="256" r="256" fill="#ffd93b"/>
												<path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
												<path d="M232.3 201.3c0 49.2-74.3 94.2-74.3 94.2s-74.4-45-74.4-94.2a38 38 0 0 1 74.4-11.1 38 38 0 0 1 74.3 11.1z" fill="#e24b4b"/>
												<path d="M96.1 173.3a37.7 37.7 0 0 0-12.4 28c0 49.2 74.3 94.2 74.3 94.2C80.2 229.8 95.6 175.2 96 173.3z" fill="#d03f3f"/>
												<path d="M215.2 200c-3.6 3-9.8 1-13.8-4.1-4.2-5.2-4.6-11.5-1.2-14.1 3.6-2.8 9.7-.7 13.9 4.4 4 5.2 4.6 11.4 1.1 13.8z" fill="#fff"/>
												<path d="M428.4 201.3c0 49.2-74.4 94.2-74.4 94.2s-74.3-45-74.3-94.2a38 38 0 0 1 74.4-11.1 38 38 0 0 1 74.3 11.1z" fill="#e24b4b"/>
												<path d="M292.2 173.3a37.7 37.7 0 0 0-12.4 28c0 49.2 74.3 94.2 74.3 94.2-77.8-65.7-62.4-120.3-61.9-122.2z" fill="#d03f3f"/>
												<path d="M411.3 200c-3.6 3-9.8 1-13.8-4.1-4.2-5.2-4.6-11.5-1.2-14.1 3.6-2.8 9.7-.7 13.9 4.4 4 5.2 4.6 11.4 1.1 13.8z" fill="#fff"/>
												<path d="M381.7 374.1c-30.2 35.9-75.3 64.4-125.7 64.4s-95.4-28.5-125.8-64.2a17.6 17.6 0 0 1 16.5-28.7 627.7 627.7 0 0 0 218.7-.1c16.2-2.7 27 16.1 16.3 28.6z" fill="#3e4347"/>
												<path d="M256 438.5c25.7 0 50-7.5 71.7-19.5-9-33.7-40.7-43.3-62.6-31.7-29.7 15.8-62.8-4.7-75.6 34.3 20.3 10.4 42.8 17 66.5 17z" fill="#e24b4b"/>
											</svg>
											<svg class="point-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
												<g fill="#ffd93b">
													<circle cx="256" cy="256" r="256"/>
													<path d="M512 256A256 256 0 0 1 56.8 416.7a256 256 0 0 0 360-360c58 47 95.2 118.8 95.2 199.3z"/>
												</g>
												<path d="M512 99.4v165.1c0 11-8.9 19.9-19.7 19.9h-187c-13 0-23.5-10.5-23.5-23.5v-21.3c0-12.9-8.9-24.8-21.6-26.7-16.2-2.5-30 10-30 25.5V261c0 13-10.5 23.5-23.5 23.5h-187A19.7 19.7 0 0 1 0 264.7V99.4c0-10.9 8.8-19.7 19.7-19.7h472.6c10.8 0 19.7 8.7 19.7 19.7z" fill="#e9eff4"/>
												<path d="M204.6 138v88.2a23 23 0 0 1-23 23H58.2a23 23 0 0 1-23-23v-88.3a23 23 0 0 1 23-23h123.4a23 23 0 0 1 23 23z" fill="#45cbea"/>
												<path d="M476.9 138v88.2a23 23 0 0 1-23 23H330.3a23 23 0 0 1-23-23v-88.3a23 23 0 0 1 23-23h123.4a23 23 0 0 1 23 23z" fill="#e84d88"/>
												<g fill="#38c0dc">
													<path d="M95.2 114.9l-60 60v15.2l75.2-75.2zM123.3 114.9L35.1 203v23.2c0 1.8.3 3.7.7 5.4l116.8-116.7h-29.3z"/>
												</g>
												<g fill="#d23f77">
													<path d="M373.3 114.9l-66 66V196l81.3-81.2zM401.5 114.9l-94.1 94v17.3c0 3.5.8 6.8 2.2 9.8l121.1-121.1h-29.2z"/>
												</g>
												<path d="M329.5 395.2c0 44.7-33 81-73.4 81-40.7 0-73.5-36.3-73.5-81s32.8-81 73.5-81c40.5 0 73.4 36.3 73.4 81z" fill="#3e4347"/>
												<path d="M256 476.2a70 70 0 0 0 53.3-25.5 34.6 34.6 0 0 0-58-25 34.4 34.4 0 0 0-47.8 26 69.9 69.9 0 0 0 52.6 24.5z" fill="#e24b4b"/>
												<path d="M290.3 434.8c-1 3.4-5.8 5.2-11 3.9s-8.4-5.1-7.4-8.7c.8-3.3 5.7-5 10.7-3.8 5.1 1.4 8.5 5.3 7.7 8.6z" fill="#fff" opacity=".2"/>
											</svg>
								  		</div>
									</div>
							  	</div>
							</div>
						</div>
          			</div>
          			<!-- 작성한 리뷰가 없을경우 컨테이너 -->
          			<div id="reviewContainer" class="m-4">
	          			<textarea rows="10" cols="100" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 삭제처리 될 수 있습니다."
	          			class="border-4 rounded-lg" id="reviewContent" style="resize:none;"></textarea>
	          			<div class="flex justify-end mt-2">
		          			<button type="button" class="bg-red-500 text-gray-100 rounded tracking-wide font-semibold 
						    focus:outline-none focus:shadow-outline hover:bg-red-600 cursor-pointer 
						    transition ease-in duration-300 w-32 h-8" onclick="fn_book_bookReviewInsert(event);">리뷰 남기기</button>
					    </div>
          			</div>
          			<!-- 작성한 리뷰가 있을경우 컨테이너 -->
	          		<div id="reviewContainer2" class="hidden flex flex-col m-4 w-full bg-gray-200 p-4">
	          			<div class="mb-4 flex">
	          				<div class="w-3/4"><p>${reviewCheck.reviewDate }</p></div>
	          				<div class="w-1/4 flex justify-end">
	          					<!-- 리뷰수정 -->
	          					<button type="button" id="reviewDelete" onclick="fn_book_bookReviewUpdate();">
		          					<svg class="hi-solid hi-pencil inline-block w-5 h-5" fill="currentColor" 
			          				viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
				          				<path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 
				          				5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
		          					</svg>
	          					</button>
	          					&nbsp;&nbsp;
	          					<!-- 리뷰삭제 -->
	          					<button type="button" id="reviewUpdate" onclick="fn_book_bookReviewDelete();">
		          					<svg class="hi-solid hi-trash inline-block w-5 h-5" fill="currentColor" 
		          					viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
		          						<path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 
		          						2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 
		          						0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"/>
		          					</svg>
	          					</button>
	          				</div>
	          			</div>
	          			<div>
	          				<p>${reviewCheck.reviewContent }</p>
	          			</div>    		
		          	</div>
		          	<div id="reviewContainer3" class="hidden m-4">
	          			<textarea rows="10" cols="100" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 삭제처리 될 수 있습니다."
	          			class="border-4 rounded-lg" id="reviewUpdateContent" style="resize:none;">${reviewCheck.reviewContent }</textarea>
	          			<div class="flex justify-end mt-2">
	          				<button type="button" class="bg-white text-gray-500 rounded tracking-wide font-semibold border
						    focus:outline-none focus:shadow-outline hover:bg-red-600 hover:text-gray-100 cursor-pointer 
						    transition ease-in duration-300 w-20 h-8" onclick="fn_book_bookReviewUpdateCancel();">취소</button>
						    &nbsp;
		          			<button type="button" class="bg-red-500 text-gray-100 rounded tracking-wide font-semibold 
						    focus:outline-none focus:shadow-outline hover:bg-red-600 cursor-pointer 
						    transition ease-in duration-300 w-32 h-8" onclick="fn_book_bookReviewUpdateEnd();">리뷰 수정</button>
					    </div>
          			</div>
          		</div>
          	</div>
          	<div class="flex flex-col justify-center m-8 p-8 border-t-4">
	          	<c:if test="${empty review }">
	          		<div class="flex text-xl font-bold m-4 justify-center">
						<h2>아직 등록된 리뷰가 없습니다.<br/>첫 번째 리뷰를 남겨주세요!</h2>
					</div>
	          	</c:if>
	          	<c:if test="${not empty review }">
	          		<c:forEach items="${review }" var="r">
	          			<div class="flex h-50 w-full border-b-2">
		          			<div class="w-1/4 my-4">
			          			<div class="flex">
			          				<c:if test="${r.point==1 }">
					        			<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
					        			<c:forEach begin="0" end="3">
					        				<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
					        			</c:forEach>
					        		</c:if>
					        		<c:if test="${r.point==2 }">
						        	<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
						        	<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
					        		<c:forEach begin="0" end="2">
					        			<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
					        		</c:forEach>
					        			</c:if>
					        		<c:if test="${r.point==3 }">
					        			<c:forEach begin="0" end="2">
					        				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
					        			</c:forEach>
					        			<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
					        			<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
					        		</c:if>
					        		<c:if test="${r.point==4 }">
					        			<c:forEach begin="0" end="3">
					        				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1">
					        			</c:forEach>
					        			<img src="${path}/resources/img/star_off.png" alt="" class="w-4 h-4 mr-1">
					        		</c:if>
					        		<c:if test="${r.point==5 }">
					        			<c:forEach begin="0" end="4">
					        				<img src="${path}/resources/img/star_on.png" alt="" class="w-4 h-4 mr-1" >
					        			</c:forEach>
					        		</c:if>
			          			</div>
			          			<div class="font-semibold">
			          				${fn:substring(r.memberId,0,3) }***
			          			</div>
			          			<div class="text-gray-500">
			          				${r.reviewDate }
			          			</div>
			          		</div>
			          		<div class="w-3/4 my-4">
			          			${r.reviewContent }
			          		</div>
		          		</div>
	          		</c:forEach>	          		
	          	</c:if>    
          	</div>	
        </div>
	</div>
</section>
<script>
	function request(no){
		if('${loginMember.memberId}'==''){
			alert('로그인후 이용이 가능합니다.');
			location.assign('${path}/member/memberLogin.do');
		}else{
			if(confirm("입고요청을 하시겠습니까?")){
				$.get("${path}/admin/bookRequestMemberCheck?no="+no+"&memberId=${loginMember.memberId}",data=>{
					alert(data);
				})
			}
		}
	}

	let quant = 1;
	window.addEventListener("load",function(){
		var price = Number($("#bookCost").val());
		//적립금
		$("#savings").html(price/50);
		//총가격
		$("#sumPrice").html(price);
		$("input[type=number]").change(e=>{
			if($(e.target).val()==0){
				alert("최소 1권 이상이어야 합니다");
				$(e.target).val("1");
			}else{
			quant = Number($(e.target).val());
			var resultPrice= price * Number($(e.target).val());
			$("#sumPrice").html(resultPrice);
				
			}
		});
	});
	
	function goCart(){
		if('${loginMember.memberId}'==''){
			alert('로그인후 이용이 가능합니다.');
			location.assign('${path}/member/memberLogin.do');
		}else{
			var bookCode = $("input[name=bookCode]").val();
			//매핑 주소 AdminController에 있습니다 충돌 날까봐 일단 뒀어요
			$.get("${path}/cartInsert.do?bookCode="+bookCode+"&quant="+quant,data=>{
				if(data){
					if(confirm("장바구니에 담겼습니다. 이동하시겠습니까?")){
						location.assign("${path}/member/cartList.do");
					}
				}else{
					alert("장바구니 왜 실패지?");
				}	
			});
		}
	
	}
	
	//책 찜등록/삭제
	function fn_book_bookHeart(e){
		if('${loginMember.memberId}'==''){
			alert('로그인후 이용이 가능합니다.');
			location.assign('${path}/member/memberLogin.do');
		}else{
			if($("#heartBtn").hasClass('text-red-500')){
				//이미 찜이 되어있을경우
				if(confirm("찜목록에서 제거하시겠습니까?")){
					$.ajax({
						type:"post",
						url:"${path}/book/bookHeartDelete.do",
						data:{
							"memberId":'${loginMember.memberId}',
							"bookCode":'${bookInfo.bookCode}'
						},
						success:data=>{
							if(data=>0){
								alert('찜목록에서 제거되었습니다.');
								location.reload();
							}else{
								alert('찜목록 제거를 실패했습니다. 관리자에게 문의하세요.');
							}
						}
					});
				}
			}else{
				//찜이 되어있지 않을경우
				$.ajax({
					type:"post",
					url:"${path}/book/bookHeartInsert.do",
					data:{
						"memberId":'${loginMember.memberId}',
						"bookCode":'${bookInfo.bookCode}'
					},
					success:data=>{
						if(data>0){
							if(confirm("찜목록에 등록되었습니다. 찜목록 페이지로 이동하시겠습니까?")){
								location.replace("${path}/member/memberHeartList.do");
							}else{
								location.reload();
							}	
						}else{
							alert('찜목록에 등록을 실패했습니다. 관리자에게 문의하세요.');
						}
					}
				});
			}	
		}
	}
	
<<<<<<< HEAD
	const fn_directPayment=()=>{
		const bookCode=$("input[name='bookCode']").val();
		const bookAmount=$("#bookAmount").val()
		location.replace("${path}/order/directPayment.do?bookCode="+bookCode+"&bookAmount="+bookAmount);
	}
=======
	//리뷰 쓰기전 로그인 확인
	function fn_book_bookReviewInsert(e){
		if(${loginMember.memberId!=null}){ //로그인이 되어있을경우
			let pointCheck=$("input[name=point]");
			let point;
			$("input[name=point]").each(function(){ //radio name이 point인 것을 순회해서 체크드인거 찾기
				if($(this).is(":checked")){
					point=$(this).val();
				}
			});
			$.ajax({
				type:"post",
				url:"${path}/book/bookReviewInsert.do",
				data:{
					"memberId":'${loginMember.memberId}',
					"bookCode":${bookInfo.bookCode},
					"point":point,
					"reviewContent":$("#reviewContent").val()
				},
				success:data=>{
					if(data>0){
						alert('리뷰등록에 성공했습니다.');
						location.reload();
					}else{
						alert('리뷰등록에 실패했습니다. 관리자에게 문의하세요.');
					}
				}
			});
		}else{
			if(confirm('로그인해야 이용이 가능합니다. 로그인페이지로 이동 하시겠습니까?')){
				location.assign("${path}/member/memberLogin.do");
			}
		}
	}
	
	//이미 리뷰를 달았을경우
	$(function reviewCheck(){ 
		if(${not empty reviewCheck}){
			$("input[name=point]").each(function(){ //radio name이 point인 것을 순회해서 체크드인거 찾기
				if($(this).val()=='${reviewCheck.point}'){
					console.log($(this));
					$(this).attr("checked",true);
				}
			});
			$("#reviewContainer").hide();
			$("#reviewMsg").hide();
			$("#reviewContainer2").show();
		}else{
			$("#reviewContainer").show();
			$("#reviewMsg").show();
			$("#reviewContainer2").hide();
		}
	});
	
	//리뷰 수정
	function fn_book_bookReviewUpdate(){
		$("#reviewContainer3").show();
		$("#reviewContainer2").hide();
	}
	function fn_book_bookReviewUpdateCancel(){
		$("#reviewContainer2").show();
		$("#reviewContainer3").hide();
	}
	function fn_book_bookReviewUpdateEnd(){
		let pointCheck=$("input[name=point]");
		let point;
		$("input[name=point]").each(function(){ //radio name이 point인 것을 순회해서 체크드인거 찾기
			if($(this).is(":checked")){
				point=$(this).val();
			}
		});
		$.ajax({
			type:"post",
			url:"${path}/book/bookReviewUpdate.do",
			data:{
				"memberId":'${loginMember.memberId}',
				"bookCode":${bookInfo.bookCode},
				"point":point,
				"reviewContent":$("#reviewUpdateContent").val()
			},
			success:data=>{
				if(data>0){
					location.reload();
				}else{
					alert('리뷰등록에 실패했습니다. 관리자에게 문의하세요.');
				}
			}
		});
	}
	
	//리뷰 삭제
	function fn_book_bookReviewDelete(){
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${path}/book/bookReviewDelete.do",
				data:{
					"memberId":'${loginMember.memberId}',
					"bookCode":${bookInfo.bookCode},
				},
				success:data=>{
					if(data>0){
						location.reload();
					}else{
						alert('리뷰삭제에 실패했습니다. 관리자에게 문의하세요.');
					}
				}
			});
		}
	}
	
>>>>>>> branch 'main' of https://github.com/gwahyun/21PM_POTSTAND_final.git
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>