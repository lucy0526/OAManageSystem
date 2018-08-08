package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.JdbcUtil;
import entity.Overtime;
public class WorkDao 
{
	//����Ա��id��������
		public List<Overtime> queryalloveruserbyid(Integer id)
		{
			
	        List<Overtime> overtimes=new ArrayList<Overtime>();
			JdbcUtil jUtil=new JdbcUtil();
			Connection connection=null;
			PreparedStatement preparedStatement=null;
			ResultSet rs = null;
			try {
				connection=jUtil.getConnection();
			   String sql="select emp.emp_id,emp_name, time,date from emp inner join overtime where emp.emp_id=overtime.emp_id and emp.emp_id=?";
			  preparedStatement=connection.prepareStatement(sql);
			  preparedStatement.setInt(1, id);
			  rs=preparedStatement.executeQuery();
				while(rs.next())
				{
			
					Overtime overtime=new Overtime();
				    overtime.setOvertimeId(rs.getInt("emp.emp_id"));
				    overtime.setDate(rs.getDate("date"));
				    overtime.setTime(rs.getInt("time"));
				    overtime.setname(rs.getString("emp_name"));
				     overtimes.add(overtime);
					
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally 
			{
				//�ر���Դ
				try {
					rs.close();
					preparedStatement.close();
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
	
			return overtimes;
		
			
		}
		public List<Overtime> queryallmissuserbyid(Integer id)
		{
			
	        List<Overtime> overtimes=new ArrayList<Overtime>();
			JdbcUtil jUtil=new JdbcUtil();
			Connection connection=null;
			PreparedStatement preparedStatement=null;
			ResultSet rs = null;
			try {
				connection=jUtil.getConnection();
			   String sql="select emp.emp_id,emp_name, time,date from emp inner join misstime where emp.emp_id=misstime.emp_id and emp.emp_id=?";
			  preparedStatement=connection.prepareStatement(sql);
			  preparedStatement.setInt(1, id);
			  rs=preparedStatement.executeQuery();
				while(rs.next())
				{
			
					Overtime overtime=new Overtime();
				    overtime.setmisstimeId(rs.getInt("emp.emp_id"));
				    overtime.setDate(rs.getDate("date"));
				    overtime.setTime(rs.getInt("time"));
				    overtime.setname("emp_name");
				     overtimes.add(overtime);
					
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally 
			{
				//�ر���Դ
				try {
					rs.close();
					preparedStatement.close();
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
	
			return overtimes;
		
			
		}
		//���ʱ������
		public List<Overtime> queryalloveruserbytime()
		{
			
			
			List<Overtime> overtimes=new ArrayList<Overtime>();
			JdbcUtil jUtil=new JdbcUtil();
			Connection connection=null;
			Statement Statement=null;
			ResultSet rs = null;
			try {
				connection=jUtil.getConnection();
				Statement=connection.createStatement();
			   String sql="select emp.emp_id,emp_name, date,time from emp inner join overtime where emp.emp_id=overtime.emp_id order by overtime_id";
		  
			  rs=Statement.executeQuery(sql);
				while(rs.next())
				{
			
					Overtime overtime=new Overtime();
				    overtime.setOvertimeId(rs.getInt("emp.emp_id"));
				    overtime.setDate(rs.getDate("date"));
				    overtime.setTime(rs.getInt("time"));
				    overtime.setname(rs.getString("emp_name"));
				     overtimes.add(overtime);
					
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally 
			{
				//�ر���Դ
				try {
					rs.close();
				Statement.close();
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
	
			return overtimes;
			
			
		}
    //���ȱ����Ա����
		public List<Overtime> queryallmissuserbytime()
		{
			
			
			List<Overtime> overtimes=new ArrayList<Overtime>();
			JdbcUtil jUtil=new JdbcUtil();
			Connection connection=null;
			Statement Statement=null;
			ResultSet rs = null;
			try {
				connection=jUtil.getConnection();
				Statement=connection.createStatement();
			   String sql="select emp.emp_id,emp_name, date,time from emp inner join misstime where emp.emp_id=misstime.emp_id order by misstime_id";
		  
			  rs=Statement.executeQuery(sql);
				while(rs.next())
				{
			
					Overtime overtime=new Overtime();
				    overtime.setmisstimeId(rs.getInt("emp.emp_id"));
				    overtime.setDate(rs.getDate("date"));
				    overtime.setTime(rs.getInt("time"));
				    overtime.setname(rs.getString("emp_name"));
				    overtimes.add(overtime);
					
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally 
			{
				//�ر���Դ
				try {
					rs.close();
				Statement.close();
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
	
			return overtimes;
			
			
		}
   //������Ա
    public void addtime(Integer id,String name,Integer time,Object date,int type)
    {

		JdbcUtil ju = new JdbcUtil();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    	Overtime overtime =new Overtime();
    	
    	String oversql = "INSERT INTO overtime( emp_id,time,date) VALUES (?,?,?)";//���ӼӰ���Ա����
    	String misssql = "INSERT INTO misstime( emp_id,time,date) VALUES (?,?,?)";//����ȱ����Ա����
    	try {
    		conn=ju.getConnection();
    		if(type==1)//type=1���ӼӰ���Ա
    		{
			pstmt = conn.prepareStatement(oversql);
			}
    		if(type==2)//type=2����ȱ�ڵ���Ա
    		{
    			
    			pstmt = conn.prepareStatement(misssql);
    		
    		}
			pstmt.setInt(1, id);
			pstmt.setInt(2, time);
			pstmt.setObject(3, date);
		    pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
    	
    }

}
