<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>postand - admin</title>
<c:set var ="path" value = "${pageContext.request.contextPath }"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/adminStyle.css"/>
<!-- Latest compiled and minified CSS -->
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
</head>
    <body >
        <aside>
            <div class="admin-logo"><a href="${path }/admin/adminMain">BOOKin</a></div>
            <ul>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">상품</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/productInsert">상품 등록</a></li>
                        <li><a href="${path }/admin/productSelect">상품 조회/수정</a></li>
                    </ul>
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">판매</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/orderCheck">주문확인/발송관리</a></li>
                    </ul>
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">문의/리뷰</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/qnaManager">문의 관리</a></li>
                        <li><a href="${path }/admin/reviewManager">리뷰 관리</a></li>
                    </ul>
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">NOTICE</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/noticeInsert">NOTICE 등록</a></li>
                        <li><a href="${path }/admin/noticeSelect">NOTICE 조회/관리</a></li>
                    </ul>
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">FAQ</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/faqInsert">FAQ 등록</a></li>
                        <li><a href="${path }/admin/faqSelect">FAQ 조회/관리</a></li>
                    </ul>
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">EVENT</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/eventInsert">EVENT 등록</a></li>
                        <li><a href="${path }/admin/eventSelect">EVENT 조회/관리</a></li>
                    </ul>
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">정산</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/calSelect">정산 내역</a></li>
                    </ul>
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">회원관리</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/memberSelect">회원조회</a></li>
                    </ul>
                   
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text">재고</span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }/admin/stockManager">재고관리</a></li>
                    </ul>
                   
                </li>
                <li class="admin-aside-top_menu"><span class="admin-aside-top_text"></span>
                    <ul class="admin-aside-side_menus">
                        <li><a href="${path }">메인 페이지</a></li>
                    </ul>
                </li>
            </ul>
        </aside>