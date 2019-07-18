package kr.co.subway.common;

public class CommonFunc {
	
	/* 페이지 네비 만들기 ~.~ */
	public String getPageNavi(int total, int reqPage, int pageNum, int totalNavi) {
		String pageNavi = "";
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
		int pageNo = ((reqPage-1)/totalNavi)*totalNavi+1;
		if(reqPage != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='javascript:list("+(reqPage-1)+");'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";	
		}else {
			pageNavi += "<a class='paging-arrow prev-arrow'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";	
		}
		
		int i = 1;
		while(!(i++>totalNavi || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<a class='cur'>"+pageNo+"</a>";
			}else {
				pageNavi += "<a href='javascript:list("+pageNo+");'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(reqPage!=totalPage && totalPage!=0) {
			pageNavi += "<a class='paging-arrow next-arrow' href='javascript:list("+(reqPage+1)+");'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}else {
			pageNavi += "<a class='paging-arrow next-arrow'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		return pageNavi;
	}

}
