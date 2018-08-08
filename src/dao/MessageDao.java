package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.JdbcUtil;
import entity.Message;

public class MessageDao {
	JdbcUtil JdbcUtil = new JdbcUtil();

	//������Ϣ
	public int addMassage(Message message) {
		Connection conn = JdbcUtil.getConnection();
		PreparedStatement pstat = null;
		String sql = "insert into message (title,content,date,isread) values (?,?,?,false)";
		int rows  = 0;
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, message.getTitle());
			pstat.setString(2, message.getContent());
			pstat.setDate(3, (Date) message.getDate());
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
	//��ѯ��Ϣ����
	public int selectCounts()
	{
		Connection conn = JdbcUtil.getConnection();
		String sql = "select count(*) from message ";
		Statement stat = null;
		ResultSet rs = null;
		int rows = 0;
		try {
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while(rs.next())
			{
				rows = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO �Զ���ɵ� catch ��
				e.printStackTrace();
			}
		}
		return rows;
	}
	//һҳһҳ�Ĳ���Ϣ
	public Message selectByPage(int page)
	{
		Connection conn = JdbcUtil.getConnection();
		String sql = "select * from message order by mess_id DESC limit ?,1";
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Message message = new Message();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, page-1);
			rs = pstat.executeQuery();
			while(rs.next())
			{
				message.setTitle(rs.getString("title"));
				message.setContent(rs.getString("content"));
				message.setDate(rs.getDate("date"));
				message.setMessId(rs.getInt("mess_id"));
				message.setRead(rs.getBoolean("isread"));
			}
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO �Զ���ɵ� catch ��
				e.printStackTrace();
			}

		}

		return message;
	}
	//��ѯ������Ϣ
	public List<Message> selectAll()
	{
		List<Message> list = new ArrayList<Message>();
		Connection conn = JdbcUtil.getConnection();
		String sql = "select * from message order by date DESC";
		Statement stat = null;
		ResultSet rs = null;
		try {
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while(rs.next())
			{
				Message message = new Message();
				message.setTitle(rs.getString("title"));
				message.setContent(rs.getString("content"));
				message.setDate(rs.getDate("date"));
				message.setMessId(rs.getInt("mess_id"));
				message.setRead(rs.getBoolean("isread"));
				list.add(message);

			}
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO �Զ���ɵ� catch ��
				e.printStackTrace();
			}
		}
		return list;
	}
	//��ID����Ϣ
	public Message selectById(int id)
	{
		Connection conn = JdbcUtil.getConnection();
		String sql = "select * from message where mess_id = ?";
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Message message = new Message();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, id);
			rs = pstat.executeQuery();
			while(rs.next())
			{
				message.setTitle(rs.getString("title"));
				message.setContent(rs.getString("content"));
				message.setDate(rs.getDate("date"));
				message.setMessId(rs.getInt("mess_id"));
				message.setRead(rs.getBoolean("isread"));
			}
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO �Զ���ɵ� catch ��
				e.printStackTrace();
			}

		}

		return message;
	}
	
	public Message selectBytitle(String title)
	{
		Connection conn = JdbcUtil.getConnection();
		String sql = "select * from message where title = ?";
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Message message = new Message();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			rs = pstat.executeQuery();
			while(rs.next())
			{
				message.setTitle(rs.getString("title"));
				message.setContent(rs.getString("content"));
				message.setDate(rs.getDate("date"));
				message.setMessId(rs.getInt("mess_id"));
				message.setRead(rs.getBoolean("isread"));
			}
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO �Զ���ɵ� catch ��
				e.printStackTrace();
			}

		}

		return message;
	}

	public List<Message> selectByEmpId(int id)
	{
		Connection conn = JdbcUtil.getConnection();
//		String sql = "SELECT  message.title,emp.emp_id,message.mess_id,message.isread,message.date  from emp,emp_message,message WHERE emp_message.emp_id=emp.emp_id AND message.mess_id=emp_message.mess_id ORDER BY message.date DESC, message.mess_id DESC;";
		String sql = "SELECT message.title,emp.emp_id,message.mess_id,message.isread,message.date FROM emp INNER JOIN emp_message ON emp.emp_id=emp_message.emp_id INNER JOIN message ON message.mess_id=emp_message.mess_id ORDER BY message.date DESC, message.mess_id DESC;";
		PreparedStatement pstat = null;
		ResultSet rs = null;
		List<Message> list = new ArrayList<Message>();
		try {
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			while(rs.next())
			{
				if(rs.getInt("emp_id")==id) {
					Message message = new Message();
					message.setTitle(rs.getString("title"));
					message.setDate(rs.getDate("date"));
					message.setMessId(rs.getInt("mess_id"));
					message.setRead(rs.getBoolean("isread"));
					list.add(message);
				}
			}
		} catch (SQLException e) {
			// TODO �Զ���ɵ� catch ��
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO �Զ���ɵ� catch ��
				e.printStackTrace();
			}

		}

		return list;
	}
	public int updateIsreadById(int id) {
		Connection conn = JdbcUtil.getConnection();
		String sql = "UPDATE message SET isread = TRUE where mess_id = ?";
		PreparedStatement pstat = null;
		int rows = 0;
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, id);
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
