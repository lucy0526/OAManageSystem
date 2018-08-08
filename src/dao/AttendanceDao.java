package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import util.JdbcUtil;
import entity.Attendance;

public class AttendanceDao 
{
  //����Ա��id��������
	public List<Attendance> queryallUserbyid(Integer id)
	{
		
        List<Attendance> attendances=new ArrayList<Attendance>();
		JdbcUtil jUtil=new JdbcUtil();
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet rs = null;
		try {
			connection=jUtil.getConnection();
		   String sql="select emp.emp_id,emp_name, startdate,enddate from emp inner join attendance where emp.emp_id=attendance.emp_id and emp.emp_id=?";
		  preparedStatement=connection.prepareStatement(sql);
		  preparedStatement.setInt(1, id);
		  rs=preparedStatement.executeQuery();
			while(rs.next())
			{
		
				Attendance attendance=new Attendance();
				attendance.setEmpId(rs.getInt("emp.emp_id"));
	            attendance.setname(rs.getString("emp_name"));
	            attendance.setStartdate(rs.getObject("startdate"));
				attendance.setEnddate(rs.getObject("enddate"));
				attendances.add(attendance);
				
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
		
		
		return attendances;
		
	
		
	}
	
    //����Ա��ǩ��ʱ���������
	public List<Attendance> queryallUserbytime()
	{
		
		
		
		List<Attendance> attendances=new ArrayList<Attendance>();
		JdbcUtil jUtil=new JdbcUtil();
		Connection connection=null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			connection=jUtil.getConnection();
			stmt=connection.createStatement();
			String sql="select emp.emp_id,emp_name, startdate,enddate from emp inner join attendance where emp.emp_id=attendance.emp_id order by att_id";
		
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
		
				Attendance attendance=new Attendance();
				attendance.setEmpId(rs.getInt("emp.emp_id"));
	            attendance.setname(rs.getString("emp_name"));
				attendance.setStartdate(rs.getObject("startdate"));
				attendance.setEnddate(rs.getObject("enddate"));
				attendances.add(attendance);
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally 
		{
			//�ر���Դ
			try {
				rs.close();
				stmt.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return attendances;
		
		
	}
	//ǩ��
	 public int sign(Integer id) throws ParseException
	    {
	    	int rows = 0;
			JdbcUtil ju = new JdbcUtil();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	    	Attendance attendance=new Attendance();
	    	String sql = "INSERT INTO attendance ( emp_id,startdate,static) VALUES (?,?,?)";
	    	try {
	    		conn=ju.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				attendance.setStartdate(attendance.gettime());
				pstmt.setObject(2, attendance.getStartdate());
				pstmt.setInt(3,1);
//			    pstmt.executeUpdate();
			    rows = pstmt.executeUpdate();
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
	    	return rows;
		}

    
    	
    
   //ǩ��
	 public int leave(Integer id) throws ParseException
	    {
	    	int rows = 0;
			JdbcUtil ju = new JdbcUtil();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	    	Attendance attendance=new Attendance();
	    	String sql = "update attendance set enddate=?,static=2 where emp_id=? and static=1;";
	     	try {
	    		conn=ju.getConnection();
				pstmt = conn.prepareStatement(sql);
				attendance.setEnddate(attendance.gettime());
				pstmt.setObject(1, attendance.getEnddate());
				pstmt.setInt(2, id);
			    rows = pstmt.executeUpdate();
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
	    	return rows;
	    }

	//ɾ��
    public void delete(Integer id) throws ParseException
    {
    	
    	
    }
  //�༭ 
   public void edit() throws ParseException
    {
		
	}
    }
