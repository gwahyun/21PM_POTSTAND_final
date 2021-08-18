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
    <section class="text-gray-600 body-font">
    <div class="container px-5 py-10 mx-auto h-full">
	 	<div class="slide flex justify-center w-full">
			<img class="cell" src="${pageContext.request.contextPath}/resources/img/grandOpen1.png" alt=""/>
			<img class="cell" src="${pageContext.request.contextPath}/resources/img/event1.png" alt=""/>
			<img class="cell" src="${pageContext.request.contextPath}/resources/img/event2.png" alt=""/>
  		</div>
	</div>
    </section>
	<img title="faq입니다!" style="cursor: pointer" onclick="javascript:window.open('${path }/faqChat','','width=600,height=600');" src="${path }/resources/img/images.png" width="100px " class="fix">
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
