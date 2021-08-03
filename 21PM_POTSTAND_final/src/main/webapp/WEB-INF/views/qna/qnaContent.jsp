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
            <div id="notice-nav" 
          class="
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
          w-4/12"><a href="${path}/notice/noticeSelectList.do">공지사항</a></div>
            <div id="qna-nav" class="
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
          w-4/12"><a href="${path}/qna/qnaWrite.do">1:1문의하기</a></div>
            <div id="myqna-nav" class="ttext-center
          text-lg
          py-1
          px-3
          bg-red-500
          text-white
          rounded
          mt-4
          md:mt-0
          cursor-pointer
          font-bold
          w-4/12">내 문의내역</div>
        </div>
        <div class="myqna-container">
            <div class="myqna-title flex mt-10 pb-2 border-solid border-b border-gray-300 items-baseline">
               <h3 class="text-base w-1/12 text-red-500"><c:out value="${qna.qnaSort}"/></h3>
               <h1 class="text-2xl w-10/12 text-gray-900"><c:out value="${qna.qnaTitle}"/></h1>
               <h3 class="text-base w-1/12 "><c:out value="${qna.memberId}"/></h3>
               <h3 class="text-base w-1/12 "><fmt:formatDate pattern="yy/MM/dd" value="${qna.qnaDate}"/></h3>
            </div>
            <div class="myqna-content border-solid border-b  border-gray-300 my-5 h-2/5 leading-relaxed">
                <c:out value="${qna.qnaContent}"/> 
            </div>
        </div>
        <c:choose>
	        <c:when test="${empty qna.answer}">
		       <div class="myqna-answer flex my-10 bg-gray-200">
		            <div class="answer-name text-red-500 border border-gray-300 border-solid w-2/12 ">
		                삭제예정
		            </div>
		            <div class="answer-content border border-gray-300 border-solid w-8/12">
		                안녕하세요 고객님 팟스탠드입니다.<br>
		                어차피 냄비받침으로 사신건데 평생 냄비 안쓸거 아니면 그냥 잘 쓰시기 바랍니다<br>
		                감사합니다 :)
		                
		            </div>
		            <div class="answer-date border border-gray-300 border-solid w-2/12">
		                2021-07-21
		            </div>
		        </div>
		    </c:when>
	        <c:otherwise>
		        <div class="myqna-answer flex my-10 h-20">
		            <div class="answer-name bg-green-100 border border-gray-300 border-solid w-2/12 text-center align-middle">
		                <c:out value="${qna.answer.adminId}"/>
		                
		            </div>
		            <div class="answer-content bg-green-100 border border-gray-300 border-solid w-8/12 p-3">
		                <c:out value="${qna.answer.answerContent}"/>
		            </div>
		            <div class="answer-date bg-green-100 border border-gray-300 border-solid w-2/12 text-center align-middle">
		                <fmt:formatDate pattern="yy/MM/dd" value="${qna.answer.answerDate}"/>
		            </div>
		        </div>
	        </c:otherwise>
        </c:choose>
        <button class=" inline-flex items-center bg-gray-200 border-0 py-1 px-3 focus:outline-none hover:bg-red-400 
	          		hover:text-white rounded text-base mt-4 md:mt-0" onclick="location.assign('${path}/notice/noticeSelectList.do');">
	            목록으로
	            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
	            	<path d="M5 12h14M12 5l7 7-7 7"></path>
	            </svg>
          	</button>
          	</div>
    </section>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>