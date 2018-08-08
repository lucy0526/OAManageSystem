package service;

import dao.NoticeDao;
import entity.Notice;

public class NoticeService {
	public NoticeDao noticeDao = new NoticeDao();
	public Notice selectNewNotice() {
		return noticeDao.selectNewNotice();
	}
	public int addNotice(Notice notice)
	{
		return noticeDao.addNotice(notice);
	}
}
