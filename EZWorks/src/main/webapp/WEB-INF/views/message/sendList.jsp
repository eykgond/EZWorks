<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>

<style type="text/css">
	.nav-link{
		font-size:0.75em;
	}
	.tab-pane li {
    border-bottom: 1px solid #dfe3e7;
    border-collapse:collapse;
	}
	
	.tab-pane li:last-child {
	    border-bottom: 1px solid #dfe3e7;
	}
	
	#contents{
		border-left: 1px solid #dfe3e7;/
		border-right: 1px solid #dfe3e7;
	}
	span.recent-header{
		font-size:0.9em;
		font-weight:bold;
	}
	span.recent-menu{
		font-size:0.8em;
		font-weight:bold;
	}
	tr.hover-color-change:hover{
		background-color:#f9f9f9;
	}
	
	#fav-toggle{
		color:yellow;
	}
	
	body{
		padding:10px;
		margin:10px;
	 }	
</style>
<script type="text/javascript">
	$(function(){
		$('.table tbody tr').hover(function(){
			$(this).css('background',"Aquamarine");
		}, function(){
			$(this).css('background',"");
		});
	});

	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}
	/* $(function(){
		$('#fav-toggle').click(
		function(){
			$('#fav-toggle').css({"color":"yellow"});
		},
		function(){
			$('#fav-toggle').css({"color":"black"});
		});
	}); */
	
	$(function(){
		$('select[name=recordCountPerPage]').change(function(){
			var recordCountPerPage = $('select[name=recordCountPerPage]').val();
			$('input[name=recordCountPerPage]').val(recordCountPerPage);
			$('form[name=frmPage]').submit();
		});
		
		
	});
</script>
<form action="<c:url value='/message/messageList'/>" name="frmPage" method="post" style="padding:none;margin:none">
	<input type="hidden" name="currentPage" value="<c:if test='${empty param.currentPage }'>1</c:if><c:if test='${!empty param.currentPage }'>${param.currentPage }</c:if>">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	<input type="hidden" name="recordCountPerPage" value="${pagingInfo.recordCountPerPage }">
</form>

	<section style="padding:0px">

		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:center">
			<h5>
				<a style="font-size: 30px;">보낸 쪽지함</a> <a href="#"></a>
			</h5>
		</div>
		
	</section>
	
	
	
	<section style="padding:0px;padding-right:20px;padding-left:20px;">
			<div style="margin: 0px; padding: 0px; float: right; right: 0px; display: inline-flex">
				<select class="choices form-select" name="recordCountPerPage" style="font-size:0.7em;width:60px">
					<option value="20"
					<c:if test="${pagingInfo.recordCountPerPage==20 }">
					selected="selected"
					</c:if>
					>20</option>
					<option value="40"
					<c:if test="${pagingInfo.recordCountPerPage==40 }">
					selected="selected"
					</c:if>
					>40</option>
					<option value="60"
					<c:if test="${pagingInfo.recordCountPerPage==60 }">
					selected="selected"
					</c:if>
					>60</option>
					<option value="80"
					<c:if test="${pagingInfo.recordCountPerPage==80 }">
					selected="selected"
					</c:if>
					>80</option>
				</select>
			</div>
	</section>
	
	<div class="table-responsive" style="margin:0px;padding:0px;">
		<table class="table mb-0 table-lg" style="width:100%;font-size:0.8em;text-align: center">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:50%;" />
				<col style="width:20%;" />
				<col style="width:20%;" />	
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">내용</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody class="table-hover">
				<c:if test="${empty list }">
			<tr>
				<td colspan="5" class="align_center">null!!</td>
			</tr>
		</c:if>		
		<c:if test="${!empty list }">			 
		  	<!-- 반복문 시작  -->
		  	<c:forEach var="vo2" items="${list }">			 
				<tr class="align_center">
					<td>${vo2.no}</td>
					<td>
						<a href
						="<c:url value='/message/senddetail?no=${vo2.no }'/>">
							${vo2.content}
						</a>
					</td>
					<td>${vo2.name}</td>
					<td>
						<fmt:formatDate value="${vo2.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>	
					</td>
				</tr> 
			</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
			</tbody>
		</table>
	</div>
	
	<div style="margin-top:40px">
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-primary pagination-sm justify-content-center">
				<li class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.firstPage }'>disabled</c:if>">
				<a class="page-link" href="#" onclick="pageProc(${pagingInfo.firstPage-1})">Previous</a></li>
				<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<li class="page-item"><a class="page-link" href="#" onclick="pageProc(${i})">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
					<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> <img
						src="<c:url value='/resources/images/message/last.JPG'/>" alt="다음 블럭으로">
					</a>
				</c:if>
				<li class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.lastPage }'>disabled</c:if>"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
	
	<div class="divSearch" style="display:flex;justify-content: center!important;">
   	<form name="frmSearch" method="post" action='<c:url value="/message/sendList"/>'>
   		<div class="input-group input-group-sm mb-1">
        <select name="searchCondition" class="form-select input-group-text" style="width:80px">
             <option value="content"
            	<c:if test="${param.searchCondition == 'content' }">            	
            		selected="selected"
            	</c:if>
            >내용</option>
            <option value="name" 
            	<c:if test="${param.searchCondition == 'name' }">            	
            		selected="selected"
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" class="form-control" value="${param.searchKeyword }" style="width:200px "> 
        <input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="submit" class= "btn btn-primary" value="검색">
		</div>
    </form>
	</div>
	<nav><br></nav>
	<hr>
	<footer id="main_footer" style="text-align: center">
		<address>Copyright &copy; <a href=https://kkimsangheon.github.io >이지웍스</a> All Rights Reserved.</address>
		<address>Blog : <a href=https://kkimsangheon.github.io ></a>https://blog.naver.com/hyunki89</address>
		<address>Github : <a href=https://github.com/KKimSangHeon >https://github.com/eykgond/EZWorks</a></address>
    </footer>
<%@ include file="../include/bottom.jsp" %>