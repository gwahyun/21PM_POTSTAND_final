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
            <div id="notice-nav" class="text-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12 text-"><a href="${path}/notice/noticeList.do">공지사항</a></div>
            <div id="qna-nav" class="text-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12"><a href="${path}/qna/qnaWrite.do">1:1문의하기</a></div>
            <div id="myqna-nav" class="text-center bg-blue-500 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12">내 질문</div>
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
                    조회수
                </div>
            </div>
            <div class="qna-list-body">
            <c:forEach var="q" items="${myQnaList}">
                <div class="qna-obj flex">
                    <div class="qna-no border-solid border-gray-400 border w-1/12 text-center">
                        <c:out value="${q.qnaNo}"/>
                    </div>
                    <div class="qna-sort border-solid border-gray-400 border w-1/12 text-center">
                        <c:out value="${q.qnaSort}"/>
                    </div>
                    <div class="qna-title border-solid border-gray-400 border w-7/12 cursor-pointer hover:underline hover:bg-gray-200 px-5">
                    	<a href="${path}/qna/qnaContent.do/${q.qnaNo}" class=""><c:out value="${q.qnaTitle}"/></a>
                    </div>
                    <div class="qna-date border-solid border-gray-400 border w-2/12 text-center">
                        <fmt:formatDate pattern="yy/MM/dd" value="${q.qnaDate}"/>
                    </div>
                    <div class="qna-status border-solid border-gray-400 border w-1/12 text-center">
                        <c:out value="${q.qnaStatus}"/>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
        <div class="pageBar"> &lt; 1 2 3 4 5 &gt;</div>
    </section>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>