<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
        
<section>
<div class="admin-content_area">
            <div class="admin-content">
                <div class="admin-content_title">EVENT 관리</div>
            </div>
        </div>
            <div class="admin-content_area">
                <div class="admin-content">
                    <div class="admin-content_title">EVENT 목록</div>
                    <div class="align-row choice-genre-area">
                        <div class="search-table" style="min-height: 550px;">
                            <table class="table table-border table-hover table-striped" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="width: 1%;">번호</th>
                                       
                                        <th style="width: 3%">제목</th>
                                        <th style="width: 1%;">작성자</th>
                                        <th style="width: 1%;">등록일자</th>
                                        <th style="width: 1%;">조회수</th>
                                        <th style="width: 1%;">수정</th>
                                        <th style="width: 1%;">삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                    <tr>
                                        <td>6</td>
                                       
                                        <td style="text-align: left;">이벤트~</td>
                                        <td>
                                        
                                        admin
                                        </td>
                                        <td>2021-06-11</td>
                                        <td>17</td>
                                        <td><a class="update-btn" href="#">수정</a></td>
                                        <td><a class="update-btn" style="background-color: #FF5A5A;" href="#">삭제</a></td>
                                    </tr>
                                
                                  
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 페이지 네비게이션 자리 -->
                    <div class="pagination">
                    
                        
                        
                        
                            
                                <a class="on">1</a>
                            
                        
                        
                        
                        
                    </div>
                        
                    <form class="page-form" action="notice.jsp" method="post">
                        <input type="hidden" name="pageNo">
                    </form>
                </div>
                
            </div>
</section>
		
</body>
</html>

