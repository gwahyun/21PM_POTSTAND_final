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
            <div class="cart-list w-8/12">
                <button 
                	class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-3 px-5 m-3 
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				text-base 
	          				mt-4 md:mt-0" 
	          		onclick="">
	          		전체선택
	          		</button>

                <!-- 카트 항목 -->
                <div class="cart-obj flex m-8 border-t border-b border-solid border-gray-400 py-3">
                    <input type="checkbox">
                    <div class="img-area"><img src=""></div>
                    <div class="obj-info">
                        <h2>책 제목</h3>
                        <h4>저자</h4>
                        <button>삭제</button>
                    </div>
                    <div class="price">
                        <h3>20,000원</h3>
                        <h2>18,000원</h2>
                    </div>
                </div>
            </div>
            <div class="buy-container w-4/12">
                <div class="cart-cost">
                    <div id="sum-cost" class="li">
                        <h3>총 상품 금액</h3>
                        <h3>100,000원</h3>
                    </div>
                    <div id="sale-cost" class="li">
                        <h3>할인 금액</h3>
                        <h3>-30,000원</h3>
                    </div>
                    <div id="send-cost" class="li">
                        <h3>배송비</h3>
                        <h3>-3,000원</h3>
                    </div>
                    <div id="total" class="li">
                        <h3>합계</h3>
                        <h3>97,000원</h3>
                    </div>
                </div>
                <div class="buy-button">
                    구매하기
                </div>
            </div>
        </div>
        <div class="button-area">
            <button class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-3 px-5 m-3 
                			focus:outline-none 
                			hover:bg-red-200 
	          				hover:text-white rounded 
	          				text-base 
	          				mt-4 md:mt-0" 
	          		onclick="">선택삭제</button>
            <button class="inline-flex items-center 
                			bg-gray-300 
                			border border-solid border-gray-400 
                			py-3 px-5 m-3 
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
</html>