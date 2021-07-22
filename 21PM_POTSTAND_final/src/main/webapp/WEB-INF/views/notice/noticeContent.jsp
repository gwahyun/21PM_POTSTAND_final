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
<section class="mx-80">
        <div><h1 class="text-4xl font-bold m-5 text-center">공지사항</h1></div>
        <div class="nav-container flex">
            <div id="notice-nav" class="text-center bg-blue-500 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12 text-">공지사항</div>
            <div id="qna-nav" class="text-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12"><a href="${path}/qna/qnaWrite.do">1:1문의하기</a></div>
            <div id="myqna-nav" class="text-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12"><a href="${path}/qna/myQnaList.do">내 문의내역</a></div>
        </div>
        <div class="notice-container my-10">
            <div class="notice-title flex mt-10 pb-2 border-solid border-b border-gray-300 items-baseline">
               <h1 class="text-3xl font-bold m-5 w-10/12"><c:out value="${notice.noticeTitle}"/></h1>
               <h3 class="text-base w-1/12"><c:out value="${notice.memberId}"/></h3>
               <h3 class="text-base w-1/12"><fmt:formatDate pattern="yy/MM/dd" value="${notice.noticeDate}"/></h3>
            </div>
            <div class="notice-content border-solid border-b  border-gray-300 my-5 h-2/5">
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
        
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	alert("조회수 처리했니");
</script>
</html>