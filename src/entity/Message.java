package entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private Integer messId;
	private String title;
	private String content;
	private Date date;
	private Set empMessages = new HashSet(0);
	private boolean read = false;

	// Constructors
	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(String title, String content, Date date,boolean read) {
		this.title = title;
		this.content = content;
		this.date = date;
		this.read = read;
	}

	public boolean isRead() {
		return read;
	}

	public void setRead(boolean read) {
		this.read = read;
	}

	/** full constructor */
	public Message(String title, String content, Date date, Set empMessages) {
		this.title = title;
		this.content = content;
		this.date = date;
		this.empMessages = empMessages;
	}

	// Property accessors

	public Integer getMessId() {
		return this.messId;
	}

	public void setMessId(Integer messId) {
		this.messId = messId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Set getEmpMessages() {
		return this.empMessages;
	}

	public void setEmpMessages(Set empMessages) {
		this.empMessages = empMessages;
	}

}