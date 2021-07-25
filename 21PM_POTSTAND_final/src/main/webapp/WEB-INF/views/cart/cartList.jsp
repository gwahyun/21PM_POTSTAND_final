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
	          		onclick="">
	          		전체선택
	          		</button>

                <!-- 카트 항목 -->
                <div class="cart-obj 
                		flex m-3 py-6 
                		border-t border-b border-solid border-gray-400 
                		items-center">
                    <input type="checkbox" name="cartNo" value="" class="ml-3">
                    <div class="img-area w-2/12 h-36 mx-5"><img src="" class="w-full"></div>
                    <div class="obj-info ml-6 w-4/12">
                        <h2 class="my-3 text-2xl font-bold">책 제목</h3>
                        <h4 class="my-3 text-xl font-medium">저자</h4>
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
                        <h3 class="ori_price m-3 text-xl text-right font-medium font-bold">20,000원</h3>
                        <h2 class="dis_price m-3 text-xl text-right font-medium font-bold mb-3">18,000원</h2>
                        <label class="coupon text-l font-bold mb-2 block">사용 가능 쿠폰</label>
                        	<select class="w-full border border-solid border-gray-400 " name="eventTitle">
                        	<!-- if로 coupon 있으면 option 추가 없으면 없음 표시하게 --> 
                        	<option value="">대충 30% 할인권</option>
                        </select>
                        
                    </div>
                </div>
                
                
            </div>
            
            <!-- 가격표시창 -->
            <div class="buy-container w-4/12 border border-solid border-blue-400 items-center sticky relative top-0 h-80">
                <div class="cart-cost mb-8">
                    <div id="sum-cost" class="li flex">
                        <h3 class="my-3 text-xl font-semibold mx-3 w-5/12">총 상품 금액</h3>
                        <h3 class="my-3 text-xl font-semibold ml-10 w-5/12">100,000원</h3>
                    </div>
                    <div id="sale-cost" class="li flex bg-blue-300">
                        <h3 class="my-3 text-xl font-semibold mx-3 w-5/12">할인 금액</h3>
                        <h3 class="my-3 text-xl font-semibold ml-10 w-5/12">-30,000원</h3>
                    </div>
                    <div id="send-cost" class="li flex">
                        <h3 class="my-3 text-xl font-semibold mx-3 w-5/12">배송비</h3>
                        <h3 class="my-3 text-xl font-semibold ml-10 w-5/12">3,000원</h3>
                    </div>
                    <div id="total" class="li flex bg-green-300">
                        <h3 class="my-3 text-xl font-bold mx-3 w-5/12">합계</h3>
                        <h3 class="my-3 text-xl font-bold ml-10 w-5/12">97,000원</h3>
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
	function fn_allCheck(){
		
	}
</script>
</html>