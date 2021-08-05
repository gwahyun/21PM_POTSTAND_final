<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			                <li class="py-2"><a href="#">주문목록/배송조회</a></li>
			                <li class="py-2"><a href="${path}/member/memberCouponListSelect.do">쿠폰</a></li>
			                <li class="py-2"><a href="${path}/member/memberPoint.do">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
        	<div class="w-3/4 h-full px-5 py-8 flex flex-col content-center">
        		<div class="w-full">
        			<h3 class="text-2xl font-semibold">쿠폰</h3>
        		</div>
        		<div class="flex w-full mt-5 border-b-4 mb-5">
        			<div class="h-full border-b-4 border-opacity-0 hover:border-opacity-100 hover:border-gray-500">
			        	<h2 class="mb-2 text-gray-500 font-semibold text-xl">
			        		<a href="${path}/member/memberCouponListSelect.do">
			        			사용가능<span class="text-blue-500">${totalData }</span>
			        		</a>
			        	</h2>
		        	</div>
		        	<div class="w-6"></div>
		        	<div class="border-b-4 border-red-500">
			        	<h2 class="mb-2 font-semibold text-xl">
			        		<a href="${path}/member/memberEndCouponListSelect.do">
			        			기간만료
			        		</a>
			        	</h2>
		        	</div>
	        	</div>
	        	<c:if test="${empty list}">
        			<div class="flex justify-center mt-5">
        				<h3 class="text-lg font-bold">기간만료된 쿠폰이 없습니다.</h3>
        			</div>
        		</c:if>
	        	<c:if test="${not empty list}">
	        		<div class="flex w-full flex-col justify-center border">
	        			<div class="flex">
	        				<div class="w-1/5 border h-11 p-2 bg-red-100 flex justify-center">
	        					<h3 class="text-lg font-bold">발행일</h3>
		        			</div>
		        			<div class="w-2/5 border h-11 p-2 bg-red-100 flex justify-center">
		        				<h3 class="text-lg font-bold">쿠폰명</h3>
		        			</div>
		        			<div class="w-1/5 border h-11 p-2 bg-red-100 flex justify-center">
	        					<h3 class="text-lg font-bold">할인가</h3>
		        			</div>
		        			<div class="w-1/5 border h-11 p-2 bg-red-100 flex justify-center">
	        					<h3 class="text-lg font-bold">만료일</h3>
		        			</div>
	        			</div>
	        			<c:forEach items="${list }" var="c">	
		        			<div class="flex">
		        				<div class="w-1/5 border h-11 p-2 flex justify-center">
		        					<h4>${c.startDate }</h4>
			        			</div>
			        			<div class="w-2/5 border h-11 p-2 flex justify-center">
			        				<h4>${c.event.eventTitle }</h4>
			        			</div>
			        			<div class="w-1/5 border h-11 p-2 flex justify-center">
			        				<h4><fmt:formatNumber value="${c.event.discount}" type="percent"/></h4>
			        			</div>
			        			<div class="w-1/5 border h-11 p-2 flex justify-center">
			        				<h4>${c.valDate}</h4>
			        			</div>
		        			</div>
	        			</c:forEach>
	        		</div>     	
        			<div class="pageBar flex my-5">${pageBar}</div>
        		</c:if>
			</div>
		</div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>