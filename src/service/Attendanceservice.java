package service;

import java.util.List;

import dao.AttendanceDao;
import entity.Attendance;

public class Attendanceservice {
	AttendanceDao attendanceDao=new AttendanceDao();
	public List<Attendance> queryallUserbytime()
	{
		List<Attendance> queryallUserbytime = attendanceDao.queryallUserbytime();
		System.out.println("queryallUserbytime:"+queryallUserbytime.size());
		return  queryallUserbytime;
	
		
	}
	public List<Attendance> queryallUserbyid(Integer id)
	{
		return  attendanceDao.queryallUserbyid(id);
	
		
	}
	public int sign(Integer id) throws Exception
	{
		return attendanceDao.sign(id);
	}

	public int leave(Integer id) throws Exception
	{
		return attendanceDao.leave(id);
	}

}
