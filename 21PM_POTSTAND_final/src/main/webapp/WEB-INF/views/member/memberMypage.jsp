<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="h-1 w-20 bg-red-500 rounded mb-10"></div>
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
	        	<div class="flex text-center bg-gray-100 rounded-md">
	        		<div class="w-1/3 h-full px-5 py-24">
	        			<div class="mb-3"><h4 class="text-4xl font-semibold">${loginMember.memberId }</h4></div>
	        			<div class="mb-2"><h5 class="text-xl">${loginMember.memberEmail }</h5></div>
	        			<div><button type="button" onclick="location.replace('${path}/member/memberLogout.do')"
	        			class="mt-12 bg-red-500 text-gray-100  px-6 py-4 rounded-lg tracking-wide font-bold focus:outline-none 
	        			focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer transition ease-in duration-300">
	        				로그아웃
	        			</button></div>
	        		</div>
	        		<div class="w-1/3 h-full px-5 py-24">	
	        		
	        			<div><h4 class="text-4xl font-semibold">적립금</h4></div>
	    				<div>
	    					<button type="button"
	        			class="mt-20  bg-red-500 text-gray-100  px-6 py-4 rounded-lg tracking-wide font-bold font-2xl focus:outline-none 
	        			focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer transition ease-in duration-300">
	        				<a href="${path}/member/memberPoint.do">${mypageTotalPoint } point</a>
	        			</button>
	    				</div>
	        		</div>
	        		<div class="w-1/3 h-full px-5 py-24">
	        			<div><h4 class="text-4xl font-semibold">쿠폰</h4></div>
	        			<div>
	        				<button type="button"
	        			class="mt-20 bg-red-500 text-gray-100 px-6 py-4 rounded-lg tracking-wide font-semibold focus:outline-none 
	        			focus:shadow-outline hover:bg-red-600 shadow-lg cursor-pointer transition ease-in duration-300">
	        				<a href="${path}/member/memberCouponListSelect.do">${mypageTotalCoupon }개</a>
	        			</button>
	        			</div>
	        		</div>
	        	</div>
	        	<div class="mt-7 w-full">
	        		<h3 class="text-2xl font-semibold">주문현황</h3>
	        	</div>
	        	<div class="flex justify-center text-center mt-4 border-t-2">
	        		<dl class="flex">
						<dd class="px-5 py-24">
							<div><a href="${path}/member/memberOrderListSelect.do" class="text-5xl">0</a></div>
							<div class="text-2xl">결제완료</div>
						</dd>
						<dd class="px-5 py-24">
							<img class="w-20" src="${path }/resources/img/myInfo_next.png">
						</dd>
						<dd class="px-5 py-24">
							<div><a href="${path}/member/memberOrderListSelect.do" class="text-5xl">0</a></div>
							<div class="text-2xl">배송중</div>
						</dd>
						<dd class="px-5 py-24">
							<img class="w-20" src="${path }/resources/img/myInfo_next.png">
						</dd>
						<dd class="px-5 py-24">
							<div><a href="${path}/member/memberOrderListSelect.do" class="text-5xl">0</a></div>
							<div class="text-2xl">배송완료</div>
						</dd>
					</dl>
	        	</div>
	        </div>
		</div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>