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
<section class="text-gray-600 body-font overflow-hidden">
     <div class="container p-5 mx-auto">
     <div><h1 class="sm:text-3xl
            text-2xl
            font-medium
            title-font
            mb-2
            text-gray-900">고객센터</h1></div>
            <div class="h-1 w-20 bg-red-500 rounded mb-10"></div>

        <div class="nav-container flex">
        <a href="${path}/notice/noticeSelectList.do" class="text-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-red-500
            text-lg text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12">
           <div id="notice-nav" >공지사항</div></a>
            <div id="qna-nav" class="text-center bg-red-500 border-0 py-1 px-3 focus:outline-none hover:bg-red-500
            text-lg text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12">1:1문의하기</div>
            <a href="${path}/qna/myQnaList.do" class="text-center bg-gray-400 border-0 py-1 px-3 focus:outline-none hover:bg-red-500
            text-lg text-white rounded text-base mt-4 md:mt-0 cursor-pointer font-bold w-4/12">
            <div id="myqna-nav">내 문의내역</div></a>
        </div>
        <div class="qna-container">
        	<form id="qnaWriteEnd" method="post" action="${path}/qna/qnaWriteEnd.do">
	            <div class="qna-title flex m-8">
	            	<label class="text-2xl">분류</label>
	            	<select name="qnaSort" class="border-transparent focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-transparent mx-5 w-1/12">
	                	<option value="상품문의">상품문의</option>
	                	<option value="교환">교환</option>
	                	<option value="반품">반품</option>
	                </select>
	                <label class="text-2xl mx-4">제목</label><input type="text" name="qnaTitle" 
	                class="border-solid border-b-4 border-gray-300 w-9/12 outline-none text-lg focus:border-b-4 focus:border-red-400 easy-in-out" required>
	            </div>
	            <div class="qna-content  flex m-8">
	                 <label class="text-2xl">내용</label><div id="editor" class="ml-5 border-solid border border-gray-300 w-11/12"></div>
	                 <input type="hidden" name="qnaContent" id="qnaContent">
	                 <input type="hidden" name="memberId" id="memberId" value="${loginMember.memberId}">
	            </div>
	            <div class="btn-area flex justify-center">
	                <button class=" inline-flex items-center bg-gray-100 border-0 py-2 px-6 focus:outline-none hover:bg-red-400 
	          		hover:text-white rounded text-base text-lg mr-10" onclick="qnaInsert();">
	            		등록하기
          			</button>
	               </button>
	            <div class="btn-area flex justify-center">
	            <button class=" inline-flex items-center bg-gray-100 border-0 py-2 px-6 focus:outline-none hover:bg-red-400 
	          		hover:text-white rounded text-base text-lg" onclick="location.assign('${pageContext.request.contextPath}/notice/noticeSelectList.do');">
	            		돌아가기
          			</button>
	            </div>
	        </form>
        </div>
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