package com.kh.potstand.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.potstand.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public Member selectMember(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		
		return session.selectOne("member.selectMember", param);
	}
}
