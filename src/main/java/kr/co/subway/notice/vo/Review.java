package kr.co.subway.notice.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewGender;
	private String reviewBirthday;
	private String reviewItem;
	private String reviewStarItem;
	private String reviewBranch;
	private String reviewStarBranch;
	private String reviewContent;
	private String reviewHashtag;
	private int reviewLike;
	private String filename;
	private String filepath;
	private Date reviewDate;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewNo, String reviewTitle, String reviewWriter, String reviewGender, String reviewBirthday,
			String reviewItem, String reviewStarItem, String reviewBranch, String reviewStarBranch,
			String reviewContent, String reviewHashtag, int reviewLike, String filename, String filepath,
			Date reviewDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewWriter = reviewWriter;
		this.reviewGender = reviewGender;
		this.reviewBirthday = reviewBirthday;
		this.reviewItem = reviewItem;
		this.reviewStarItem = reviewStarItem;
		this.reviewBranch = reviewBranch;
		this.reviewStarBranch = reviewStarBranch;
		this.reviewContent = reviewContent;
		this.reviewHashtag = reviewHashtag;
		this.reviewLike = reviewLike;
		this.filename = filename;
		this.filepath = filepath;
		this.reviewDate = reviewDate;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewGender() {
		return reviewGender;
	}
	public void setReviewGender(String reviewGender) {
		this.reviewGender = reviewGender;
	}
	public String getReviewBirthday() {
		return reviewBirthday;
	}
	public void setReviewBirthday(String reviewBirthday) {
		this.reviewBirthday = reviewBirthday;
	}
	public String getReviewItem() {
		return reviewItem;
	}
	public void setReviewItem(String reviewItem) {
		this.reviewItem = reviewItem;
	}
	public String getReviewStarItem() {
		return reviewStarItem;
	}
	public void setReviewStarItem(String reviewStarItem) {
		this.reviewStarItem = reviewStarItem;
	}
	public String getReviewBranch() {
		return reviewBranch;
	}
	public void setReviewBranch(String reviewBranch) {
		this.reviewBranch = reviewBranch;
	}
	public String getReviewStarBranch() {
		return reviewStarBranch;
	}
	public void setReviewStarBranch(String reviewStarBranch) {
		this.reviewStarBranch = reviewStarBranch;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewHashtag() {
		return reviewHashtag;
	}
	public void setReviewHashtag(String reviewHashtag) {
		this.reviewHashtag = reviewHashtag;
	}
	public int getReviewLike() {
		return reviewLike;
	}
	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
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
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
}
