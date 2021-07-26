<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
			                <li class="py-2"><a href="#">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
        	<div class="w-3/4 h-full px-5 py-8 flex flex-col content-center">
        		<div class="w-full">
        			<h3 class="text-2xl font-semibold">정보변경</h3>
        		</div>
        		<div class="mt-4">
        			<h4 class="text-xl">보안을 위해 비밀번호를 한번 더 입력해 주세요.</h4>
        			<form class="mt-2" action="${path}/member/memberUpdate.do" method="post">
        				<input type="hidden" name="memberId" value="${loginMember.memberId }">
        				<input type="password" name="memberPwd" class="border h-8 w-80" required>
        				<button type="submit" class="border h-8 w-16 bg-red-500 text-gray-100 rounded-full tracking-wide 
        				font-semibold focus:outline-none focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer 
        				transition ease-in duration-300">
        					확인
        				</button>
        			</form>
        		</div>
			</div>
		</div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>