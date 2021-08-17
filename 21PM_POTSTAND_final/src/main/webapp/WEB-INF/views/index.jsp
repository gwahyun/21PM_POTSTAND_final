<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	.fix{
		position: fixed;
		right: 3em;
		bottom:3em;
		background:  center center / 50% no-repeat;
	    animation: target_image 1.2s; 
 		animation-iteration-count: infinite;
		transform-origin: 50% 100%;
	}
	@keyframes target_image {
		0% { transform: rotate(-5deg); }
		50% { transform: rotate(10deg) }
		100% { transform: rotate(-5deg); }
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
.tracking-in-expand {
	-webkit-animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
	        animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
}

@-webkit-keyframes tracking-in-expand {
  0% {
    letter-spacing: -0.5em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    opacity: 1;
  }
}
@keyframes tracking-in-expand {
  0% {
    letter-spacing: -0.5em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    opacity: 1;
  }
}


</style>
    <section class="text-gray-600 body-font">
    <div class="container px-5 py-10 mx-auto">
	  <div class="slide-container flex justify-center w-full">
    <ul class="slide ">
      <li class="cell inline-block"><img src="${pageContext.request.contextPath}/resources/img/grandOpen1.png" alt=""/></li>
      <li class="cell hidden"><img src="${pageContext.request.contextPath}/resources/img/event1.png" alt=""/></l>
      <li class="cell hidden"><img src="${pageContext.request.contextPath}/resources/img/event2.png" alt=""/></li>
    </ul>
  </div>
</div>
    </section>
	<img title="faq입니다!" style="cursor: pointer" onclick="javascript:window.open('${path }/faqChat','','width=600,height=600');" src="${path }/resources/img/images.png" width="100px " class="fix">
<script>

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
