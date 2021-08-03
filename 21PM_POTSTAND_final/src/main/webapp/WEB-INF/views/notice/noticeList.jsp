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
	                <div class="notice-obj flex">
	                    <div class="notice-no border-solid border-gray-400 border w-1/12 text-center">
	                    	<c:out value="${n.noticeNo}"/>
	                    </div>
	                    <div class="notice-title border-solid border-gray-400 border w-4/6 cursor-pointer hover:underline hover:bg-gray-200 px-5">
	                    	<a href="${path}/notice/noticeContent.do/${n.noticeNo}" class=""><c:out value="${n.noticeTitle}"/></a>
	                    </div>
	                    <div class="notice-date border-solid border-gray-400 border w-1/6 text-center">
	                        <fmt:formatDate pattern="yy/MM/dd" value="${n.noticeDate}"/>
	                    </div>
	                    <div class="notice-view border-solid border-gray-400 border w-1/12 text-center">
	                        <c:out value="${n.noticeView}"/>
	                    </div>
	                </div>
            </c:forEach> 
            </div>
        </div>
        
        
    	<div class="pageBar flex my-5">${pageBar}</div>
	    
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>