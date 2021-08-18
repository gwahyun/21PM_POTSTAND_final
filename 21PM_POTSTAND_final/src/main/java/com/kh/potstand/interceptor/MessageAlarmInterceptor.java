package com.kh.potstand.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.potstand.member.model.service.MemberService;
import com.kh.potstand.member.model.vo.Member;

@Controller
public class MessageAlarmInterceptor implements HandlerInterceptor {
	
	@Autowired
	MemberService service;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getSession().getAttribute("loginMember")!=null) {
			String memberId=(String)((Member)request.getSession().getAttribute("loginMember")).getMemberId();
			int messageCount = service.getMessageCount(memberId);
			List<Map> messageList = service.getMessageList(memberId);
			HttpSession session = request.getSession();
			session.setAttribute("messageCount", messageCount);
			session.setAttribute("messageList", messageList);
			return true;
		}else {
			return true;
		}
	}
}
