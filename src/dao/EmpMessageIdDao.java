package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.JdbcUtil;
import entity.Emp;
import entity.Message;

public class EmpMessageIdDao {
	JdbcUtil JdbcUtil = new JdbcUtil();
	public int addEmpMessageId(Emp emp ,Message message)
	{
		Connection conn = JdbcUtil.getConnection();
		int rows = 0;
		String sql = "insert into emp_message (emp_id,mess_id) values (?,?)";
		PreparedStatement pstat = null;
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, emp.getEmpId());
			pstat.setInt(2, message.getMessId());
			rows = pstat.executeUpdate();
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}finally {
			try {
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO �Զ���ɵ� catch ��
				e.printStackTrace();
			}
			
		}
		return rows;
	}
}
