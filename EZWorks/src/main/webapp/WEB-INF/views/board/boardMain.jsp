<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ include file="boardMenu/boardMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>

<!-- Contents 영역 추가 -->
<jsp:include page="boardContents/boardContentsHome/boardContentsHome.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
<%@ include file="../include/bottom.jsp"%>