<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@ include file="../include/top.jsp"%>
<style type="text/css">
	.btn btn-light{
		padding:0;
	}
	#btnWrite{
		text-align: center;
	}
	#headingOne{
		padding:0;
	}
	.notice{
		font-size: 0.8em;
		margin:0;
	}
	#intro{
		height: 150px;
	}
	.radioWrapper{
		display: inline-flex;
	}
	#label{
		padding-top:3px;
	}
	
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
	});

</script>
	<div class="card-header">
	   <h5 class="card-title">커뮤니티</h5> 
	</div>
	<div class="card-body" style="height:760px">
	   <div class="buttons" id="btnWrite">
          <a href="<c:url value='/community/communityNew'/>" 
           	class="btn btn-outline-primary" style="width:200px">커뮤니티 만들기</a>
       </div>
       <div class="accordion" id="cardAccordion">
        <div class="card">
            <div class="card-header" id="headingOne" data-bs-toggle="collapse"
                data-bs-target="#collapseOne" aria-expanded="false"
                aria-controls="collapseOne" role="button">
             <span><img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
	         <span class="collapsed collapse-title">가입 커뮤니티</span>
            </div>
            <div id="collapseOne" class="collapse pt-1" aria-labelledby="headingOne"
                data-parent="#cardAccordion">
	        <div>
             <span><a href="<c:url value='/community/communityOne'/>">YOLO EZ</a>
             	<img src="<c:url value='/resources/images/accordion/gear.svg'/>" style="float:right">
             </span><br>
             <span><a href="">BLIND</a>
             	<img src="<c:url value='/resources/images/accordion/gear.svg'/>"style="float:right">
             </span><br>
             <span><img src="<c:url value='/resources/images/accordion/hold2.png'/>">
             	<a href="">아이디어 공유</a></span><br>
             <span><a href="">독서합시다</a>
             	<img src="<c:url value='/resources/images/accordion/gear.svg'/>"style="float:right">
             </span><br>
             <span><img src="<c:url value='/resources/images/accordion/hold2.png'/>">
             	<a href="">A-팀 프로젝트</a></span><br>
             <span><img src="<c:url value='/resources/images/accordion/hold2.png'/>">
             	<a href="">운동합시다</a></span><br>
	         </div>
	       </div>
	     </div>             
	   </div>
     </div>						
<%@ include file="../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->									
	<section class="row">
      <div class="col-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">커뮤니티 개설</h5>
                </div>
                <div class="card-body">
                     <form class="form form-horizontal" method="post" 
                     		action="<c:url value='/community/communityNew'/>">
                       <div class="form-body">
                           <div class="row">
                               <div class="col-md-2" id="label">
                                   <label>커뮤니티 명</label>
                               </div>
                               <div class="col-md-10 form-group">
                                   <input type="text" id="communityName" class="form-control"
                                       name="communityName" placeholder="커뮤니티 명을 적어주세요">
                               </div>
                               <div class="col-md-2" id="label">
                                   <label>소개</label>
                               </div>
                               <div class="col-md-10 form-group">
                               		<div class="form-floating">
                                        <textarea class="form-control" id="intro" name="intro"
                                         placeholder="커뮤니티 소개글을 간략하게 적어주세요"></textarea>
                                        <label for="intro">커뮤니티 소개글을 간략하게 적어주세요</label>
                                    </div>
                               </div>
                               <div class="col-md-2" id="label">
                                   <label>공개여부</label>
                               </div>
                               <div class="col-md-10 form-group">
                               	<div class="radioWrapper">
                               	  <div class="form-check">
                                        <input class="form-check-input" type="radio" name="publicSetting"
                                            id="publicSet1" value="Y" checked>
                                        <label class="form-check-label" for="publicSet1">공개</label>&nbsp&nbsp&nbsp
                                  </div>
                                  <div class="form-check">
                                  		<input class="form-check-input" type="radio" name="publicSetting"
                                            id="publicSet2" value="N">
                                        <label class="form-check-label" for="publicSet2">비공개</label>
                                    </div>
                               	</div>
                                   <p class="notice">※ 공개로 설정 할 경우, 멤버가 아니어도 게시물을 열람할 수 있습니다.</p>
                                   <p class="notice">※ 멤버 초대는 커뮤니티 개설 후에 할 수 있습니다.</p>
                               </div>
                               <div class="col-sm-12 d-flex justify-content-end">
                                   <button type="submit" id="btnSubmit" 
                                   		class="btn btn-primary me-1 mb-1">등록</button>
                                   <button type="reset" 
                                   		class="btn btn-light-secondary me-1 mb-1">취소</button>
                               </div>
                           </div>
                       </div>
                   </form>
                </div>
            </div>
         </div> 
	</section>											
<%@ include file="../include/bottom.jsp" %>