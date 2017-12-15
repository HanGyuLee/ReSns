<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

 

<style type="text/css">


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
	
	$(".hidemodal").click(function(){
		$(this).modal('hide');
		
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

	<section class="banner-section" style="border:1px solid pink; margin-top:-8px;"> </section>
	<section class="post-content-section">
	<div class="container" style="border:1px solid blue; ">

		<!--  <div class="row" style="border:1px solid green"> -->
			<div class="col-lg-12 col-md-12 col-sm-12 post-title-block">

				<h1 class="text-center" >　Gyu Lee's Page</h1>
				<ul class="list-inline text-center" style="font-size:20pt; font-weight:bold;">
					<li>　　게시물　|　</li>
					<li><a href="/resns/music.re?fk_login_id=${fk_login_id}">유투브　|</a></li>
					<li>문   답</li>
				</ul>
			</div>
		<div style="width:80%; border:1px solid black;">	
			<div class="col-lg-9 col-md-9 col-sm-12" style="margin-top:30px; width:50%; height:150px;border:1px solid black;">
				<h3>안녕? 뿌이뿌잉</h3>
			<br/>안녕~~~~~~ 나는 kh 교육생이야 ^^*
		
			</div>	
			
			<div class="col-lg-9 col-md-9 col-sm-12" align="center" style="margin-top:110px; width:30%; height:70px;border:1px solid black;">
				<h2>${sessionScope.loginUser.login_name}</h2>
			</div>	
		</div>
			
			
  
   <div style="margin-top:270px;margin-left:43%; border:1px solid red" >
	   <a href="#" data-toggle="modal" data-target="#settings">
	   <img  style="position:absolute; border:4px solid white; width:200px; height:200px;" src="<%=request.getContextPath()%>/resources/images/${profile.uimg_profile_filename}" alt="Debbie Schmidt" class="img-responsive img-circle" />
	   </a>
   </div>
  
  
  <div id="settings" class="modal fade bs-example-modal-sm hidemodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
           <h4 class="modal-title" id="mySmallModalLabel" align="center">내 설정</h4>
       	 </div>
                
        <div class="modal-body ">
             <ul class="list-group" id="contact-list">
               
            <li class="list-group-item" id="editInfo">                       
                	내 정보 수정하기                 
             </li>
             <li class="list-group-item" id="changePf">                       
               		프로필 사진 바꾸기                 
             </li>
             <li class="list-group-item" id="changeBg">                       
           			배경 사진 바꾸기                
             </li>
               <li class="list-group-item " id="changeBg">                       
           			<button type="button" class="mybutton" data-toggle="modal" data-target="#mypageEdit">내 페이지 설정 </button>       
             </li>
    
           </ul>
        </div>
          
            </div>
        </div>
    </div>
    
    
   <div id="mypageEdit" class="modal fade bs-example-modal-sm hidemodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-m">
            <div class="modal-content" style="padding-top:20px;height:300px; width:500px;">
                <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
           <h4 class="modal-title" id="mySmallModalLabel" align="center">내 페이지 설정</h4>
       	 </div>
                
        <div class="modal-body" style="padding:10px;padding-top:30px;">
             <!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">페이지 타이틀</label>  
				  <div class="col-md-8">
				  <input id="textinput" name="textinput" placeholder="" class="form-control input-md" required="" type="text">
				    
				  </div>
				</div>
				
				<!-- Textarea -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textarea">내 소개</label>
				  <div class="col-md-8">                     
				    <textarea class="form-control" id="textarea" name="textarea"></textarea>
				  </div>
				</div>
				
				<!-- Button (Double) -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="btnCancel"></label>
				  <div class="col-md-8">
				 
				   <br/> <button id="btnCancel" name="btnCancel" class="btn btn-primary">Cancel</button>
				    <button id="btnSave" name="btnSave" class="btn btn-success">Save</button>
				  </div>
				</div>
    
        </div>
          
            </div>
        </div>
    </div>
    
    
   
    
    

  
   
    <div class="container gal-container" style="border:1px solid orange;margin-top:300px;">
   
   
   <div style="margin-left:-30px; margin-top:-80px;float: left; width:73%; border:1px solid black;">
   
   
   <c:if test="${not empty list}">
   
   <c:forEach var="board" items="${list}" varStatus="status" >
   
    <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
      <div class="box" >
        <a href="#" data-toggle="modal" data-target="#bimg_filename${status.count}">
          <img src="<%=request.getContextPath()%>/resources/images/${board.bimg_filename}">
        </a>
        <div class="modal fade" id="bimg_filename${status.count}" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <div class="modal-body">
                <img src="<%=request.getContextPath()%>/resources/images/${board.bimg_filename}">
              </div>
                <div class="col-md-12 description">
                  <h4>${board.board_content}</h4>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    </c:forEach>
    
    </c:if>
    
    <c:if test="${empty list}">
    
    
    <br/>
    <div align="left">
    	<span style="color:black; font-style:italic; font-weight:bold; font-size:16pt;">등록된 게시물이 없습니다.</span>
    	</div>
    <br/>
    <br/>
    
    
    </c:if>
   
   
   </div>
   
   
   
   
    <div style="margin-top:-250px;float: right; width:26%; border:1px solid red;">
    
    
    <div class="col-lg-3  col-md-3 col-sm-12">
				
				

<div class="container" style="margin-left:-330px;">
    

    <div class="row">
        <div class="col-xs-12 col-sm-offset-3 col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading c-list">
                    <span class="title">Followers</span>
                   <ul class="pull-right c-controls">
                        <li><a href="#cant-do-all-the-work-for-you" data-toggle="tooltip" data-placement="top" title="Add Contact"><i class="glyphicon glyphicon-plus"></i></a></li>
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
                
              <%--   <c:if test="${not empty followerList }">
                	
                	<c:forEach var="followvo" items="${followerList }">
                
                    <li class="list-group-item">
                        <div class="col-xs-12 col-sm-3">
                            <img src="http://api.randomuser.me/portraits/men/49.jpg" alt="Scott Stevens" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">Scott Stevens ${followvo.}</span><br/>
                            <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5842 Hillcrest Rd"></span>
                            <span class="visible-xs"> <span class="text-muted">5842 Hillcrest Rd  ${followvo.}</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(870) 288-4149"></span>
                            <span class="visible-xs"> <span class="text-muted">(870) 288-4149  ${followvo.}</span><br/></span>
                            <span class="fa fa-comments text-muted c-info" data-toggle="tooltip" title="scott.stevens@example.com"></span>
                            <span class="visible-xs"> <span class="text-muted">scott.stevens@example.com  ${followvo.}</span><br/></span>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                    </c:forEach>
                    </c:if>
                     <c:if test="${empty followerList}">
                     <br/>
                     	<span style="font-size:13pt; font-weight:bold; color:gray; padding:50px;">아직 팔로워가 없습니다.^^ <br/><br/><br/> </span>

                    </c:if> --%>
                  
                    
                     <li class="list-group-item">
                        <div class="col-xs-12 col-sm-3">
                            <img src="http://api.randomuser.me/portraits/men/97.jpg" alt="Seth Frazier" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">Seth Frazier</span><br/>
                            <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="7396 E North St"></span>
                            <span class="visible-xs"> <span class="text-muted">7396 E North St</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(560) 180-4143"></span>
                            <span class="visible-xs"> <span class="text-muted">(560) 180-4143</span><br/></span>
                            <span class="fa fa-comments text-muted c-info" data-toggle="tooltip" title="seth.frazier@example.com"></span>
                            <span class="visible-xs"> <span class="text-muted">seth.frazier@example.com</span><br/></span>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                    <li class="list-group-item">
                        <div class="col-xs-12 col-sm-3">
                            <img src="http://api.randomuser.me/portraits/women/90.jpg" alt="Jean Myers" class="img-responsive img-circle" />
                        </div>
                        <div class="col-xs-12 col-sm-9">
                            <span class="name">Jean Myers</span><br/>
                            <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="4949 W Dallas St"></span>
                            <span class="visible-xs"> <span class="text-muted">4949 W Dallas St</span><br/></span>
                            <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(477) 792-2822"></span>
                            <span class="visible-xs"> <span class="text-muted">(477) 792-2822</span><br/></span>
                            <span class="fa fa-comments text-muted c-info" data-toggle="tooltip" title="jean.myers@example.com"></span>
                            <span class="visible-xs"> <span class="text-muted">jean.myers@example.com</span><br/></span>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                     
                </ul>
            </div>
        </div>
	</div>
    
    	<!-- JavaScrip Search Plugin -->
    <script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
 
   		   
	</div>
		
			
					
	</div>
    
    
    </div>
   
   
    
    <%-- 
    <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
      <div class="box">
        <a href="#" data-toggle="modal" data-target="#image2">
          <img src="<%=request.getContextPath()%>/resources/images/image2.png">
        </a>
        <div class="modal fade" id="image2" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <div class="modal-body">
                 <img src="<%=request.getContextPath()%>/resources/images/image2.png">
              </div>
                <div class="col-md-12 description">
                  <h4>This is the second one on my Gallery</h4>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    
    <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
      <div class="box">
        <a href="#" data-toggle="modal" data-target="#image3">
          <img src="<%=request.getContextPath()%>/resources/images/image3.png">
        </a>
        <div class="modal fade" id="image3" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <div class="modal-body">
                 <img src="<%=request.getContextPath()%>/resources/images/image3.png">
              </div>
                <div class="col-md-12 description">
                  <h4>This is the second one on my Gallery</h4>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    
    <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
      <div class="box">
        <a href="#" data-toggle="modal" data-target="#image4">
          <img src="<%=request.getContextPath()%>/resources/images/image4.png">
        </a>
        <div class="modal fade" id="image4" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <div class="modal-body">
                <img src="<%=request.getContextPath()%>/resources/images/image4.png">
              </div>
                <div class="col-md-12 description">
                  <h4>This is the third one on my Gallery</h4>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
     <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
      <div class="box">
        <a href="#" data-toggle="modal" data-target="#image5">
          <img src="<%=request.getContextPath()%>/resources/images/image5.png">
        </a>
        <div class="modal fade" id="image5" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <div class="modal-body">
                <img src="<%=request.getContextPath()%>/resources/images/image5.png">
              </div>
                <div class="col-md-12 description">
                  <h4>This is the third one on my Gallery</h4>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div> --%>
    
    <!-- 이렇게해야대`!!~! data-target은 #뒤에 파일명, 밑에 모달 id가 파일명이어야돼 둘이 같아야돼!!! 그니까 모달의 아이디를 받아와서 data-target에 쓰는것! -->
    
    
    
    
  

			
			
	</div>
	</div>
	
	<!-- /container --> </section>


<a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" ><span class="glyphicon glyphicon-chevron-up"></span></a>

</body>
</html>
