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
   <link
      rel="stylesheet"
      href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/2.0.0/toastui-editor.min.css">
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
<section class="mx-80">
        <div><h1 class="text-4xl font-bold m-5 text-center">1:1문의하기</h1></div>
        <div class="nav-container flex">
            <div id="notice-nav" class="text-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12"><a href="${path}/notice/noticeSelectList.do">공지사항</a></div>
            <div id="qna-nav" class="text-center bg-blue-500 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12">1:1문의하기</div>
            <div id="myqna-nav" class="text-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-blue-400 
	          		text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12"><a href="${path}/qna/myQnaList.do">내 문의내역</a></div>
        </div>
        <div class="qna-container">
        	<form id="qnaWriteEnd" method="post" action="${path}/qna/qnaWriteEnd.do">
	            <div class="qna-title flex m-8">
	            	<label class="text-2xl">분류</label>
	            	<select name="qnaSort" class="mx-5 border-solid border border-gray-300 w-1/12">
	                	<option value="상품문의">상품문의</option>
	                	<option value="교환">교환</option>
	                	<option value="반품">반품</option>
	                </select>
	                <label class="text-2xl mx-4">제목</label><input type="text" name="qnaTitle" 
	                class="border-solid border border-gray-300 w-9/12" required>
	            </div>
	            <div class="qna-content  flex m-8">
	                 <label class="text-2xl">내용</label><div id="editor" class="ml-5 border-solid border border-gray-300 w-11/12"></div>
	                 <input type="hidden" name="qnaContent" id="qnaContent">
	                 <input type="hidden" name="memberId" id="memberId" value="${loginMember.memberId}">
	            </div>
	            <div class="btn-area flex justify-center">
	                <button type="button" class="inline-flex items-center bg-gray-300 border border-solid border-gray-400 py-3 px-5 m-3 focus:outline-none hover:bg-red-200 
	          		hover:text-white rounded text-base mt-4 md:mt-0" onclick="qnaInsert();">
	            		등록하기
          			</button>
	                <button type="button" class="inline-flex items-center bg-gray-300 border border-solid border-gray-400 py-3 px-5 m-3 focus:outline-none hover:bg-red-200 
	          		hover:text-white rounded text-base mt-4 md:mt-0" 
	          		onclick="location.assign('${pageContext.request.contextPath}/notice/noticeSelectList.do');">
	            		돌아가기
          			</button>
	            </div>
	        </form>
        </div>
        
    </section>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
     <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
      const editor = new toastui.Editor({
        el: document.querySelector("#editor"),
        previewStyle: "vertical",
        initialEditType: "wysiwyg",
        height: "500px",
      });
      
      function ToView() {
        viewer.setMarkdown(editor.getMarkdown());
      }
      
      
      function ex() {
        viewer.setMarkdown("# 안녕하세요");
      }
      
      function qnaInsert(){
    	  const text = editor.getMarkdown();
    	  $("#qnaContent").attr("value",text);
    	  console.log($("#qnaContent").attr("value"));
    	  if(text!=""){
    	  	$("#qnaWriteEnd").submit();
    	  }else{
    		  alert("내용을 입력해주세요");
    		  focus(editor);
    	  }
      }
    </script>
</body>
</html>