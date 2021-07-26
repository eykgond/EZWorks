<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@ include file="../include/top.jsp"%>
<style type="text/css">
	.col-12 col-lg-12{
		padding:0;
	}
	.col-auto{
		 font-size:0.8em;
	}
	#mainTitle{
		font-size:1.3em;
		font-weight:bold;
	}
	#sp2{
		padding-top:7px;
	}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>	
		
<%@ include file="../community/sidebar/sidebar2.jsp" %>		
<%@ include file="../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->									
	<section class="row">
      <div class="col-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">커뮤니티 글</h5>
                </div>
                <div class="card-body">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel"
                            aria-labelledby="home-tab">
                            <div class="table-responsive">
		                       <table class="table table-hover table-lg">
		                        <tbody>
		                        <c:forEach var="vo" items="${boardList}">
		                        	<c:forEach var="vo2" items="${contentList}">
		                               <tr>
		                                   <td class="col-auto">
		                                       <p class=" mb-0">${vo.communityName} > ${vo.boardName}</p>
		                                       <p class=" mb-0" id="mainTitle">${vo2.title}</p>	                                      
		                                       <p class=" mb-0">${vo2.content}</p>
		                                       <div class="avatar avatar-md">
													<img src="<c:url value='/resources/images/faces/1.jpg'/>">
													<span class="mb-0" id="sp2">홍길동 과장 ${vo2.regdate}</span>
											   </div>
		                                   </td>
		                               </tr>
		                        	</c:forEach>
	                               </c:forEach>
		                        </tbody>
		                       </table>
		                   </div>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel"
                            aria-labelledby="profile-tab">
                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel"
                            aria-labelledby="contact-tab">
                            <p class="mt-2">
                            
                            </p>
                        </div>
                    </div>
                </div>
            </div>
         </div> 
	</section>											
<%@ include file="../include/bottom.jsp" %>