package rtobeans;
import java.sql.Date;

public class CustomerBean {
	private String vtype;
	private String vclass;
	private String vmaker;
	private String vname;
	private String vcolor;
	private Date vdate;
	private int rid;
	private String uname;
	private String vdealer;
	private String status;
	private String tempno;
	private String pno;
	private int id;
	private Date curDate;
	private Date regDate;
	//-----------------------------getters and setters-----------------------//
	public String getVtype() {
		return vtype;
	}
	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	public String getVclass() {
		return vclass;
	}
	public void setVclass(String vclass) {
		this.vclass = vclass;
	}
	public String getVmaker() {
		return vmaker;
	}
	public void setVmaker(String vmaker) {
		this.vmaker = vmaker;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVcolor() {
		return vcolor;
	}
	public void setVcolor(String vcolor) {
		this.vcolor = vcolor;
	}
	public Date getVdate() {
		return vdate;
	}
	public void setVdate(Date vdate) {
		this.vdate = vdate;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getVdealer() {
		return vdealer;
	}
	public void setVdealer(String vdealer) {
		this.vdealer = vdealer;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTempno() {
		return tempno;
	}
	public void setTempno(String tempno) {
		this.tempno = tempno;
	}
	public Date getCurDate() {
		return curDate;
	}
	public void setCurDate(Date curDate) {
		this.curDate = curDate;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
