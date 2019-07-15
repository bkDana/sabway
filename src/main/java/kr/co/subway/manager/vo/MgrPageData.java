package kr.co.subway.manager.vo;

public class MgrPageData {
   private String text;
   private String keyword;
   private int firstPage;
   private int lastPage;
   private int status;
   public MgrPageData() {
      super();
      // TODO Auto-generated constructor stub
   }
   public MgrPageData(String text, String keyword, int firstPage, int lastPage, int status) {
      super();
      this.text = text;
      this.keyword = keyword;
      this.firstPage = firstPage;
      this.lastPage = lastPage;
      this.status = status;
   }
   public String getText() {
      return text;
   }
   public void setText(String text) {
      this.text = text;
   }
   public String getKeyword() {
      return keyword;
   }
   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }
   public int getFirstPage() {
      return firstPage;
   }
   public void setFirstPage(int firstPage) {
      this.firstPage = firstPage;
   }
   public int getLastPage() {
      return lastPage;
   }
   public void setLastPage(int lastPage) {
      this.lastPage = lastPage;
   }
   public int getStatus() {
      return status;
   }
   public void setStatus(int status) {
      this.status = status;
   }
   
}