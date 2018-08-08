package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Emp;
import entity.Wage;
import util.JdbcUtil;

public class LoginDao {
	//ÊµÏÖµÇÂ¼
	public Emp Login(String empName, String password) {
		Emp emp = new Emp();
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from emp where emp_name=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empName);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				emp.setEmpId(rs.getInt("emp_id"));
				Wage wage = new Wage(emp);
				//emp.setWage(wage);
				emp.setEmpName(rs.getString("emp_name"));
				emp.setPassword(rs.getString("password"));
				emp.setPriority(rs.getInt("priority"));
				emp.setAge(rs.getInt("age"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setPosition(rs.getString("position"));
				emp.setPhoto(rs.getString("photo"));
			}//of while
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return emp;
	}
}

