<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@ include file="../include/top.jsp"%>
<style type="text/css">
	.btn btn-light{
		padding:0;
	}
	#btnMenu{
		width:160px;
	}
	#btnWrite{
		text-align: center;
	}
	.sp1{
		font-size:0.8em;
		padding:0;
		width:200px;
		text-align: left;
	}
	.col-12 col-lg-8, .col-12 col-lg-4{
		padding:0;
	}
	.col-auto, .col-3{
		 font-size:0.8em;
	}
	#mainTitle{
		font-size:1.3em;
		font-weight:bold;
	}
	#sp2{
		padding-top:7px;
	}
	#headingOne{
		padding:0;
	}
	#cName{
		width:110px;
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
      <div class="col-12 col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">커뮤니티 홈</h5>
                </div>
                <div class="card-body">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home"
                                role="tab" aria-controls="home" aria-selected="true">최근글</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile"
                                role="tab" aria-controls="profile" aria-selected="false">가입 커뮤니티</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact"
                                role="tab" aria-controls="contact" aria-selected="false">전체 커뮤니티</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel"
                            aria-labelledby="home-tab">
                            <div class="table-responsive">
		                       <table class="table table-hover table-lg">
		                        <tbody>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > 암벽클라이밍 동호회</p>
	                                       <p class=" mb-0" id="mainTitle">인사드리겠습니다 ^^</p>	                                      
	                                       <p class=" mb-0">안녕하세요! 홍길동입니다! ㅎㅎ 힘든 암벽하고, 맛있는 음식 먹으러가요!</p>
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/1.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp홍길동 과장 2018-02-21(수) 14:52</span>
										   </div>
	                                   </td>
	                               </tr>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > Wish list 적고 가세요!</p>
	                                       <p class=" mb-0" id="mainTitle">안녕하세요! 발도장 찍고갑니다</p>	                                      
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/1.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp홍길동 과장 2018-02-21(수) 14:51</span>
										   </div>
	                                   </td>
	                               </tr>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > 암벽클라이밍 동호회</p>
	                                       <p class=" mb-0" id="mainTitle">암벽은 처음이라 ^^</p>	                                      
	                                       <p class=" mb-0">안녕하세요! 김길동 부장입니다! 제가 암벽을 잘 따라갈지 너무 걱정이네요 ㅎ 그래도 열심해 해볼게요~</p>
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/2.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp김길동 부장 2018-02-21(수) 14:10</span>
										   </div>
	                                   </td>
	                               </tr>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > Wish list 적고 가세요!</p>
	                                       <p class=" mb-0" id="mainTitle">해외로도 나가나요? 오사카도 좋은데~</p>	                                      
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/2.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp김길동 부장 2018-02-21(수) 14:35</span>
										   </div>
	                                   </td>
	                               </tr>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > 암벽클라이밍 동호회</p>
	                                       <p class=" mb-0" id="mainTitle">안녕하세요~</p>	                                      
	                                       <p class=" mb-0">안녕하세요~~ 박길동 상무입니다 ^^ 제가 등산은 좀 해봤는데, 암벽은 한번도 안해봐서 서툴지만 잘 부탁드려요! 허허 ^^</p>
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/3.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp박길동 상무 2018-02-21(수) 13:58</span>
										   </div>
	                                   </td>
	                               </tr>
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
       <div class="col-12 col-lg-4">
           <div class="card">
               <div class="card-header">
                   <h4>전체 커뮤니티 정보</h4>
               </div>
               <div class="card-body" style="text-align:center;padding:0">
                 <fieldset class="form-group">
	                 <select class="form-select" id="basicSelect">
	                     <option>가장 회원이 많은 커뮤니티</option>
	                     <option>가장 글이 많은 커뮤니티</option>
	                     <option>가장 최근에 개설한 커뮤니티</option>
	                 </select>
	             </fieldset>
                   <div class="table-responsive">
                       <table class="table table-hover table-lg">
                           <thead>
                               <tr>
                                   <th>Name</th>
                                   <th>Regdate</th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">1. EZ Works 마케팅</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 김윤경</p>
                                       <p class=" mb-0">개설일자 : 2015-10-07(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                           </tbody>
                       </table>
                   </div>
               </div>
           </div>
       </div>
	</section>											
<%@ include file="../include/bottom.jsp" %>