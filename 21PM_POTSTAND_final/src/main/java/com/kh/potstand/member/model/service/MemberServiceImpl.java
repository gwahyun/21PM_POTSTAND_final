package com.kh.potstand.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.potstand.member.model.dao.MemberDao;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSession session;
	
	//로그인 -> 멤버찾기
	@Override
	public Member memberSelect(Map param) {
		// TODO Auto-generated method stub
		return dao.memberSelect(session,param);
	}

	//회원가입
	@Override
	@Transactional
	public int insertMember(Member m) throws Exception{
		// TODO Auto-generated method stub	
		try {
			int result=dao.memberInsert(session,m);
			if(result>0) {
				List<Address> Addresses=m.getAddresses();
				if(Addresses.size()>0) { //나중에 주소 여러개 저장할때를 대비해서 이렇게 로직짬
					for(Address a :Addresses) {
						result=dao.addressInsert(session,a);
					}
				}else return 0;	
			}else return 0;
		}catch(RuntimeException e) {
			throw new Exception("회원가입에 실패하였습니다.");
		}
		return 1;
	}

}
