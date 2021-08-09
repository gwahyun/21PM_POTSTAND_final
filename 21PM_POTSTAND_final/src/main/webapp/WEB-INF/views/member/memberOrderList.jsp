<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	#menu div {
	    position: relative;
	    display: inline-block;
	}
	.arrow {
	    display: block;
	    padding: 2px 16px;
	    cursor: pointer;
	}
	.arrow_box {
	  margin-left: 50%;
	  display: none;
	  position: absolute;
	  width: auto;
	  padding: 8px;
	  left: -150px;
	  -webkit-border-radius: 8px;
	  -moz-border-radius: 8px;  
	  border-radius: 8px;
	  background: #333;
	  color: #fff;
	  font-size: 14px;
	}
	.arrow_box:after {
	  position: absolute;
	  bottom: 100%;
	  left: 50%;
	  width: 0;
	  height: 0;
	  margin-left: -10px;
	  border: solid transparent;
	  border-color: rgba(51, 51, 51, 0);
	  border-bottom-color: #333;
	  border-width: 10px;
	  pointer-events: none;
	  content: " ";
	}
	.arrow:hover + p.arrow_box {
	  display: block;
	}
</style>
<section class="text-gray-600 body-font overflow-hidden">
     <div class="container p-5 mx-auto flex justify-start">
        	<div class="w-1/4 h-full py-8">
        	 <h1 class="sm:text-3xl
            text-2xl
            font-medium
            title-font
            mb-2
            text-gray-900"><a href="${path}/member/memberMypage.do">마이페이지</a></h1>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>개인</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="${path}/notice/noticeSelectList.do">고객센터</a></li>
			                <li class="py-2"><a href="${path}/member/memberCheckPwd.do">정보변경</a></li>
			                <li class="py-2"><a href="${path}/member/cartList.do">장바구니</a></li>
			                <li class="py-2"><a href="${path}/member/memberHeartList.do">찜 목록</a></li>
			                <li class="py-2"><a href="${path }//member/memberMyReview.do">내 리뷰 관리</a></li>
			            </ul>
	            	</div>
	            </div>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>구매/혜택</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="${path}/member/memberOrderListSelect.do">주문목록/배송조회</a></li>
			                <li class="py-2"><a href="${path}/member/memberCouponListSelect.do">쿠폰</a></li>
			                <li class="py-2"><a href="${path}/member/memberPoint.do">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
        	<div class="w-3/4 h-full px-5 py-8 flex flex-col content-center">
        		<div class="w-full">
        			<h3 class="text-2xl font-semibold">주문목록/배송조회</h3>
        		</div>
	        	<c:if test="${empty list }">
        			<div class="flex justify-center mt-5">
        				<h3 class="text-lg font-bold">주문 내역이 없습니다.</h3>
        			</div>
        		</c:if>
	        	<c:if test="${not empty list}">
	        		<div class="flex w-full flex-col justify-center border mt-5">
	        			<div class="flex">
	        				<div class="w-1/12 border h-11 p-2 bg-red-100 flex justify-center items-center">
	        					<h3 class="text-base font-extrabold">주문번호</h3>
		        			</div>
		        			<div class="w-4/12 border h-11 p-2 bg-red-100 flex justify-center items-center">
		        				<h3 class="text-base font-extrabold">상품이름</h3>
		        			</div>
		        			<div class="w-1/12 border h-11 p-2 bg-red-100 flex justify-center items-center">
	        					<h3 class="text-base font-extrabold">수령인</h3>
		        			</div>
		        			<div class="w-2/12 border h-11 p-2 bg-red-100 flex justify-center items-center">
	        					<h3 class="text-base font-extrabold">금액</h3>
		        			</div>
		        			<div class="w-2/12 border h-11 p-2 bg-red-100 flex justify-center items-center">
	        					<h3 class="text-base font-extrabold">주문일</h3>
		        			</div>
		        			<div class="w-1/12 border h-11 p-2 bg-red-100 flex justify-center items-center">
	        					<h3 class="text-base font-extrabold">상태</h3>
		        			</div>
		        			<div class="w-1/12 border h-11 p-2 bg-red-100 flex justify-center items-center">
	        					<h3 class="text-base font-extrabold">-</h3>
		        			</div>
	        			</div>
	        			<c:forEach items="${list }" var="p">	
		        			<div class="flex">
			        			<div class="w-1/12 border p-2 flex justify-center items-center">
			        				<h4>${p.paymentNo }</h4>
				        		</div>
				        		<div id="menu" class="w-4/12 border p-2 flex justify-center items-center">
				        			<div id="menu">
										<div> 
											<span class="arrow">${p.name }</span>
											<p class="arrow_box">
												<c:forEach items="${p.paymentObj}" var="po">
													${po.book.bookTitle} ${po.bookAmount }권<br>
												</c:forEach>
											</p>
										</div>
									</div>
				        		</div>
				        		<div class="w-1/12 border p-2 flex justify-center items-center">
				        			<h4>${p.receiverName }</h4>
				        		</div>
				        		<div class="w-2/12 border p-2 flex justify-center items-center">
				        			<h4><fmt:formatNumber type="currency" value="${p.amount }"></fmt:formatNumber></h4>
				        		</div>
				        		<div class="w-2/12 border p-2 flex justify-center items-center">
				        			<h4>${p.payDate }</h4>
				        		</div>
				        		<div class="w-1/12 border p-2 flex justify-center items-center">
				        			<h4>${p.orderState }</h4>
				        		</div>
				        		<div class="w-1/12 border p-2 flex justify-center items-center">
				        			<c:if test="${p.orderState eq '결제완료' }">
					        			<button type="button" class="bg-red-500 text-gray-100 rounded-sm tracking-wide px-0.5 
					        			font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg 
					        			transition ease-in duration-300" onclick="fn_memberOrderList_orderCancel(event);">
					        				결제취소
					        			</button>
					        			<input type="hidden" value="${p.paymentNo }"/>
				        			</c:if>
				        			<c:if test="${p.orderState ne '결제완료' }">
				        				-
				        			</c:if>
				        		</div>
			        		</div>
	        			</c:forEach>
	        		</div>     	
        			<div class="pageBar flex my-5">${pageBar}</div>
        		</c:if>
			</div>
		</div>
    </section>
    <script>
    	function fn_memberOrderList_orderCancel(e){
    		if(confirm('정말로 결제를 취소하시겠습니까?')){
    			console.log($(e.target).next().val());
    			$.ajax({
    				type:"post",
    				url:"${path}/member/memberOrderListDelete.do",
    				data:{
    					"paymentNo":$(e.target).next().val()
    				},
    				success:data=>{
    					if(data){
    						alert('결제가 취소되었습니다.');
    						location.reload();
    					}else{
    						alert('결제를 취소하지 못했습니다. 관리자에게 문의하세요.');
    					}
    				}
    			});
    		}
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>