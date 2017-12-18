<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Someone's PAGE</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

   <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Ribeye">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Tangerine">
 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/resources/style/hglStyle.css">

<style type="text/css">


.banner-section {
	
	background-image: 
		url("<%=request.getContextPath()%>/resources/images/${profile.uimg_header_filename}");
	 
	background-size: cover;
	height: 380px;
	left: 0;
	position: absolute;
	top: 128px;
	background-position: 0;
	
}

</style>


<script type="text/javascript">

$(function(){
	
	$(".clickhide").click(function(){
		$(".hidemodal").modal('hide');
		
	});
	
	

	

	


	
    /* BOOTSNIPP FULLSCREEN FIX */
    if (window.location == window.parent.location) {
        $('#back-to-bootsnipp').removeClass('hide');
    }
    
    
    $('[data-toggle="tooltip"]').tooltip();
    
    $('#fullscreen').on('click', function(event) {
        event.preventDefault();
        window.parent.location = "http://bootsnipp.com/iframe/4l0k2";
    });
    $('a[href="#cant-do-all-the-work-for-you"]').on('click', function(event) {
        event.preventDefault();
        $('#cant-do-all-the-work-for-you').modal('show');
    })
    
    $('[data-command="toggle-search"]').on('click', function(event) {
        event.preventDefault();
        $(this).toggleClass('hide-search');
        
        if ($(this).hasClass('hide-search')) {        
            $('.c-search').closest('.row').slideUp(100);
        }else{   
            $('.c-search').closest('.row').slideDown(100);
        }
    })
    
    $('#contact-list').searchable({
        searchField: '#contact-list-search',
        selector: 'li',
        childSelector: '.col-xs-12',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    })
    
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });
    
    $('#back-to-top').tooltip('show');
});


	

function goFollower(num,followId){
	
	alert("확인");
	var frm = document.follower;

	frm.followId.value=followId;
	frm.method = "post";
	frm.action = "/resns/followAddEnd.re";
	frm.submit();
	
}

function goFollowing(num,followId){
	
	alert("확인");
	var frm = document.following;

	frm.followId.value=followId;
	frm.method = "post";
	frm.action = "/resns/followAddEnd.re";
	frm.submit();
	
}




</script>


</head>

<body>

	<section class="banner-section" style="border:1px solid transparent; margin-top:-8px;"> </section>
	<section class="post-content-section">
	<div class="container" style="border:1px solid transparent; ">

		<!--  <div class="row" style="border:1px solid green"> -->
			<div class="col-lg-12 col-md-12 col-sm-12 post-title-block">

				<h1 class="text-center tangerine" >${mypage.textinput}</h1>
				<ul class="list-inline text-center" style="font-size:20pt; font-weight:bold;">
					
				</ul>
			</div>
		<div style="width:80%; border:1px solid transparent;">	
			<div class="col-lg-9 col-md-9 col-sm-12 " style="margin-top:70px; width:50%; height:150px;border:1px solid transparent;">
				<h4>${mypage.textarea}</h4>
			
		
			</div>	
			
			<div class="col-lg-9 col-md-9 col-sm-12 ribeye" align="center" style="margin-top:150px; width:30%; height:70px;border:1px solid transparent;">
				<h2>${userid}</h2>
			</div>	
		</div>
			
			
  
   <div style="margin-top:270px;margin-left:43%; border:1px solid transparent" >
	  
	   <img  style="position:absolute; border:4px solid white; width:200px; height:200px;" src="<%=request.getContextPath()%>/resources/images/${profile.uimg_profile_filename}" alt="Debbie Schmidt" class="img-responsive img-circle" />
	  
   </div>
  
  
 
    
   
     <div class="container gal-container" style="border:1px solid transparent;margin-top:300px;">
   
   
   <div style="margin-left:-30px; margin-top:-80px;float: left; width:73%; border:1px solid transparent; background-color:white;">
   <div data-spy="scroll" class="tabbable-panel" style="display:inline; border:1px solid transparent;">
        <div class="tabbable-line">
          <ul class="nav nav-tabs ">
            <li class="active">
              <a href="#tab_default_1" data-toggle="tab">
             	 게시물  </a>
            </li>
           
            <li>
              <a href="#tab_default_3" data-toggle="tab">
           		  유투브</a>
            </li>
             <li>
              <a href="#tab_default_4" data-toggle="tab">
            	 문답</a>
            </li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab_default_1">
 
   <c:if test="${not empty myBoardList}">
   
   <c:forEach var="board" items="${myBoardList}" varStatus="status" >
   
    <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
      <div class="box" >
        <a href="#" data-toggle="modal" data-target="#bimg_filename${status.count}">
          <img src="<%=request.getContextPath()%>/resources/images/${board.bimg_filename}">
        </a>
        <div class="modal fade" id="bimg_filename${status.count}" tabindex="-1" role="dialog"  >
          <div class="modal-dialog" role="document">
            <div class="modal-content" style="margin-top:150px;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <div class="modal-body" >
                <img src="<%=request.getContextPath()%>/resources/images/${board.bimg_filename}" >
              </div>
                <div class="col-md-12 description" style="margin-top:-40px; height:80px;">
                  <h5>♡ 좋아요 ${board.board_heart}개<br/><br/>${board.board_content}</h5>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    </c:forEach>
    
    </c:if>
    
    <c:if test="${empty myBoardList}">
    
    
    <br/>
    <div align="left">
    	<span style="color:black; font-style:italic; font-weight:bold; font-size:16pt;">등록된 게시물이 없습니다.</span>
    	</div>
    <br/>
    <br/>
    
    
    </c:if>
   
            </div>
            <div class="tab-pane" id="tab_default_2">
              <p>
               		준비중
              </p>
             

             
           
            </div>
            <div class="tab-pane" id="tab_default_3">
              <p>
                	준비중
              </p>
             
            </div>
             <div class="tab-pane" id="tab_default_4">
              <p>
              	 준비중

              </p>
               
            </div>
          </div>
        </div>
      </div>
  
 
  <div class="col-sm-4">
   <div class="panel panel-default">
   
</div>

 </div>
  
   
   
   </div>
   
   
   
    <div style="margin-top:-250px;float: right; width:26%; border:1px solid transparent;">
    
    
    
    <div class="col-lg-3  col-md-3 col-sm-12">
				
				
				<!-- 클릭하면 페이지로 이동하도록. -->

<div class="container" style="margin-left:-330px;">

    <div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">Followers</span>
                   <ul class="pull-right c-controls">
                       
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="Toggle Search"><i class="fa fa-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group" id="contact-list">
                
                <!--  팔로워 리스트 ~!!~! -->

                
                <c:if test="${not empty myFollowerList }">
                	<%-- 
                	<c:forEach var="follower" items="${myFollowerList}" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                  
                    <li class="list-group-item">
                    
                    
                    
                     <c:if test="${sessionScope.loginUser.login_id == following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    
                    
                    
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${follower.uimg_profile_filename}" alt="${follower.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                                                
                            <span class="name">${follower.login_name}</span>
                            
                            <button type="button" id="btnFollow"  onClick="goFollow();" style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button>
                    <input type="hidden" id="followId" name="followId" value="${follower.fk_login_id}"/>
                            <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">${follower.fk_login_id}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>
         
                        </div>
                    </a> --%>
                  
                	<c:forEach var="follower" items="${myFollowerList}" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                  
                    <li class="list-group-item">
                    
                    
                    
                     <c:if test="${sessionScope.loginUser.login_id == follower.fk_login_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != follower.fk_login_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${follower.fk_login_id}">
                    </c:if>
                    
                    
                    
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${follower.uimg_profile_filename}" alt="${follower.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">${follower.login_name}</span>
                      </a>          
                    <%--  <button type="button" id="btnFollower${status.count}"   style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button> --%>
                    <a class="btn icon-btn btn-success" id="btnFollower" onClick="goFollower('${status.count}','${follower.fk_login_id}');"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Follow</a>
                    
                    
                    <input type="hidden" id="followId" name="followId" value="${follower.fk_login_id}"/>
                     <br/><span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                          
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>
         
                   
                  
                    </div>
                        <div class="clearfix"></div>
                          
                    </li>
                 
                    
                    
                    </c:forEach>
                    <li class="list-group-item"><span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">count : ${count}</span></li>
                    </c:if>
                     <c:if test="${empty myFollowerList}">
                     <br/>
                     	<span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">아직 팔로워가 없습니다.^^ <br/><br/><br/> </span>

                    </c:if> 
                  
                </ul>
            </div>
        </div>
	</div>
	
	
	<div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">Followings</span>
                   <ul class="pull-right c-controls">
                        
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="Toggle Search"><i class="fa fa-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group" id="contact-list">
                
                <!--  팔로워 리스트 ~!!~! -->
                
                <c:if test="${not empty myFollowingList }">
                	  
                	<c:forEach var="following" items="${myFollowingList }" varStatus="status">
                <c:set var="count" value="${status.count }"></c:set>
                    <li class="list-group-item">
                    <c:if test="${sessionScope.loginUser.login_id == following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/mypage.re?fk_login_id=${following.follow_id}">
                    </c:if>
                    <c:if test="${sessionScope.loginUser.login_id != following.follow_id}">
                    	<a href="<%=request.getContextPath() %>/otherspage.re?fk_login_id=${following.follow_id}">
                    </c:if>
                     
                        <div class="col-xs-12 col-sm-3">
                            <img src="<%=request.getContextPath()%>/resources/images/${following.uimg_profile_filename}" alt="${following.login_name}" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">${following.login_name}</span>
                            </a>
                     <%--  <button type="button" id="btnFollower${status.count}"   style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button> --%>
                    <a class="btn icon-btn btn-success" id="btnFollowing${status.count}" onClick="goFollowing('${status.count}','${following.follow_id}');"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Follow</a>
                            
                    <%-- <button type="button" id="btnFollowing${status.count}"  onClick="goFollowing('${status.count}','${following.follow_id}');" style=" background-color: blue;"><img src="<%=request.getContextPath()%>/resources/images/follow_white.png" /></button> --%>
                     <input type="hidden" id="followingId" name="followId" value="${following.follow_id}"/>       
                         <br/>   <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">${following.follow_id}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>

                        </div>
                       
                        
                        <div class="clearfix"></div>
                    </li>
                    </c:forEach>
                     <li class="list-group-item"><span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">count : ${count}</span></li>
                    </c:if>
                     <c:if test="${empty myFollowingList}">
                     <br/>
                     	<span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;"> 다른 사람을 팔로잉 해보세요^^ <br/><br/><br/> </span>

                    </c:if> 
                  
                    
                     
                </ul>
            </div>
        </div>
	</div>
	
	
	
    
    	<!-- JavaScrip Search Plugin -->
    <script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
 
   		   
	</div>
		
			
					
	</div>
    
    
    </div>
   
   
 
			
	</div>
	</div>
	
	<!-- /container --> </section>


<a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" ><span class="glyphicon glyphicon-chevron-up"></span></a>

  <form name="follower">
  <input type="hidden" name="followId"/>	
  </form>
  <form name="following">
  <input type="hidden" name="followId"/>	
  </form>
</body>
</html>

