package service;

import java.util.List;

import dao.MessageDao;
import entity.Message;

public class MessageService {
	MessageDao messageDao = new MessageDao();
	public int addMessage (Message message)
	{
		return messageDao.addMassage(message);
	}
	public int selectCounts()
	{
		return messageDao.selectCounts();
	}
	public Message selectByPage( int page)
	{
		return messageDao.selectByPage(page);
	}
	public List<Message> selectAll()
	{
		return messageDao.selectAll();
	}
	public Message selectById(int id)
	{
		return messageDao.selectById(id);
	}
	public Message selectBytitle(String title)
	{
		return messageDao.selectBytitle(title);
	}
	public List<Message> selectByEmpId(int id)
	{
		return messageDao.selectByEmpId(id);
	}
	public int updateIsreadById(int id)
	{
		return messageDao.updateIsreadById(id);
	}
}
