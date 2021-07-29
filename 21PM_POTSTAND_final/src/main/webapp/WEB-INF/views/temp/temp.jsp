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
<h1><a href="${path}/db/sortSetting.do">sortSetting</a></h1>
<h1><a href="${path}/db/bookSetting.do">bookSetting</a></h1>

        
</section>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------->
     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
     
</body>
</html>