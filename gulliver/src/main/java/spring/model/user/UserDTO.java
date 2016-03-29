package spring.model.user ;
import org.springframework.web.multipart.MultipartFile;

public class UserDTO {
	
	private String userid;
	private String name;
	private String passwd;
	private String phone;
	private String email;
	private String birthdate;
	private String callphone;
	private String zipcode;
	private String grade;
	private String address1;
	private String address2;
	private String joindate;
	private String userphoto;
	private MultipartFile userphotoMF;
	
	public MultipartFile getUserphotoMF() {
		return userphotoMF;
	}
	public void setUserphotoMF(MultipartFile userphotoMF) {
		this.userphotoMF = userphotoMF;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getCallphone() {
		return callphone;
	}
	public void setCallphone(String callphone) {
		this.callphone = callphone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getUserphoto() {
		return userphoto;
	}
	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}

}
