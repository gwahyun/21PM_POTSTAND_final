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
        <div class="myqna-container">
            <div class="myqna-title flex">
               <h1>환불해주세요</h1>
               <h3>분류 : 환불</h3>
               <h3>진상</h3>
               <h3>2021-07-21 19:38</h3>
            </div>
            <div class="myqna-content">
                환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 환불'해줘' 
            </div>
        </div>
        <div class="myqna-answer flex">
            <div class="answer-name">
                관리자
            </div>
            <div class="answer-content">
                안녕하세요 고객님 팟스탠드입니다.<br>
                어차피 냄비받침으로 사신건데 평생 냄비 안쓸거 아니면 그냥 잘 쓰시기 바랍니다<br>
                감사합니다 :)
                
            </div>
            <div class="answer-date">
                2021-07-21
            </div>
        </div>
        <div class="list-btn">
            목록으로
        </div>
    </section>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>