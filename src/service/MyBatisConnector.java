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
			//sqlMapConfig.xml�о���δ�.
			Reader reader = 
											/* ��Ű�� ���
															mybatis������ ��� �ִ� ���� (DB / Mapper ������ �ִ�.) */
				Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
			/* ���� ������ �о� factory�� �����Ѵ�. 
			factory �۾��ڸ� �����ϴ� ��ü */
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//������ factory�� �ٸ� ������ ����� �����ϵ��� �Ѵ�.
	public SqlSessionFactory  getSqlSessionFactory()
	{
		return factory;
	}
}
