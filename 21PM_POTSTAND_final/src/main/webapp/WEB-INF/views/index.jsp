<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="container px-5 py-24 mx-auto">
	<div class="flex justify-center items-center bg-red-500 h-44">
	<img src="${pageContext.request.contextPath}/resources/img/potstand_logo.svg" alt="" class="fill-current 
	           	text-red-500 w-12 rounded-full border-3 border-white"/>
	<h1 class="text-white text-5xl font-bold tracking-in-expand">POTSTAND</h1>
		</div>
		</div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
