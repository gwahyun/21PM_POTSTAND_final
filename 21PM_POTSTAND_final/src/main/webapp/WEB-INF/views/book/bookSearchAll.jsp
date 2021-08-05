<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${loginMember}" name="loginMember"/>
</jsp:include>
<section class="text-gray-600 body-font">
	<div class="container p-5 mx-auto">
			<h1 class="sm:text-3xl text-2xl font-medium title-font mb-10 text-gray-900">검색결과</h1>
<!-- 반복 컴포넌트 -->
			<h2 class="text-2xl font-medium mb-5">제목 검색 <span class="text-red-500 text-xl">${answer.twp.get(0)}건</h2>
			<c:choose>
				<c:when test="${!answer.title.isEmpty()}">
					<div class="flex flex-wrap -m-4 content-center mb-10">
		<!-- 카드 시작 -->
					<c:forEach var="t" items="${answer.title}">
		 				<div class="xl:1/5 md:w-1/5 p-4">
		 				<a href="${path }/book/bookinfo.do?no=${t.getBookCode()}">
		            	<div class="bg-gray-100 p-6 rounded-lg">
		              		<img class="h-45 rounded w-full object-contain object-center mb-6" 
		              		src=<c:out value="${t.getBookCover()}"/> alt="content"/>
		              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font">
		              			<c:out value="${t.getBookPub()}"/>
		              		</h3>
		              		<h2 class="text-lg text-gray-900 font-medium title-font">
		                		<c:out value="${t.getBookTitle()}"/>
		              		</h2>
		              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font mb-4 truncate">
		           				<c:out value="${t.getBookWriter()}"/>
		              		</h3>
		              		<p class="leading-relaxed text-base"><fmt:formatNumber type="currency" value="${t.getBookCost()}"/></p>
		            	</div>
		            	</a>
		          		</div>
					</c:forEach>
					<c:if test="${answer.twp.get(0)>5}">
						<a href="${path}/search/bookinfomore.do?search=${search}&cate=title" class="w-full text-right">검색결과 더보기</a>
					</c:if>
				</c:when>
				<c:when test="${answer.title.isEmpty()}">
					<h1 class="ml-5 align-baseline">검색된 도서가 없습니다</h1>
				</c:when>
			</c:choose>
				</div>
				<div class="container p-5 mx-auto">
		<h2 class="text-2xl font-medium mb-5">작가 검색 <span class="text-red-500 text-xl">${answer.twp.get(1)}건</h2>
		<c:choose>
			<c:when test="${!answer.writer.isEmpty()}">
				<div class="flex flex-wrap -m-4 content-center mb-10">
		<!-- 카드 시작 -->
					<c:forEach var="w" items="${answer.writer}">
			 			<div class="xl:1/5 md:w-1/5 p-4">
				 			<a href="${path }/book/bookinfo.do?no=${w.getBookCode()}">
				            	<div class="bg-gray-100 p-6 rounded-lg">
				              		<img class="h-45 rounded w-full object-contain object-center mb-6" 
				              		src=<c:out value="${w.getBookCover()}"/> alt="content"/>
				              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font">
				              			<c:out value="${w.getBookPub()}"/>
				              		</h3>
				              		<h2 class="text-lg text-gray-900 font-medium title-font">
				                		<c:out value="${w.getBookTitle()}"/>
				              		</h2>
				              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font mb-4 truncate">
				           				<c:out value="${w.getBookWriter()}"/>
				              		</h3>
				              		<p class="leading-relaxed text-base"><fmt:formatNumber type="currency" value="${w.getBookCost()}"/></p>
				            	</div>
			            	</a>
		          		</div>
					</c:forEach>
					<c:if test="${answer.twp.get(1)>5}">
						<a href="${path}/search/bookinfomore.do?search=${search}&cate=writer" class="w-full text-right">검색결과 더보기</a>
					</c:if>
			</c:when>
			<c:when test="${answer.writer.isEmpty()}">
				<h1 class="ml-5 align-baseline">검색된 작가가 없습니다</h1>
			</c:when>
		</c:choose>
		</div>
				<div class="container p-5 mx-auto">
			<h2 class="text-2xl font-medium mb-5">출판사 검색 <span class="text-red-500 text-xl">${answer.twp.get(2)}건</h2>
		<c:choose>
		<c:when test="${!answer.pub.isEmpty()}">
		<div class="flex flex-wrap -m-4 content-center mb-10">
		<!-- 카드 시작 -->
				<c:forEach var="p" items="${answer.pub}">
		 			<div class="xl:1/5 md:w-1/5 p-4">
		 			<a href="${path }/book/bookinfo.do?no=${p.getBookCode()}">
		            	<div class="bg-gray-100 p-6 rounded-lg">
		              		<img class="h-45 rounded w-full object-contain object-center mb-6" 
		              		src=<c:out value="${p.getBookCover()}"/> alt="content"/>
		              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font">
		              			<c:out value="${p.getBookPub()}"/>
		              		</h3>
		              		<h2 class="text-lg text-gray-900 font-medium title-font">
		                		<c:out value="${p.getBookTitle()}"/>
		              		</h2>
		              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font mb-4 truncate">
		           				<c:out value="${p.getBookWriter()}"/>
		              		</h3>
		              		<p class="leading-relaxed text-base"><fmt:formatNumber type="currency" value="${p.getBookCost()}"/></p>
		            	</div>
		            	</a>
		          	</div>
				</c:forEach>
			<c:if test="${answer.twp.get(2)>5}">
				<a href="${path}/search/bookinfomore.do?search=${search}&cate=pub" class="w-full text-right">검색결과 더보기</a>
			</c:if>
			</c:when>
			<c:when test="${answer.pub.isEmpty()}">
			<h1 class="ml-5 align-baseline">검색된 출판사가 없습니다</h1>
			</c:when>
		</c:choose>
		</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>