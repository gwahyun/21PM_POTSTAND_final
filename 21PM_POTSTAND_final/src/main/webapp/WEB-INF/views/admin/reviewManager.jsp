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
                <div class="admin-content_title">리뷰 관리</div>
            </div>
        </div>
        
    <!-- 	<form action="#" method="post"> -->
    <!-- 		<div class="admin-content_area"> -->
    <!-- 			<div class="admin-content"> -->
    <!-- 				<div class="admin-content_title"> -->
    <!-- 					검색 -->
    <!-- 				</div> -->
    <!-- 				<div class="admin-search"> -->
    <!-- 					<div>책 번호</div> -->
    <!-- 					<input type='number' name="bookNo"> -->
    <!-- 				</div> -->
    <!-- 				<div class="admin-search"> -->
    <!-- 					<div>책 제목</div> -->
    <!-- 					<input type='text' name="bookTitle" > -->
    <!-- 				</div> -->
    <!-- 				<div class="admin-search"> -->
    <!-- 					<div>작성자</div> -->
    <!-- 					<input type='text' name="bookAuthor" > -->
    <!-- 				</div> -->
    <!-- 			</div> -->
    <!-- 		</div> -->
    <!-- 		<button class="submit-btn">검색</button> -->
    <!-- 	</form> -->
        
        
        <div class="admin-content_area">
            <div class="admin-content">
                <div class="admin-content_title">리뷰 목록</div>
                <div class="align-row choice-genre-area">
                    <div class="search-table" style="min-height: 630px;">
                        <table class="table table-border table-hover table-striped" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th style="width: 1%;">리뷰번호</th>
                                    <th style="width: 1%;">상품번호</th>
                                    <th style="width: 15%;">리뷰내용</th>
                                    <th style="width: 2%;">작성자</th>
                                    <th style="width: 4%;">별점</th>
                                    <th style="width: 4%;">등록일자</th>
                                    <th style="width: 4%;">상품정보</th>
                                    <th style="width: 4%;">삭제</th>
                                </tr>
                                </tr>
                            </thead>
                            <tbody>
                            
                                <tr>
                                    <td>121</td>
                                    <td>10219</td>
                                    <td style="text-align: left;">개쓰레기책</td>
                                    <td>
                                        
                                        user01
                                    </td>
                                    <td>
                                        <span style="display: none;">1</span>
                                        
                                        
                                            <img src="/bookin/image/star_on.png">
                                        
                                        
                                            <img src="/bookin/image/star_off.png">
                                        
                                            <img src="/bookin/image/star_off.png">
                                        
                                            <img src="/bookin/image/star_off.png">
                                        
                                            <img src="/bookin/image/star_off.png">
                                        
                                    </td>
                                    <td>2021-07-14</td>
                                    <td><a class="update-btn" href="/bookin/book/bookDetail.jsp?no=10219">상품정보 이동</a></td>
                                    <td><a class="update-btn" href="/bookin/book/bookDetail.jsp?no=10219" style="background-color: #FF5A5A;;">삭제</a></td>
                                </tr>
                            
                               
                            
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 페이지 네비게이션 자리 -->
                <div class="pagination">
                
                    
                    
                    
                        
                            <a class="on">1</a>
                        
                    
                    
                    
                    
                </div>
                    
                <form class="page-form" action="review.jsp" method="post">
                    <input type="hidden" name="pageNo">
                </form>
            </div>
            
        </div>
</section>
		
</body>
</html>

