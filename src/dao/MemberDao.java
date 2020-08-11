package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.MemberVo;

public class MemberDao {
	
	//Mybatis처리 객체
	SqlSessionFactory factory;
	
	//single-ton : 객체 1개만생성해서 사용(서비스)하자
	static MemberDao single = null;

	public static MemberDao getInstance() {

		if (single == null)
			single = new MemberDao();
		return single;
		
	}

	public MemberDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//아이디 체크 --------------------------------------------------------
	public MemberVo selectOne(String m_id) {
		MemberVo vo = null;
		
		//객체얻어오기
		SqlSession sqlSession = factory.openSession();
		
		//수행
		vo = sqlSession.selectOne("member.member_one", m_id);
		
		//반환
		sqlSession.close();
		
		return vo;
	}
	
	//insert -----------------------------------------------------------
	public int insert(MemberVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);

		res = sqlSession.insert("member.member_insert", vo);
		
		sqlSession.close();

		//실패시 0	
		return res;
	}

	//목록조회 --------------------------------------------------------
	public List<MemberVo> selectList() {
		List<MemberVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("member.member_list");
		
		sqlSession.close();
		
		return list;
	}

	//삭제 --------------------------------------------------------
	public int delete(int m_idx) {
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.delete("member.member_delete", m_idx);
		
		sqlSession.close();		
				
		return res;
	}

	//회원 한명 조회 --------------------------------------------------------
	public MemberVo selectOne(int m_idx) {
		MemberVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("member.member_one_list", m_idx);
		
		sqlSession.close();
		
		return vo;
	}

	//회원 정보 수정 ---------------------------------------------------------
	public int update(MemberVo vo) {
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.update("member.member_update", vo);
		
		sqlSession.close();
		
		return res;
	}	
	
	public int todayMember() {

		int count = 0;
		
		SqlSession sqlSession = factory.openSession();
		
		count = sqlSession.selectOne("member.today_member");
		
		System.out.println(count);
		
		sqlSession.close();

		return count;
	}
	
}