package main.ict.calendar.vo;

public class CalendarVO {

	private String cal_no;
	private String cal_title;
	private String cal_startdate;
	private String cal_enddate;
	private String cal_description;
	private String cal_type;
	private String cal_backgroundColor;
	private String cal_textColor;
	private String cal_allDay;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	// 생성자 
	public CalendarVO() {
	
	}
	
	public CalendarVO(String cal_no, String cal_title, String cal_startdate, String cal_enddate, String cal_description,
			String cal_type, String cal_backgroundColor, String cal_textColor, String cal_allDay, String deleteyn,
			String insertdate, String updatedate) {
		
		this.cal_no = cal_no;
		this.cal_title = cal_title;
		this.cal_startdate = cal_startdate;
		this.cal_enddate = cal_enddate;
		this.cal_description = cal_description;
		this.cal_type = cal_type;
		this.cal_backgroundColor = cal_backgroundColor;
		this.cal_textColor = cal_textColor;
		this.cal_allDay = cal_allDay;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}
	// getter / setter
	public String getCal_no() {
		return cal_no;
	}
	public String getCal_title() {
		return cal_title;
	}
	public String getCal_startdate() {
		return cal_startdate;
	}
	public String getCal_enddate() {
		return cal_enddate;
	}
	public String getCal_description() {
		return cal_description;
	}
	public String getCal_type() {
		return cal_type;
	}
	public String getCal_backgroundColor() {
		return cal_backgroundColor;
	}
	public String getCal_textColor() {
		return cal_textColor;
	}
	public String getCal_allDay() {
		return cal_allDay;
	}
	public String getDeleteyn() {
		return deleteyn;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setCal_no(String cal_no) {
		this.cal_no = cal_no;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public void setCal_startdate(String cal_startdate) {
		this.cal_startdate = cal_startdate;
	}
	public void setCal_enddate(String cal_enddate) {
		this.cal_enddate = cal_enddate;
	}
	public void setCal_description(String cal_description) {
		this.cal_description = cal_description;
	}
	public void setCal_type(String cal_type) {
		this.cal_type = cal_type;
	}
	public void setCal_backgroundColor(String cal_backgroundColor) {
		this.cal_backgroundColor = cal_backgroundColor;
	}
	public void setCal_textColor(String cal_textColor) {
		this.cal_textColor = cal_textColor;
	}
	public void setCal_allDay(String cal_allDay) {
		this.cal_allDay = cal_allDay;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	
}
