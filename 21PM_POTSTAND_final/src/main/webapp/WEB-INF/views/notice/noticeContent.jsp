<%@page language="java" contentType="text/html; charset=UTF-8"  
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
<section class="text-gray-600 body-font overflow-hidden">
     <div class="container p-5 mx-auto">
      <div><h1 class="sm:text-3xl
            text-2xl
            font-medium
            title-font
            mb-2
            text-gray-900">고객센터</h1></div>
            <div class="h-1 w-20 bg-red-500 rounded mb-10"></div>

         <div class="nav-container flex">
            <div id="notice-nav" class="text-center
            bg-gray-400
            py-1
            px-3
            bg-red-500
            text-lg
            text-white
            rounded
            mt-4
            md:mt-0
            cursor-pointer
            font-bold
            w-4/12">공지사항</div>
            <a href="${path}/qna/qnaWrite.do" class="
            text-center
          text-lg
          bg-gray-400
          py-1
          px-3
          hover:bg-red-500
          text-white
          rounded
          mt-4
          md:mt-0
          cursor-pointer
          font-bold
          w-4/12">
            <div id="qna-nav">1:1문의하기</div></a>
            <a href="${path}/qna/myQnaList.do" 
            class="text-center
          bg-gray-400
          text-lg
          py-1
          px-3
          hover:bg-red-500
          text-white
          rounded
          mt-4
          md:mt-0
          cursor-pointer
          font-bold
          w-4/12">
            <div id="myqna-nav">내 문의내역</div></a>
          </div>
        <div class="notice-container my-10">
            <div class="notice-title flex mt-10 pb-2 border-solid border-b border-gray-300 items-baseline">
               <h1 class="text-3xl font-bold m-5 w-10/12"><c:out value="${notice.noticeTitle}"/></h1>
               <h3 class="text-base w-1/12"><c:out value="${notice.memberId}"/></h3>
               <h3 class="text-base w-1/12"><fmt:formatDate pattern="yy/MM/dd" value="${notice.noticeDate}"/></h3>
            </div>
            <div class="notice-content border-solid border-b  border-gray-300 my-5 h-2/5 leading-relaxed">
                 <c:out value="${notice.noticeContent}"/>
            </div>
            <button class=" inline-flex items-center bg-gray-200 border-0 py-1 px-3 focus:outline-none hover:bg-red-400 
	          		hover:text-white rounded text-base mt-4 md:mt-0" onclick="location.assign('${path}/notice/noticeSelectList.do');">
	            목록으로
	            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
	            	<path d="M5 12h14M12 5l7 7-7 7"></path>
	            </svg>
          	</button>
        </div>
       </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	alert("조회수 처리했니");
</script>
</html>