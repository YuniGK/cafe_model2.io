package service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MyBatisConnector {
    
	SqlSessionFactory  factory=null;
	private static MyBatisConnector connector;
	//private static MyBatisConnector connector = null;
	
	//single-ton
	public static MyBatisConnector getInstance(){
		if(connector==null)
			connector = new MyBatisConnector();
		return connector;
	}
	
	public MyBatisConnector()
	{
		try {
			//sqlMapConfig.xml읽어들인다.
			Reader reader = 
											/* 패키지 경로
															mybatis설정이 들어 있는 파일 (DB / Mapper 정보가 있다.) */
				Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
			/* 파일 정보를 읽어 factory를 생성한다. 
			factory 작업자를 생성하는 객체 */
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//생성된 factory를 다른 곳에서 사용이 가능하도록 한다.
	public SqlSessionFactory  getSqlSessionFactory()
	{
		return factory;
	}
}
