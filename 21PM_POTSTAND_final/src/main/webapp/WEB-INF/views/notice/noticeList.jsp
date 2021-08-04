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
            <a href="${path}/qna/qnaWrite.do" class="text-center
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
          <a href="${path}/qna/myQnaList.do" class="text-center
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
        <div class="notice-list my-10">
            <div class="notice-list-head flex w-full bg-gray-300">
                <div class="notice-no border-solid border-gray-400 border w-1/12 text-center">
                    번호
                </div>
                <div class="notice-title border-solid border-gray-400 border w-4/6 text-center">
                    제목
                </div>
                <div class="notice-date border-solid border-gray-400 border w-1/6 text-center">
                    등록일
                </div>
                <div class="notice-view border-solid border-gray-400 border w-1/12 text-center">
                    조회수
                </div>
            </div>
            <div class="notice-list-body">
            	<c:forEach var="n" items="${noticeList}">
	               <div class="notice-obj flex hover:bg-gray-200 duration-200 ease-in-out">
	                    <div class="notice-no
                  border-solid border
                  w-1/12
                  text-center
                  py-2
                  flex
                  justify-center
                  content-center">
	                    	<c:out value="${n.noticeNo}"/>
	                    </div>
	                   <div class="notice-title
                  border-solid 
                  border
                  w-4/6
                  cursor-pointer
                  px-5
                  py-2
                  flex
                  justify-center
                  content-center">
	                    	<a href="${path}/notice/noticeContent.do/${n.noticeNo}" class=""><c:out value="${n.noticeTitle}"/></a>
	                    </div>
	                   <div class="notice-date
                  border-solid border
                  w-1/6
                  text-center
                  py-2
                  flex
                  justify-center
                  content-center">
	                        <fmt:formatDate pattern="yy/MM/dd" value="${n.noticeDate}"/>
	                    </div>
	                  <div class="notice-view
                  border-solid border
                  w-1/12
                  text-center
                  py-2
                  flex
                  justify-center
                  content-center">
	                        <c:out value="${n.noticeView}"/>
	                    </div>
	                </div>
            </c:forEach> 
            </div>
        </div>
        
        
    	<div class="pageBar flex my-5">${pageBar}</div>
	    </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>