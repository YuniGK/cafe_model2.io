 package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ReviewVo;

public class ReviewDao {

	SqlSessionFactory factory;
	
	//single-ton : 객체 1개만생성해서 사용(서비스)하자
	static ReviewDao single = null;

	public static ReviewDao getInstance() {

		if (single == null)
			single = new ReviewDao();
		return single;
	}

	public ReviewDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public int insert (ReviewVo vo) {
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("review.review_insert", vo);
		
		sqlSession.close();
		
		//실패시 0	
		return res;
	}
	
	public List<ReviewVo> selectList() {

		List<ReviewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList("review.review_list");
		
		sqlSession.close();
		
		return list;
	}
	

	public List<ReviewVo> select(int m_idx) {

		List<ReviewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList("review.my_review_list", m_idx);
		
		sqlSession.close();
		
		return list;
	}
	
	public ReviewVo selectOne(int r_idx) {

		ReviewVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("review.review_list_one", r_idx);
		
		sqlSession.close();

		return vo;
	}
	
	public List<ReviewVo> selectList(int c_idx) {

		List<ReviewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("review.review_list_cafe", c_idx);
		
		sqlSession.close();

		return list;
	}
	
	public ReviewVo select_review_avg(int c_idx) {

		ReviewVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("review.review_avg_grade", c_idx);
		
		sqlSession.close();
		
		return vo;
	}
	
	public ReviewVo select_review_total(int c_idx) {

		ReviewVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("review.review_total_grade", c_idx);
		
		sqlSession.close();
		
		return vo;
	}
	
	public int delete(int r_idx) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.delete("review.review_delete", r_idx);
		
		sqlSession.close();
		
		//실패시 0	
		return res;
	}
	
	public int update(ReviewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.update("review.review_update", vo);
		
		sqlSession.close();
		
		//실패시 0	
		return res;
	}
	
	public int today_review() {

		int count = 0;

		SqlSession sqlSession = factory.openSession();
		
		count = sqlSession.selectOne("review.today_review");
		
		sqlSession.close();
		
		return count;
	}
	
	public int my_review(int m_idx) {

		int count = 0;

		SqlSession sqlSession = factory.openSession();
		
		count = sqlSession.selectOne("review.my_review", m_idx);
		
		sqlSession.close();
		
		return count;
	}
	
}
