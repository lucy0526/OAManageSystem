package entity;


/**
 * EmpMessage entity. @author MyEclipse Persistence Tools
 */

public class EmpMessage implements java.io.Serializable {

	// Fields

	private EmpMessageId id;

	// Constructors

	/** default constructor */
	public EmpMessage() {
	}

	/** full constructor */
	public EmpMessage(EmpMessageId id) {
		this.id = id;
	}

	// Property accessors

	public EmpMessageId getId() {
		return this.id;
	}

	public void setId(EmpMessageId id) {
		this.id = id;
	}

}