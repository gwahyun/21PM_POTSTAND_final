package com.kh.potstand.common;

public class PageFactory {
	
	public static String getPageBar(int totalData, int cPage, int numPerPage, int pageBarSize, String url) {
		
		//변수지정
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;		
		
		
		String pageBar="<ul class='flex w-full justify-center'>";
		//이전
		if(pageNo==1) {
			pageBar+="<li class='mr-1'>"
					+ "<a class='inline-block py-1 px-3 text-gray-400 cursor-not-allowed' href='#' tabindex='-1'> 이전 </a>"
					+ "</li>";
		}else {
			pageBar+="<li class='mr-1'>"
					+ "<a class='inline-block border border-white rounded hover:border-gray-200 text-blue-500 hover:bg-gray-200 py-1 px-3' href='javascript:changePage("+(pageNo-1)+")'> 이전 </a>"
					+ "</li>";
		}
		
		//페이지번호
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='mr-1'>"
						+ "<a class='inline-block border border-blue-500 rounded py-1 px-3 bg-blue-500 text-white'>"+pageNo+"</a>"
						+ "</li>";
			}else {
				pageBar+="<li class='mr-1'>"
						+ "<a class='inline-block border border-white rounded hover:border-gray-200 text-blue-500 hover:bg-gray-200 py-1 px-3' href='javascript:changePage("+(pageNo)+")'>"+pageNo+"</a>"
						+ "</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='mr-1'>"
					+ "<a class='inline-block py-1 px-3 text-gray-400 cursor-not-allowed' href='#' tabindex='-1'> 다음 </a>"
					+ "</li>";
		}else {
			pageBar+="<li class='mr-1'>"
					+ "<a class='inline-block border border-white rounded hover:border-gray-200 text-blue-500 hover:bg-gray-200 py-1 px-3' href='javascript:changePage("+(pageNo)+")'> 다음 </a>"
					+ "</li>";
		}
		pageBar+="</ul>";
		pageBar+="<script>"
				+ "function changePage(cPage){"
				+ "location.assign('"+url+"?cPage='+cPage);"
				+ "}"
				+ "</script>";

		return pageBar;
	}
	
public static String getPageBar(int totalData, int cPage, int numPerPage, int pageBarSize, String url,String param) {
		
		//변수지정
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;		
		
		
		String pageBar="<ul class='flex w-full justify-center'>";
		//이전
		if(pageNo==1) {
			pageBar+="<li class='mr-1'>"
					+ "<a class='inline-block py-1 px-3 text-gray-400 cursor-not-allowed' href='#' tabindex='-1'> 이전 </a>"
					+ "</li>";
		}else {
			pageBar+="<li class='mr-1'>"
					+ "<a class='inline-block border border-white rounded hover:border-gray-200 text-blue-500 hover:bg-gray-200 py-1 px-3' href='javascript:changePage("+(pageNo-1)+")'> 이전 </a>"
					+ "</li>";
		}
		
		//페이지번호
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='mr-1'>"
						+ "<a class='inline-block border border-blue-500 rounded py-1 px-3 bg-blue-500 text-white'>"+pageNo+"</a>"
						+ "</li>";
			}else {
				pageBar+="<li class='mr-1'>"
						+ "<a class='inline-block border border-white rounded hover:border-gray-200 text-blue-500 hover:bg-gray-200 py-1 px-3' href='javascript:changePage("+(pageNo)+")'>"+pageNo+"</a>"
						+ "</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='mr-1'>"
					+ "<a class='inline-block py-1 px-3 text-gray-400 cursor-not-allowed' href='#' tabindex='-1'> 다음 </a>"
					+ "</li>";
		}else {
			pageBar+="<li class='mr-1'>"
					+ "<a class='inline-block border border-white rounded hover:border-gray-200 text-blue-500 hover:bg-gray-200 py-1 px-3' href='javascript:changePage("+(pageNo)+")'> 다음 </a>"
					+ "</li>";
		}
		pageBar+="</ul>";
		pageBar+="<script>"
				+ "function changePage(cPage){"
				+ "location.assign('"+url+"?"+param+"&cPage='+cPage);"
				+ "}"
				+ "</script>";

		return pageBar;
	}
}
