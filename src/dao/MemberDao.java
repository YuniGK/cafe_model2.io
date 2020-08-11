package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.MemberVo;

public class MemberDao {
	
	//Mybatisó�� ��ü
	SqlSessionFactory factory;
	
	//single-ton : ��ü 1���������ؼ� ���(����)����
	static MemberDao single = null;

	public static MemberDao getInstance() {

		if (single == null)
			single = new MemberDao();
		return single;
		
	}

	public MemberDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//���̵� üũ --------------------------------------------------------
	public MemberVo selectOne(String m_id) {
		MemberVo vo = null;
		
		//��ü������
		SqlSession sqlSession = factory.openSession();
		
		//����
		vo = sqlSession.selectOne("member.member_one", m_id);
		
		//��ȯ
		sqlSession.close();
		
		return vo;
	}
	
	//insert -----------------------------------------------------------
	public int insert(MemberVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);

		res = sqlSession.insert("member.member_insert", vo);
		
		sqlSession.close();

		//���н� 0	
		return res;
	}

	//�����ȸ --------------------------------------------------------
	public List<MemberVo> selectList() {
		List<MemberVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("member.member_list");
		
		sqlSession.close();
		
		return list;
	}

	//���� --------------------------------------------------------
	public int delete(int m_idx) {
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.delete("member.member_delete", m_idx);
		
		sqlSession.close();		
				
		return res;
	}

	//ȸ�� �Ѹ� ��ȸ --------------------------------------------------------
	public MemberVo selectOne(int m_idx) {
		MemberVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("member.member_one_list", m_idx);
		
		sqlSession.close();
		
		return vo;
	}

	//ȸ�� ���� ���� ---------------------------------------------------------
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