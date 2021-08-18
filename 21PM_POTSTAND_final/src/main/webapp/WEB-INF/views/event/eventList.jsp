<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${loginMember}" name="loginMember"/>
</jsp:include>
	<section class="text-grey-600 body-font">
		<div class="container p-5 mx-auto">
			<div class="flex flex-wrap w-full mb-10">
          		<div class="lg:w-1/2 w-full mb-6 lg:mb-0">
           			 <h1
			              class="
			                sm:text-3xl
			                text-2xl
			                font-medium
			                title-font
			                mb-2
			                text-gray-900
			                border-b-4
			                border-red-500
			                inline-block
			              
			              "
			            >
              			진행중인 이벤트
           			 </h1>
          		</div>
			</div>
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
        </div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>