<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${loginMember}" name="loginMember"/>
</jsp:include>
<style>
	.dropdown:hover .dropdown-menu {
  		display: block;
	}
	.dropdown-menu>li:hover .dropdown-menu2{
		display: block;
	}
	.dropdown-menu2>li:hover .dropdown-menu3{
		display: block;
	}
</style>
<section class="text-gray-600 body-font">
	<div class="container p-5 mx-auto">
		<div class="container px-5 mx-auto">
			<h1 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">도서보기</h1>
			<div class="h-1 w-20 bg-red-500 rounded"></div>
			<!-- 카테고리 분류 -->
			<div class="flex w-full">
				<c:forEach items="${lv1}" var="l1">
				<div class="p-4">
					<div class="dropdown inline-block relative w-full">
    					<button class="bg-white text-gray-700 font-semibold py-2 px-4 rounded inline-flex items-center">
	      					<a href="${path}/book/sortBookList.do?sortNo=${l1.sortNo}"><span class="mr-1">${l1.lv1 }</span></a>
	      					<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
	      						<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/> 
	      					</svg>
    					</button>	
    					<ul class="dropdown-menu hidden absolute text-gray-700 pt-1">
    						<c:forEach items="${lv2 }" var="l2">
    						<c:if test="${l1.lv1==l2.lv1 }">
					      	<li class="flex h-10">
					      		<a class="rounded-t bg-gray-200 hover:bg-gray-400 py-2 px-4 block whitespace-no-wrap w-52" 
					      		href="${path}/book/sortBookList.do?sortNo=${l2.sortNo}">
					      			${l2.lv2 }
					      		</a>
					      		<ul class="dropdown-menu2 text-gray-700 hidden">
		    						<c:forEach items="${lv3 }" var="l3">
		    						<c:if test="${l1.lv1==l2.lv1 && l2.lv2==l3.lv2 }">
							      	<li class="flex h-10">
							      		<a class="rounded-t bg-gray-200 hover:bg-gray-400 py-2 px-4 block whitespace-no-wrap w-52" 
							      		href="${path}/book/sortBookList.do?sortNo=${l3.sortNo}">
							      			${l3.lv3 }
							      		</a>
							      		<ul class="dropdown-menu3 text-gray-700 hidden">
				    						<c:forEach items="${lv4 }" var="l4">
				    						<c:if test="${l1.lv1==l2.lv1 && l2.lv2==l3.lv2 && l3.lv3==l4.lv3}">
									      	<li class="flex">
									      		<a class="rounded-t bg-gray-200 hover:bg-gray-400 py-2 px-4 block whitespace-no-wrap w-52" 
									      		href="${path}/book/sortBookList.do?sortNo=${l4.sortNo}">
									      			${l4.lv4 }
									      		</a>
									      	</li>
									      	</c:if>
				    						</c:forEach>		
				    					</ul>
							      	</li>
							      	</c:if>
		    						</c:forEach>		
		    					</ul>
					      	</li>
					      	</c:if>
    						</c:forEach>		
    					</ul>
  					</div>
				</div>
				</c:forEach>
			</div>	 
		<c:if test="${bookList!=null}">
		<div class="flex flex-wrap -m-4  content-center">
		<!-- 카드 시작 -->
			<c:forEach var="l" items="${bookList}">
	 			<div class="xl:1/5 md:w-1/5 p-4">
	 			<a href="${path }/book/bookinfo.do?no=${l.getBookCode()}">
	            	<div class="bg-gray-100 p-6 rounded-lg">
	              		<img class="h-45 rounded w-full object-contain object-center mb-6" 
	              		src=<c:out value="${l.getBookCover()}"/> alt="content"/>
	              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font">
	              			<c:out value="${l.getBookPub()}"/>
	              		</h3>
	              		<h2 class="text-lg text-gray-900 font-medium title-font">
	                		<c:out value="${l.getBookTitle()}"/>
	              		</h2>
	              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font mb-4 truncate">
	           				<c:out value="${l.getBookWriter()}"/>
	              		</h3>
	              		<p class="leading-relaxed text-base"><fmt:formatNumber type="currency" value="${l.getBookCost()}"/></p>
	            	</div>
	            	</a>
	          	</div>
			</c:forEach>
		</div>
		<div class="pageBar flex my-5">${pageBar}</div>
		</c:if>
		<c:if test="${bookList=='[]'}">
			<div class="text-xl font-bold mt-4 text-center">
				<h2>판매중인 책이 없습니다.</h2>
			</div>
		</c:if>
	</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>