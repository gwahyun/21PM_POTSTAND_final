<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
.tracking-in-expand {
	-webkit-animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
	        animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
}

@-webkit-keyframes tracking-in-expand {
  0% {
    letter-spacing: -0.5em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    opacity: 1;
  }
}
@keyframes tracking-in-expand {
  0% {
    letter-spacing: -0.5em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    opacity: 1;
  }
}


.slide{
position:relative;
 overflow: hidden;
}
.slide::after {
 content: "";
 display: block;
 clear: both;
  }
.cell{
position:absolute;
top:0;
left:0;
bottom:0;
right:0;
opacity:0;
z-index:0;
transition:opacity .5s ease-in-out;
 width: 100%;
height:100%;
}
.showing{
z-index:1;
opacity:1;
}


</style>
<section class="text-gray-600 body-font">
	 	<div class="slide flex justify-center w-full h-96">
			<img class="cell object-cover" src="${pageContext.request.contextPath}/resources/img/grandopen1.png" alt=""/>
			<img class="cell object-cover" src="${pageContext.request.contextPath}/resources/img/event1.png" alt=""/>
			<img class="cell object-cover" src="${pageContext.request.contextPath}/resources/img/event2.png" alt=""/>
  		</div>
    	
    </section>
<section class="text-gray-600 body-font min-h-full">
	<div class="container p-5 mx-auto">
    	<h1 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900 border-b-4 border-red-500 inline-block mb-6">이달의 이벤트</h1>
		<div class="flex flex-wrap -m-4">
		<c:forEach var="e" items="${eventList}">
          <div class="xl:w-1/4 md:w-1/2 p-4">
          <a href="${path}/event/eventpost.do?no=${e.eventNo}">
            <div class="bg-gray-100 p-6 rounded-lg">
            <c:choose>
            	<c:when test="${e.eventThum == 'thumb.jpg'}">
	              <img
	                class="h-40 rounded w-full object-cover object-center mb-6"
	                src="${path }/resources/img/thumb.jpg"
	               
	              />
            	</c:when>
            	<c:otherwise>
	              <img
	                class="h-40 rounded w-full object-cover object-center mb-6"
	                src="${path }/resources/upload/event/${e.eventThum}"
	               
	              />
	              </c:otherwise>
              </c:choose>
              <h2 class="text-lg text-gray-900 font-medium title-font">
				<c:out value="${e.eventTitle}"/>
              </h2>
              <h3
                class="
                  tracking-widest
                  text-red-500 text-xs
                  font-medium
                  title-font
                  mb-4
                "
              >
                <c:out value="${e.eventStart}"/>~<c:out value="${e.eventEnd}"/>
              </h3>
              <p class="leading-relaxed text-base">
                <c:out value="${e.eventShort}"/>
              </p>
            </div>
          </div>
          </a>
   </c:forEach>
   	</div>
   	<c:if test="${bookList!=null}">
   	<h1 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900 border-b-4 border-red-500 inline-block my-6">이달의 도서</h1>
		<div class="flex flex-wrap -m-4 mt-5 content-center">
		<!-- 카드 시작 -->
			<c:forEach var="l" items="${bookList}">
	 			<div class="xl:1/5 md:w-1/5 p-4">
	 			<a href="${path }/book/bookinfo.do?no=${l.getBookCode()}">
	            	<div class="bg-gray-100 p-6 rounded-lg">
	              		<img class="h-45 rounded w-full object-contain object-center mb-6" 
	              		src=
	              		<c:if test="${l.bookCover.contains('http') }">
	              			<c:out value="${l.getBookCover()}"/>
	              		</c:if>
              			<c:if test="${!l.bookCover.contains('http') }">
              				${path }/resources/upload/book/${l.bookCover() }
	              		</c:if>
	              		 alt="content"/>
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
		</div>
	</c:if>
	
	
		
</section>
<script>
 const SHOWING = "showing";
 const firstSlide = document.querySelector(".cell:first-child");
 firstSlide.classList.add(SHOWING);
 
 function slide(){
	 const currentSlide = document.querySelector(".showing");
	 if(currentSlide){
		 currentSlide.classList.remove(SHOWING);
		 const nextSlide = currentSlide.nextElementSibling;
		 console.log(nextSlide);
		 if(nextSlide){
			 nextSlide.classList.add(SHOWING);
		 }else{
			 firstSlide.classList.add(SHOWING);
		 }
	 }else{
		 firstSLide.classList.add(SHOWING);
	 }
 }
 setInterval(slide,4000);
 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
