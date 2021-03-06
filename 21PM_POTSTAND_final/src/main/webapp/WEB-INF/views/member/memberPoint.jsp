<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
        			<h3 class="text-2xl font-semibold">적립금</h3>
        		</div>
        		<c:if test="${empty list }">
        			<div class="flex justify-center mt-5">
        				<h3 class="text-lg font-bold">적립금 적립/사용 내역이 없습니다.</h3>
        			</div>
        		</c:if>
        		<c:if test="${not empty list}">
        			<div class="flex w-full flex-col justify-center mt-5">
        				<h2 class="mb-2">
	        				잔여 적립금 : <span class="text-blue-500 font-semibold text-xl">${totalPoint }</span> point
	        			</h2>
        			</div>
	        		<div class="flex w-full flex-col justify-center border" >
	        			<div class="flex">
	        				<div class="w-1/4 border h-11 p-2 bg-red-100 flex justify-center items-center">
	        					<h3 class="text-lg font-bold">날짜</h3>
		        			</div>
		        			<div class="w-2/4 border h-11 p-2 bg-red-100 flex justify-center items-center">
		        				<h3 class="text-lg font-bold">내용</h3>
		        			</div>
		        			<div class="w-1/4 border h-11 p-2 bg-red-100 flex justify-center items-center">
	        					<h3 class="text-lg font-bold">사용/적립 포인트</h3>
		        			</div>
	        			</div>
	        			<c:forEach items="${list }" var="p">
	        				<c:if test="${p.point!=0 }">
			        			<div class="flex">
			        				<div class="w-1/4 border p-2 flex justify-center items-center">
			        					<h4>${p.useDate }</h4>
				        			</div>
				        			<div class="w-2/4 border p-2 flex justify-center items-center">
				        				<h4>${p.payment.name} ${p.useLog }</h4>
				        			</div>
				        			<div class="w-1/4 border p-2 flex justify-center items-center">
				        				<c:if test="${fn:contains(p.useLog,'사용') }">
				        					<h4>-${p.point }</h4>		
				        				</c:if>
			        					<c:if test="${fn:contains(p.useLog,'적립') }">
				        					<h4>+${p.point }</h4>
				        				</c:if>
				        			</div>
			        			</div>
		        			</c:if>
	        			</c:forEach>
	        		</div>     	
        			<div class="pageBar flex my-5">${pageBar}</div>
        		</c:if>
			</div>
		</div>
    </section>
    <script>
    	
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>