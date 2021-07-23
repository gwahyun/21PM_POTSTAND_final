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
			<div class="flex flex-wrap w-full mb-20">
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
			</div>
			 ${event.eventInfo}
			 ${event.eventStart}
			 ${event.eventEnd}
        </div>
        </div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>