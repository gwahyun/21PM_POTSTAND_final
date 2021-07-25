<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>
<section>
<div class="admin-content_area">
			<div class="admin-content">
				<div class="admin-content_title">
					EVENT&nbsp;등록
				</div>
			</div>
		</div>
		<form action="${path }/admin/eventUpdateEnd" method="post" onsubmit="return exgetMarkdown();">
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>번호</span>
					</div>
					<div class="admin-input_text">
					<input type="number" name="eventNo" value="${e.eventNo }" readonly="readonly">					
					</div>
				</div>
			</div>
		
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>제목</span>
					</div>
					<div class="admin-input_text">
					<input type="text" value="${e.eventTitle }" name="eventTitle" placeholder="제목을 입력하세요." required="">
					</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>이벤트 기간</span>
					</div>
					<div class="admin-search">
					<input type="date" value="${e.eventEnd }" name="eventEnd" class="date2" required="required">
					 	
				</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>수정할 내용</span>
					</div>
					<input name="eventInfo" type="hidden">
					<div class="admin-input_text">
					 <div id="editor" style="width: 800px"></div>
					</div>
				</div>
			</div>
			
         		
			<button class="submit-btn">등록</button>
		</form>
</section>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
      const editor = new toastui.Editor({
        el: document.querySelector("#editor"),
        previewStyle: "vertical",
        initialEditType: "wysiwyg",
        height: "500px",
      });
        editor.setMarkdown('${e.eventInfo}');
      
      function exgetMarkdown() {
    	  $("input[type=hidden]").val(editor.getMarkdown());
        const text = editor.getMarkdown();
        
    	  if(text.length==0){
    	  alert("빈칸 없이 입력해 주세요.");
    		  return false;
    	  }else{
    		  
    		  return true;
    	  }
        console.log(text);
      }
      function ex() {
        viewer.setMarkdown("# 안녕하세요");
      }
      
      
    </script>
</body>
</html>
