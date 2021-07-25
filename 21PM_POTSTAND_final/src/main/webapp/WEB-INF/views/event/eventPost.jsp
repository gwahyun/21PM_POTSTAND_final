<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${loginMember}" name="loginMember"/>
</jsp:include>
	<section class="text-grey-600 body-font">
		<div class="container px-5 py-12 mx-auto">
			<div class="flex flex-wrap w-full mb-10 justify-between">
          		<div class="lg:w-1/2 w-full mb-6 lg:mb-0">
           			 <h1
			              class="
			                sm:text-3xl
			                text-2xl
			                font-medium
			                title-font
			                mb-2
			                text-gray-900
			              "
			            >
              			${event.eventTitle}
           			 </h1>
           			<div class="h-1 w-20 bg-red-500 rounded"></div>
          		</div>
          		 <div class="text-red-500">${event.eventStart} ~ ${event.eventEnd}</div>
			</div>
			 <div class="text-xl leading-relaxed mb-10">
			 ${event.eventInfo}
			 </div>
			  <div class="w-min-full flex justify-center">
                         <button class=" inline-flex items-center bg-gray-200 border-0 py-1 px-3 focus:outline-none hover:bg-red-400 
                         hover:text-white rounded text-base mt-4 md:mt-0" onclick="location.assign('${path}/event/eventlist.do');">
                   목록으로
                   <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                       <path d="M5 12h14M12 5l7 7-7 7"></path>
                   </svg>
                 </button>
                     </div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>