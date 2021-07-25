<%@page language="java" contentType="text/html; charset=UTF-8"  
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <section class="mx-80">
        <div><h1 class="text-4xl font-bold m-5 text-center">장바구니</h1></div>
        <div class="content-container flex">
            <div class="cart-list w-8/12 mx-4 border border-solid border-gray-400 p-4">
                <button 
                	class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			p-2
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				text-base 
	          				mt-4 md:mt-0" 
	          		onclick="fn_allCheck(event);">
	          		전체선택
	          		</button>
	          		
	          		
	          	<!-- 카트 내용 출력 -->	
				<c:forEach var="cart" items="${cartList}">
	                <!-- 카트 항목 -->
	                <div class="cart-obj 
	                		flex m-3 py-6 
	                		border-t border-b border-solid border-gray-400 
	                		items-center">
	                    <input type="checkbox" name="cartNo" value="${cart.cartNo}" class="ml-3">
	                    	<div class="img-area w-2/12 h-36 mx-5"><img src="${cart.book.bookCover}" class="w-full"></div>
	                    <div class="obj-info ml-6 w-4/12">
	                        <h2 class="my-3 text-2xl font-bold"><c:out value="${cart.book.bookTitle}"/></h3>
	                        <h4 class="my-3 text-xl font-medium"><c:out value="${cart.book.bookWriter}"/></h4>
	                        <button class="inline-flex items-center 
	                			bg-gray-300 
	                			border border-solid border-gray-400 
	                			py-1 px-2 mb-3 
	                			focus:outline-none 
	                			hover:bg-red-200 
		          				hover:text-white rounded 
		          				text-base 
		          				mt-4 md:mt-0" 
		          		onclick="">삭제</button>
	                    </div>
	                    <div class="price ml-6 w-4/12">
	                        <h3 class="ori-price m-3 text-xl text-right font-medium font-bold"><c:out value="${cart.book.bookCost}"/></h3>
	                        <h2 class="dis-price m-3 text-xl text-right font-medium font-bold mb-3"></h2>
	                        <c:choose>
		                        <c:when test="${empty cart.coupon or cart.coupon.endCheck eq 'Y'}">
		                        	<label class="coupon text-l font-bold mb-2 block">사용 가능한 쿠폰이 없습니다.</label>
		                        </c:when>
		                        <c:otherwise>
			                        <label class="coupon text-l font-bold mb-2 block">사용 가능 쿠폰</label>
			                        	<input type="checkBox" class="eventTitle w-full border border-solid border-gray-400 " name="couponNo" value="${cart.coupon.couponNo}">
			                        	<input type="hidden" name="dis-ratio" value="${cart.coupon.discount}"> 
			                        	<c:out value="${cart.coupon.event.eventTitle}"/>
		                        </c:otherwise>
	                        </c:choose>
	                    </div>
	                </div>
                </c:forEach>
                <!-- 쿠폰 로직+구조 바꿔야될거같은데..? 한 책에 적용 가능한 쿠폰이 여러개일수도 있는데???(Event 중복)?
                	 한개 쿠폰으로 여러책을 적용해버리는 문제-> 장바구니에서 체크/select 하면 나머지 disable처리?? ajax??
                	 
                	   -->
            </div>
            
            <!-- 가격표시창 -->
            <div class="buy-container w-4/12 border border-solid border-blue-400 items-center sticky relative top-0 h-80">
                <div class="cart-price mb-8">
                    <div id="sum-price" class="li flex">
                        <h3 class="my-3 text-xl font-semibold mx-3 w-5/12">총 상품 금액</h3>
                        <h3 class="money my-3 text-xl font-semibold ml-10 w-5/12"></h3>
                    </div>
                    <div id="sale-cost" class="li flex bg-blue-300">
                        <h3 class="my-3 text-xl font-semibold mx-3 w-5/12">할인 금액</h3>
                        <h3 class="money my-3 text-xl font-semibold ml-10 w-5/12"></h3>
                    </div>
                    <div id="send-cost" class="li flex">
                        <h3 class="my-3 text-xl font-semibold mx-3 w-5/12">배송비</h3>
                        <h3 class="money my-3 text-xl font-semibold ml-10 w-5/12">3,000원</h3>
                    </div>
                    <div id="total" class="li flex bg-green-300">
                        <h3 class="my-3 text-xl font-bold mx-3 w-5/12">합계</h3>
                        <h3 class="money my-3 text-xl font-bold ml-10 w-5/12"></h3>
                    </div>
                </div>
                <button class="buy-button
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-2 px-2 
                			w-full
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				font-bold
	          				mt-4 md:mt-0" 
	          		onclick="">
                    구매하기
                </button>
            </div>
        </div>
        <div class="button-area m-4">
            <button class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-2 px-2 m-3
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				text-base 
	          				mt-4 md:mt-0" 
	          		onclick="">선택삭제</button>
            <button class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-2 px-2 m-3
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				text-base 
	          				mt-4 md:mt-0" 
	          		onclick="">전체삭제</button>
        </div>
    </section>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	function fn_priceCalc(){
		//책 원래가격
		let oriPrice=$(".ori-price").text();
		//책 할인가격
		let disPrice=$(".dis-price").text();
		
		console.log(oriPrice);
		//전체 합
		let sumPrice=0;
		oriPrice.forEach(function(v,oriPrice){
			v.trim();
			sumPrice+=v;
		});
		
		//할인가격
		let totalDiscount=0;
		for(let i=0;i<oriPrice.length;i++){
			totalDiscount+=(oriPrice[i]-disPrice[i]);
		}
		
		
		//배송비...3000원 고정인데 나중에 로직을 추가하던가 뭐
		
		//
		
		//결제금액
		let totalPrice=sumPrice-totalDiscount+3000;
		
		//text 수정
			$("#sum-price>.money").text(sumPrice);
			$("#sale-price>.money").text("-"+salePrice);
			
			$("#total-price>.money").text(totalPrice);
		
	}

	const fn_allCheck=(e)=>{
		let str = $(e.target).text().trim();
		if(str=='전체선택'){
			$("input[name='cartNo']").prop("checked", true);
			$(e.target).text('전체해제');
		}else{
			$("input[name='cartNo']").prop("checked", false);
			$(e.target).text('전체선택');
		}
	};
	
	
	
	$(document).ready(fn_priceCalc());
</script>
</html>