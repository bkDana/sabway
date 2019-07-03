<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/editor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<div class="common-tbl-box">
			<form name="write">
			    <table id="insertTable" class="comm-tbl editor-container-navi">
			        <tr>
				        <td colspan="2">
				        	<div id="testContent" class="editor-content" contentEditable="true">
				    			
				    		</div>
				        </td>
				    </tr>
				    <tr>
			        	<td colspan="2">
			        		<div class="common-tbl-btn-group">
			        			<button type="button" class="btn-style2 small" onClick='addFile(this.form)'>사진 첨부하기</button>
			        		</div>
			        	</td>
			        </tr>
			    </table>
			    <input type="hidden" name="rowCount" value="1">
			    <div class="common-tbl-btn-group">
					<button type="submit" class="btn-style2 small">리뷰 등록</button>
				</div>
			</form> 
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />