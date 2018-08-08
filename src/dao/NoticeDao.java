package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.JdbcUtil;
import entity.Notice;

public class NoticeDao {
	JdbcUtil JdbcUtil = new JdbcUtil();
	public Notice selectNewNotice()
	{
		Notice notice = new Notice();
		String sql = "select * from notice order by notice_id DESC limit 0,1";
		Connection conn = JdbcUtil.getConnection();
		ResultSet rs = null;
		Statement stat = null;
		try {
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while(rs.next())
			{
				notice.setContent(rs.getString("content"));
				notice.setNoticeId(new Integer(rs.getInt("notice_id")));
				notice.setTitle(rs.getString("title"));
				notice.setDate(rs.getDate("date"));
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
		return notice;
	}
	public int addNotice(Notice notice)
	{
		Connection conn = JdbcUtil.getConnection();
		PreparedStatement pstat = null;
		String sql = "insert into notice (title,content,date,notice_source,notice_type) values (?,?,?,?,?)";
		int rows  = 0;
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, notice.getTitle());
			pstat.setString(2, notice.getContent());
			pstat.setDate(3, (Date)notice.getDate());
			pstat.setString(4, notice.getNotice_source());
			pstat.setString(5, notice.getNotice_type());
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
		String sql = "select count(*) from message";
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
}
