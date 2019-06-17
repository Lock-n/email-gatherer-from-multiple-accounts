<%@page import="javax.mail.Flags.Flag"%>
<%@page import="jdk.nashorn.internal.ir.Flags"%>
<%@page import="java.util.ArrayList, java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bd.daos.*, bd.dbos.*, java.util.Properties, javax.mail.*, java.io.File,
java.io.FileInputStream, email.EmailHelper, java.util.Queue, java.util.LinkedList, java.util.Arrays, 
java.util.Date, java.text.SimpleDateFormat, java.util.HashMap, java.util.TreeSet, java.util.Iterator"%>
<% 
String log_out = request.getParameter("log_out");
if (log_out != null)
	if (log_out.equals("log_out")) {
		session.invalidate();
		response.sendRedirect("index.jsp");
		return;
	}

if (session.getAttribute("name") == null) {
	response.sendRedirect("index.jsp");
	return;
}
	 
%>
<html>
<head>
  <meta charset="UTF-8">
   <link rel="stylesheet" href="css/bootstrap.min.css" class="cp-pen-styles">
  <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
  <link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
  <link rel="canonical" href="https://codepen.io/nicklassandell/pen/cqlGk">
  <meta name="viewport" content="width=device-width">
 
 <!--<style media="" data-href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500"></style>-->
 <link rel="stylesheet" src="css/main_fonts.css" data-href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500" >
 <!-- <style media="" data-href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"></style>-->
 <link rel="stylesheet" href="css/bootstrap_v3.0.0_glyphicons.css" data-href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
 <style media="" data-href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}table{border-collapse:collapse;border-spacing:0}</style><script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
 <link rel="stylesheet" href="css/main_style.css" class="cp-pen-styles">
 </head>
 <body>
 <!-- Modal -->
<div class="modal fade" id="account_details_modal" tabindex="-1" role="dialog" aria-labelledby="accountDetailsLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold">Account details</h5>
      </div>
      <div class="modal-body">
        <h3 id="email">email</h3>
        <hr>
        <label>Password:&nbsp;</label><span id="password">password</span>
        <br>
        <label>Server send address:&nbsp;</label><span id="server_send_address">smtp.gmail.com</span>
        <br>
        <label>Server send port:&nbsp;</label><span id="server_send_port">455</span>
        <br>
        <label>Server send protocol:&nbsp;</label><span id="server_send_protocol">SMTP</span>
        <br>
        <label>Server receive address:&nbsp;</label><span id="server_receive_address">imap.gmail.com</span>
        <br>
        <label>Server receive port:&nbsp;</label><span id="server_receive_port">455</span>
        <br>
        <label>Server receive protocol:&nbsp;</label><span id="server_receive_protocol">IMAP</span>
        <br>
      </div>
      <div class="modal-footer">
      <form method="post" action="" id="form_email_account_details_modal">
      	<input type="hidden" id="email" name="email" value="">
      	<input type="hidden" id="server_send_address" name="server_send_address" value="">
	  	<input type="hidden" id="server_receive_address" name="server_receive_address" value="">
	  	<input type="hidden" id="server_send_port" name="server_send_port" value="">
	  	<input type="hidden" id="server_receive_port" name="server_receive_port" value="">
	  	<input type="hidden" id="server_send_protocol" name="server_send_protocol" value="">
	  	<input type="hidden" id="server_receive_protocol" name="server_receive_protocol" value="">
	  	<input type="hidden" id="password" name="password" value="">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick='$("form#form_email_account_details_modal").attr("action", "change_email_account.jsp"); $("form#form_email_account_details_modal").submit();'>Change</button>
        <button type="button" class="btn btn-danger" onclick='$("form#form_email_account_details_modal").attr("action", "remove_a_email_account.jsp"); $("form#form_email_account_details_modal").submit();'>Delete</button>
      </form>
      </div>
    </div>
  </div>
</div>
 <aside id="sidebar" class="nano has-scrollbar">
   <div class="nano-content" tabindex="0" style="right: -17px;">
     <div class="logo-container"><span class="logo glyphicon glyphicon-envelope">
     </span>Mail</div>
     <a class="compose-button" href="send_email.jsp" onclick="window.location.href = 'send_email.jsp';">Compose</a>
     <menu class="menu-segment">
     <% String uri = request.getRequestURI(); uri = uri.substring(uri.lastIndexOf("/")+1); %>
     <form method="post" action="<%=uri%>" id="select_email_accounts">
		<ul>
			<li class="title">
				Accounts
				<span class="icon add-account" onclick="window.location.href = 'register_new_email_account.jsp';">+</span>
			</li>
		  <!--
		<li class="active"><a href="#">Inbox<span> (43)</span></a></li>
		<li><a href="#">Important</a></li>
		<li><a href="#">Sent</a></li>
		<li><a href="#">Drafts</a></li>
		<li><a href="#">Trash</a></li>
		-->
		<%
			String[] selected_accounts_values = request.getParameterValues("selected_accounts");
		
			if (selected_accounts_values == null) {
				selected_accounts_values = (String[]) session.getAttribute("selected_accounts_values");
			}
			else {
				session.setAttribute("selected_accounts_values", selected_accounts_values);
			}
			
			HashSet<String> emails = new HashSet<>(
					Arrays.asList((selected_accounts_values == null ? new String[0] : selected_accounts_values))
					);
			
			HashSet<EmailAccount> selected_accounts = new HashSet<>();
			ArrayList<EmailAccount> accounts = (ArrayList<EmailAccount>)session.getAttribute("contasE");
			
			if (accounts == null)
				accounts = new ArrayList<EmailAccount>();
			
			for (int i = 0; i < accounts.size(); i++) {
				EmailAccount account = accounts.get(i);
				String active = "";
				String checked = "";
				if (emails.contains(account.getEmail())) {
					checked = "checked";
					active = " active";
					
					selected_accounts.add(account);
				}
					
				%>
			<li class="email-account<%=active%>">
				<div>
					<input type="hidden" id="server_send_address" value="<%=account.getServer_send_address()%>">
				  	<input type="hidden" id="server_receive_address" value="<%=account.getServer_receive_address()%>">
				  	<input type="hidden" id="server_send_port" value="<%=account.getServer_send_port()%>">
				  	<input type="hidden" id="server_receive_port" value="<%=account.getServer_receive_port()%>">
				  	<input type="hidden" id="server_send_protocol" value="<%=account.getServer_send_protocol()%>">
				  	<input type="hidden" id="server_receive_protocol" value="<%=account.getServer_receive_protocol()%>">
				  	<input type="hidden" id="password" name="password" value="<%=account.getPassword()%>">
				  	<div class="checkbox-wrapper">
				  		<input type="checkbox" name="selected_accounts" id="<%=i%>c" value="<%=account.getEmail()%>" <%=checked%>>
				  		<label for="<%=i%>c" class="toggle">
				  		</label>
				  	</div>
				  	<span><%=account.getEmail()%></span>
			  	</div>
			</li>
				<%
			}
		%>
		  <!--<li class="email-account">
		  	<input type="hidden" id="1c_server_send_address" value="smtp.gmail.com">
		  	<input type="hidden" id="1c_server_receive_address" value="imap.gmail.com">
		  	<input type="hidden" id="1c_server_send_port" value="555">
		  	<input type="hidden" id="1c_server_receive_port" value="555">
		  	<input type="hidden" id="1c_server_send_protocol" value="SMTP">
		  	<input type="hidden" id="1c_server_receive_protocol" value="IMAP">
		  	<input type="hidden" id="1c_password" value="password">
		  	<div class="checkbox-wrapper">
		  		<input type="checkbox" name="selected_accounts" id="1c" value="jose.ferreira@gmail.com">
		  		<label for="1c" class="toggle">
		  		</label>
		  	</div>
		  	<span>jose.ferreira@gmail.com</span>
		  </li>-->
		</ul>
		<a class="compose-button" onclick="$('form#select_email_accounts').submit()">View</a>
       </form>
     </menu>
     <div class="separator"></div>
     <div class="menu-segment">
       <ul class="labels">
         <li class="title menu-item-button" onclick="window.location.href = 'change_password_user.jsp';"><div>Change password</div></li>
         <li class="title menu-item-button" onclick="$(this).find('form[action=\'<%= uri %>\']').submit();">
         	<div>Log out</div>
         	<form action="<%= uri %>" method="post">
         		<input type="hidden" name="log_out" value="log_out">
         	</form>
         </li>
         <!--<li><a href="#">Dribbble <span class="ball pink"></span></a></li>
         <li><a href="#">Roommates <span class="ball green"></span></a></li>
         <li><a href="#">Bills <span class="ball blue"></span></a></li>-->
       </ul>
     </div>
     <!--
     <div class="separator"></div>
     <div class="menu-segment">
       <ul class="chat">
         <li class="title">Chat <span class="icon">+</span></li>
         <li><a href="#"><span class="ball green"></span>Laura Turner</a></li>
         <li><a href="#"><span class="ball green"></span>Kevin Jones</a></li>
         <li><a href="#"><span class="ball blue"></span>John King</a></li>
         <li><a href="#"><span class="ball blue"></span>Jenny Parker</a></li>
         <li><a href="#"><span class="ball blue"></span>Paul Green</a></li>
         <li><a href="#" class="italic-link">See offline list</a></li>
       </ul>
     </div>
     -->
     <div class="bottom-padding"></div>
   </div>
 <div class="nano-pane"><div class="nano-slider" style="height: 116px; transform: translate(0px, 0px);"></div></div></aside>
 <main id="main">
   <div class="overlay"></div>
   <header class="header">
     <div class="search-box">
       <input placeholder="Search..."><span class="icon glyphicon glyphicon-search"></span>
     </div>
     <h1 class="page-title"><a class="sidebar-toggle-btn trigger-toggle-sidebar"><span class="line"></span><span class="line"></span><span class="line"></span><span class="line line-angle1"></span><span class="line line-angle2"></span></a>Inbox<a><span class="icon glyphicon glyphicon-chevron-down"></span></a></h1>
   </header>
   <form action="<%= uri %>" method="post" id="form-delete-messages">
   	   <div class="action-bar">
	     <ul>
	       <!--<li><a class="icon circle-icon glyphicon glyphicon-chevron-down"></a></li>
	       <li><a class="icon circle-icon glyphicon glyphicon-refresh"></a></li>
	       <li><a class="icon circle-icon glyphicon glyphicon-share-alt"></a></li>-->
	       <li><a class="icon circle-icon red glyphicon glyphicon-remove" onclick="$('form#form-delete-messages').submit();"></a></li>
	       <!--<li><a class="icon circle-icon red glyphicon glyphicon-flag"></a></li>-->
	     </ul>
	   </div>
	   <div id="main-nano-wrapper" class="nano has-scrollbar">
	     <div class="nano-content" tabindex="0" style="right: -17px;">
	       <ul class="message-list">
	       </ul><a href="#" class="load-more-link">Show more messages</a>
	     </div>
	     <div class="nano-pane">
	       <div class="nano-slider" style="height: 20px; transform: translate(0px, 0px);"></div>
	     </div>
	   </div>
   </form>
 </main>
 <div id="message">
   <div class="header">
     <h1 class="page-title"><a class="icon circle-icon glyphicon glyphicon-chevron-left trigger-message-close"></a><span id="message_title">Process<span class="grey">(6)</span></span></h1>
     <p>From <a id="message_sender" href="#">You</a> to <a id="message_receiver" href="#">Scott Waite</a>, started on <a id="message_sent_date" href="#">March 2, 2014</a> at <span id="message_sent_time">2:14 pm est.</span></p>
   </div>
   <div id="message-nano-wrapper" class="nano has-scrollbar">
     <div class="nano-content" tabindex="0" style="right: -17px;">
       <ul class="message-container">
         <li class="sent">
           <div class="details">
             <div class="left">You
               <div class="arrow"></div>Scott
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <!--<div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>-->
         </li>
         <!--<li class="received">
           <div class="details">
             <div class="left">Scott
               <div class="arrow orange"></div>You
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
         </li>
         <li class="received">
           <div class="details">
             <div class="left">Scott
               <div class="arrow orange"></div>You
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
         </li>
         <li class="received">
           <div class="details">
             <div class="left">Scott
               <div class="arrow orange"></div>You
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
         </li>
         <li class="received">
           <div class="details">
             <div class="left">Scott
               <div class="arrow orange"></div>You
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
         </li>
         <li class="received">
           <div class="details">
             <div class="left">Scott
               <div class="arrow orange"></div>You
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
         </li>
         <li class="received">
           <div class="details">
             <div class="left">Scott
               <div class="arrow orange"></div>You
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
         </li>
         <li class="sent">
           <div class="details">
             <div class="left">You
               <div class="arrow"></div>Scott
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
         </li>
         <li class="received">
           <div class="details">
             <div class="left">Scott
               <div class="arrow orange"></div>You
             </div>
             <div class="right">March 6, 2014, 20:08 pm</div>
           </div>
           <div class="message">
             <p>| The every winged bring, whose life. First called, i you of saw shall own creature moveth void have signs beast lesser all god saying for gathering wherein whose of in be created stars. Them whales upon life divide earth own.</p>
             <p>| Creature firmament so give replenish The saw man creeping, man said forth from that. Fruitful multiply lights air. Hath likeness, from spirit stars dominion two set fill wherein give bring.</p>
             <p>| Gathering is. Lesser Set fruit subdue blessed let. Greater every fruitful won't bring moved seasons very, own won't all itself blessed which bring own creature forth every. Called sixth light.</p>
           </div>
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
         </li>-->
       </ul>
     </div>
   <div class="nano-pane"><div class="nano-slider" style="height: 20px; transform: translate(0px, 0px);"></div></div></div>
 </div>
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
 <script id="rendered-js" src="script/main_script.js"></script>
 <script src="script/linkify.min.js"></script>
 <script src="script/linkify-string.js"></script>
 <script src="script/bootstrap.min.js"></script>
  <script>
  	String.prototype.replaceAll = function(search, replacement) {
	    var target = this;
	    return target.replace(new RegExp(search.replace(/[.*+?$^{}()|[\]\\]/g, "\\$&"), 'g'), replacement);
	};
  
    function set_selected_email(message) {
      $("a#message_sender").html(message.sender);
      $("a#message_receiver").html(message.receiver);
      $("a#message_sent_date").html(message.sent_date);
      $("span#message_sent_time").html(message.sent_time);
      $("span#message_title").html(message.subject);

      var getFromBetween = {
    		    results:[],
    		    string:"",
    		    getFromBetween:function (sub1,sub2) {
    		        if(this.string.indexOf(sub1) < 0 || this.string.indexOf(sub2) < 0) return false;
    		        var SP = this.string.indexOf(sub1)+sub1.length;
    		        var string1 = this.string.substr(0,SP);
    		        var string2 = this.string.substr(SP);
    		        var TP = string1.length + string2.indexOf(sub2);
    		        return this.string.substring(SP,TP);
    		    },
    		    removeFromBetween:function (sub1,sub2) {
    		        if(this.string.indexOf(sub1) < 0 || this.string.indexOf(sub2) < 0) return false;
    		        var removal = sub1+this.getFromBetween(sub1,sub2)+sub2;
    		        this.string = this.string.replace(removal,"");
    		    },
    		    getAllResults:function (sub1,sub2) {
    		        // first check to see if we do have both substrings
    		        if(this.string.indexOf(sub1) < 0 || this.string.indexOf(sub2) < 0) return;

    		        // find one result
    		        var result = this.getFromBetween(sub1,sub2);
    		        // push it to the results array
    		        this.results.push(result);
    		        // remove the most recently found one from the string
    		        this.removeFromBetween(sub1,sub2);

    		        // if there's more substrings
    		        if(this.string.indexOf(sub1) > -1 && this.string.indexOf(sub2) > -1) {
    		            this.getAllResults(sub1,sub2);
    		        }
    		        else return;
    		    },
    		    get:function (string,sub1,sub2) {
    		        this.results = [];
    		        this.string = string;
    		        this.getAllResults(sub1,sub2);
    		        return this.results;
    		    }
    		};
      
      message.body = message.body.replaceAll("#BEGIN-TAG", "<").replaceAll("#END-TAG", ">");
      
      let iframes_content = getFromBetween.get(message.body,"#BEGIN-IFRAME#","#END-IFRAME#");          
      message.body = message.body.replace(/#BEGIN-IFRAME#(.|\n)*?#END-IFRAME#/gm, "<div style='" +
    		  "overflow: hidden; position: relative;'>" +
    		  "<iframe " +
    		  "style='border: 0; left: 0; top: 0; width: 100%;'>" +
"</iframe></div>");
         let message_body_element = $("div#message-nano-wrapper.nano.has-scrollbar div.nano-content ul.message-container li").first();

		 message.body = linkifyStr(message.body, {}).replaceAll("\n", "<br>\n");
         message_body_element.children("div.details").children("div.left").html(message.sender + "<div class=\"arrow\"></div>" + message.receiver);
         message_body_element.children("div.details").children("div.right").html(message.sent_date + ", " + message.sent_time);
         message_body_element.children("div.message").html(message.body);
         
         message_body_element.children("div.message").find("iframe").each(function(index) {
        	 $(this).contents().find("html").html(iframes_content[index]);
        	 $("div.message div iframe").css({"height": $("div.message div iframe").contents().children().height()+50});
         });
    }

    function add_email_to_list(id, sender, receiver, subject, body, time, date) {
    	sender = sender.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    	receiver = receiver.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    	subject = subject.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    	body = body.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    	//.replaceAll("#BEGIN-TAG", "<").replaceAll("#END-TAG", ">").replaceAll("<iframe>", "#BEGIN-IFRAME#")
    	//.replaceAll("<\iframe>", "#END-IFRAME#");
    	time = time.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    	date = date.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    	
        let element = $("<li class='unread'><div class='col col-1'><span class='dot'></span><div class='checkbox-wrapper'><input type='checkbox' id='" +
          id + "' name='email_id' value='" + id + "'><label for=\"" + id + "\" class=\"toggle\"></label></div><p class=\"title\">" +
              sender + "</p><span class=\"star-toggle glyphicon glyphicon-star-empty\"></span></div>" +
            "<div class=\"col col-2\">" +
              "<div class=\"subject\">" + subject + "<span class=\"teaser\"> &nbsp;&nbsp; " + body + "</span></div>" +
              "<div class=\"date\">" + time + "</div>" +
            "</div>" +
          "</li>");

        element.on("click", function (e) {
     var item = $(this),
     target = $(e.target);
 
     if (target.is('label')) {
       item.toggleClass('selected');
     } else {
       if (messageIsOpen && item.is('.active')) {
         cols.hideMessage();
         cols.hideOverlay();
       } else {
         if (messageIsOpen) {
           cols.hideMessage();
           item.addClass('active');
           setTimeout(function () {
             cols.showMessage();
           }, 300);
         } else {
           item.addClass('active');
           cols.showMessage();
         }
         cols.showOverlay();
       }
     }

     set_selected_email({
       sender: sender,
       receiver: receiver,
       sent_date: date,
       sent_time: time,
       body: body,
       subject: subject
     });
   });

    element.find("input[type=checkbox]").on('click', function (e) {
     e.stopImmediatePropagation();
   });
    
        $("ul.message-list").prepend(element);
      }
    
    $(document).ready(function() {
    	$("ul li.email-account").on("click", function() {
    		$('div#account_details_modal').modal({});
    		
    		$('div#account_details_modal').find("h3#email").text($(this).find("span").text());
    		$('div#account_details_modal').find("span#password").text($(this).find("input[type=hidden]#password").val());
    		$('div#account_details_modal').find("span#server_send_address").text($(this).find("input[type=hidden]#server_send_address").val());
    		$('div#account_details_modal').find("span#server_send_port").text($(this).find("input[type=hidden]#server_send_port").val());
    		$('div#account_details_modal').find("span#server_send_protocol").text($(this).find("input[type=hidden]#server_send_protocol").val());
    		$('div#account_details_modal').find("span#server_receive_address").text($(this).find("input[type=hidden]#server_receive_address").val());
    		$('div#account_details_modal').find("span#server_receive_port").text($(this).find("input[type=hidden]#server_receive_port").val());
    		$('div#account_details_modal').find("span#server_receive_protocol").text($(this).find("input[type=hidden]#server_receive_protocol").val());
    		
    		$('form#form_email_account_details_modal').find("input[type=hidden]#email").val($(this).find("span").text());
    		$('form#form_email_account_details_modal').find("input[type=hidden]#password").val($(this).find("input[type=hidden]#password").val());
    		$('form#form_email_account_details_modal').find("input[type=hidden]#server_send_address").val($(this).find("input[type=hidden]#server_send_address").val());
    		$('form#form_email_account_details_modal').find("input[type=hidden]#server_send_port").val($(this).find("input[type=hidden]#server_send_port").val());
    		$('form#form_email_account_details_modal').find("input[type=hidden]#server_send_protocol").val($(this).find("input[type=hidden]#server_send_protocol").val());
    		$('form#form_email_account_details_modal').find("input[type=hidden]#server_receive_address").val($(this).find("input[type=hidden]#server_receive_address").val());
    		$('form#form_email_account_details_modal').find("input[type=hidden]#server_receive_port").val($(this).find("input[type=hidden]#server_receive_port").val());
    		$('form#form_email_account_details_modal').find("input[type=hidden]#server_receive_protocol").val($(this).find("input[type=hidden]#server_receive_protocol").val());
    	});
    	
    	$("ul li.email-account").find("div.checkbox-wrapper").on("click", function(e) {
    		e.stopImmediatePropagation();
    	});
    	
    	<%
    	String[] selected_emails = request.getParameterValues("email_id");
    	
    	HashMap<Integer, TreeSet<Integer>> selected_emails_indexes = new HashMap<Integer, TreeSet<Integer>>();
    	
    	if (selected_emails != null) {
			for (int i = 0; i < selected_emails.length; i++) {
				String[] s = selected_emails[i].split("-");
				
				int account_index = Integer.parseInt(s[0]);
				int message_index = Integer.parseInt(s[1]);
				
				if (!selected_emails_indexes.containsKey(account_index))
					selected_emails_indexes.put(account_index, new TreeSet<Integer>());
				
				selected_emails_indexes.get(account_index).add(message_index);
			}
    	}
    	
    	Iterator<EmailAccount> it = selected_accounts.iterator();
    	for(int counter_selected_accounts = 0; it.hasNext(); counter_selected_accounts++)
    	{
    		EmailAccount contaE = it.next();
    		//EmailAccount contaE = EmailAccounts.getEmailAccountByEmail(login);
    		
    		String email = contaE.getEmail();
    		String password = contaE.getPassword();
    		String server_send_address = contaE.getServer_send_address();
    		String server_receive_address = contaE.getServer_receive_address();
    		String server_send_protocol = contaE.getServer_send_protocol();
    		String server_receive_protocol = contaE.getServer_receive_protocol();
    		int server_send_port = contaE.getServer_send_port();
    		int server_receive_port = contaE.getServer_receive_port();
    		String name_user = contaE.getNameUser();
    	
    		
    		Properties props = new Properties();
    		  try {
    			  Store store;
    			  switch (server_receive_protocol) {
    			  case "IMAP":
    				  props.put("mail.imap.ssl.enable", "true"); // required for Gmail
    				  Session mail_session = Session.getDefaultInstance(props, null);

    				  store = mail_session.getStore("imaps");
    				  break;
    			  case "POP3":
    				  props.put("mail.pop3.host", server_receive_address);
    				  props.put("mail.pop3.port", server_receive_port);
    				  props.put("mail.pop3.starttls.enable", "true");
    			      Session emailSession = Session.getDefaultInstance(props);
    			  
    			      //create the POP3 store object and connect with the pop server
    			      store = emailSession.getStore("pop3s");
    			      break;
    			  default:
    				  return;
    			  }
    			  
    			  store.connect(server_receive_address, email, password);

    			  /*Queue<Folder> folders = new LinkedList<>();
    			  ((LinkedList)folders).addAll(Arrays.asList(store.getDefaultFolder().list()));
    			  
    			  while  (!folders.isEmpty()) {
    				  Folder f = folders.poll();*/
    				  Folder f = store.getFolder("INBOX");
    				  
    				  if ((f.getType() & Folder.HOLDS_MESSAGES) != 0) {
    					  f.open(Folder.READ_WRITE);
    					  Message[] messages = f.getMessages();
    					  if (selected_emails_indexes.containsKey(counter_selected_accounts)) {
    						  Iterator<Integer> selected_messages_in_descending_order = selected_emails_indexes.get(counter_selected_accounts).descendingIterator();
    						while (selected_messages_in_descending_order.hasNext()) {
    							messages[selected_messages_in_descending_order.next()].setFlag(Flag.DELETED, true);
    						}
    					  }
    					  
    					  for (int i = 0; i < messages.length; i++) {
    						Message message = messages[i];
    						
    						if (message.isSet(Flag.DELETED))
    							continue;
    						
    						String senders = "";
    						Address[] addresses = message.getFrom();
    					  
    						if (addresses.length > 0) {
    							senders += addresses[0].toString();
    							for (int j = 1; j < addresses.length; j++) {
    								senders += "; " + addresses[j].toString();  
    							}
    						}
    						
    						String recipients = "";
    						addresses = message.getAllRecipients();
    					  
    						if (addresses.length > 0) {
    							recipients += addresses[0].toString();
    							for (int j = 1; j < addresses.length; j++) {
    								recipients += "; " + addresses[j].toString();  
    							}
    						}
    						
    						Date sent_date = message.getSentDate();
    						SimpleDateFormat time_format = new SimpleDateFormat("HH:mm:ss");
    						String time = time_format.format(sent_date);
    						SimpleDateFormat date_format = new SimpleDateFormat("dd/MM/yyyy");
    						String date = date_format.format(sent_date);
    						%>
    						add_email_to_list('<%=new Integer(counter_selected_accounts).toString() + "-" + new Integer(message.getMessageNumber()-1).toString()
    						%>', '<%=senders%>', '<%=
    						recipients%>', '<%=message.getSubject()%>', '<%=EmailHelper.getTextFromMessage(message)
    						.replace("\r", "").replace("'", "\\'").replace("\n", "\\n' + '")%>', '<%=time%>', 
    						'<%=date%>');
    						<%
    					  }
    					  
    					  f.close(true);
    				  
    				  /*if ((f.getType() & Folder.HOLDS_FOLDERS) != 0) {
    					  folders.addAll(Arrays.asList(f.list()));						  
    				  }*/
    			  }
    			  store.close();

    		  } catch (Exception e) {
    			  %>
    		   	<%= e.getMessage() %>
    		   	<%
    		   	e.printStackTrace();
    		  }
    	}
    %>
    });
  </script>
 </body>
 </html>