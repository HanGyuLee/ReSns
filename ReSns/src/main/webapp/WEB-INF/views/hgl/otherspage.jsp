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
 

<style type="text/css">
.ribeye {   font-family: 'Ribeye';
        font-size: 48px;  text-shadow: 2px 2px 4px #aaa; }

.tangerine {   font-family: 'Tangerine';
        font-size: 68px;  text-shadow: 4px 4px 4px #aaa; }

.back-to-top {
    cursor: pointer;
    position: fixed;
    bottom: 20px;
    right: 20px;
    display:none;
}

.navbar {
	margin-bottom: 0;
}

section {
	width: 100%;
	float: left;
}

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

.post-title-block {
	padding: 100px 0;
}

.post-title-block h1 {
	color: #fff;
	font-size: 85px;
	font-weight: bold;
	text-transform: capitalize;
}

.post-title-block li {
	font-size: 20px;
	color: #fff;
}

.image-block {
	float: left;
	width: 100%;
	margin-bottom: 10px;
}

.footer-link {
	float: left;
	width: 100%;
	background: #222222;
	text-align: center;
	padding: 30px;
}

.footer-link a {
	color: #A9FD00;
	font-size: 18px;
	text-transform: uppercase;
}






@import url(https://fonts.googleapis.com/css?family=Quicksand:400,300);
body{
    font-family: 'Quicksand', sans-serif;
}
.gal-container{
	padding: 12px;
}
.gal-item{
	overflow: hidden;
	padding: 3px;
}
.gal-item .box{
	height: 190px;
	overflow: hidden;
}
.box img{
	height: 100%;
	width: 100%;
	object-fit:cover;
	-o-object-fit:cover;
}
.gal-item a:focus{
	outline: none;
}
.gal-item a:after{
	content:"\e003";
	font-family: 'Glyphicons Halflings';
	opacity: 0;
	background-color: rgba(0, 0, 0, 0.75);
	position: absolute;
	right: 3px;
	left: 3px;
	top: 3px;
	bottom: 3px;
	text-align: center;
    line-height: 350px;
    font-size: 30px;
    color: #fff;
    -webkit-transition: all 0.5s ease-in-out 0s;
    -moz-transition: all 0.5s ease-in-out 0s;
    transition: all 0.5s ease-in-out 0s;
}
.gal-item a:hover:after{
	opacity: 1;
}
.modal-open .gal-container .modal{
	background-color: rgba(0,0,0,0.4);
}
.modal-open .gal-item .modal-body{
	padding: 0px;
}
.modal-open .gal-item button.close{
    position: absolute;
    width: 25px;
    height: 25px;
    background-color: #000;
    opacity: 1;
    color: #fff;
    z-index: 999;
    right: -12px;
    top: -12px;
    border-radius: 50%;
    font-size: 15px;
    border: 2px solid #fff;
    line-height: 25px;
    -webkit-box-shadow: 0 0 1px 1px rgba(0,0,0,0.35);
	box-shadow: 0 0 1px 1px rgba(0,0,0,0.35);
}
.modal-open .gal-item button.close:focus{
	outline: none;
}
.modal-open .gal-item button.close span{
	position: relative;
	top: -3px;
	font-weight: lighter;
	text-shadow:none;
}
.gal-container .modal-dialogue{
	width: 80%;
}
.gal-container .description{
	position: relative;
	height: 40px;
	top: -40px;
	padding: 10px 25px;
	background-color: rgba(0,0,0,0.5);
	color: #fff;
	text-align: left;
}
.gal-container .description h4{
	margin:0px;
	font-size: 15px;
	font-weight: 300;
	line-height: 20px;
}
.gal-container .modal.fade .modal-dialog .modal2{
    -webkit-transform: scale(0.1);
    -moz-transform: scale(0.1);
    -ms-transform: scale(0.1);
    transform: scale(0.1);
    top: 100px;
    opacity: 0;
    -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
    transition: all 0.3s;
}

.gal-container .modal.fade.in .modal-dialog {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1);
    -webkit-transform: translate3d(0, -100px, 0);
    transform: translate3d(0, -100px, 0);
    opacity: 1;
}
@media (min-width: 768px) {
.gal-container .modal-dialog {
    width: 55%;
    margin: 50 auto;
}
}
@media (max-width: 768px) {
    .gal-container .modal-content{
        height:250px;
    }
}
/* Footer Style */
i.red{
    color:#BC0213;
}
.gal-container{
    padding-top :75px;
    padding-bottom:75px;
}
footer{
    font-family: 'Quicksand', sans-serif;
}
footer a,footer a:hover{
    color: #88C425;
}


@import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

body {
    padding: 30px 0px 60px;
}
.panel > .list-group .list-group-item:first-child {
    /*border-top: 1px solid rgb(204, 204, 204);*/
}
@media (max-width: 767px) {
    .visible-xs {
        display: inline-block !important;
    }
    .block {
        display: block !important;
        width: 100%;
        height: 1px !important;
    }
}



.c-search > .form-control {
   border-radius: 0px;
   border-width: 0px;
   border-bottom-width: 1px;
   font-size: 1.3em;
   padding: 12px 12px;
   height: 44px;
   outline: none !important;
}
.c-search > .form-control:focus {
    outline:0px !important;
    -webkit-appearance:none;
    box-shadow: none;
}
.c-search > .input-group-btn .btn {
   border-radius: 0px;
   border-width: 0px;
   border-left-width: 1px;
   border-bottom-width: 1px;
   height: 44px;
}


.c-list {
    padding: 0px;
    min-height: 44px;
}
.title {
    display: inline-block;
    font-size: 1.7em;
    font-weight: bold;
    padding: 5px 15px;
}
ul.c-controls {
    list-style: none;
    margin: 0px;
    min-height: 44px;
}

ul.c-controls li {
    margin-top: 8px;
    float: left;
}

ul.c-controls li a {
    font-size: 1.7em;
    padding: 11px 10px 6px;   
}
ul.c-controls li a i {
    min-width: 24px;
    text-align: center;
}

ul.c-controls li a:hover {
    background-color: rgba(51, 51, 51, 0.2);
}

.c-toggle {
    font-size: 1.7em;
}

.name {
    font-size: 1.7em;
    font-weight: 700;
}

.c-info {
    padding: 5px 10px;
    font-size: 1.25em;
}



.mybutton{
 	-webkit-apppearnace : none;
    padding: 0;
    border:0;
    background:transparent;
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
					<li>　　게시물　|　</li>
					<li>유투브　|　</li>
					<li>문   답</li>
				</ul>
			</div>
		<div style="width:80%; border:1px solid transparent;">	
			<div class="col-lg-9 col-md-9 col-sm-12 " style="margin-top:30px; width:50%; height:150px;border:1px solid transparent;">
				<h4>${mypage.textarea}</h4>
			
		
			</div>	
			
			<div class="col-lg-9 col-md-9 col-sm-12 ribeye" align="center" style="margin-top:110px; width:30%; height:70px;border:1px solid transparent;">
				<h2>${userid}</h2>
			</div>	
		</div>
			
			
  
   <div style="margin-top:270px;margin-left:43%; border:1px solid transparent" >
	  
	   <img  style="position:absolute; border:4px solid white; width:200px; height:200px;" src="<%=request.getContextPath()%>/resources/images/${profile.uimg_profile_filename}" alt="Debbie Schmidt" class="img-responsive img-circle" />
	  
   </div>
  
  
 
    
   
    
   
    <div class="container gal-container" style="border:0px solid orange;margin-top:300px;">
   
   
   <div style="margin-left:-30px; margin-top:-80px;float: left; width:73%; border:1px solid transparent;">
   
   
   <c:if test="${not empty myBoardList}">
   
   <c:forEach var="board" items="${myBoardList}" varStatus="status" >
   
    <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
      <div class="box" >
        <a href="#" data-toggle="modal" data-target="#bimg_filename${status.count}">
          <img src="<%=request.getContextPath()%>/resources/images/${board.bimg_filename}">
        </a>
        <div class="modal fade" id="bimg_filename${status.count}" tabindex="-1" role="dialog">
           <div class="modal-dialog" role="document">
            <div class="modal-content" style="margin-top:150px;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <div class="modal-body" >
                <img src="<%=request.getContextPath()%>/resources/images/${board.bimg_filename}">
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
                            <span class="name">${follower.login_name}</span><br/>
                            <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">${follower.fk_login_id}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>
         
                        </div>
                    </a>
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
                            <span class="name">${following.login_name}</span><br/>
                            <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">${following.follow_id}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>

                        </div>
                        </a>
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

</body>
</html>

