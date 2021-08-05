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
			<h2 class="text-2xl font-medium mb-5">검색결과<span class="text-red-500 text-xl"><c:out value="${count}"/> 건</span></h2>
					<div class="flex flex-wrap -m-4 content-center mb-10">
		<!-- 카드 시작 -->
					<c:forEach var="l" items="${list}">
		 				<div class="xl:1/5 md:w-1/5 p-4">
		 				<a href="${path }/book/bookinfo.do?no=${l.getBookCode()}">
		            	<div class="bg-gray-100 p-6 rounded-lg">
		              		<img class="h-45 rounded w-full object-contain object-center mb-6" 
		              		src=<c:out value="${l.getBookCover()}"/> alt="content"/>
		              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font">
		              			<c:out value="${l.getBookPub()}" escapeXml="false"/>
		              		</h3>
		              		<h2 class="text-lg text-gray-900 font-medium title-font">
		                		<c:out value="${l.getBookTitle()}" escapeXml="false"/>
		              		</h2>
		              		<h3 class="tracking-widest text-red-500 text-sm font-medium title-font mb-4 truncate">
		           				<c:out value="${l.getBookWriter()}" escapeXml="false"/>
		              		</h3>
		              		<p class="leading-relaxed text-base"><fmt:formatNumber type="currency" value="${l.getBookCost()}"/></p>
		            	</div>
		            	</a>
		          		</div>
		            	</c:forEach>
					${pageBar}
		</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>