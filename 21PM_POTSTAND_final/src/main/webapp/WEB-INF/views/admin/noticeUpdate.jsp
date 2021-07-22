<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
        
<section>
	<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						NOTICE&nbsp;수정
					</div>
		</div>
	</div>
	<form action="${path }/admin/noticeUpdateEnd" method="post">
		
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					<span>제목</span>
				</div>
				<div class="admin-input_text">
				<input type="text" value="${n.noticeTitle }" name="noticeTitle" placeholder="제목을 입력하세요." required>
				</div>
			</div>
		</div>
		
<!-- 		<div class="admin-content_area"> -->
<!-- 			<div class="admin-content "> -->
<!-- 				<dis="admin-content_title"> -->
<!-- 					상품 이미지 -->
<!-- 				</div> -->
<!-- 				<div class='img-up-text'><span>이미지 등록</span></div> -->
<!-- 				<label for="input-file"> -->
<!-- 				  <img class='admin-upload_img'> -->
<!-- 				</label> -->
<!-- 				<input class="input_img" required type="file" accept=".png, .jpg, .gif" id="input-file" name="bookImage" style="display: none"/> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					<span>내용</span>
				</div>
				<div class="admin-input_text">
				<textarea name="noticeContent" placeholder="내용을 입력해주세요." required spellcheck="false">${n.noticeContent }</textarea>
				</div>
			</div>
		</div>
          
		<input type="hidden" name="noticeNo" value="${n.noticeNo }">
		<input type="submit" class="submit-btn" value="등록"/>
	</form>
</section>
		
</body>
</html>

