<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${loginMember}" name="loginMember"/>
</jsp:include>
<section class="text-gray-600 body-font overflow-hidden">
	<!-- 페이지 컨테이너 시작 -->
	<div class="container px-5 py-10 mx-auto">
		<!-- 책 상세 상단 시작 -->
        <div class="lg:w-4/5 mx-auto flex flex-wrap">
			<img alt="ecommerce" class="lg:w-1/2 w-full lg:h-auto h-64 object-cover object-center rounded" 
          	src="<c:out value='${bookInfo.getBookCover()}'/>"/>
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
                    			<input type="number" value="1">
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
              		<button class="flex text-white bg-red-500 border-0 py-5 px-10 focus:outline-none hover:bg-red-600 
              		rounded text-xl">구매하기</button>
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
          	<c:if test="${review!=null}">
          	<!-- review 보여주고 쓰는 화면 -->
          	</c:if>
        </div>
	</div>
</section>
<script>
	let quant = 0;
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
							alert('찜목록에 등록되었습니다.');
							location.reload();
						}else{
							alert('찜목록에 등록을 실패했습니다. 관리자에게 문의하세요.');
						}
					}
				});
			}	
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>