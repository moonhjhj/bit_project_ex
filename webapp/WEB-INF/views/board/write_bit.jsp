<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="euc-kr">
<!--<meta name="viewport" id="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0">-->
<meta name="viewport" id="viewport" content="">

	<meta http-equiv="X-UA-Compatible" content="IE=8">
	<link rel= "shortcut icon" href="/images/favicon.ico">
	<title>비트교육센터</title>
	
	<link rel="stylesheet" type="text/css" href="/CSS/Base.css">
<link rel="stylesheet" type="text/css" href="/CSS/Layout.css">
<link rel="stylesheet" type="text/css" href="/CSS/Content.css">
<link rel="stylesheet" type="text/css" href="/CSS/Common.css">
<link rel="stylesheet" type="text/css" href="/CSS/UI_Style.css"><script type="text/javascript" src="/JS/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/JS/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/JS/jquery.placeholder.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<!--<script type="text/javascript" src="/JS/main.js"></script>--> <!-- it has gone -->
<!--[if lte IE 8]>
<script src="/js/html5shiv-printshiv.js"></script>
<![endif]-->

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="/include/Common_CSS_Detail_720_1709.css" >
	<link rel="stylesheet" type="text/css" href="/include/Common_CSS_Detail_720plus_1709.css" >
	
	<style>
	/*
	포지션 (position)의 속성이 absolute 일 경우에는 두가지 형태로 나뉘게 됩니다.
	absolute 된 엘리먼트의 상위 엘리먼트의 속성이 relative 인것과 아닌것으로 나뉩니다.
	아닐 경우에는, 브라우져 (body) 를 기준으로 절대적인 위치를 가지게 되고,
	상위 엘리먼트의 속성이 relative 일 경우에는 상위 엘리먼트를 기준으로 절대적인 위치로 이동합니다.
	*/
		#Header_Outer_Wrap,{
			width:100%;
		}
		#Footer_Outer_Wrap {
			width:100%;;
			background-color:#122139; 
		}
		#Header_Wrap1709 {
			position:relative;
			margin:0 auto;
			width:960px;
		} 
		#Container_Wrap {
			position:relative;
			width:960px; 
			/* min-height:2000px; */
			margin:0 auto;
		}
		#mainTopBar { 
			background-color:#122139;
			height:40px;
			font-size:13px;
			font-weight:600;
		}
		/*
		height:27px; 
		background: url('Images/MainPage_TopBar.gif') repeat-x; 
		box-shadow:0px 1px 0px #dbdbdb;
		*/

		#mainLogoBar {
			height:56px;
		}
		#mainTopMenuBar {
			height:56px;
		}
		#mainTopMenuBar img, #mainWideBanner img, #mainSubMenu img, #Content_Wrap img.slot {
			float:left;
			cursor:pointer;
		}
		#mainWideBanner {
			margin-top:6px;
			margin-bottom:0px;
			overflow-y:hidden;
			height:345px;
		}
		#mainSubMenu {
			margin-bottom:33px;
		} /* 33. but in fact, it's 9px. why?? */
		
	</style>
	<script>
var arrImage = new Array();	// preloaded images.
		var timerMainmenubar;
		var timerWidebanner;			// 일정시간 경과 후 와이드배너 이미지 변경
		var bxslider1;					// bxslider(C프로그래밍, 자료구조알고리즘)
		var MAINMENU_DELAY = 50;
		var WIDEBANNER_TRANSITION_DELAY = 400;  	//800;	// 와이드배너 전환시 transition은 1초 동안(duration).
		var COLOR_SELECTED = "blue";

		var WIDEBANNER_CHANGE_DELAY = 5300; //= 5300;		// 2초마다 와이드배너 전환(transition)		
		var NUM_OF_WIDEBANNERS = 2;	// 와이드배너이미지 개수.							// NOT USED HERE :: SHOULD BE OVERRIDED.
		// arrWidebannerAddr : 와이드배너 주소 배열
		var arrWidebannerAddr = new Array("/Center/Center_info.asp",
					"/Course/Employ/Course_Employ_BizTechPartners.asp"
					);																					// NOT USED HERE :: SHOULD BE OVERRIDED.
		var arrWidebannerBgColor = new Array("#4c4c4c", "#2a2a2a");							// NOT USED HERE :: SHOULD BE OVERRIDED.

		// wideBannerHandler() : 매개변수 index는 0부터 시작. wideBannerBtn이 3개이면 0~2 사이의 값을 가짐. mouseover 시의 변화를 구현.
		// bAnimation 이 true이면 transition시 animation사용, false이면 trasition시 animation 없이 즉시 이미지변경.
		function wideBannerHandler(index, bAnimation) {
			if(index>=0 && index<=NUM_OF_WIDEBANNERS-1) {
				// preloaded[0]~[2] : wideBannerBtn on
				// preloaded[3]~[5] : wideBannerBtn off
				// preloaded[18]~[20] : reserved for wide banners

				//$("#mainWideBanner img:eq(2)").attr("src",arrImage[18+index].src);		
				for(var i=0; i<=NUM_OF_WIDEBANNERS-1; i++) {
					if(i==index) {
						$("#mainWideBanner img:eq("+i+")").css("z-index","1");
						if(bAnimation==true) {
							$("#mainWideBanner img:eq("+i+")").css("opacity","0.0");
							$("#mainWideBanner img:eq("+i+")").stop();
							$("#mainWideBanner img:eq("+i+")").animate({"opacity":"1.0"},WIDEBANNER_TRANSITION_DELAY,"swing");
							$("#mainWideBanner").parent().animate({"background-color":arrWidebannerBgColor[i]},WIDEBANNER_TRANSITION_DELAY,"swing");
						} else if(bAnimation==false) {
							$("#mainWideBanner img:eq("+i+")").stop();
							$("#mainWideBanner img:eq("+i+")").css("opacity","1.0");
							$("#mainWideBanner").parent().css( "background-color", arrWidebannerBgColor[i] );
						}
					} else {
						$("#mainWideBanner img:eq("+i+")").css("z-index","0");
						//$("#mainWideBanner img:eq("+i+")").css("opacity","0.0");
						if(bAnimation==true) {
							$("#mainWideBanner img:eq("+i+")").stop();
							$("#mainWideBanner img:eq("+i+")").animate({"opacity":"0.0"},WIDEBANNER_TRANSITION_DELAY,"swing");
						} else if(bAnimation==false) {
							$("#mainWideBanner img:eq("+i+")").css("opacity","0.0");
						}
					}
				}
				fillNavigator(index);
				/*
				document.wideBannerBtn1.src = (index==0) ? arrImage[0].src : arrImage[3].src;
				document.wideBannerBtn2.src = (index==1) ? arrImage[1].src : arrImage[4].src;
				document.wideBannerBtn3.src = (index==2) ? arrImage[2].src : arrImage[5].src;
				$(".wideBannerBtn:eq(0)").css("margin-top", (index==0) ? "-10px" : "0px");
				$(".wideBannerBtn:eq(1)").css("margin-top", (index==1) ? "-10px" : "0px");
				$(".wideBannerBtn:eq(2)").css("margin-top", (index==2) ? "-10px" : "0px");
				*/
			}
		}

		// setTimerWidebanner() : 매개변수 index는 0부터 시작. 와이드배너 개수가 3개이고 index가 2라면, 
		// 이 함수는 0번인덱스의 와이드배너로의 전환(transition)을 일정 딜레이 초 후에 실행하도록 타이머를 설정함.
		function setTimerWidebanner(index) {
			timerWidebanner = setTimeout(function() {
				// transition to the next wideBanner.
				wideBannerHandler(++index%NUM_OF_WIDEBANNERS, true);
				setTimerWidebanner(index);

			}, WIDEBANNER_CHANGE_DELAY);
		}
		
		// fillNavigator(navigatorNum) : 내비게이터(filled동그라미, unfilled동그라미) 일괄변경 : navigatorNum(-->0부터시작!)만 filled,  나머지는 unfilled.
		function fillNavigator(navigatorNum) {
			for(var i=0; i<=NUM_OF_WIDEBANNERS-1; i++) {
				if(navigatorNum==i) {
					$(".navigatorWideBanner").eq(i).attr("src", "/Images/Icons/icn_Navigator_Filled.png");
				} else {
					$(".navigatorWideBanner").eq(i).attr("src", "/Images/Icons/icn_Navigator_NotFilled.png");
				}
			}
		
//				<img class="navigatorWideBanner" src="Images/Icons/icn_Navigator_Filled.png" style="position:absolute; height:11px; left:1170px; top:170px; z-index:10;"/>
//				<img class="navigatorWideBanner" src=style="position:absolute; height:11px; left:1190px; top:170px; z-index:10;"/>
		
		}
		
		// image preloader
		function preloadImages() {
			// 0~2 : widebannerbtn(on)
			// 3~5 : widebannerbtn(off)
			
			for(var i=0; i<=2; i++) {		
				arrImage[i] = new Image();
				arrImage[i].src = "Images/Btns/MainPage_BannerBtn__"+(i+1)+"on.png";	// 0~2 : widebannerbtn(on)
			}
			for(var i=0; i<=2; i++) {		
				arrImage[i+3] = new Image();
				arrImage[i+3].src = "Images/Btns/MainPage_BannerBtn__"+(i+1)+"off.gif";	// 3~5 : widebannerbtn(off) 	MainPage_BannerBtn__3on
			}
			for(var i=6; i<=20; i++) arrImage[i] = new Image();
			
			arrImage[6].src = "Images/Slots/MainPage_Slot__단기프_C프로그래밍.png";
			arrImage[7].src = "Images/Slots/MainPage_Slot__단기프_JAVA프로그래밍.png";
			arrImage[8].src = "Images/Slots/MainPage_Slot__단기프_Cpp프로그래밍.png";
			arrImage[9].src = "Images/Slots/MainPage_Slot__단기프_자료구조알고리즘.png";
			arrImage[10].src = "Images/Slots/MainPage_Slot__단기핵심_Javascript.png";
			arrImage[11].src = "Images/Slots/MainPage_Slot__단기핵심_Database.png";
			arrImage[12].src = "Images/Slots/MainPage_Slot__단기핵심_PM.png";
			arrImage[13].src = "Images/Slots/MainPage_Slot__단기핵심_모바일.png";
			arrImage[14].src = "Images/Slots/MainPage_Slot__고급_Iot.png";
			arrImage[15].src = "Images/Slots/MainPage_Slot__고급_임베디드.png";
			arrImage[16].src = "Images/Slots/MainPage_Slot__고급_윈도우닷넷.png";
			arrImage[17].src = "Images/Slots/MainPage_Slot__고급_빅데이터.png";
			
			arrImage[18].src = "Images/Banners/MainPage_Banner__BIT_Advantage.png";
			arrImage[19].src = "Images/Banners/MainPage_Banner__Industry40.png";
			arrImage[20].src = "Images/Banners/MainPage_Banner__Summer2017.png";		// reserved for a wide banner.
			////////////////////////////////////////////// Now working, why?
		}		
		
		// mainmenu를 보임. upperindex는 1~. depth는 0~3. index는 ".no"뒤에 붙는 숫자.
		function showMenu(upperindex,depth,index) {
			// show the mainmenu_dropdown specified by index.
			$(".mainDropdownMenu.depth0.no"+(upperindex+1)).show();
			$(".mainDropdownMenu.depth0.no"+(upperindex+1)+" .mainDropdownMenu.depth"+depth+".no"+(index+1)).show();  // index:0~
			//$(".mainDropdownMenu.no"+(index+1)+".depth"+depth).show();
			//$(".mainDropdownMenu.depth"+depth+".no"+(index+1)).show();
		}
		
		// mainmenu를 감춤. depth(0~3)단위로 감춤.
		function hideMenu(depth) {
			// hide the mainmenu_dropdown. depth:1~3.
			$(".mainDropdownMenu.depth"+depth).hide();
			//$(".mainDropdownMenu.no1.depth1").hide();
		}
		
		// COLOR_SELECTED로 바뀌었던 애들을(in the depth1~3) 기본색(#000)으로 리셋.
		function clearMainmenuDepthnumber(depth) {
			//$(".mainDropdownMenu.depth"+depth+" .divMiddle").css("color","#000");
			//$(".mainDropdownMenu.depth"+depth+" .divMiddle").removeClass("on");
			//alert("clear depth:"+depth);
			$(".mainDropdownMenu.depth"+depth+" .divMiddle .divMiddleInner").removeClass("on");
		}

		// 강의평가
		function openPopupInputFormLessonEvaluation(SubjectID) {
			window.open("/Popup/Lesson_Evaluation_InputForm2_Opener.asp?SubjectID="+SubjectID,"","left=-1500, top=-300, width=750, height=930, titlebar=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
		}

		// 프로젝트평가
		function openPopupInputFormLessonProjEvaluation(ProjectID) {
			window.open("/Popup/LessonProj_Evaluation_InputForm2_Opener.asp?ProjectID="+ProjectID,"","left=-1500, top=-300, width=750, height=930, titlebar=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
		}

		// 단기프로그래밍_과정 선택시 캠퍼스 선택지가 보이도록.(selectCampus)
		function toggleCampusInfo(numCampus) {
			var str="";
			if(numCampus==1) {		// C프로그래밍
				bxslider1.stopAuto();
				str 	= "<a href='/Course/ShortCourse/Courses_c.asp'><div><span class='campusName'>[서울]</span> 비트교육센터</div></a>" +
					"<a href='/Course/localCampus/DetailPage/Daejeon_c.asp'><div><span class='campusName'>[대전]</span> 대전캠퍼스</div></a>" +
					"<a href='/Course/localCampus/DetailPage/Busan_c.asp'><div><span class='campusName'>[부산]</span> 부산캠퍼스</div></a>";
			}
			else if(numCampus==2) {		// Java프로그래밍
				str 	= "<a href='/Course/ShortCourse/DetailPage/Course_Java.asp'><div><span class='campusName'>[서울]</span> 비트교육센터</div></a>" +
					"<a href='/Course/localCampus/DetailPage/Daejeon_java.asp'><div><span class='campusName'>[대전]</span> 대전캠퍼스</div></a>" +
					"<a href='/Course/localCampus/DetailPage/Busan_java.asp'><div><span class='campusName'>[부산]</span> 부산캠퍼스</div></a>";
			}
			else if(numCampus==3) {		// C++프로그래밍
				str 	= "<a href='/Course/ShortCourse/DetailPage/Course_cPlus.asp'><div><span class='campusName'>[서울]</span> 비트교육센터</div></a>" +
					"<a href='/Course/localCampus/DetailPage/Daejeon_cPlus.asp'><div><span class='campusName'>[대전]</span> 대전캠퍼스</div></a>";
			}
			else if(numCampus==4) {		// 자료구조/알고리즘
				bxslider1.stopAuto();
				str 	= "<a href='/Course/ShortCourse/DetailPage/Course_C2.asp'><div><span class='campusName'>[서울]</span> 비트교육센터</div></a>" +
					"<a href='/Course/localCampus/DetailPage/Busan_c2.asp'><div><span class='campusName'>[부산]</span> 부산캠퍼스</div></a>";
			}			
			if( $("div#selectCampus"+numCampus).html().length>0 )
				$("div#selectCampus"+numCampus).html("");
			else {
				$("div#selectCampus"+numCampus).html(str);
				$("div#selectCampus"+numCampus).attr("id","");
			}
		}
	</script>
	<link rel="stylesheet" type="text/css" href="/CSS/Base2017Webfont.css"/>


	<script type="text/javascript">
		$(document).ready(function(){
			/*########## SNB from Common_Js ##########*/
$(".snb_1709 .newdepth1").on("click focusin", function(){
	if($(this).hasClass("on") == false){
		$(".newdepth2_wrap").slideUp("slow", 'easeOutQuint');
	}
	if($(".snb_1709 .newdepth1").hasClass("on")){
		$(this).siblings(".newdepth2_wrap").slideDown("slow", 'easeOutQuint');
	}
	$(".snb_1709 .newdepth1").removeClass("on");
	$(this).addClass("on");
});

$(".snb_1709 .newdepth2").on("click", function(){
	var indexClicked = $(".snb_1709 .newdepth2").index($(this));
	var length = $(".snb_1709 .newdepth3_wrap").length;
	
	/*	WORKED : 2017-11-27	-- TO BE DEPRECATED : 2018-2-27
	console.log("index Clicked :: " + indexClicked );
	console.log("length :: " + length );
	*/
	
	for(var i = 0; i<=length-1; i++) {
		if(i != indexClicked ) {
			$(".newdepth3_wrap.no"+(i+1)).slideUp("slow", 'easeOutQuint');
		}
	}

	/*	WORKED : 2017-11-27	-- TO BE DEPRECATED : 2018-2-27
	if($(this).hasClass("on") == false){
		console.log("1");
		$(".newdepth3_wrap").slideUp("slow", 'easeOutQuint');
	}
	*/
	if($(".snb_1709 .newdepth2").hasClass("on")){
		$(this).siblings(".newdepth3_wrap").slideDown("slow", 'easeOutQuint');
	}
	$(".snb_1709 .newdepth2").removeClass("on");
	$(this).addClass("on");
});

$(".snb_1709 .newdepth2").on("mouseenter focusin", function(){
	$(this).addClass("on");
	$(this).stop().animate({color:'#1b499b' }, 100);
}).on("mouseleave focusout", function(){
	$(this).removeClass("on");
	$(this).stop().animate({color:'#000'}, 500);
});

$(".snb_1709 .newdepth3").on("mouseenter focusin", function(){
	$(this).addClass("on");
	$(this).stop().animate({color:'#1b499b'}, 100);
	
}).on("mouseleave focusout", function(){
	$(this).removeClass("on");
	$(this).stop().animate({color:'#000'}, 500);
});

$(".snb_1709 .newdepth4").on("mouseenter focusin", function(){
	$(this).addClass("on");
	$(this).stop().animate({color:'#1b499b'}, 100);
	
}).on("mouseleave focusout", function(){
	$(this).removeClass("on");
	$(this).stop().animate({color:'#000'}, 500);
});

			//preloadImages();
			
			// mainmenu(2~6,7~9) handlers.
			$(".mainmenu").on("mouseenter", function() {
				// clear the menubar
				for(var i=0; i<=7; i++) {
					$(".mainmenu:eq("+i+")").attr("src","/Images/Menus/2/MainPage_Menu__menu"+(i+2)+"off.png");
				}
				// hide MenuDropdown
				for(var i=0;i<=3;i++){ hideMenu(i); }
				
				var index = $(".mainmenu").index(this);
				if(index<8) $(".mainmenu:eq("+(index)+")").attr("src","/Images/Menus/2/MainPage_Menu__menu"+(index+2)+"on.png");
				
				showMenu(index,1,index);
				clearTimeout(timerMainmenubar);
			}).on("mouseleave", function() {
				var index = $(".mainmenu").index(this);
				if(index<8) $(".mainmenu:eq("+(index)+")").attr("src","/Images/Menus/2/MainPage_Menu__menu"+(index+2)+"off.png");
				timerMainmenubar = setTimeout(function() { for(var i=0;i<=3;i++){ hideMenu(i); } }, MAINMENU_DELAY);
			}).on("click", function() {
				var index = $(".mainmenu").index(this);
				if($(this).attr("h_ref")!=undefined) location.href = $(this).attr("h_ref");
			});
			$(".mainDropdownMenu .divMiddle").on("click", function() {
				var href = $(this).attr("href");
				if(href!="" && $(this).attr("href")!=undefined) location.href=href;
			});
			
			// mainmenu click to introduction pages.
			$(".mainmenu").on("click", function() {
				var index = $(".mainmenu").index(this);
				//console.log("index : "+index);   // 0 : 단기핵심, 3 : 국비지원무료과정
				if(index==0) {
					location.href="/Course/ShortCourse/Course_ShortCourse.asp";
				} else if(index==3) {
					location.href="/Course/Kukka/Course_Support.asp";
				}
			});

						// mainmenu_dropdown  handlers.
			$(".mainDropdownMenu.depth0").on("mouseenter",function() {
				var index = $(".mainDropdownMenu.depth0").index(this);
				$(".mainmenu:eq("+(index)+")").attr("src","/Images/Menus/2/MainPage_Menu__menu"+(index+2)+"on.png");
				clearTimeout(timerMainmenubar);
			}).on("mouseleave",function() {
				timerMainmenubar = setTimeout(function() { 
					// Close all.
					for(var i=0; i<=3; i++) {
						hideMenu(i);
					}
					for(var i=0; i<=4; i++) {
						$(".mainmenu:eq("+(i)+")").attr("src","/Images/Menus/2/MainPage_Menu__menu"+(i+2)+"off.png");
					}
					// Clear all.
					//No. clearMainmenuDepthnumber(1); // clear the depth1 :: set font color to #000. 
					//No. clearMainmenuDepthnumber(2); // clear the depth2 :: set font color to #000.
					//No. clearMainmenuDepthnumber(3); // clear the depth3 :: set font color to #000.
					clearMainmenuDepthnumber(1); // remove the ".on"
					clearMainmenuDepthnumber(2); // remove the ".on"
					clearMainmenuDepthnumber(3); // remove the ".on"
					
				}, MAINMENU_DELAY);
			});
			
			$(".mainDropdownMenu .divMiddle").on("mouseenter",function() {
				//clearMainmenuDepthnumber(1); // clear the depth1 :: set font color to #000.
				//clearMainmenuDepthnumber(2); // clear the depth2 :: set font color to #000.
				
				clearMainmenuDepthnumber(1); // remove the ".on"
				clearMainmenuDepthnumber(2); // remove the ".on"
				clearMainmenuDepthnumber(3); // remove the ".on"
				
				//$(this).css("color",COLOR_SELECTED);
				$(this).find("div").addClass("on");
				
				// .depth1.no1 : ----------------------------------------------XXXXXXXXXXXXXXXX0-[서울] / 1-[대전] / 2-[부산] //////////// 3-[천안=x]
				// .depth1.no1 : Programming / Java / JavaScript / Database / PM / Mobile / SW Engineering / Embedded
				var index = $(".mainDropdownMenu.depth1.no1 .divMiddle").index(this);
				if(index>-1) {
					//$(".mainmenu:eq(0)").attr("src","/Images/Menus/2/MainPage_Menu__menu1on.png"); //단기프로그래밍 mainmenu on
					$(".mainmenu:eq(0)").attr("src","/Images/Menus/2/MainPage_Menu__menu2on.png"); //단기프로그래밍 mainmenu on
					hideMenu(2);
					hideMenu(3);
					hideMenu(4);
					showMenu(0,2,index);
				}
				
				// .depth2.no1 : [서울] 비트교육센터 - 0:C 프로그래밍 / 1:Java / 2:C++ / 3:자료구조알고리즘 / 4:Python / 5:C#
				var index = $(".mainDropdownMenu.depth2.no1 .divMiddle").index(this);
				if(index>-1) {
					hideMenu(3);
					hideMenu(4);
					showMenu(0,3,index);
				}
				var index = $(".mainDropdownMenu.depth3.no1 .divMiddle").index(this);
				if(index>-1) {
					hideMenu(4);
					showMenu(0,4,index);
				}
				
				// .depth1.no2 : 
				var index = $(".mainDropdownMenu.depth1.no2 .divMiddle").index(this);
				if(index>-1) {
					//$(".mainmenu:eq(0)").attr("src","/Images/Menus/2/MainPage_Menu__menu2on.png"); //고급과정 mainmenu on
					hideMenu(2);
					hideMenu(3);
					showMenu(1,2,index);
				}
				// .depth1.no3 : 
				var index = $(".mainDropdownMenu.depth1.no3 .divMiddle").index(this);
				if(index>-1) {
					//$(".mainmenu:eq(1)").attr("src","/Images/Menus/2/MainPage_Menu__menu3on.png"); //전문가과정 mainmenu on
					hideMenu(2);
					hideMenu(3);
					showMenu(2,2,index);
				}
				// .depth1.no4 : 
				var index = $(".mainDropdownMenu.depth1.no4 .divMiddle").index(this);
				if(index>-1) {
					//$(".mainmenu:eq(2)").attr("src","/Images/Menus/2/MainPage_Menu__menu4on.png"); //국비지원무료과정 mainmenu on
					hideMenu(2);
					hideMenu(3);
					showMenu(3,2,index);
				}
				// .depth1.no5 : 
				var index = $(".mainDropdownMenu.depth1.no5 .divMiddle").index(this);
				if(index>-1) {
					//$(".mainmenu:eq(3)").attr("src","/Images/Menus/2/MainPage_Menu__menu5on.png"); //초중고SW교육 mainmenu on
					hideMenu(2);
					hideMenu(3);
					showMenu(4,2,index);
				}
				/***************************** keeping the depth1 while the mouse is on the depth2   *********/
				// 단기핵심과정1~9  :: 1=Programming , ... , 9=Embedded
				for(var i=1;i<=9;i++) {
					if( $(".mainDropdownMenu.depth0.no1 .depth2.no"+i+" .divMiddle").index(this)>-1) {
						$(".mainmenu:eq(0)").attr("src","/Images/Menus/2/MainPage_Menu__menu2on.png"); //단기핵심과정 mainmenu on
						clearMainmenuDepthnumber(1);
						$(".mainDropdownMenu.depth0.no1 .depth1 .divMiddle:eq("+(i-1)+") .divMiddleInner").addClass("on");
					}
				}
				
																/*
																// 단기핵심과정 1~7
																for(var i=1;i<=7;i++) {
																	if( $(".mainDropdownMenu.depth0.no2 .depth2.no"+i+" .divMiddle").index(this)>-1) {
																		//$(".mainmenu:eq(1)").attr("src","/Images/Menus/2/MainPage_Menu__menu2on.png"); //단기핵심과정 mainmenu on
																		$(".mainmenu:eq(0)").attr("src","/Images/Menus/2/MainPage_Menu__menu2on.png"); //단기핵심과정 mainmenu on
																		clearMainmenuDepthnumber(1);
																		//$(".mainDropdownMenu.depth0.no2 .depth1 .divMiddle:eq("+(i-1)+")").css("color",COLOR_SELECTED);
																		$(".mainDropdownMenu.depth0.no2 .depth1 .divMiddle:eq("+(i-1)+") .divMiddleInner").addClass("on");
																	}
																}
																*/
				
				// 고급과정 1~4
				for(var i=1; i<=4; i++) {
					if( $(".mainDropdownMenu.depth0.no2 .depth2.no"+i+" .divMiddle").index(this)>-1) {
						$(".mainmenu:eq(1)").attr("src","/Images/Menus/2/MainPage_Menu__menu3on.png"); //고급과정 mainmenu on
						clearMainmenuDepthnumber(1);
						$(".mainDropdownMenu.depth0.no2 .depth1 .divMiddle:eq("+(i-1)+") .divMiddleInner").addClass("on");
					}
				}
				
				// 국비지원무료과정 1~4
				for(var i=1; i<=4; i++) {
					if( $(".mainDropdownMenu.depth0.no4 .depth2.no"+i+" .divMiddle").index(this)>-1) {
						$(".mainmenu:eq(3)").attr("src","/Images/Menus/2/MainPage_Menu__menu5on.png"); //국비지원무료과정 mainmenu on
						clearMainmenuDepthnumber(1);
						$(".mainDropdownMenu.depth0.no4 .depth1 .divMiddle:eq("+(i-1)+") .divMiddleInner").addClass("on");
					}
				}
				
				/***************************** / keeping the depth1 while the mouse is on the depth2 **********/
				
				/***************************** keeping the depth2 while the mouse is on the depth3   *********/
				for(var i=1;i<=7;i++) {											// no1 ~ no7 of depth4
					if( $(".mainDropdownMenu.depth0.no1 .depth3.no"+i+" .divMiddle").index(this)>-1) {
						$(".mainmenu:eq(0)").attr("src","/Images/Menus/2/MainPage_Menu__menu2on.png"); //단기핵심과정 mainmenu on
						clearMainmenuDepthnumber(1);
						clearMainmenuDepthnumber(2);
						$(".mainDropdownMenu.depth0.no1 .depth1 .divMiddle:eq("+0+") .divMiddleInner").addClass("on"); // 단기핵심과정.
						$(".mainDropdownMenu.depth0.no1 .depth2 .divMiddle:eq("+(i-1)+") .divMiddleInner").addClass("on");
					}
				}
				/***************************** / keeping the depth2 while the mouse is on the depth4 **********/
				
				/***************************** keeping the depth3 while the mouse is on the depth4   *********/
				for(var i=1;i<=7;i++) {											// no1 ~ no7 of depth4
					if( $(".mainDropdownMenu.depth0.no1 .depth4.no"+i+" .divMiddle").index(this)>-1) {
						$(".mainmenu:eq(0)").attr("src","/Images/Menus/2/MainPage_Menu__menu2on.png"); // 단기핵심과정 mainmenu on
						clearMainmenuDepthnumber(1);
						clearMainmenuDepthnumber(2);
						clearMainmenuDepthnumber(3);
						$(".mainDropdownMenu.depth0.no1 .depth1 .divMiddle:eq("+0+") .divMiddleInner").addClass("on"); // 단기핵심과정.
						$(".mainDropdownMenu.depth0.no1 .depth3 .divMiddle:eq("+(i-1)+") .divMiddleInner").addClass("on");
						for(var j=1; j<=7; j++) {									// no1 ~ no7 of depth4
							// turn on the depth2
							if( $(".mainDropdownMenu.depth0.no1 .depth4.no"+j+" .divMiddle").index(this)>-1) {
								$(".mainDropdownMenu.depth0.no1 .depth2 .divMiddle:eq("+0+") .divMiddleInner").addClass("on"); // [서울]비트교육센터 on
							}
						}
					}
				}
				/***************************** / keeping the depth3 while the mouse is on the depth4 **********/
				
			}).on("mouseleave",function() {
				//$(this).css("background-color","#fff");
				//$(this).css("color","#000");
				$(this).find("div").removeClass("on");
				
			});


			$(".snb_1709 a.newdepth1").eq(0).addClass("on");								// Q&A ON
		});

		/*기존 서브밋 함수*/
		function submit_it()
		{
			if (FrmWrite.title.value=="")
			{
				alert("제목을 입력해 주세요.");
				document.FrmWrite.title.focus();
			}
			else if (FrmWrite.content.value=="")
			{
				alert("내용을입력해 주세요.");
				document.FrmWrite.content.focus();
			}
			else
				document.FrmWrite.submit();
		}

		/*새로바뀐 서브밋 함수*/
		function check_submit(oForm){
			var ans1 = oForm.title.value;
			var ans2 = oForm.content.value;

			if (ans1=="")
			{
				alert("제목을 입력해 주세요.");
				oForm.title.focus();
				return false;
			}
			else if (ans2=="")
			{
				alert("내용을입력해 주세요.");
				oForm.content.focus();
				return false;
			}
			else{
				var checkNum = 0; // 0 이면 성공 1 이면 안됨.
				var i = 0;   
				var special=new Array("$","==","\""); // 특수문자 배열
				
				/*제목 체크*/
				for(i=0; i< special.length;i++){
					var output = ans1.indexOf(special[i],0);  //해당문자열에 특수문자열이 있는지 확인
					if (output != -1) //특수문자가 없다면 -1을 반환 -1이외의값에 alert 수행후 함수 종료
					{
						alert("특수문자를 사용하실수 없습니다.  "+special[i]+"를 삭제하신후 다시눌러주세요");
						checkNum = -1;
						oForm.title.focus();
						return false;
					}
				}

				/*내용 체크*/
				for(i=0; i< special.length;i++){
					var output = ans2.indexOf(special[i],0);  //해당문자열에 특수문자열이 있는지 확인
					if (output != -1) //특수문자가 없다면 -1을 반환 -1이외의값에 alert 수행후 함수 종료
					{
						alert("특수문자를 사용하실수 없습니다.  "+special[i]+"를 삭제하신후 다시눌러주세요");
						checkNum = -1;
						oForm.content.focus();
						return false;
					}
				}

				// +++++ 특수문자 없다면 submit.  +++++++
				if(checkNum != -1){
					oForm.submit();
					return false;
				}
			}    
			return true;    
		}
		//-->
	</script>
	

<!-- Mobon Tracker v3.1 [공용] start -->
<script type="text/javascript">
<!--
	function mobRf(){
  		var rf = new EN();
		//rf.setSSL(true);
  		rf.sendRf();
	}
  //-->
</script>
<script src="https://cdn.megadata.co.kr/js/enliple_min2.js" defer="defer" onload="mobRf()"></script>
<!-- Mobon Tracker v3.1 [공용] end -->

</head>
<body>
	<div id="Wrapper">
		<!-- Header_Wrap -->
		

	<div id="Container" >
		<div id="Header_Outer_Wrap" style="min-width:960px;">
			<!--TopBar-->
			<div id="mainTopBar">
				<div style="width:960px; margin:0 auto;">
					<div class="fl" style="color:#d2d2d4; margin-left:12px; margin-top:14px;">입학이 긍지가 되고 수료가 날개가 되는&nbsp;</div>
					<div class="fl" style="color:#1498be; margin-top:14px;">상위1%전문가 양성을 위한 교육</div>
					<div style="float:right; margin-top:0px;">
						
						<div class="fl"><a href="/Register/register_requestResult.asp"><img src="/Images/Btns/btn_Mypage.png" title="MyPage"/></a></div>
						<div class="fl"><a href="/Member/logout.asp?return_url=/index.asp"><img src="/Images/Btns/btn_Logout.png" title="LOGOUT"/></a></div>
						<div style="clear:both;"></div>
						
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div id="Header_Wrap1709">
				<!--
				<p style="font-family:'SandolGothicNeo2'; font-weight:300;">폰트를 테스트합니다. <span style="color:blue; font-size:0.5em;">// (산돌고딕네오2a)</span></p>
				<p style="font-family:'SandolGothicNeo2'; font-weight:500;">폰트를 테스트합니다. <span style="color:blue; font-size:0.5em;">// (산돌고딕네오2c)</span></p>
				<p style="font-family:'SandolGothicNeo2'; font-weight:600;">폰트를 테스트합니다. <span style="color:blue; font-size:0.5em;">// (산돌고딕네오2d)</span></p>
				-->

				
				<!--LogoBar-->
				<div id="mainLogoBar">
					<div style="float:left;">
						<a href="/"><img src="/Images/MainPage__Logo.png" style="margin-top:11px; margin-left:12px;"/></a>
					</div>
					<!--
					<div style="float:left;">
						<img src="/Images/MainPage__Slogan.gif" style="margin-top:25px; margin-left:4px; width:382px; "/>
					</div>
					-->
					<div style="clear:both;"></div>				
				</div>
			</div>
		</div>
		<div id="Header_Outer_Wrap" style="border-top:1px solid #e8e8e8; border-bottom:3px solid #1b499b; height:54px; width:100%;"> <!-- 1px solid #e8e8e8;  -->
			<div id="Header_Wrap1709">
				<!--TopMenuBar-->
				<div id="mainTopMenuBar">
					<!--<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu1off.png"/>-->
					<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu2off.png"/>
					<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu3off.png"/>
					<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu4off.png"/>
					<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu5off.png"/>
					<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu6off.png"/>
					<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu7off.png" h_ref="/Employment/employment_jobCenter.asp"/>
					<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu8off.png" h_ref="/Course/Employ/Course_Employ.asp"/>
					<img class="mainmenu" src="/Images/Menus/2/MainPage_Menu__menu9off.png" h_ref="/Course/License/Course_Licenses.asp"/>
					<div style="clear:both;"></div>
					<!--
					<img class="mainmenuTriangle" src='/Images/Icons/MainPage_Menubar__triangle.png' style="position:relative; top:-8px; left:47px; z-index:3;"/>
					<img class="mainmenuTriangle" src='/Images/Icons/MainPage_Menubar__triangle.png' style="position:relative; top:-8px; left:140px; z-index:3;"/>
					<img class="mainmenuTriangle" src='/Images/Icons/MainPage_Menubar__triangle.png' style="position:relative; top:-8px; left:234px; z-index:3;"/>
					<img class="mainmenuTriangle" src='/Images/Icons/MainPage_Menubar__triangle.png' style="position:relative; top:-8px; left:329px; z-index:3;"/>
					<img class="mainmenuTriangle" src='/Images/Icons/MainPage_Menubar__triangle.png' style="position:relative; top:-8px; left:421px; z-index:3;"/>
					<img class="mainmenuTriangle" src='/Images/Icons/MainPage_Menubar__triangle.png' style="position:relative; top:-8px; left:513px; z-index:3;"/>
					<div style="clear:both;"></div>
					-->
					<br/>
					
					
				</div>
			</div>
		</div>
		<div id="Container_Wrap" style="min-height:0px; margin-top:0px;">
			
		<!-- main dropdown menu -->
			<style>
				.mainDropdownMenu.depth0 { z-index:30; }
				.mainDropdownMenu.depth0.no1 { min-width:260px; /* min-width:154px; */ }
				.mainDropdownMenu.depth0.no1 .mainDropdownMenu.depth2.no1 { min-width:107px; }
				.mainDropdownMenu.depth0.no1 .mainDropdownMenu.depth2.no2 { min-width:107px; }
				.mainDropdownMenu.depth0.no1 .mainDropdownMenu.depth2.no3 { min-width:107px; }
				.mainDropdownMenu.depth0.no1 .mainDropdownMenu.depth2.no4 { min-width:107px; }
				.mainDropdownMenu.depth3.no1 { min-width:145px; }
				.mainDropdownMenu.depth0.no2 { min-width:124px; }
				.mainDropdownMenu.depth0.no2 .depth2.no1 { min-width:215px; }
				.mainDropdownMenu.depth0.no2 .depth2.no2 { min-width:215px; }
				.mainDropdownMenu.depth0.no2 .depth2.no3 { min-width:215px; }
				.mainDropdownMenu.depth0.no2 .depth2.no4 { min-width:215px; }
				.mainDropdownMenu.depth0.no2 .depth2.no5 { min-width:215px; }
				.mainDropdownMenu.depth0.no2 .depth2.no6 { min-width:215px; }
				.mainDropdownMenu.depth0.no2 .depth2.no7 { min-width:215px; }
				.mainDropdownMenu.depth0.no3 { min-width:124px; }
				.mainDropdownMenu.depth0.no3 .depth2.no1 { min-width:165px; }
				.mainDropdownMenu.depth0.no3 .depth2.no2 { min-width:165px; }
				.mainDropdownMenu.depth0.no3 .depth2.no3 { min-width:165px; }
				.mainDropdownMenu.depth0.no3 .depth2.no4 { min-width:165px; }
				.mainDropdownMenu.depth0.no4 { min-width:124px; }
				.mainDropdownMenu.depth0.no4 .depth2.no1 { min-width:145px; }
				.mainDropdownMenu.depth0.no4 .depth2.no2 { min-width:145px; }
				.mainDropdownMenu.depth0.no4 .depth2.no3 { min-width:145px; }
				.mainDropdownMenu.depth0.no4 .depth2.no4 { min-width:145px; }
				.mainDropdownMenu.depth0.no5 { min-width:124px; }
				.mainDropdownMenu.depth0.no5 .depth2.no1 { min-width:145px; }
				.mainDropdownMenu.depth0.no5 .depth2.no2 { min-width:145px; }
				.mainDropdownMenu.depth0.no5 .depth2.no3 { min-width:145px; }
				.mainDropdownMenu.depth0.no5 .depth2.no4 { min-width:145px; }
				.mainDropdownMenu.depth0.no6 { min-width:124px; }
				
				.mainDropdownMenu.depth0.no1 { left:0px; }
				.mainDropdownMenu.depth0.no2 { left:119px; }
				.mainDropdownMenu.depth0.no3 { left:237px; }
				.mainDropdownMenu.depth0.no4 { left:362px; }
				.mainDropdownMenu.depth0.no5 { left:482px; }
				/*.mainDropdownMenu.depth0.no6 { left:535px; }*/
				
				.mainDropdownMenu {
					display:none;
					font-size:15px;
					font-weight:400;
					background-color:#fff;
				}
				.mainDropdownMenu.depth0 {
					position:absolute;
					top:-1px;
					left:0px;
					box-shadow:0px 3px 7px #797979;  /* old : #373737 */
					border-left:2px solid #1b499b;
					border-right:2px solid #1b499b;
					border-bottom:2px solid #1b499b;
					/*
					border-right:1px solid #a5a5a4;
					border-bottom:1px solid #a5a5a4;
					*/
				} /* top:142px; top:-20px;*/
				
				.mainDropdownMenu.depth1 {
					position:relative;
				} 
				.mainDropdownMenu.depth2 {
					position:relative;
					left:-1px;
					top:0px;
				}
				.mainDropdownMenu.depth3 {
					position:relative;
					left:-1px;
					top:0px;
				}
				
				.mainDropdownMenu .divTop1 {
					height:8px;
				}
				.mainDropdownMenu .divTop2 {
					height:8px;
				} 
				.mainDropdownMenu .divBlank {
					padding-left:15px;
					padding-right:15px;
				}
				.mainDropdownMenu .divMiddle {
					padding-left:1px;
					padding-right:1px;
					/* margin-left:15px; */
					margin-right:15px;
					height:33px;
					line-height:33px;
					cursor:pointer;
				}
				.mainDropdownMenu .divMiddle .divMiddleInner {
					margin-left:15px; 
				}
				.mainDropdownMenu .divMiddle .divMiddleInner.on {
					/* background-color:#1b499b; */
					background:#1b499b url('/Images/Icons/icn_ArrowRightOnBlue.png') no-repeat 208px 9px;
					color:#ffffff !important;				
				}
				

				.mainDropdownMenu.depth2 .divMiddle .divMiddleInner.on { /* all the depth2 */
					background:#1b499b;
				}
				.mainDropdownMenu.depth3.no4 .divMiddle .divMiddleInner.on {
					background:#1b499b;
				}
				.mainDropdownMenu.depth0.no2 .depth1 .divMiddle .divMiddleInner.on { /* 고급과정 */
					background:#1b499b url('/Images/Icons/icn_ArrowRightOnBlue.png') no-repeat 158px 7px;
				}
				.mainDropdownMenu.depth0.no3 .depth1 .divMiddle .divMiddleInner.on { /* 전문가과정 */
					background:#1b499b;
				}
				.mainDropdownMenu.depth0.no5 .depth1 .divMiddle .divMiddleInner.on { /* 초중고SW교육 */
					background:#1b499b;
				}
				.mainDropdownMenu.depth0.no1 .depth2.no1 .divMiddle .divMiddleInner.on { /* 단기핵심과정(Programming)-서울,대전,... */
					background:#1b499b url('/Images/Icons/icn_ArrowRightOnBlue.png') no-repeat 170px 7px; 
				}
				.mainDropdownMenu.depth0.no1 .depth3.no1 .divMiddle .divMiddleInner.on { /* 단기핵심과정(Programming)-서울-Java,... */
					background:#1b499b url('/Images/Icons/icn_ArrowRightOnBlue.png') no-repeat 160px 7px; 
				}
				.mainDropdownMenu.depth0.no1 .depth1 .divMiddle .divMiddleInner.on { /* 단기핵심과정 - all the depth1 */
					background:#1b499b url('/Images/Icons/icn_ArrowRightOnBlue.png') no-repeat 198px 7px; 
				}
				.mainDropdownMenu.depth0.no1 .depth2.no1 .divMiddle .divMiddleInner.on { /* 단기핵심과정 - all the depth2.no1 : Programming */
					background:#1b499b url('/Images/Icons/icn_ArrowRightOnBlue.png') no-repeat 173px 7px; 
				}
				.mainDropdownMenu.depth0.no4 .depth1 .divMiddle .divMiddleInner.on { /* 국비지원무료과정 - all the depth1 */
					background:#1b499b url('/Images/Icons/icn_ArrowRightOnBlue.png') no-repeat 180px 7px; 
				}
				
				.mainDropdownMenu .divMiddleInner {
					padding-left:15px;
					padding-right:15px;
					height:28px;
					line-height:28px;
				}
				.mainDropdownMenu .divMiddleInner.twolines {
					height:56px;
				}
				.mainDropdownMenu.depth1 .divMiddle {
				} 
				.mainDropdownMenu.depth2 .divBlank {
					border-left:1px solid #e5e5e4; 
					height:33px;
				}
				.mainDropdownMenu.depth2 .divMiddle {
					/* padding-left:15px; */
					border-left:1px solid #e5e5e4; 
				}
				.mainDropdownMenu.depth3 .divBlank {
					border-left:1px solid #e5e5e4; 
					height:33px;
				}
				.mainDropdownMenu.depth3 .divMiddle {
					/* padding-left:15px; */
					border-left:1px solid #e5e5e4; 
				}
				.mainDropdownMenu.depth4 .divBlank {
					border-left:1px solid #e5e5e4; 
					height:33px;
				}
				.mainDropdownMenu.depth4 .divMiddle {
					/* padding-left:15px; */
					border-left:1px solid #e5e5e4; 
				}
				.mainDropdownMenu .divMiddle.long {
					letter-spacing:-1px;
				}
				.mainDropdownMenu .divMiddle.twolines {
					/*
					padding-top:5px;
					padding-bottom:5px;
					*/
					height:61px;
				}
				.mainDropdownMenu .divBottom {
					height:8px;

				}
				.fl {
					float:left;
				}
				.dnone {
					display:none;
				}
			</style>
			<!-- depth0 no1 : 단기핵심과정 -->
			<div class="mainDropdownMenu depth0 no1" >
				<!--<img src="Images/Icons/MainPage_Menubar__triangle.png" style="position:relative; top:-13px; left:-91px;"/>-->
				<div class="mainDropdownMenu depth1 no1 fl" style="width:250px;">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">Programming</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">Data Science</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">Java</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">JavaScript</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">Database</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">Project Management(PM)</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">Mobile</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">SW Engineering</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:190px;">Embedded</div></div>
					<div class="divMiddle" href="/Course/ShortCourse/Course_Summer2018.asp"><div class="divMiddleInner blueTxt" style="width:190px; background-image: url();"><b>여름방학특강</b></div></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no1 fl" style="width:220px;">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle"><div class="divMiddleInner " style="width:160px;">[서울] 비트교육센터</div></div>
					<div class="divMiddle"><div class="divMiddleInner " style="width:160px;">[대전] 대전캠퍼스</div></div>
					<div class="divMiddle"><div class="divMiddleInner " style="width:160px;">[부산] 부산캠퍼스</div></div>
					<div class="divMiddle"><div class="divMiddleInner " style="width:160px;">[군포] 군포캠퍼스</div></div>
					<div class="divMiddle"><div class="divMiddleInner " style="width:160px;">[김해] 김해캠퍼스</div></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth3 no1 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:150px;">C Master</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:150px;">Java 프로그래밍</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:150px;">C++ 프로그래밍</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:150px;">자료구조/알고리즘</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:150px;">Python 프로그래밍</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:150px;">C# 프로그래밍</div></div>
					<div class="divMiddle"><div class="divMiddleInner" style="width:150px; letter-spacing:-2px;">SW 자율학습 지도 커뮤니티</div></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth4 no1 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_c.asp">
						<div class="divMiddleInner" style="width:140px;">[주중반] C Master</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_C_Weekend.asp">
						<div class="divMiddleInner" style="width:140px;">[주말반] C Master</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth4 no2 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_Java.asp">
						<div class="divMiddleInner" style="width:160px;">[주중반] Java 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_Java_Weekend.asp">
						<div class="divMiddleInner" style="width:160px;">[주말반] Java 프로그래밍</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth4 no3 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_cPlus.asp">
						<div class="divMiddleInner" style="width:160px;">[주중반] C++ 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_cPlus_Weekend.asp">
						<div class="divMiddleInner" style="width:160px;">[주말반] C++ 프로그래밍</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth4 no4 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_c2.asp">
						<div class="divMiddleInner" style="letter-spacing:0px;">[주말반] 자료구조</div>
					</div>
					<!--
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_algorithmIntermediate.asp">
						<div class="divMiddleInner" style="letter-spacing:-2px;">[주말반/중급] 문제해결을 위한 알고리즘</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_algorithmAdvanced.asp">
						<div class="divMiddleInner" style="letter-spacing:-2px;">[주말반/고급] 문제해결을 위한 알고리즘</div>
					</div>
					-->
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth4 no5 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_Python.asp">
						<div class="divMiddleInner" style="width:180px;">[주중반] Python 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_Python_Weekend.asp">
						<div class="divMiddleInner" style="width:180px;">[주말반] Python 프로그래밍</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth4 no6 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_cSharp.asp">
						<div class="divMiddleInner" style="width:160px;">[주중반] C# 프로그래밍</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth4 no7 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_SelfLearning.asp">
						<div class="divMiddleInner" style="width:170px; letter-spacing:-1px;">이론 / 프로젝트 멘토링 과정</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<!-- no2 : 대전캠퍼스 -->
				<div class="mainDropdownMenu depth3 no2 fl">
					<div class="divTop1"></div>
					<div class="divTop2" ></div>
					<div class="divBlank"></div>
					<div class="divMiddle" href="/Course/localCampus/localCampus_Daejeon_introduction.asp">
						<div class="divMiddleInner" style="width:140px;">대전캠퍼스 소개</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Daejeon_c.asp">
						<div class="divMiddleInner" style="width:140px;">C 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Daejeon_cPlus.asp">
						<div class="divMiddleInner" style="width:140px;">C++ 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Daejeon_java.asp">
						<div class="divMiddleInner" style="width:140px;">Java 프로그래밍</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<!-- // no2 : 대전캠퍼스 -->
				<!-- no3 : 부산캠퍼스 -->
				<div class="mainDropdownMenu depth3 no3 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/localCampus/localCampus_Busan_introduction.asp">
						<div class="divMiddleInner" style="width:140px;">부산캠퍼스 소개</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Busan_c.asp">
						<div class="divMiddleInner" style="width:140px;">C 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Busan_java.asp">
						<div class="divMiddleInner" style="width:140px;">Java 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Busan_c2.asp">
						<div class="divMiddleInner" style="width:140px;">자료구조</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<!-- // no3 : 부산캠퍼스 -->
				<!-- no4 : 군포캠퍼스 -->
				<div class="mainDropdownMenu depth3 no4 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/localCampus/localCampus_Gunpo_introduction.asp">
						<div class="divMiddleInner" style="width:140px;">군포캠퍼스 소개</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Gunpo_c.asp">
						<div class="divMiddleInner" style="width:140px;">C 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Gunpo_cPlus.asp">
						<div class="divMiddleInner" style="width:140px;">C++ 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Gunpo_c2.asp">
						<div class="divMiddleInner" style="width:140px;">자료구조</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<!-- // no4 : 군포캠퍼스 -->
				<!-- no5 : 김해캠퍼스 -->
				<div class="mainDropdownMenu depth3 no5 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/localCampus/localCampus_Gimhae_introduction.asp">
						<div class="divMiddleInner" style="width:140px;">김해캠퍼스 소개</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Gimhae_c.asp">
						<div class="divMiddleInner" style="width:140px;">C 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Gimhae_java.asp">
						<div class="divMiddleInner" style="width:140px;">JAVA 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Gimhae_c2.asp">
						<div class="divMiddleInner" style="width:140px;">자료구조/알고리즘</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<!-- // no5 : 김해캠퍼스 -->
				<div class="mainDropdownMenu depth2 no2 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_DSCIENCE_AnalysisMachineLearning.asp">
						<div class="divMiddleInner long" style="width:295px;">R을 사용한 데이터 분석과 머신러닝 (초급)</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_DSCIENCE_AnalysisMachineLearning2.asp">
						<div class="divMiddleInner long" style="width:295px;">R을 사용한 데이터 분석과 머신러닝 (중급)</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_DSCIENCE_PracticalMachineLearningPython.asp">
						<div class="divMiddleInner" style="width:295px;">Python을 활용한 실용머신러닝 - 초급</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_DSCIENCE_ExcelMachineLearning.asp">
						<div class="divMiddleInner" style="width:295px; letter-spacing:-1px;">즉각 활용하는 Excel을 사용한 데이터 사이언스 입문</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no3 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_servletJsp.asp">
						<div class="divMiddleInner" style="width:220px;">Servlet &amp; JSP 프로그래밍</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_spring.asp">
						<div class="divMiddleInner" style="width:220px;">Spring Framework 과정</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_aiojava.asp">
						<div class="divMiddleInner" style="width:220px;">All-in-One Java Application 개발</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no4 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle long" href="/Course/ShortCourse/DetailPage/Course_HTML5.asp">
						<div class="divMiddleInner" style="width:260px;">웹개발자를 위한 HTML5(HTML5+CSS3)</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:260px;">실전 jQuery</div>
					</div>
					<div class="divMiddle long" href="/Course/ShortCourse/DetailPage/Course_JavaScript.asp">
						<div class="divMiddleInner" style="width:260px;">웹개발자를 위한 JavaScript &amp; Ajax</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_WebPublishing.asp">
						<div class="divMiddleInner" style="width:260px;">Web Publishing 실무</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:260px;">AngularJS 프로그래밍</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:260px;">ReactJS 프로그래밍</div>
					</div>
					<div class="divMiddle long" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:260px;">Front-End JavaScript Framework</div>
					</div>
					<div class="divMiddle long" href="/Course/ShortCourse/DetailPage/Course_Nodejs.asp">
						<div class="divMiddleInner" style="width:260px;">객체지향 JavaScript와 Node.js 프로그래밍</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no5 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_SearchEngine.asp">
						<div class="divMiddleInner" style="width:240px;">맞춤형 검색엔진<!-- 과정--></div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_dataBaseModeling.asp">
						<div class="divMiddleInner" style="width:240px;">데이터베이스 모델링</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_dataBase.asp">
						<div class="divMiddleInner" style="width:240px;">데이터베이스 성능튜닝</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_springData.asp">
						<div class="divMiddleInner" style="width:240px;">Spring Data + noSQL</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:240px;">MySQL  최적화</div>
					</div>
					<div class="divMiddle long" href="/Course/ShortCourse/DetailPage/Course_sqlJdbc.asp">
						<div class="divMiddleInner" style="width:240px;">오라클과 데이터베이스 연동 프로그래밍</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no6 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_Agile4Developer.asp">
						<div class="divMiddleInner" style="width:240px;">Agile 소프트웨어 개발 실무</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_ArchitectureBasic.asp">
						<div class="divMiddleInner" style="width:240px;">소프트웨어 아키텍처 입문</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_ITIL.asp">
						<div class="divMiddleInner" style="width:240px;">ITILv3 기반 IT Service Management</div>
					</div>
					<div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no7 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_Android.asp">
						<div class="divMiddleInner" style="width:140px;">안드로이드 앱 개발</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:140px;">UX/UI 제작 실무</div>
					</div>
					<div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no8 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_javaPlan.asp">
						<div class="divMiddleInner" style="width:250px;">Java 설계과정</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_realUml.asp">
						<div class="divMiddleInner" style="width:250px;">UML 실전에서는 이것만 쓴다</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_uml.asp">
						<div class="divMiddleInner" style="width:250px;">실전! 분석과정</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_designPattern.asp">
						<div class="divMiddleInner" style="width:250px;">객체지향 개념과 디자인 패턴</div>
					</div>
					<div class="divMiddle" href="/Course/ShortCourse/DetailPage/Course_codingTuning.asp">
						<div class="divMiddleInner" style="width:250px;">자바 성능향상을 위한 코딩습관과 튜닝</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no9 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle long" href="/Course/ShortCourse/DetailPage/Course_RaspberryPi.asp">
						<div class="divMiddleInner" style="width:240px;">오픈소스 라즈베리파이를 활용한 IoT 과정</div>
					</div>
					<div class="divMiddle long" href="/Course/ShortCourse/DetailPage/Course_StorageSystem_FMBased.asp">
						<div class="divMiddleInner" style="width:240px;">Flash Memory기반 Storage System</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<div style="clar:both;"></div>
			</div>

			<!-- depth0 no2 : 고급과정 -->
			<div class="mainDropdownMenu depth0 no2" >
				<!--<img src="Images/Icons/MainPage_Menubar__triangle.png" style="position:relative; top:-13px; left:-40px;"/>-->
				<div class="mainDropdownMenu depth1 no2 fl" >
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle">
						<div class="divMiddleInner" style="width:150px;">[서울] 비트교육센터</div>
					</div>
					<div class="divMiddle">
						<div class="divMiddleInner" style="width:150px;">[대전] 대전캠퍼스</div>
					</div>
					<div class="divMiddle">
						<div class="divMiddleInner" style="width:150px;">[부산] 부산캠퍼스</div>
					</div>
					<div class="divMiddle">
						<div class="divMiddleInner" style="width:150px;">[군포] 군포캠퍼스</div>
					</div>
					<div class="divMiddle">
						<div class="divMiddleInner" style="width:150px;">[김해] 김해캠퍼스</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no1 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:180px;">자바 Front-End 고급과정</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:180px;">자바 Back-End 고급과정</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:180px;">IoT 고급과정</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:180px;">임베디드 시스템 고급과정</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:180px;">윈도우 닷넷 고급과정</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. 문의(02-3486-3456)');">
						<div class="divMiddleInner" style="width:180px;">빅데이터 사이언티스트 과정</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<!-- no2 : 대전캠퍼스(고급과정) -->
				<div class="mainDropdownMenu depth2 no2 fl">
					<div class="divTop1"></div>
					<div class="divTop2" ></div>
					<div class="divBlank"></div>
					<div class="divMiddle" href="/Course/localCampus/localCampus_Daejeon_introduction.asp">
						<div class="divMiddleInner" style="width:140px;">대전캠퍼스 소개</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Daejeon_windowNet.asp">
						<div class="divMiddleInner" style="width:140px;">윈도우 닷넷 고급과정</div>
					</div>
					<div class="divBlank"></div>
					<div class="divBottom"></div>
				</div>
				<!-- // no2 : 대전캠퍼스(고급과정) -->
				<!-- no3 : 부산캠퍼스(고급과정) -->
				<div class="mainDropdownMenu depth2 no3 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/localCampus/localCampus_Busan_introduction.asp">
						<div class="divMiddleInner" style="width:130px;">부산캠퍼스 소개</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Busan_javaHigh.asp">
						<div class="divMiddleInner" style="width:130px;">웹&amp;모바일 고급과정</div><!--자바고급과정???-->
					</div>
					<div class="divBottom"></div>
				</div>
				<!-- // no3 : 부산캠퍼스(고급과정) -->
				<!-- no4 : 군포캠퍼스(고급과정) -->
				<div class="mainDropdownMenu depth2 no4 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/localCampus/localCampus_Gunpo_introduction.asp">
						<div class="divMiddleInner" style="width:140px;">군포캠퍼스 소개</div>
					</div>
					<div class="divMiddle" href="/Course/localCampus/DetailPage/Gunpo_windowNet.asp">
						<div class="divMiddleInner" style="width:140px;">윈도우 닷넷 고급과정</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<!-- // no4 : 군포캠퍼스(고급과정) -->
				<!-- no4 : 김해캠퍼스(고급과정) -->
				<div class="mainDropdownMenu depth2 no5 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<div class="divMiddle" href="/Course/localCampus/localCampus_Gimhae_introduction.asp">
						<div class="divMiddleInner" style="width:140px;">김해캠퍼스 소개</div>
					</div>
					<div class="divMiddle twolines" href="javascript:alert('준비중입니다.(문의 02-3486-3456)'); // /Course/localCampus/DetailPage/Gimhae_BigData.asp">
						<div class="divMiddleInner twolines" style="width:140px;">빅데이터 엔지니어링 실무적용 고급과정</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<!-- // no4 : 김해포캠퍼스(고급과정) -->
				<div style="clar:both;"></div>
			</div>
			
			<!-- depth0 no3 : 전문가과정 -->
			<div class="mainDropdownMenu depth0 no3" >
				<!--<img src="Images/Icons/MainPage_Menubar__triangle.png" style="position:relative; top:-13px; left:-50px;"/>-->
				<div class="mainDropdownMenu depth1 no3 fl" >
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle" href="/Course/Expert/Course_Expert_JavaExpert.asp">
						<div class="divMiddleInner" style="width:180px;">자바 전문가과정</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. (문의 02-3486-3456)');">
						<div class="divMiddleInner" style="width:180px;">윈도우 닷넷 전문가과정</div>
					</div>
					<div class="divMiddle" href="/Course/Expert/Course_Expert_Embedded.asp">
						<div class="divMiddleInner" style="width:180px;">임베디드 시스템 전문가과정</div>
					</div>
					<div class="divMiddle" href="javascript:alert('준비중입니다. (문의 02-3486-3456)');">
						<div class="divMiddleInner" style="width:180px;">청년실업 해소펀드</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<div style="clar:both;"></div>
			</div>
			
			<!-- depth0 no4 : 국비지원무료과정 -->
			<div class="mainDropdownMenu depth0 no4" >
				<!--<img src="Images/Icons/MainPage_Menubar__triangle.png" style="position:relative; top:-13px; left:-93px;"/>-->
				<div class="mainDropdownMenu depth1 no4 fl" >
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle">
						<div class="divMiddleInner" style="width:170px;">4차산업선도인력양성</div>
					</div>
					<div class="divMiddle"><!-- href="/Course/Kukka/Course_Kukka_2018.asp">-->
						<div class="divMiddleInner" style="width:170px;">국가기간전략산업직종</div>
					</div>
					<div class="divMiddle"><!-- href="/Course/Employ/Course_Employ.asp">-->
						<div class="divMiddleInner" style="width:170px;">신입사원 채용교육</div>
					</div>
					<div class="divMiddle">
						<div class="divMiddleInner" style="width:170px;">국가인적자원개발컨소시엄</div>
					</div>
					<div class="divMiddle" href="/Course/Chung/Course_Chung_2018.asp">
						<div class="divMiddleInner" style="width:170px; background-image: url();">청년취업아카데미</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no1 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle long" href="/Course/Industry4.0/Course_Industry40_FinTech_Expert.asp">
						<div class="divMiddleInner" style="width:220px;">AI기반 핀테크 융합 전문가과정</div>
					</div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>
					<!--
					<div class="divMiddle long twolines" href="/Course/Industry4.0/Course_Industry40_BigData_Expert.asp">
						<div class="divMiddleInner twolines" style="width:220px;">AI기반 빅데이터 엔지니어/사이언티스트 전문가과정</div>
					</div>
					-->
					<!--
					<div class="divMiddle long twolines" href="/Course/Industry4.0/Course_Industry40_IoTSelfDriving_Expert.asp">
						<div class="divMiddleInner twolines" style="width:220px;">IoT를 활용한 AI 기반 자율주행 전문가과정</div>
					</div>
					-->

					<div class="divBottom"></div>
				</div>

				<div class="mainDropdownMenu depth2 no2 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div>

					<!--
					<div style="DISPLAY:NONE;" class="divMiddle  " href="/Course/Kukka/Course_Kukka_Projects2070929.asp">
						<div class="divMiddleInner" style="width:200px;">프로젝트 발표회</div>
					</div>
					-->
					<div class="divMiddle  " href="/Course/Kukka/Course_Kukka_Introduction.asp">
						<div class="divMiddleInner" style="width:200px;">국가기간전략산업직종훈련 소개</div>
					</div>
					<div class="divMiddle long twolines" href="/Course/Kukka/Course_Kukka_RaspberryPiIoTService_2018.asp">
						<div class="divMiddleInner twolines" style="width:200px;">라즈베리파이를 활용한 IoT 서비스<br/>고급인력 양성과정</div>
					</div>
					<!--
					<div class="divMiddle long twolines" href="/Course/Kukka/Course_Kukka_AWSCloudWeb_2018.asp">
						<div class="divMiddleInner twolines" style="width:200px; letter-spacing:-2px;">AWS를 활용한 클라우드 기반 웹 개발<br/>고급인력 양성과정</div>
					</div>
					-->
					<!--
					<div class="divMiddle long twolines" href="/Course/Kukka/Course_Kukka_EmbeddedDrone_2018.asp">
						<div class="divMiddleInner twolines" style="width:200px;">임베디드 시스템 기반 드론 제작<br/>고급인력 양성과정</div>
					</div>
					-->
					<!--
					<div class="divMiddle long twolines" href="/Course/Kukka/Course_Kukka_JavaBigData_2018.asp">
						<div class="divMiddleInner twolines" style="width:200px;">JAVA 기반 빅데이터 분석을 위한 <br/>개발자 양성과정</div>
					</div>
					<div class="divMiddle long twolines" href="/Course/Kukka/Course_Kukka_RaspberryPiIoTEmbedded_2017.asp">
						<div class="divMiddleInner twolines" style="width:200px; letter-spacing:-2px;">라즈베리파이를 활용한 IoT임베디드<br/>시스템 개발자 양성과정</div>
					</div>
					-->
					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no3 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div>

					<div class="divMiddle" href="/Course/Employ/Course_Employ.asp">
						<div class="divMiddleInner" style="width:190px;">신입사원 채용교육 소개</div>
					</div>
					<div class="divMiddle" href="/Course/Employ/Course_Employ_ITtelecom.asp">
						<div class="divMiddleInner" style="width:190px;">㈜아이티텔레콤 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="divMiddle" href="/Course/Employ/Course_Employ_BAinfra.asp">
						<div class="divMiddleInner" style="width:190px;">㈜비에이인프라 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="divMiddle" href="/Course/Employ/Course_Employ_ivis.asp">
						<div class="divMiddleInner" style="width:190px;">㈜아이비스 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="dnone divMiddle" href="/Course/Employ/Course_Employ_Cafe24.asp">
						<div class="divMiddleInner" style="width:190px;">㈜카페24<span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="divMiddle" href="/Course/Employ/Course_Employ_BitComputer.asp">
						<div class="divMiddleInner" style="width:190px;">㈜비트컴퓨터 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="divMiddle" href="/Course/Employ/Course_Employ_AurosTech.asp">
						<div class="divMiddleInner" style="width:190px;">㈜오로스테크놀로지 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="divMiddle" href="/Course/Employ/Course_Employ_PSK.asp">
						<div class="divMiddleInner" style="width:190px;">㈜피에스케이 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="divMiddle" href="/Course/Employ/Course_Employ_BizTechPartners.asp">
						<div class="divMiddleInner" style="width:190px;">㈜비즈테크파트너스 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="divMiddle" href="/Course/Employ/Course_Employ_TaehaMechatronics.asp">
						<div class="divMiddleInner" style="width:190px;">㈜테하메카트로닉스 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="dnone divMiddle" href="/Course/Employ/Course_Employ_LEETECH.asp">
						<div class="divMiddleInner" style="width:190px;">㈜리텍 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<div class="dnone divMiddle" href="/Course/Employ/Course_Employ_voiceye.asp">
						<div class="divMiddleInner" style="width:190px;">㈜보이스아이 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					<!--
					<div class="divMiddle" href="/Course/Employ/Course_Employ_WhiteInfoComm.asp">
						<div class="divMiddleInner" style="width:190px;">㈜화이트정보통신 <span style="font-size:13px;">[모집중]</span></div>
					</div>
					-->

					<div class="divBottom"></div>
				</div>
				<div class="mainDropdownMenu depth2 no4 fl">
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divBlank"></div><div class="divBlank"></div><div class="divBlank"></div>

					<div class="divMiddle long" href="/Course/Kukka/Course_Consortium_AWS_Cloud_Web.asp">
						<div class="divMiddleInner" style="width:220px;">AWS를 활용한 클라우드 기반 웹 개발</div>
					</div>
					<div class="divMiddle long" href="/Course/Kukka/Course_Consortium_RaspberryPi_IoT.asp">
						<div class="divMiddleInner" style="width:220px; letter-spacing:-2px;">라즈베리파이를 활용한 IoT개발 실무과정</div>
					</div>
					<div class="divBottom"></div>
				</div>

				<div style="clar:both;"></div>
			</div>
			<!-- depth0 no5 : 초중고SW교육 -->
			<div class="mainDropdownMenu depth0 no5" >
				<!--<img src="Images/Icons/MainPage_Menubar__triangle.png" style="position:relative; top:-13px; left:-52px;"/>-->
				<div class="mainDropdownMenu depth1 no5 fl" >
					<div class="divTop1"></div>
					<div class="divTop2"></div>
					<div class="divMiddle long" href="javascript:alert('준비중입니다. (문의 : 02-3486-3456)'); ///Course/ShortCourse/DetailPage/Course_RaspberryPi_Audio.asp">
						<div class="divMiddleInner" style="width:260px;">세상과 소통하는 라즈베리파이 오디오 만들기</div>
					</div>
					<div class="divBottom"></div>
				</div>
				<div style="clar:both;"></div>
			</div>
			
			<div style="clar:both;"></div>
			<!--//main dropdown menu -->
			
		</div>

		<!-- //Header_Wrap -->

		<div id="Container_Wrap">
			<!-- Content_Wrap -->
			<div id="Content_Wrap">
				<!-- SNB_Wrap-->
				<style>
	#SNB_Wrap_1709 {
		position: absolute;
		top: 0px;
		/*height: 100%;*/
		padding: 0;
		background: #e9e9ef;
		/*
		border-left: 1px solid #efefef;
		border-right: 1px solid #efefef; 
		border-bottom: 1px solid #efefef;
		*/
	}
	
	#SNB_Wrap_1709 h3 {
	     padding: 31px 8px;
		height:60px;		
		font-size: 23px;
		line-height:28px;
		color: #ffffff;
		background-color: #1b499b;
		margin-bottom:1px;
		font-weight:600;
		text-align:center;
	} /* textt-shadow:1px 3px 3px #d9d9df; font-family: "Nanum Gothic Bold"; */
	
	.snb_1709 {
		background: #fff;
	}
	
	/*
	.snb_1709 li.last {
		border-bottom: 5px solid #17538e;
	}
	*/
	
	/*
	.snb_1709 > li {
		border-bottom: 1px solid #d1d1d1;
	}
	*/
	.snb_1709 li a {
		display: block;
	}
	.snb_1709 li a.newdepth1.on {
		background-color:#44587b;
		color: #fff;
	} /* background: #17538e url(/Images/Common/ico_snbBtnUp.png) 195px 12px no-repeat; */
	.snb_1709 li a.newdepth1 {
		padding: 17px 10px;
		background: url(/Images/Common/ico_snbBtnDown.png) 195px 12px no-repeat;
		font-family: "Nanum Gothic Bold";
		font-size: 15px;
		color: #222;
		border-bottom:1px solid #a0a0a0;
	}
	.snb_1709 li a.newdepth2.on{
		color: #1b499b;
		
	}
	.snb_1709 li a.newdepth2 {
		height:22px;
		padding: 8px 18px;
		font-family: "Nanum Gothic Bold";
		font-size: 14px;
		color: #333;
	} /* height:15px; */
	.snb_1709 li.long a {
		padding-right:4px;
	}
	.snb_1709 li .newdepth3_wrap.on , .snb_1709 li .newdepth4_wrap.on {
		display:block;
	}
	.snb_1709 li .newdepth3_wrap , .snb_1709 li .newdepth4_wrap {
		display:none;
		margin: 2px 18px;
		background: #f8f8f8;
		font-family: "Nanum Gothic Bold";
		font-size: 14px;
		border:1px solid #cfcfcf;
	} /* padding: 2px 8px; */
	.snb_1709 li a.newdepth3.on , .snb_1709 li a.newdepth4.on {
		color: #1b499b;
	}  /* #007a3d */
	.snb_1709 li a.newdepth3 ,  .snb_1709 li a.newdepth4 {
		height:22px;
		padding: 8px 1px 8px 10px;
		font-family: "Nanum Gothic Bold";
		font-size: 14px;
		color: #333;
	} /* height:15px; */
	.snb_1709 li a.newdepth4 {
		padding: 8px 1px 8px 8px;
		font-size:13px;
		letter-spacing:-1px;
	}

	.snb_1709 .newdepth2_wrap.on {
		display:block;
	}
	.snb_1709 .newdepth2_wrap {
		display:none;
		background: #f8f8f8;
		border-bottom:1px solid #cfcfcf;
	} /* background: #fffcef; */
	
/*
	.snb_1709 .newdepth2_wrap.no4 li:first-child a {
		height: 24px;
	}

	.snb_1709 .newdepth2_wrap.no4 li:not(:first-child) a {
		height: 30px;
	}
	
	.snb_1709 .newdepth2_wrap.no8 li:nth-child(2) a { height: 32px; }

	.snb_1709 .newdepth2_wrap.no9 li:not(:first-child) a {
		height: 34px;
	}
	
	.snb_1709 .newdepth2_wrap.no10 li:nth-child(1) a { height: 32px; }
*/	
	.snb_1709 .newwrap.up {
		background: #f7f7f7 url(/Images/Common/ico_snbBtnUp.png) 175px 7px no-repeat;
	}
	.snb_1709 .newwrap.down {
		background: url(/Images/Common/ico_snbBtnDown.png) 175px 6px no-repeat;
	}
	.snb_1709 .newwrap.plus {
		background: #f7f7f7 url(/Images/Icons/icn_Plus.png) 130px 5px no-repeat;
	}
	.snb_1709 .newwrap.minus {
		background: url(/Images/Icons/icn_Minus.png) 130px 5px no-repeat;
	}
	
/*	
	.snb_1709 .newdepth3_wrap.no2 {
		height: 314px;
	}
	.snb_1709 .newdepth3_wrap.no2 li:nth-child(3) a { height: 26px; }
	.snb_1709 .newdepth3_wrap.no2 li:nth-child(8) a { height: 26px; }
	.snb_1709 .newdepth3_wrap.no2 li:nth-child(9) a { height: 26px; }
	.snb_1709 .newdepth3_wrap.no3 {
		height: 130px;
	}
	.snb_1709 .newdepth3_wrap.no3 li a { height: 26px; }
*/	
/*
	.snb_1709 .newdepth3_wrap.no5 {
		height: 212px;
	}
	.snb_1709 .newdepth3_wrap.no5 li:nth-child(1) a { height: 26px; }
	.snb_1709 .newdepth3_wrap.no6 li:nth-child(2) a { height: 26px; }
	.snb_1709 .newdepth3_wrap.no7 {
		height: 86px;
	}
	.snb_1709 .newdepth3_wrap.no7 li a { height: 25px; }
*/	
	
	
</style>

<style>
	div.banner_wrap {
		display:none;
	}
	div#Content_Wrap {
		margin-top:10px;
	}
	.moveTop {
		left:1px;
	}
	#SNB_Wrap_1709 { 
		background:#ffffff !important; 
		width:188px !important; 
	}
</style>

<style>
	#Content_Wrap { border:none !important; }
</style>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>


				<!-- //SNB_Wrap-->
				<!-- Content -->
				<div id="Content">
					<div class="hGroup1709">
						<p>
							<img src="/Images/Icons/icn_Home.png"/>
							<img src="/Images/Icons/icn_ArrowTriangleRight.png"/>지원안내
						</p>
						<h4>온라인문의 (Q&amp;A) -  글쓰기</h4>
					</div>

					<style>
						.myTitle {
							font-family:'Nanum Gothic Bold';
							font-size:13pt;
							color:#8b6338;
							text-shadow: 1px 1px 2px #b9b9b9;
						}
						.divTable table {
							border-top: 1px solid #e0e0e0;
							border-bottom: 1px solid #e0e0e0;
						}
						.divTable table th {
							border-bottom: 1px solid #e0e0e0;
							font-size:18px;
							padding: 10px 8px;
						}
						.divTable table td {
							font-size:15px;
							border-bottom: 1px solid #e0e0e0;
							padding: 10px 8px;
							
						} /* color: #555; */
						.gradBg {
							background: linear-gradient(to right, #f2f6f8, #fffae9); 
						}
						/*
						A:link {
							color:#004366;
						}
						A:visited {
							color:#73808c;
						}*/ /* 73808c */
						#Content_Wrap {
							min-height:800px;
						}
						a.btn.mid.dGray {
							font-size:15px !important;
							padding:1px 25px;
							margin-top:0px;
						} /* 목록 */
						.btn.white {
							font-size:15px !important;
						}
					</style>
					
					<section class="section">
						<form name="FrmWrite" method="post" action="/Support/Support_online_write_ok.asp" onsubmit="return check_submit(this);">
							<input type="hidden" name="idx" value="">
							<input type="hidden" name="ref" value="">
							<input type="hidden" name="re_step" value="">
							<input type="hidden" name="re_level" value="">
							<input type="hidden" name="gotopage" value="">
							<input type="hidden" name="re" value="">	
							<input type="hidden" name="field" value="">
							<input type="hidden" name="field_value" value="">
							<div class="divTable">
								<table>
									<colgroup>
										<col style="width:10%">
										<col style="width:90%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="gradBg c">제목</th>
											<td>
												<input type="text" name="title" class="form" value="" style="width:98%">
												
											</td>
										</tr>
										<tr>
											<th scope="row" class="gradBg c">이름</th>
											<td>
												${vo.name }
											</td>
										</tr>
										<tr>
											<th scope="row" class="gradBg c">내용</th>
											<td>
												<textarea name="content" rows="20" class="form" style="width:100%"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								
								<div class="btn_wrap mar_t40 c">
									<button class="btnGreenBorder big" style="font-size:18px !important;">확인</button>
									<a href="/Support/Support_online_list.asp" class="btnWhiteBorder big mar_l10" style="font-size:18px !important;">취소</a>
								</div>
							</div>
						</form>
					</section>
				</div>
				<!-- // Content -->
			</div>
			<!-- //Content_Wrap -->
		</div>

		<!-- Footer_Wrap -->
		
			<c:import url="/WEB-INF/views/includes/bit_footer.jsp"></c:import>
	
	</div>
</body>
</html>