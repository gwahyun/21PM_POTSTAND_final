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
		<form action="${path }/admin/eventUpdateEnd" method="post"  enctype="multipart/form-data" onsubmit="return exgetMarkdown();">
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
						<span>구분</span>
					</div>
					<div class="admin-input_text">
						<select id="optionValue" name="type" required="" class="notice-type-select">
							<c:choose>
								<c:when test="${e.type == 'Y' }">
									<option value="">선택하세요</option>
									<option value="Y" selected>책</option>
									<option value="N">준비중</option>
								</c:when>
								<c:otherwise>
									<option value="">선택하세요</option>
									<option value="Y" >책</option>
									<option value="N">준비중</option>
								</c:otherwise>	
							</c:choose>
							
						</select>
							해당 책 :<h2 style="margin-left: 117px;" id="parentEleId">${str }</h2>
						<input type="hidden" name="parentValue" id="parentValue" value="${str }"/>
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
					//alert(this.value);
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
					<input type="text" value="${e.eventTitle }" name="eventTitle" placeholder="제목을 입력하세요." required="">
					</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>소제목</span>
					</div>
					<div class="admin-input_text">
					<input type="text" value="${e.eventShort}" name="eventShort" placeholder="제목을 입력하세요." required="">
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
						<span>메인으로 보여질 이미지</span>
					</div>
					<div class="admin-input_text">
						등록된 이미지
					<img src="${path }/resources/upload/event/${e.eventThum }" width="300px" height="300px">
					<input type="hidden" name="oldFile" value="${e.eventThum}">
					<input type="file" name="upFile"/>
					</div>
				</div>
			</div>
			
			<div class="admin-content_area">
				<div class="admin-content">
					<div class="admin-content_title">
						<span>수정할 내용</span>
					</div>
					<input id="info" name="eventInfo" type="hidden">
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
    	  if($("h2").html()==""){
    		  alert("책을 다시 입력해주세요");
    		  return false;
    	  }
    	  $("#info").val(editor.getMarkdown());
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
