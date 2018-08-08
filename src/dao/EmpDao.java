package dao;

import entity.Emp;
import entity.Wage;
import util.JdbcUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * ��ݿ��������ɾ�Ĳ�
 * 
 * @author biwei
 *
 */
public class EmpDao {
	
	//����Ա��
	public int insertEmp(Emp emp) {
		int priority = 0;
		int rows = 0;
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into emp(emp_name,password,priority,age,gender,phone,email,position,photo) values(?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emp.getEmpName());
			pstmt.setString(2, emp.getPassword());
			pstmt.setInt(3, priority);
			pstmt.setInt(4, emp.getAge());
			pstmt.setString(5, emp.getGender());
			pstmt.setString(6, emp.getPhone());
			pstmt.setString(7, emp.getEmail());
			pstmt.setString(8, emp.getPosition());
			pstmt.setString(9, emp.getPhoto());
			rows = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return rows;
	}
		
	//���idɾ��Ա��
	public int deleteEmpById(int empId) {
		int rows = 0;	//������Ӱ�������
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from emp where emp_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empId);
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rows;
	}
	
	//���id�޸�Ա����Ϣ
	public int updateEmpById(Emp emp) {
		int rows = 0;
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update emp set emp_name=?,password=?,age=?,gender=?,phone=?,email=?,photo=? where emp_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emp.getEmpName());
			pstmt.setString(2, emp.getPassword());
			pstmt.setInt(3, emp.getAge());
			pstmt.setString(4, emp.getGender());
			pstmt.setString(5, emp.getPhone());
			pstmt.setString(6, emp.getEmail());
			pstmt.setString(7, emp.getPhoto());
			pstmt.setInt(8, emp.getEmpId());
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
	
	//��ѯ����Ա��
	public List<Emp> queryAllEmp(){
		List<Emp> list = new ArrayList<Emp>();
		JdbcUtil ju = new JdbcUtil();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ju.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from emp";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Emp emp = new Emp();
				emp.setEmpId(rs.getInt("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setPosition(rs.getString("position"));
				/*Wage wage = new Wage(emp);
				emp.setWage(wage);*/
				emp.setPassword(rs.getString("password"));
				emp.setPriority(rs.getInt("priority"));
				emp.setAge(rs.getInt("age"));
				emp.setGender(rs.getString("gender"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setPhoto(rs.getString("photo"));
				list.add(emp);
			}//of while
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	//����û����ѯԱ����ģ���ѯ��
	public List<Emp> queryEmpByName(String empName, int page){
		List<Emp> list = new ArrayList<Emp>();
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from emp where emp_name like ? limit ?,10";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + empName +"%");
			pstmt.setInt(2, (page-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Emp emp = new Emp();
				emp.setEmpId(rs.getInt("emp_id"));
				Wage wage = new Wage(emp);
				emp.setWage(wage);
				emp.setEmpName(rs.getString("emp_name"));
				emp.setPassword(rs.getString("password"));
				emp.setPriority(rs.getInt("priority"));
				emp.setAge(rs.getInt("age"));
				emp.setGender(rs.getString("gender"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setPosition(rs.getString("position"));
				emp.setPhoto(rs.getString("photo"));
				list.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//�ر���Դ
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	//���id��ѯ�û�
	public Emp queryEmpById(int empId) {
		Emp emp = new Emp();
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from emp where emp_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				emp.setEmpId(rs.getInt("emp_id"));
				Wage wage = new Wage(emp);
				emp.setWage(wage);
				emp.setEmpName(rs.getString("emp_name"));
				emp.setPassword(rs.getString("password"));
				emp.setPriority(rs.getInt("priority"));
				emp.setAge(rs.getInt("age"));
				emp.setGender(rs.getString("gender"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setPosition(rs.getString("position"));
				emp.setPhoto(rs.getString("photo"));
			}//of while
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			//�ر���Դ
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return emp;
	}
	
	//��ѯ������(ģ���ѯ)
	public int queryCountByName(String empName){
		int count = 0;
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select count(*) from emp where emp_name like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + empName + "%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//�ر���Դ
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}
	
	//���ҳ���ѯ�û�
	public List<Emp> queryByPage(int page){
		List<Emp> list = new ArrayList<Emp>();
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from emp limit ?,10";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page - 1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Emp emp = new Emp();
				emp.setEmpId(rs.getInt("emp_id"));
				Wage wage = new Wage(emp);
				emp.setWage(wage);
				emp.setEmpName(rs.getString("emp_name"));
				emp.setPassword(rs.getString("password"));
				emp.setPriority(rs.getInt("priority"));
				emp.setAge(rs.getInt("age"));
				emp.setGender(rs.getString("gender"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setPosition(rs.getString("position"));
				emp.setPhoto(rs.getString("photo"));
				list.add(emp);
			}//of while
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//�ر���Դ
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
		
	//��ѯ������
	public int queryCount() {
		int count = 0;
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select count(*) from emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				count = rs.getInt("count(*)");
			}//of while
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//�ر���Դ
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}
	public Emp queryEmpName(String name)
	{
		JdbcUtil ju = new JdbcUtil();
		Connection conn = ju.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Emp emp = new Emp();
		try {
			/*String sql = "select * from emp where emp_name like ? limit ?,10";*/
			String sql = "select * from emp where emp_name = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name );
			rs = pstmt.executeQuery();
			while(rs.next()) {

				emp.setEmpId(rs.getInt("emp_id"));
				emp.setEmpName(rs.getString("emp_name"));
				emp.setPassword(rs.getString("password"));
				emp.setPriority(rs.getInt("priority"));
				emp.setAge(rs.getInt("age"));
				emp.setGender(rs.getString("gender"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setPosition(rs.getString("position"));
				emp.setPhoto(rs.getString("photo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//关闭资源
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return emp;
	}
}
