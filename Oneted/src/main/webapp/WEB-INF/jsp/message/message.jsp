<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>

  <head>
  	
    <%@ include file="/WEB-INF/include/include-header.jspf"%>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <style>
		html,body,h1,h2,h3,h4,h5 {
		  font-family: "RobotoDraft", "Roboto", sans-serif;
		}
		.w3-bar-block .w3-bar-item {
		  padding: 16px
		}
      </style>
      <title>Insert title here</title>
  </head>

  <body>
<jsp:include page="/WEB-INF/include/navBar.jspf" flush="true"/>
    <!-- Side Nav start -->
    <nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card-2" 
    	style="z-index:3;width:320px;" id="mySidebar">
    	<!-- 3buttons -->
    	
    	<a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
        class="w3-bar-item w3-button w3-hide-large w3-large">
        Close <i class="fa fa-remove"></i></a>
    	
      	<a id="OneTed" href="javascript:void(0);"
        class="w3-bar-item w3-button w3-border-bottom w3-large">
        <span style="font-weight: bold;"><span style="color: red">
        One</span>Ted</span>Message</a>
         
        <a id="newMsg" href="javascript:void(0)" 
        class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align">
        NewMessage <i class="w3-padding fa fa-pencil"></i></a>
        
        <a id="myBtn" onclick="myFunc('Demo1')" href="javascript:void(0)" 
        class="w3-bar-item w3-button"><i class="fa fa-inbox w3-margin-right"></i>
        Inbox (3)<i class="fa fa-caret-down w3-margin-left"></i></a>
        
      <div id="Demo1" class="w3-hide w3-animate-left">
      
      	<!-- Message Search -->
        <div class="w3-container" style="padding-bottom: 10px; padding-top: 10px;">
          <form>
            <select id="selector" style="height: 30px">
				<option value="sender">Sender</option>
				<option value="subject">Subject</option>
				<option value="contents">Content</option>
				<option value="writeday">Writeday</option>
			</select> 
			<input type="text" id="searchKey" style="height: 30px; width: 120px"/> 
			<input type="button" id="searchBtn" value="Search" style="height: 30px"/>
          </form>
        </div>
        
        <!-- Message Expression start -->
        <c:choose>
          <c:when test="${fn:length(list) > 0}">
            <c:forEach items="${list }" var="row">
              <a href="javascript:void(0)" name="title"
                class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey"
                id="firstTab" style="padding: 0px; padding-left: 10px; padding-top: 10px">
                <div class="w3-container" style="padding: 0px">
                  <div style="float: left">
                    <input id="mid" type="hidden" value="${row.MID}"/>                    
                    <input type="checkbox" name="chkList" value="${row.MID}"/>
                  </div>
                  <div class="open" style="margin-left: 30px">
                    <i class="material-icons" style="color: red">contact_mail</i>&nbsp;&nbsp;
                    <span class="w3-opacity w3-large">${row.SENDER}</span>
                      <h6>${row.SUBJECT}</h6>
                  </div>
                </div>
              </a>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="4">조회된 결과가 없습니다.</td>
            </tr>
          </c:otherwise>
        </c:choose>
        <!-- Message Expression end -->
        
      </div>     
      <!-- 2buttons -->
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-margin-right"></i>
      To Team</a>
      <a id="mdelMsg" class="w3-bar-item w3-button"><i class="fa fa-trash w3-margin-right"></i>
      Delete</a>
    </nav>
	<!-- Side Nav end-->
    <!-- Modal that pops up when you click on "New Message" -->
    <%@ include file="/WEB-INF/include/include-sendmsg.jspf"%>

      <!-- Overlay effect when opening the side navigation on small screens -->
      <div class="w3-overlay w3-hide-large w3-animate-opacity"
        onclick="w3_close()" style="cursor: pointer"
        title="Close Sidemenu" id="myOverlay"></div>

      <!-- Page content -->
      <div class="w3-main" style="margin-left: 320px;">
        <i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top"
          onclick="w3_open()"></i>
        <a id=mNewMsg href="javascript:void(0)"
          class="w3-hide-large w3-red w3-button w3-right w3-margin-top w3-margin-right"><i class="fa fa-pencil"></i></a>

        <div id="detail" class="w3-container person">
          <input type="hidden" id="dmid" />          <br>
          <h5 id="dsubject" class="w3-opacity"></h5>
          <h4>
            <i class="material-icons">contact_mail</i>&nbsp;&nbsp;
            <span
              id="dsender"></span><br> <i class="fa fa-clock-o"></i>&nbsp;&nbsp;&nbsp;
              <span
                id="dwriteday"></span>
          </h4>
          <a id="replyThis" class="w3-button w3-light-grey">Reply<i
				class="w3-margin-left fa fa-mail-reply"></i></a>          <a id="forwardThis" class="w3-button w3-light-grey"
            href="#">Forward<i
				class="w3-margin-left fa fa-arrow-right"></i></a>          <a id="delThis" class="w3-button w3-light-grey">Delete<i
				class="w3-margin-left fa fa-trash"></i></a>
          <hr>
          <p id="dcontents"></p>

        </div>

      </div>

      <%@ include file="/WEB-INF/include/include-body.jspf"%>
		<script>
			var openInbox = document.getElementById("myBtn");
			openInbox.click();
			
			function w3_open() {
			  document.getElementById("mySidebar").style.display = "block";
			  document.getElementById("myOverlay").style.display = "block";
			}
			
			function w3_close() {
			  document.getElementById("mySidebar").style.display = "none";
			  document.getElementById("myOverlay").style.display = "none";
			}
			
			function myFunc(id) {
			  var x = document.getElementById(id);
			  if (x.className.indexOf("w3-show") == -1) {
			    x.className +=" w3-show";
			    x.previousElementSibling.className +=" w3-red";
			  } else {
			    x.className = x.className.replace(" w3-show", "");
			    x.previousElementSibling.className = x.previousElementSibling.className.replace(" w3-red", "");
			  }
			}
		</script>
			
		<script>
			var openTab = document.getElementById("firstTab");
			openTab.click();
		</script>
			
		<script>
			$(document).ready(function() {
			  //fn_listMsg();
			  //상세 메시지 열기 버튼
			  $(".open").on("click", function(e) { 
			      e.preventDefault();
			      fn_detailMsg($(this));
			      w3_close();
			  	});
			  //체크박스 메세지 지우기 버튼		
			  $("#mdelMsg").on("click", function(e) { 		
			      fn_delMultiMsg();
			    });
			  //해당 메세지 지우기 버튼
			  $("#delThis").on("click", function(e) { 
			      e.preventDefault();
			      fn_delThis();
			    });
			  //해당 메세지 답신 버튼
			  $("#replyThis").on("click", function(e) { 
			      e.preventDefault();
			      fn_replyThis();
			    });
			  //해당 메세지 전달 버튼
			  $("#forwardThis").on("click", function(e) { 
			      e.preventDefault();
			      fn_forwardThis();
			    });
			  //새 메시지창
			  $("#newMsg").on("click", function(e) { 				
			      fn_newMsg();
			  	});
			  //찾기 버튼
			  $("#searchBtn").on("click", function(e) { 				
			      fn_searchMsg();
			    });
			  //초기화 버튼
			  $("#OneTed").on("click", function(e) { 				
			      fn_listMsg();
			  	});
			  //새 메시지창
			  $("#mNewMsg").on("click", function(e) { 				
			      fn_newMsg();
			    });
			});
			
			function fn_listMsg() {
			  var comSubmit = new ComSubmit();
			  comSubmit.setUrl(
		 	  "<c:url value='/message/listMsg.do' />"
		 	  );
			  comSubmit.submit();
			}
			
			function fn_searchMsg() {
			  var comSubmit = new ComSubmit();
			  comSubmit.setUrl( 
			  "<c:url value='/message/searchMsg.do' />"
			  );
			  comSubmit.addParam("SELECTOR", $("#selector").val());
			  comSubmit.addParam("SEARCHKEY", $("#searchKey").val().toLowerCase());
			  comSubmit.submit();
			}
			
			function fn_delThis() {
			  var comSubmit = new ComSubmit();
			  comSubmit.setUrl(
			  "<c:url value='/message/delThis.do' />"
			  );
			  comSubmit.addParam("DMID", $("#dmid").val());
			  comSubmit.submit();
			}
			
			function fn_replyThis() {
			  $("#srecipient").val($("#dsender").text());
			  $("#ssubject").val("RE: " + $("#dsubject").text());
			  $("#scontents").html(">>" + $("#dcontents").html());
			  $("#id01").css("display", "block");
			}
			
			function fn_forwardThis() {
			  $("#ssubject").val("FW: " + $("#dsubject").text());
			  $("#scontents").html(">>" + $("#dcontents").html());
			  $("#srecipient").val("");
			  $("#id01").css("display", "block");
			}
			
			function fn_delMultiMsg() {
			  var comSubmit = new ComSubmit();
			  comSubmit.setUrl(
			    "<c:url value='/message/delMsg.do' />"
			  );
			  var str = "";
			  $(
				"input:checkbox[name='chkList']:checked"
			  ).each(function(index) {
			    str += $(this).val() + ";";
			  });
			  comSubmit.addParam("MID", str);
			  comSubmit.submit();
			}
			
			function fn_detailMsg(obj) {
			  var mid = obj.parent().find("#mid").val();
			  console.log(mid);
			  $
			    .ajax({
			      type: 'POST',
			      url: "<c:url value='/message/detailMsg.do'/>",
			      data: "MID=" + mid,
			      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			      processData: false,
			      async: false,
			      datatype: 'json',
			      success: function(data, textStatus, xhr) {
			        var val = $.parseJSON(data);
			        console.log(val['MID']);
			        $("#dmid").val(val.MID);
			        $("#dsender").text(val.SENDER);
			        $("#dsubject").text(val.SUBJECT);
			        $("#dcontents").html(val.CONT);
			        $("#dwriteday").text(val.WRITEDAY);
			      },
			      error: function(request, status, error) {
			        alert("code:" + request.status +"\n" + "error:" + error);
			      }
			    });
			}
        </script>
  </body>
  </html>