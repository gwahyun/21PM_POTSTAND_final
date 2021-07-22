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
				<div class="admin-content_title">
					EVENT&nbsp;등록
				</div>
			</div>
		</div>
		<form action="/bookin/admin/qnaNoticeInsert.kh" method="post">
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>구분</span>
					</div>
					<div class="admin-input_text">
						<select name="noticeBoardHeader" required="" class="notice-type-select">
							<option value="">선택하세요</option>
							<option>이벤트1</option>
							<option>이벤트2</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>제목</span>
					</div>
					<div class="admin-input_text">
					<input type="text" name="noticeBoardTitle" placeholder="제목을 입력하세요." required="">
					</div>
				</div>
			</div>
            <div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>정가</span>
					</div>
					<div class="admin-input_text">
					<input type="number" name="#" placeholder="정가를 입력하세요." required="">
					</div>
				</div>
			</div>
            <div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>판매가</span>
					</div>
					<div class="admin-input_text">
					<input type="number" name="#" placeholder="판매가를 입력하세요." required="">
					</div>
				</div>
			</div>
			
		<div class="admin-content_area"> 
			<div class="admin-content "> 
					<div class="admin-content_title"> 
						상품 이미지 
					</div> 
					<div class='img-up-text'><span>이미지 등록</span></div> 
					<label for="input-file"> 
					  <img class='admin-upload_img'> 
				</label> 
				<input class="input_img" required type="file" accept=".png, .jpg, .gif" id="input-file" name="bookImage" style="display: none"/>
				</div> 
	 		</div> 
             <div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>책소개</span>
					</div>
					<div class="admin-input_text">
					<input type="text" name="#" placeholder="책 소개를 입력하세요." required="">
					</div>
				</div>
			</div>
            <div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>저자</span>
					</div>
					<div class="admin-input_text">
					<input type="text" name="#" placeholder="저자를 입력하세요." required="">
					</div>
				</div>
			</div>
            <div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>출판사</span>
					</div>
					<div class="admin-input_text">
					<input type="text" name="#" placeholder="출판사를 입력하세요." required="">
					</div>
				</div>
			</div>
            <div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>출판일</span>
					</div>
					<div class="admin-input_text">
					<input type="number" name="#" placeholder="출판일을 입력하세요." required="">
					</div>
				</div>
			</div>
			
			 <div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>첨부파일</span>
					</div>
					<div class="admin-input_text">
					<input type="file" name="fileUpload" >
					</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>내용</span>
					</div>
					<div class="admin-input_text">
					<textarea name="noticeBoardContent" placeholder="내용을 입력해주세요." required=""></textarea>
					</div>
				</div>
			</div>
          
			
			<button class="submit-btn">등록</button>
		</form>
</section>
		
</body>
</html>

