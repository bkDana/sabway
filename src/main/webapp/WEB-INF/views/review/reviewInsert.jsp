<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/ckeditor/ckeditor.js"></script>
<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<div class="common-tbl-box">
			<textarea class="form-control" id="p_content"></textarea>
			<textarea rows="30" id="testContent"></textarea>
		</div>
	</div>
</section>

<script>
	CKEDITOR.replace('p_content',{height:500});
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />