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
		<form action="${path }/admin/eventInsertEnd" method="post" enctype="multipart/form-data" onsubmit="return exgetMarkdown();">
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>구분</span>
					</div>
					<div class="admin-input_text">
						<select id="optionValue" name="type" required="" class="notice-type-select">
							<option value="">선택하세요</option>
							<option value="Y">책</option>
							<option value="N">준비중</option>
						</select>
						해당 책 :<h2 style="margin-left: 117px;" id="parentEleId"></h2>
						<input type="hidden" name="parentValue" id="parentValue" value=""/>
					</div>
				</div>
			</div>
			
			<script>
			
			
			
			$("#optionValue").on('change',function(){
				if(this.value=='Y'){
					const status="width=1000px,height=600px";
			    	const title="duplicateId";
			    	const url="${path}/admin/eventSelectBook";
			    	open(url,title,status);
				}else{
					$("h2").html("");
				}
				
			});
			
			
			
			
			</script>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>제목</span>
					</div>
					<div class="admin-input_text">
					<input type="text" name="eventTitle" placeholder="제목을 입력하세요." required="">
					</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>소제목</span>
					</div>
					<div class="admin-input_text">
					<input type="text" name="eventShort" placeholder="제목을 입력하세요." required="">
					</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>할인율</span>
					</div>
					<div class="admin-input_text">
					<input step="0.1" type="number" name="discount" placeholder="할인율을 입력하세요." required="">
					</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>이벤트 종료일</span>
					</div>
					<div class="admin-search">
					<input type="date" name="eventEnd" class="date2" required="required">
				</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>메인으로 보여질 이미지</span>
					</div>
					<div class="admin-input_text">
					<label for="input-file">
				  <img class="admin-upload_img">
					</label>
					<!-- <input type="file" name="upFile"> -->
					<input class="input_img" required="" type="file" accept=".png, .jpg, .gif" id="input-file" name="upFile" style="display: none">
					</div>
				</div>
			</div>
			<script>
		
		window.addEventListener("load",function(){
			function readImage(input) {
			    // 인풋 태그에 파일이 있는 경우
			    if(input.files && input.files[0]) {
			        // 이미지 파일인지 검사 (생략)
			        // FileReader 인스턴스 생성
			        const reader = new FileReader()
			        // 이미지가 로드가 된 경우
			        reader.onload = e => {
			            const previewImage = document.querySelector(".admin-upload_img")
			            previewImage.src = e.target.result
			        }
			        // reader가 이미지 읽도록 하기
			        reader.readAsDataURL(input.files[0])
			    }
			}
			// input file에 change 이벤트 부여
			const inputImage = document.querySelector(".input_img")
			inputImage.addEventListener("change", e => {
			    readImage(e.target)
			})
			
		});
	</script>
			
			
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>내용</span>
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
      const viewer = toastui.Editor.factory({
        el: document.querySelector("#viewer"),
        viewer: true,
        height: "500px",
      });
      function ToView() {
        viewer.setMarkdown(editor.getMarkdown());
      }
      function exgetMarkdown() {
    	  if($("h2").html()==""){
    		  alert("책을 다시 입력해주세요");
    		  return false;
    	  }
    	  
    	  $("input[name=eventInfo]").val(editor.getMarkdown());
        const text = editor.getMarkdown();
        const hi = $(".hi").val();
        const h = $(".h").val();
        
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

