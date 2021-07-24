<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="body-font">
    	<div class="container px-5 py-24 mx-auto flex justify-start">
        	<div class="w-1/4 h-full">
	            <h3 class="text-4xl font-extrabold">마이페이지</h3>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold pb-2"><span>개인</span></h4>
	            	<div class="pl-4 text-xl">
	            		<ul>
			                <li class="pb-1"><a href="#">고객센터</a></li>
			                <li class="pb-1"><a href="#">정보변경</a></li>
			                <li class="pb-1"><a href="#">장바구니</a></li>
			                <li class="pb-1"><a href="#">찜 목록</a></li>
			                <li class="pb-1"><a href="#">내 리뷰 관리</a></li>
			            </ul>
	            	</div>
	            </div>
	            <div class="mt-4 text-gray-500 border-t-2">
	            	<h4 class="text-2xl font-semibold pb-2"><span>구매/혜택</span></h4>
	            	<div class="pl-4 text-xl">
	            		<ul>
			                <li class="pb-1"><a href="#">주문목록/배송조회</a></li>
			                <li class="pb-1"><a href="#">쿠폰</a></li>
			                <li class="pb-1"><a href="#">적립금</a></li>
			            </ul>
	            	</div>
	            </div>
        	</div>
	        <div class="w-3/4 h-full flex flex-col content-center">
	        	<div class="flex px-5 py-24 text-center">
	        		<div class="w-1/3">
	        			<h4 class="text-2xl font-semibold">${loginMember.memberId }</h4>
	        			<h5 class="text-xl">${loginMember.memberEmail }</h5>
	        			<button type="button" onclick="location.replace('${path}/member/memberLogout.do')"
	        			class="">로그아웃</button>
	        		</div>
	        		<div class="w-1/3">
	        			<h4 class="text-2xl font-semibold">적립금</h4>
	    				??Point
	        		</div>
	        		<div class="w-1/3">
	        			<h4 class="text-2xl font-semibold">쿠폰</h4>
	        			??개
	        		</div>
	        	</div>
	        	<div class="w-full flex px-5 py-24 text-center">
	        		<h4>배송정보 담을곳</h4>
	        	</div>
	        </div>
		</div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>