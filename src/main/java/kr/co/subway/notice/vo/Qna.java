package kr.co.subway.notice.vo;

import java.sql.Date;

public class Qna {
	private int qnaNo;
	private String qnaCategory;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private String filename;
	private String filepath;
	private Date qnaDate;
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qna(int qnaNo, String qnaCategory, String qnaWriter, String qnaTitle, String qnaContent, String filename,
			String filepath, Date qnaDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.filename = filename;
		this.filepath = filepath;
		this.qnaDate = qnaDate;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	
}
