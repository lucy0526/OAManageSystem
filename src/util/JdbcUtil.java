package util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
/**
 * 
 * ��ȡ����
 */
public class JdbcUtil {
	//������ȡ���ӵķ���
	public Connection getConnection(){
		Connection conn = null;
		InputStream in = null;
		try {
			in = this.getClass().getResourceAsStream("/jdbc.properties");//��õ�ǰ��������,�ڶ�������������Ҫ�ҵ��Ǹ��ļ���·��
			Properties prop = new Properties();
			prop.load(in);
			String driver = prop.getProperty("driver");//��ݼ�����ȡֵ
			String url = prop.getProperty("url");
			String userName = prop.getProperty("username");
			String password = prop.getProperty("password");
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try{
				in.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		return conn;
	}
}