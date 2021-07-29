package com.kh.potstand.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.member.model.dao.MemberDao;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Heart;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.member.model.vo.Point;
import com.kh.potstand.order.model.vo.Cart;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSession session;
	
	//단방향암호화
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//로그인 -> 멤버찾기
	@Override
	public Member memberSelect(Map param) {
		// TODO Auto-generated method stub
		return dao.memberSelect(session,param);
	}

	//회원가입
	@Override
	@Transactional
	public int memberInsert(Member m) throws Exception{
		// TODO Auto-generated method stub	
		try {
			int result=dao.memberInsert(session,m);
			if(result>0) {
				List<Address> Addresses=m.getAddresses();
				if(Addresses.size()>0) { //나중에 주소 여러개 저장할때를 대비해서 이렇게 로직짬
					for(Address a :Addresses) {
						dao.addressInsert(session,a);
					}
				}else return 0;	
			}else return 0;
		}catch(RuntimeException e) {
			throw new Exception("회원가입에 실패하였습니다.");
		}
		return 1;
	}
	
	//아이디찾기
	@Override
	public Member memberSearchIdSelect(String memberEmail){
		return dao.memberSearchIdSelect(session, memberEmail);
	}
	
	//비밀번호 재설정
	@Override
	@Transactional
	public Member memberResetPwd(Member m) throws Exception {
		try {
			Member searchM=dao.memberSearchIdSelect(session, m.getMemberEmail());
			if(searchM!=null && searchM.getMemberId().equals(m.getMemberId())) {
				//임시비밀번호 발급
				char[] charSet = new char[] { 
						'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
						'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
						'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
						'u', 'v', 'w', 'x', 'y', 'z' 
				};
				String temporaryPw="!";
				int index=0;
				for(int i=0; i<7; i++) {
					index=(int)(charSet.length*Math.random());
					temporaryPw+=charSet[index];
				}
				searchM.setMemberPwd(pwEncoder.encode(temporaryPw));
				int result=dao.memberResetPwd(session,searchM);
				searchM.setMemberPwd(temporaryPw);
				if(result>0) {
					return searchM;
				}
			}else {
				throw new Exception("해당 정보로 가입된 아이디가 존재하지 않습니다.");
			}
		}catch(RuntimeException e){
			throw new Exception("비밀번호 재설정에 실패하였습니다. 관리자에게 문의하세요.");
		}
		return null;
	}
	
	//회원탈퇴
	@Override
	@Transactional
	public int memberDelete(Map param) throws Exception {
		try {
			int result=dao.memberAddrDelete(session,param);
			log.debug("{}",result);
			if(result>0) {
				result=dao.memberDelete(session,param);	
				if(result>0) {
					return 1;
				}else {
					return 0;
				}
			}else return 0;
		}catch(RuntimeException e) {
			log.debug(e.getMessage());
			throw new Exception("회원탈퇴에 실패하였습니다. 관리자에게 문의하세요.");
		}
	}
	
	//비밀번호 변경
	@Override
	public int memberUpdatePwd(Map param) {
		return dao.memberUpdatePwd(session, param);
	}	
	
	//회원정보 수정
	@Override
	@Transactional
	public int memberUpdate(Member m) throws Exception {
		try {
			int result=dao.memberUpdate(session,m);
			if(result>0) {
				List<Address> Addresses=m.getAddresses();
				if(Addresses.size()>0) { //나중에 주소 여러개 저장할때를 대비해서 이렇게 로직짬
					for(Address a :Addresses) {
						dao.addressUpdate(session,a);
					}
				}else return 0;	
			}else return 0;
		}catch(RuntimeException e) {
			throw new Exception("회원가입에 실패하였습니다.");
		}
		return 1;
	}
	
	//포인트 기록 조회
	@Override
	public List<Point> memberPointSelect(String memberId) {
		return dao.memberPointSelect(session,memberId);
	}
	
	//포인트 기록 조회(페이징처리)
	@Override
	public List<Point> memberPointSelect(String memberId, int cPage, int numPerpage) {
		return dao.memberPointSelect(session,memberId,cPage,numPerpage);
	}

	//포인트 기록 총 개수
	@Override
	public int memberPointSelectCount(String memberId) {
		return dao.memberPointSelectCount(session,memberId);
	}
	
	//찜목록 개수
	@Override
	public int memberHeartListCount(String memberId) {
		return dao.memberHeartListCount(session,memberId);
	}

	//찜목록 리스트
	@Override
	public List<Heart> memberHeartListSelect(String memberId, int cPage, int numPerpage) {
		return dao.memberHeartListSelect(session,memberId,cPage,numPerpage);
	}
	
	//찜목록 등록전 장바구니에 등록되어 있는 책인지 조회
	@Override
	public Cart memberCartSelect(Map param) {
		return dao.memberCartSelect(session,param);
	}
	
	//찜목록 장바구니에 있으면 amount +1
	@Override
	public int memberOverlapCartUpdate(Map param) {
		return dao.memberOverlapCartUpdate(session,param);
	}
	
	//찜목록 - 선택 장바구니에담기
	@Override
	public int memberChoiceCartInsert(Map param) {
		return dao.memberChoiceCartInsert(session,param);
	}
	
	//찜목록 지우기
	@Override
	public int memberHeartDelete(Map param) {
		return dao.memberHeartDelete(session,param);
	}
	
	//내 리뷰 관리 - 리뷰리스트 총 개수
	@Override
	public int memberReviewListCount(Map param) {
		return dao.memberReviewListCount(session,param);
	}

	//내 리뷰 관리 - 리뷰리스트
	@Override
	public List<Review> memberReviewListSelect(Map param,int cPage, int numPerpage) {
		return dao.memberReviewListSelect(session,param,cPage,numPerpage);
	}
	
	//notice List 호출 (공지사항 페이지)
	@Override
	public List<Notice> noticeSelectList(int cPage, int numPerPage) {
		return dao.noticeSelectList(session, cPage, numPerPage);
	}

	//notice Content 호출
	@Override
	public Notice noticeSelectOne(int noticeNo) {
		return dao.noticeSelectOne(session, noticeNo);
	}

	//내 문의 List 호출
	@Override
	public List<Qna> qnaSelectList(String memberId, int cPage, int numPerPage) {
		return dao.qnaSelectList(session, memberId, cPage, numPerPage);
	}

	//qna Content 호출
	@Override
	public Qna qnaSelectOne(int qnaNo) {
		return dao.qnaSelectOne(session, qnaNo);
	}

	//1:1문의 작성
	@Override
	public int qnaInsert(Qna q) {
		return dao.qnaInsert(session, q);
	}

	
	//notice count : totalData용
	@Override
	public int noticeSelectCount() {
		return dao.noticeSelectCount(session);
	}

	//qna count : totalData용
	@Override
	public int qnaSelectCount(String memberId) {
		return dao.qnaSelectCount(session, memberId);
	}

	//카트 조회
	@Override
	public List<Cart> cartSelectList(String memberId) {
		return dao.cartSelectList(session, memberId);
	}

	//카트 항목 삭제 / 전체삭제
	@Override
	public int cartObjDelete(Map param) {
		return dao.cartObjDelete(session, param);
	}
	
	//카트 선택삭제
	@Override
	public int cartObjDelete(List<String> param) {
		return dao.cartObjDelete(session, param);
	}
	
	//카트 bookAmount update
	@Override
	public int cartBookAmountUpdate(Map param) {
		return dao.cartBookAmountUpdate(session, param);
	}


	@Override
	public int cartCouponUpdate(Map param) {
		return dao.cartCouponUpdate(session, param);
	}
	
	


	
}
