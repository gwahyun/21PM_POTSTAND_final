<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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


.slide{
position:relative;
}
.cell{
position:absolute;
top:0px;
opacity:0;
z-index:0;
transition:opacity .5s ease-in-out;
}
.showing{
z-index:1;
opacity:1;
}


</style>
<section class="text-gray-600 body-font min-h-screen">
	 	<div class="slide flex justify-center w-full">
			<img class="cell w-screen" src="${pageContext.request.contextPath}/resources/img/grandOpen1.png" alt=""/>
			<img class="cell w-screen" src="${pageContext.request.contextPath}/resources/img/event1.png" alt=""/>
			<img class="cell w-screen" src="${pageContext.request.contextPath}/resources/img/event2.png" alt=""/>
  		</div>
	<div class="container px-5 py-10 mx-auto">
	</div>
    </section>
<script>
 const SHOWING = "showing";
 const firstSlide = document.querySelector(".cell:first-child");
 firstSlide.classList.add(SHOWING);
 
 function slide(){
	 const currentSlide = document.querySelector(".showing");
	 if(currentSlide){
		 currentSlide.classList.remove(SHOWING);
		 const nextSlide = currentSlide.nextElementSibling;
		 console.log(nextSlide);
		 if(nextSlide){
			 nextSlide.classList.add(SHOWING);
		 }else{
			 firstSlide.classList.add(SHOWING);
		 }
		 
	 }else{
		 firstSLide.classList.add(SHOWING);
	 }
 }
 setInterval(slide,4000);
 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
