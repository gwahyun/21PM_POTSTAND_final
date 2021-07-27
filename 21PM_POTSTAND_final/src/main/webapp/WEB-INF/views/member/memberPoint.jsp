<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set value="0" var="totalPoint"/>
	<section class="body-font">
    	<div class="container mx-auto flex justify-start">
        	<div class="w-1/4 h-full py-8">
	            <h3 class="text-4xl font-extrabold">마이페이지</h3>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>개인</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="${path}/notice/noticeSelectList.do">고객센터</a></li>
			                <li class="py-2"><a href="${path}/member/memberCheckPwd.do">정보변경</a></li>
			                <li class="py-2"><a href="#">장바구니</a></li>
			                <li class="py-2"><a href="#">찜 목록</a></li>
			                <li class="py-2"><a href="#">내 리뷰 관리</a></li>
			            </ul>
	            	</div>
	            </div>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold py-2"><span>구매/혜택</span></h4>
	            	<div class="pl-5 text-xl">
	            		<ul>
			                <li class="py-2"><a href="#">주문목록/배송조회</a></li>
			                <li class="py-2"><a href="#">쿠폰</a></li>
			                <li class="py-2"><a href="${path}/member/memberPoint.do?memberId=${loginMember.memberId}">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
        	<div class="w-3/4 h-full px-5 py-8 flex flex-col content-center">
        		<div class="w-full">
        			<h3 class="text-2xl font-semibold">적립금</h3>
        		</div>
        		<div class="flex w-full flex-col justify-center mt-5 border" >
        		<h2 id="totalPoint" class="text-xl font-bold"></h2>
        			<div class="flex">
        				<div class="w-1/4 border h-11 p-2 bg-red-100 flex justify-center">
        					<h3 class="text-lg font-bold">날짜</h3>
	        			</div>
	        			<div class="w-2/4 border h-11 p-2 bg-red-100 flex justify-center">
	        				<h3 class="text-lg font-bold">내용</h3>
	        			</div>
	        			<div class="w-1/4 border h-11 p-2 bg-red-100 flex justify-center">
        					<h3 class="text-lg font-bold">사용/적립 포인트</h3>
	        			</div>
        			</div>
        			<c:forEach items="${list }" var="p">
	        			<div class="flex">
	        				<div class="w-1/4 border h-11 p-2 flex justify-center">
	        					<h4>${p.useDate }</h4>
		        			</div>
		        			<div class="w-2/4 border h-11 p-2 flex justify-center">
		        				<h4>${p.useLog }</h4>
		        			</div>
		        			<div class="w-1/4 border h-11 p-2 flex justify-center">
		        				<!-- 임시로 사용이 들어가면 -가붙게 구매가 들어가면 +가 붙게함 의논해봐야할듯 -->
		        				<c:if test="${fn:contains(p.useLog,'사용') }">
		        					<h4>-${p.point }</h4>
		        					<c:set value="${totalPoint-p.point }" var="totalPoint"/>
		        				</c:if>
	        					<c:if test="${fn:contains(p.useLog,'구매') }">
	        						<c:set value="${totalPoint+p.point }" var="totalPoint"/>
		        					<h4>+${p.point }</h4>
		        				</c:if>
		        			</div>
	        			</div>
        			</c:forEach>
        		</div>
			</div>
		</div>
    </section>
    <script>
    	//저장해놓은 총 적립금을 text안에 넣어줌
    	$("#totalPoint").text("총 적립금 : ${totalPoint }");
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>