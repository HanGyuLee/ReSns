<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	body {
	 	background: #f5f5fa;
	}

	/* ==========================================================================
	   7. How It Works Section
	========================================================================== */
	.how-it-works {
	    background: #f5f5fa;
		padding-bottom: 30px;
	}
	
	.board{
		/*width: 75%;
		margin: 60px auto;
		margin-bottom: 0;
		box-shadow: 10px 10px #ccc,-10px 20px #ddd;*/
	}
	.board .nav-tabs {
		position: relative;
		/* border-bottom: 0; */
		/* width: 80%; */
		margin: 40px auto;
		margin-bottom: 0;
		box-sizing: border-box;
	
	}
	
	.board > div.board-inner > .nav-tabs {
		border: none;
	}
	
	p.narrow{
		width: 60%;
		margin: 10px auto;
	}
	
	.liner{
		height: 2px;
		background: #ddd;
		position: absolute;
		width: 80%;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: 50%;
		z-index: 1;
	}
	/* .nav-tabs > li.active 일때, > .nav-tabs의 바로 하위의 li.active 만 선택된다. */
	.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
		color: #555555;
		cursor: default;
		/* background-color: #ffffff; */
		border: 0;
		border-bottom-color: transparent;
		outline: 0;
	}
	
	span.round-tabs{
		width: 70px;
		height: 70px;
		line-height: 70px;
		display: inline-block;
		border-radius: 100px;
		background: white;
		z-index: 2;
		position: absolute;
		left: 0;
		text-align: center;
		font-size: 25px;
	}
	
	span.round-tabs.one{
		border: 2px solid #ddd;
		color: #ddd;
	}
	
	li.active span.round-tabs.one, li.active span.round-tabs.two, li.active span.round-tabs.three, li.active span.round-tabs.four, li.active span.round-tabs.five {
		background: #69cb95 !important;
		border: 2px solid #69cb95;
		color: #fff;
	}
	
	span.round-tabs.two{
		border: 2px solid #ddd;
		color: #ddd;
	}
	
	span.round-tabs.three{
		border: 2px solid #ddd;
		color: #ddd;
	}
	
	span.round-tabs.four{
		border: 2px solid #ddd;
		color: #ddd;
	}
	
	span.round-tabs.five{
		border: 2px solid #ddd;
		color: #ddd;
	}
	
	.nav-tabs > li.active > a span.round-tabs{
		background: #fafafa;
	}
	.nav-tabs > li {
		width: 20%;
	}
	
	.nav-tabs > li a{
		width: 70px;
		height: 70px;
		margin: 20px auto;
		border-radius: 100%;
		padding: 0;
	}
	
	.nav-tabs > li a:hover{
		background: transparent;
	}
	
	.tab-content{
	}
	.tab-pane{
		position: relative;
		padding-top: 50px;
	}
	
	.btn-outline-rounded{
		padding: 10px 40px;
		margin: 20px 0;
		border: 2px solid transparent;
		border-radius: 25px;
	}
	
	.btn.green{
		background-color:#69cb95;
		/*border: 2px solid #5cb85c;*/
		color: #ffffff;
	}
	
	@media( max-width : 585px ){
	
		.board {
			width: 90%;
			height:auto !important;
		}
		span.round-tabs {
			font-size:16px;
			width: 50px;
			height: 50px;
			line-height: 50px;
		}
		.tab-content .head{
			font-size:20px;
		}
		.nav-tabs > li a {
			width: 50px;
			height: 50px;
			line-height:50px;
		}
	
		li.active:after {
			content: " ";
			position: absolute;
			left: 35%;
		}
	
		.btn-outline-rounded {
			padding:12px 20px;
		}
	}

</style>
<title>관리자 메인페이지</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
</head>
<body>


<!-- How it Works section -->
    <section  class="section how-it-works" id="how-it-works">
        <div class="container">
            <div class="row text-center">
                <div class="how-it-works-heading">
                    <h2 class="section-title">관리자 메뉴</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 board">
                    <!-- <h2>Welcome to IGHALO!<sup>™</sup></h2>-->
                    <div class="board-inner">
                        <ul class="nav nav-tabs" id="myTab">
                            <div class="liner"></div>
                            <li class="active">
                                <a href="#userManager" aria-controls="home" role="tab" data-toggle="tab" title="회원관리">
                      <span class="round-tabs one"><span style="font-size: 16px;">회원관리</span>
                              <i class="icon icon-profile-male"></i>
                      </span>
                                </a></li>

                            <li><a href="#report" aria-controls="profile" role="tab" data-toggle="tab" title="신고관리">
                     <span class="round-tabs two"><span style="font-size: 16px;">신고관리</span>
                         <i class="icon icon-pencil"></i>
                     </span>
                            </a>
                            </li>
                            <li><a href="#help" aria-controls="prototyping" role="tab" data-toggle="tab" title="문의게시판">
                     <span class="round-tabs three"><span style="font-size: 12px;">문의게시판</span>
                          <i class="icon icon-layers"></i>
                     </span> </a>
                            </li>

                            <li><a href="#qna" aria-controls="uidesign" role="tab" data-toggle="tab" title="자주묻는질문">
                         <span class="round-tabs four"><span style="font-size: 16px;">FAQ</span>
                              <i class="icon icon-aperture"></i>
                         </span>
                            </a></li>

                            <li><a href="#statistics" aria-controls="doner" role="tab" data-toggle="tab" title="통계">
                         <span class="round-tabs five"><span style="font-size: 16px;">통계</span>
                              <i class="icon icon-tools-2"></i>
                         </span> </a>
                            </li>

                        </ul></div>

                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="userManager">

                            <h3 class="head text-center">회원관리</h3>
                            <p class="narrow text-center">
                               	회원 목록을 조회할 수 있고, 회원 정보의 수정, 삭제가 가능합니다. 
                            </p>

                            <p class="text-center">
                                <a href="<%= request.getContextPath() %>/memberSupervise.re" class="btn btn-success btn-outline-rounded green"> 회원관리 <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                            </p>
                        </div>
                        <div class="tab-pane fade" id="report">
                            <h3 class="head text-center">신고관리</h3>
                            <p class="narrow text-center">
                                게시물의 신고 현황을 관리하고, 신고된 게시물을 차단할 수 있습니다.
                            </p>

                            <p class="text-center">
                                <a href="<%= request.getContextPath() %>/report.re" class="btn btn-success btn-outline-rounded green"> 신고관리 <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                            </p>

                        </div>
                        <div class="tab-pane fade" id="help">
                            <h3 class="head text-center">문의게시판</h3>
                            <p class="narrow text-center">
                                회원들의 문의에 대해 조회하고, 답글을 달아줄 수 있습니다.
                            </p>

                            <p class="text-center">
                                <a href="<%= request.getContextPath() %>/help.re" class="btn btn-success btn-outline-rounded green"> 문의게시판 <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                            </p>
                        </div>
                        <div class="tab-pane fade" id="qna">
                            <h3 class="head text-center">자주묻는질문</h3>
                            <p class="narrow text-center">
                                회원들이 자주 묻는 질문에 대해 작성, 수정 및 관리가 가능합니다.
                            </p>

                            <p class="text-center">
                                <a href="<%= request.getContextPath() %>/faq.re" class="btn btn-success btn-outline-rounded green"> FAQ <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                            </p>
                        </div>
                        <div class="tab-pane fade" id="statistics">
                            <div class="text-center">
                                <i class="img-intro icon-checkmark-circle"></i>
                            </div>
                            <h3 class="head text-center">통계</h3>
                            <p class="narrow text-center">
                                ReSNS의 전반적인 통계에 대해 볼 수 있습니다.
                            </p>
                            <p class="text-center">
                                <a href="<%= request.getContextPath() %>/statistics.re" class="btn btn-success btn-outline-rounded green"> 통계 <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>
                            </p>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- /How it work -->

<script type="text/javascript">

	document.title = "관리자 메인페이지";
</script>
</body>
</html>