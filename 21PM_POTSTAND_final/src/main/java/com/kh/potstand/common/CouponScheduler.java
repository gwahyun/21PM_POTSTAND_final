package com.kh.potstand.common;

import org.apache.ibatis.session.SqlSession;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class CouponScheduler {
	
	private SqlSession session;
	
	@Scheduled(cron="0 0 0 * * *") //메일 00시
	public void couponEndScheduled() {
		session.update("member.membmerCouponEndUpdate");
	}
}
