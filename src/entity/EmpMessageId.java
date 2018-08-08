package entity;


/**
 * EmpMessageId entity. @author MyEclipse Persistence Tools
 */

public class EmpMessageId implements java.io.Serializable {

	// Fields

	private Emp emp;
	private Message message;

	// Constructors

	/** default constructor */
	public EmpMessageId() {
	}

	/** full constructor */
	public EmpMessageId(Emp emp, Message message) {
		this.emp = emp;
		this.message = message;
	}

	// Property accessors

	public Emp getEmp() {
		return this.emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public Message getMessage() {
		return this.message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof EmpMessageId))
			return false;
		EmpMessageId castOther = (EmpMessageId) other;

		return ((this.getEmp() == castOther.getEmp()) || (this.getEmp() != null
				&& castOther.getEmp() != null && this.getEmp().equals(
				castOther.getEmp())))
				&& ((this.getMessage() == castOther.getMessage()) || (this
						.getMessage() != null
						&& castOther.getMessage() != null && this.getMessage()
						.equals(castOther.getMessage())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getEmp() == null ? 0 : this.getEmp().hashCode());
		result = 37 * result
				+ (getMessage() == null ? 0 : this.getMessage().hashCode());
		return result;
	}

}