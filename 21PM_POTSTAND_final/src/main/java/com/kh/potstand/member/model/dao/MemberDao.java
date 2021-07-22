package com.kh.potstand.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.member.model.vo.Member;

public interface MemberDao {

	Member selectMember(SqlSession session,@RequestParam Map param);
}
