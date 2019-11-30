package rtobeans;
import java.sql.Date;
/**
 * 
 * @author Sreejith
 * Date : 06.11.2019
 *
 */
public class RtoBean {
	private int id;
	private String name;
	private String gender;
	private String idproof;
	private String idproofno;
	private String mob;
	private String email;
	private String uname;
	private String upswd;
	private String img;
	private String add;
//---------------------getters and setters--------------//    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpswd() {
		return upswd;
	}
	public void setUpswd(String upswd) {
		this.upswd = upswd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIdproof() {
		return idproof;
	}
	public void setIdproof(String idproof) {
		this.idproof = idproof;
	}
	public String getIdproofno() {
		return idproofno;
	}
	public void setIdproofno(String idproofno) {
		this.idproofno = idproofno;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	
	
}
