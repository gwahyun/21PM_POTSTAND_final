<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
        
<section>
 <div class="admin-content_area">
            <div class="admin-content ">
                <div class="admin-content_title a_bth">QnA 문의
    
                
                <a class="noreply">미답변</a>
                <a class="all on">전체</a>
                
                </div>
                <form class="rsform" action="" method="get">
                    <input type="hidden" value="all" name="type">
                </form>
            </div>
        </div>
            <div class="admin-content_area">
                <div class="admin-content">
                    <div class="admin-content_title">QnA 문의 목록</div>
                    <div class="align-row choice-genre-area">
                        <div class="search-table" style="min-height: 550px;">
                            <table class="table table-border table-hover table-striped" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="width: 1%;">번호</th>
                                        <th style="width: 2%;">구분</th>
                                        <th style="width: 20%;">제목</th>
                                        <th style="width: 3%;">작성자</th>
                                        <th style="width: 3%;">등록일자</th>
                                        <th style="width: 2%;">답변여부</th>
                                        <th style="width: 2%;">답변</th>
                                        <th style="width: 2%;">삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list }" var="q">
                                    <tr>
                                        <td>${q.qnaNo }</td>
                                        <td>${q.qnaSort }</td>
                                        <td class="overflow" style="text-align: left;">${q.qnaTitle }</td>
                                        <td>
                                        
                                        ${q.memberId }
                                        </td>
                                        <td>${q.qnaDate }</td>
                                        <td>
                                            <span class="contents-info" oninput="contentsInfo();">							
                                                <!-- 댓글 개수 0보다 클 경우 답변완료 -->
                                                                            
                                                    <span style="color: #3296FF">${q.qnaStatus }</span>
                                                                        
                                            </span>
                                        </td>
                                        <td><a id="10" class="update-btn" onclick="">답변</a></td>
                                        <td><a class="update-btn" style="background-color: #FF5A5A;" href="#">삭제</a></td>
                                    </tr>
                                    </c:forEach>
                                    
                                    
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 페이지 네비게이션 자리 -->
                    <div class="pagination">
                            <a class="on">1</a>
                    </div>
                    <form class="page-form" action="qnaReply.jsp" method="post">
                        <input type="hidden" name="pageNo">
                    </form>
                </div>
            </div>
</section>
		
</body>
</html>
