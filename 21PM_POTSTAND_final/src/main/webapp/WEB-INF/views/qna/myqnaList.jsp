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
        <a href="${path}/notice/noticeSelectList.do" class="text-center
            bg-gray-400
            py-1
            px-3
            hover:bg-red-500
            text-lg
            text-white
            rounded
            mt-4
            md:mt-0
            cursor-pointer
            font-bold
            w-4/12">
           <div id="notice-nav" >공지사항</div></a>
            <a href="${path}/qna/qnaWrite.do"  class="text-center
            bg-gray-400
            py-1
            px-3
            hover:bg-red-500
            text-lg
            text-white
            rounded
            mt-4
            md:mt-0
            cursor-pointer
            font-bold
            w-4/12"><div id="qna-nav">1:1문의하기</div></a>
            <div id="myqna-nav" class="
          text-center
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
        <div class="qna-list my-10">
            <div class="qna-list-head flex w-full bg-gray-300">
                <div class="qna-no border-solid border-gray-400 border w-1/12 text-center">
                    번호
                </div>
                <div class="qna-sort border-solid border-gray-400 border w-1/12 text-center">
                    분류
                </div>
                <div class="qna-title border-solid border-gray-400 border w-7/12 text-center">
                    제목
                </div>
                <div class="qna-date border-solid border-gray-400 border w-2/12 text-center">
                    등록일
                </div>
                <div class="qna-view border-solid border-gray-400 border w-1/12 text-center">
                    답변상태
                </div>
            </div>
            <div class="qna-list-body">
            <c:forEach var="q" items="${myQnaList}">
              <div class="qna-obj flex notice-obj flex hover:bg-gray-200 duration-200 ease-in-out">
                    <div class="qna-no  border-solid 
                  border
                  w-1/12
                  cursor-pointer
                  px-5
                  py-2
                  flex
                  justify-center
                  content-center">
                        <c:out value="${q.qnaNo}"/>
                    </div>
                   <div class="qna-sort  border-solid border
                  w-1/12
                  text-center
                  py-2
                  flex
                  justify-center
                  content-center">
                        <c:out value="${q.qnaSort}"/>
                    </div>
                  <div class="qna-title 
                    border-solid 
                  border
                  w-7/12
                  cursor-pointer
                  px-5
                  py-2
                  flex
                  justify-center
                  content-center">
                    	<a href="${path}/qna/qnaContent.do?qnaNo=${q.qnaNo}" class=""><c:out value="${q.qnaTitle}"/></a>
                    </div>
                  <div class="qna-date border-solid border
                  w-2/12
                  text-center
                  py-2
                  flex
                  justify-center
                  content-center">
                        <fmt:formatDate pattern="yy/MM/dd" value="${q.qnaDate}"/>
                    </div>
                     <div class="qna-status   border-solid border
                  w-1/12
                  text-center
                  py-2
                  flex
                  justify-center
                  content-center">
                        <c:out value="${q.qnaStatus}"/>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
        <div class="pageBar w-full flex justify-center my-5">${pageBar}</div>
        </div>
    </section>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>