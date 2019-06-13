<%@page import="java.util.ArrayList, java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bd.daos.*, bd.dbos.*, java.util.Properties, javax.mail.*, java.io.File,
java.io.FileInputStream, email.EmailHelper, java.util.Queue, java.util.LinkedList, java.util.Arrays, 
java.util.Date, java.text.SimpleDateFormat"%>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
  <link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
  <link rel="canonical" href="https://codepen.io/nicklassandell/pen/cqlGk">
  <meta name="viewport" content="width=device-width">
 
 <style media="" data-href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500">/* cyrillic-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 100;
   src: local('Roboto Thin'), local('Roboto-Thin'), url(https://fonts.gstatic.com/s/roboto/v19/KFOkCnqEu92Fr1MmgVxFIzIFKw.woff2) format('woff2');
   unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
 }
 /* cyrillic */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 100;
   src: local('Roboto Thin'), local('Roboto-Thin'), url(https://fonts.gstatic.com/s/roboto/v19/KFOkCnqEu92Fr1MmgVxMIzIFKw.woff2) format('woff2');
   unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
 }
 /* greek-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 100;
   src: local('Roboto Thin'), local('Roboto-Thin'), url(https://fonts.gstatic.com/s/roboto/v19/KFOkCnqEu92Fr1MmgVxEIzIFKw.woff2) format('woff2');
   unicode-range: U+1F00-1FFF;
 }
 /* greek */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 100;
   src: local('Roboto Thin'), local('Roboto-Thin'), url(https://fonts.gstatic.com/s/roboto/v19/KFOkCnqEu92Fr1MmgVxLIzIFKw.woff2) format('woff2');
   unicode-range: U+0370-03FF;
 }
 /* vietnamese */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 100;
   src: local('Roboto Thin'), local('Roboto-Thin'), url(https://fonts.gstatic.com/s/roboto/v19/KFOkCnqEu92Fr1MmgVxHIzIFKw.woff2) format('woff2');
   unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
 }
 /* latin-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 100;
   src: local('Roboto Thin'), local('Roboto-Thin'), url(https://fonts.gstatic.com/s/roboto/v19/KFOkCnqEu92Fr1MmgVxGIzIFKw.woff2) format('woff2');
   unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
 }
 /* latin */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 100;
   src: local('Roboto Thin'), local('Roboto-Thin'), url(https://fonts.gstatic.com/s/roboto/v19/KFOkCnqEu92Fr1MmgVxIIzI.woff2) format('woff2');
   unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
 }
 /* cyrillic-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 300;
   src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmSU5fCRc4EsA.woff2) format('woff2');
   unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
 }
 /* cyrillic */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 300;
   src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmSU5fABc4EsA.woff2) format('woff2');
   unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
 }
 /* greek-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 300;
   src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmSU5fCBc4EsA.woff2) format('woff2');
   unicode-range: U+1F00-1FFF;
 }
 /* greek */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 300;
   src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmSU5fBxc4EsA.woff2) format('woff2');
   unicode-range: U+0370-03FF;
 }
 /* vietnamese */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 300;
   src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmSU5fCxc4EsA.woff2) format('woff2');
   unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
 }
 /* latin-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 300;
   src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmSU5fChc4EsA.woff2) format('woff2');
   unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
 }
 /* latin */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 300;
   src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmSU5fBBc4.woff2) format('woff2');
   unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
 }
 /* cyrillic-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 400;
   src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v19/KFOmCnqEu92Fr1Mu72xKOzY.woff2) format('woff2');
   unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
 }
 /* cyrillic */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 400;
   src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v19/KFOmCnqEu92Fr1Mu5mxKOzY.woff2) format('woff2');
   unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
 }
 /* greek-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 400;
   src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v19/KFOmCnqEu92Fr1Mu7mxKOzY.woff2) format('woff2');
   unicode-range: U+1F00-1FFF;
 }
 /* greek */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 400;
   src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v19/KFOmCnqEu92Fr1Mu4WxKOzY.woff2) format('woff2');
   unicode-range: U+0370-03FF;
 }
 /* vietnamese */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 400;
   src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v19/KFOmCnqEu92Fr1Mu7WxKOzY.woff2) format('woff2');
   unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
 }
 /* latin-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 400;
   src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v19/KFOmCnqEu92Fr1Mu7GxKOzY.woff2) format('woff2');
   unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
 }
 /* latin */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 400;
   src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v19/KFOmCnqEu92Fr1Mu4mxK.woff2) format('woff2');
   unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
 }
 /* cyrillic-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 500;
   src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmEU9fCRc4EsA.woff2) format('woff2');
   unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
 }
 /* cyrillic */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 500;
   src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmEU9fABc4EsA.woff2) format('woff2');
   unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
 }
 /* greek-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 500;
   src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmEU9fCBc4EsA.woff2) format('woff2');
   unicode-range: U+1F00-1FFF;
 }
 /* greek */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 500;
   src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmEU9fBxc4EsA.woff2) format('woff2');
   unicode-range: U+0370-03FF;
 }
 /* vietnamese */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 500;
   src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmEU9fCxc4EsA.woff2) format('woff2');
   unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
 }
 /* latin-ext */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 500;
   src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmEU9fChc4EsA.woff2) format('woff2');
   unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
 }
 /* latin */
 @font-face {
   font-family: 'Roboto';
   font-style: normal;
   font-weight: 500;
   src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v19/KFOlCnqEu92Fr1MmEU9fBBc4.woff2) format('woff2');
   unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
 }
 </style>
 <style media="" data-href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">/*!
  * Bootstrap v3.0.0
  *
  * Copyright 2013 Twitter, Inc
  * Licensed under the Apache License v2.0
  * http://www.apache.org/licenses/LICENSE-2.0
  *
  * Designed and built with all the love in the world @twitter by @mdo and @fat.
  */
 
 
 article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block;}
 audio,canvas,video{display:inline-block;}
 audio:not([controls]){display:none;height:0;}
 [hidden]{display:none;}
 html{font-family:sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;}
 body{margin:0;}
 a:focus{outline:thin dotted;}
 a:active,a:hover{outline:0;}
 h1{font-size:2em;margin:0.67em 0;}
 abbr[title]{border-bottom:1px dotted;}
 b,strong{font-weight:bold;}
 dfn{font-style:italic;}
 hr{-moz-box-sizing:content-box;box-sizing:content-box;height:0;}
 mark{background:#ff0;color:#000;}
 code,kbd,pre,samp{font-family:monospace, serif;font-size:1em;}
 pre{white-space:pre-wrap;}
 q{quotes:"\201C" "\201D" "\2018" "\2019";}
 small{font-size:80%;}
 sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline;}
 sup{top:-0.5em;}
 sub{bottom:-0.25em;}
 img{border:0;}
 svg:not(:root){overflow:hidden;}
 figure{margin:0;}
 fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:0.35em 0.625em 0.75em;}
 legend{border:0;padding:0;}
 button,input,select,textarea{font-family:inherit;font-size:100%;margin:0;}
 button,input{line-height:normal;}
 button,select{text-transform:none;}
 button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer;}
 button[disabled],html input[disabled]{cursor:default;}
 input[type="checkbox"],input[type="radio"]{box-sizing:border-box;padding:0;}
 input[type="search"]{-webkit-appearance:textfield;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;box-sizing:content-box;}
 input[type="search"]::-webkit-search-cancel-button,input[type="search"]::-webkit-search-decoration{-webkit-appearance:none;}
 button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0;}
 textarea{overflow:auto;vertical-align:top;}
 table{border-collapse:collapse;border-spacing:0;}
 *,*:before,*:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
 html{font-size:62.5%;-webkit-tap-highlight-color:rgba(0, 0, 0, 0);}
 body{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:1.428571429;color:#333333;background-color:#ffffff;}
 input,button,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit;}
 button,input,select[multiple],textarea{background-image:none;}
 a{color:#428bca;text-decoration:none;}a:hover,a:focus{color:#2a6496;text-decoration:underline;}
 a:focus{outline:thin dotted #333;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
 img{vertical-align:middle;}
 .img-responsive{display:block;max-width:100%;height:auto;}
 .img-rounded{border-radius:6px;}
 .img-thumbnail{padding:4px;line-height:1.428571429;background-color:#ffffff;border:1px solid #dddddd;border-radius:4px;-webkit-transition:all 0.2s ease-in-out;transition:all 0.2s ease-in-out;display:inline-block;max-width:100%;height:auto;}
 .img-circle{border-radius:50%;}
 hr{margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eeeeee;}
 .sr-only{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0 0 0 0);border:0;}
 @font-face{font-family:'Glyphicons Halflings';src:url("https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/../fonts/glyphicons-halflings-regular.eot");src:url("https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/../fonts/glyphicons-halflings-regular.eot?#iefix") format('embedded-opentype'),url("https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/../fonts/glyphicons-halflings-regular.woff") format('woff'),url("https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/../fonts/glyphicons-halflings-regular.ttf") format('truetype'),url("https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/../fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular") format('svg');}.glyphicon{position:relative;top:1px;display:inline-block;font-family:'Glyphicons Halflings';font-style:normal;font-weight:normal;line-height:1;-webkit-font-smoothing:antialiased;}
 .glyphicon-asterisk:before{content:"\2a";}
 .glyphicon-plus:before{content:"\2b";}
 .glyphicon-euro:before{content:"\20ac";}
 .glyphicon-minus:before{content:"\2212";}
 .glyphicon-cloud:before{content:"\2601";}
 .glyphicon-envelope:before{content:"\2709";}
 .glyphicon-pencil:before{content:"\270f";}
 .glyphicon-glass:before{content:"\e001";}
 .glyphicon-music:before{content:"\e002";}
 .glyphicon-search:before{content:"\e003";}
 .glyphicon-heart:before{content:"\e005";}
 .glyphicon-star:before{content:"\e006";}
 .glyphicon-star-empty:before{content:"\e007";}
 .glyphicon-user:before{content:"\e008";}
 .glyphicon-film:before{content:"\e009";}
 .glyphicon-th-large:before{content:"\e010";}
 .glyphicon-th:before{content:"\e011";}
 .glyphicon-th-list:before{content:"\e012";}
 .glyphicon-ok:before{content:"\e013";}
 .glyphicon-remove:before{content:"\e014";}
 .glyphicon-zoom-in:before{content:"\e015";}
 .glyphicon-zoom-out:before{content:"\e016";}
 .glyphicon-off:before{content:"\e017";}
 .glyphicon-signal:before{content:"\e018";}
 .glyphicon-cog:before{content:"\e019";}
 .glyphicon-trash:before{content:"\e020";}
 .glyphicon-home:before{content:"\e021";}
 .glyphicon-file:before{content:"\e022";}
 .glyphicon-time:before{content:"\e023";}
 .glyphicon-road:before{content:"\e024";}
 .glyphicon-download-alt:before{content:"\e025";}
 .glyphicon-download:before{content:"\e026";}
 .glyphicon-upload:before{content:"\e027";}
 .glyphicon-inbox:before{content:"\e028";}
 .glyphicon-play-circle:before{content:"\e029";}
 .glyphicon-repeat:before{content:"\e030";}
 .glyphicon-refresh:before{content:"\e031";}
 .glyphicon-list-alt:before{content:"\e032";}
 .glyphicon-flag:before{content:"\e034";}
 .glyphicon-headphones:before{content:"\e035";}
 .glyphicon-volume-off:before{content:"\e036";}
 .glyphicon-volume-down:before{content:"\e037";}
 .glyphicon-volume-up:before{content:"\e038";}
 .glyphicon-qrcode:before{content:"\e039";}
 .glyphicon-barcode:before{content:"\e040";}
 .glyphicon-tag:before{content:"\e041";}
 .glyphicon-tags:before{content:"\e042";}
 .glyphicon-book:before{content:"\e043";}
 .glyphicon-print:before{content:"\e045";}
 .glyphicon-font:before{content:"\e047";}
 .glyphicon-bold:before{content:"\e048";}
 .glyphicon-italic:before{content:"\e049";}
 .glyphicon-text-height:before{content:"\e050";}
 .glyphicon-text-width:before{content:"\e051";}
 .glyphicon-align-left:before{content:"\e052";}
 .glyphicon-align-center:before{content:"\e053";}
 .glyphicon-align-right:before{content:"\e054";}
 .glyphicon-align-justify:before{content:"\e055";}
 .glyphicon-list:before{content:"\e056";}
 .glyphicon-indent-left:before{content:"\e057";}
 .glyphicon-indent-right:before{content:"\e058";}
 .glyphicon-facetime-video:before{content:"\e059";}
 .glyphicon-picture:before{content:"\e060";}
 .glyphicon-map-marker:before{content:"\e062";}
 .glyphicon-adjust:before{content:"\e063";}
 .glyphicon-tint:before{content:"\e064";}
 .glyphicon-edit:before{content:"\e065";}
 .glyphicon-share:before{content:"\e066";}
 .glyphicon-check:before{content:"\e067";}
 .glyphicon-move:before{content:"\e068";}
 .glyphicon-step-backward:before{content:"\e069";}
 .glyphicon-fast-backward:before{content:"\e070";}
 .glyphicon-backward:before{content:"\e071";}
 .glyphicon-play:before{content:"\e072";}
 .glyphicon-pause:before{content:"\e073";}
 .glyphicon-stop:before{content:"\e074";}
 .glyphicon-forward:before{content:"\e075";}
 .glyphicon-fast-forward:before{content:"\e076";}
 .glyphicon-step-forward:before{content:"\e077";}
 .glyphicon-eject:before{content:"\e078";}
 .glyphicon-chevron-left:before{content:"\e079";}
 .glyphicon-chevron-right:before{content:"\e080";}
 .glyphicon-plus-sign:before{content:"\e081";}
 .glyphicon-minus-sign:before{content:"\e082";}
 .glyphicon-remove-sign:before{content:"\e083";}
 .glyphicon-ok-sign:before{content:"\e084";}
 .glyphicon-question-sign:before{content:"\e085";}
 .glyphicon-info-sign:before{content:"\e086";}
 .glyphicon-screenshot:before{content:"\e087";}
 .glyphicon-remove-circle:before{content:"\e088";}
 .glyphicon-ok-circle:before{content:"\e089";}
 .glyphicon-ban-circle:before{content:"\e090";}
 .glyphicon-arrow-left:before{content:"\e091";}
 .glyphicon-arrow-right:before{content:"\e092";}
 .glyphicon-arrow-up:before{content:"\e093";}
 .glyphicon-arrow-down:before{content:"\e094";}
 .glyphicon-share-alt:before{content:"\e095";}
 .glyphicon-resize-full:before{content:"\e096";}
 .glyphicon-resize-small:before{content:"\e097";}
 .glyphicon-exclamation-sign:before{content:"\e101";}
 .glyphicon-gift:before{content:"\e102";}
 .glyphicon-leaf:before{content:"\e103";}
 .glyphicon-eye-open:before{content:"\e105";}
 .glyphicon-eye-close:before{content:"\e106";}
 .glyphicon-warning-sign:before{content:"\e107";}
 .glyphicon-plane:before{content:"\e108";}
 .glyphicon-random:before{content:"\e110";}
 .glyphicon-comment:before{content:"\e111";}
 .glyphicon-magnet:before{content:"\e112";}
 .glyphicon-chevron-up:before{content:"\e113";}
 .glyphicon-chevron-down:before{content:"\e114";}
 .glyphicon-retweet:before{content:"\e115";}
 .glyphicon-shopping-cart:before{content:"\e116";}
 .glyphicon-folder-close:before{content:"\e117";}
 .glyphicon-folder-open:before{content:"\e118";}
 .glyphicon-resize-vertical:before{content:"\e119";}
 .glyphicon-resize-horizontal:before{content:"\e120";}
 .glyphicon-hdd:before{content:"\e121";}
 .glyphicon-bullhorn:before{content:"\e122";}
 .glyphicon-certificate:before{content:"\e124";}
 .glyphicon-thumbs-up:before{content:"\e125";}
 .glyphicon-thumbs-down:before{content:"\e126";}
 .glyphicon-hand-right:before{content:"\e127";}
 .glyphicon-hand-left:before{content:"\e128";}
 .glyphicon-hand-up:before{content:"\e129";}
 .glyphicon-hand-down:before{content:"\e130";}
 .glyphicon-circle-arrow-right:before{content:"\e131";}
 .glyphicon-circle-arrow-left:before{content:"\e132";}
 .glyphicon-circle-arrow-up:before{content:"\e133";}
 .glyphicon-circle-arrow-down:before{content:"\e134";}
 .glyphicon-globe:before{content:"\e135";}
 .glyphicon-tasks:before{content:"\e137";}
 .glyphicon-filter:before{content:"\e138";}
 .glyphicon-fullscreen:before{content:"\e140";}
 .glyphicon-dashboard:before{content:"\e141";}
 .glyphicon-heart-empty:before{content:"\e143";}
 .glyphicon-link:before{content:"\e144";}
 .glyphicon-phone:before{content:"\e145";}
 .glyphicon-usd:before{content:"\e148";}
 .glyphicon-gbp:before{content:"\e149";}
 .glyphicon-sort:before{content:"\e150";}
 .glyphicon-sort-by-alphabet:before{content:"\e151";}
 .glyphicon-sort-by-alphabet-alt:before{content:"\e152";}
 .glyphicon-sort-by-order:before{content:"\e153";}
 .glyphicon-sort-by-order-alt:before{content:"\e154";}
 .glyphicon-sort-by-attributes:before{content:"\e155";}
 .glyphicon-sort-by-attributes-alt:before{content:"\e156";}
 .glyphicon-unchecked:before{content:"\e157";}
 .glyphicon-expand:before{content:"\e158";}
 .glyphicon-collapse-down:before{content:"\e159";}
 .glyphicon-collapse-up:before{content:"\e160";}
 .glyphicon-log-in:before{content:"\e161";}
 .glyphicon-flash:before{content:"\e162";}
 .glyphicon-log-out:before{content:"\e163";}
 .glyphicon-new-window:before{content:"\e164";}
 .glyphicon-record:before{content:"\e165";}
 .glyphicon-save:before{content:"\e166";}
 .glyphicon-open:before{content:"\e167";}
 .glyphicon-saved:before{content:"\e168";}
 .glyphicon-import:before{content:"\e169";}
 .glyphicon-export:before{content:"\e170";}
 .glyphicon-send:before{content:"\e171";}
 .glyphicon-floppy-disk:before{content:"\e172";}
 .glyphicon-floppy-saved:before{content:"\e173";}
 .glyphicon-floppy-remove:before{content:"\e174";}
 .glyphicon-floppy-save:before{content:"\e175";}
 .glyphicon-floppy-open:before{content:"\e176";}
 .glyphicon-credit-card:before{content:"\e177";}
 .glyphicon-transfer:before{content:"\e178";}
 .glyphicon-cutlery:before{content:"\e179";}
 .glyphicon-header:before{content:"\e180";}
 .glyphicon-compressed:before{content:"\e181";}
 .glyphicon-earphone:before{content:"\e182";}
 .glyphicon-phone-alt:before{content:"\e183";}
 .glyphicon-tower:before{content:"\e184";}
 .glyphicon-stats:before{content:"\e185";}
 .glyphicon-sd-video:before{content:"\e186";}
 .glyphicon-hd-video:before{content:"\e187";}
 .glyphicon-subtitles:before{content:"\e188";}
 .glyphicon-sound-stereo:before{content:"\e189";}
 .glyphicon-sound-dolby:before{content:"\e190";}
 .glyphicon-sound-5-1:before{content:"\e191";}
 .glyphicon-sound-6-1:before{content:"\e192";}
 .glyphicon-sound-7-1:before{content:"\e193";}
 .glyphicon-copyright-mark:before{content:"\e194";}
 .glyphicon-registration-mark:before{content:"\e195";}
 .glyphicon-cloud-download:before{content:"\e197";}
 .glyphicon-cloud-upload:before{content:"\e198";}
 .glyphicon-tree-conifer:before{content:"\e199";}
 .glyphicon-tree-deciduous:before{content:"\e200";}
 .glyphicon-briefcase:before{content:"\1f4bc";}
 .glyphicon-calendar:before{content:"\1f4c5";}
 .glyphicon-pushpin:before{content:"\1f4cc";}
 .glyphicon-paperclip:before{content:"\1f4ce";}
 .glyphicon-camera:before{content:"\1f4f7";}
 .glyphicon-lock:before{content:"\1f512";}
 .glyphicon-bell:before{content:"\1f514";}
 .glyphicon-bookmark:before{content:"\1f516";}
 .glyphicon-fire:before{content:"\1f525";}
 .glyphicon-wrench:before{content:"\1f527";}
 </style>
 <style media="" data-href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}table{border-collapse:collapse;border-spacing:0}</style><script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
 <link rel="stylesheet" href="css/main_style.css" class="cp-pen-styles">
 </head>
 <body>
 <aside id="sidebar" class="nano has-scrollbar">
   <div class="nano-content" tabindex="0" style="right: -17px;">
     <div class="logo-container"><span class="logo glyphicon glyphicon-envelope">
     </span>Mail</div>
     <a class="compose-button">Compose</a>
     <menu class="menu-segment">
     <form method="post" action="<%String uri = request.getRequestURI();%><%=uri.substring(uri.lastIndexOf("/")+1)%>" id="select_email_accounts">
		<ul>
		  <!--
		<li class="active"><a href="#">Inbox<span> (43)</span></a></li>
		<li><a href="#">Important</a></li>
		<li><a href="#">Sent</a></li>
		<li><a href="#">Drafts</a></li>
		<li><a href="#">Trash</a></li>
		-->
		<%
			String[] selected_accounts_values = request.getParameterValues("selected_accounts");
			HashSet<String> email_accounts = new HashSet<>(
					Arrays.asList((selected_accounts_values == null ? new String[0] : selected_accounts_values))
					);
			ArrayList<EmailAccount> accounts = (ArrayList<EmailAccount>)session.getAttribute("contasE");
			
			if (accounts == null)
				accounts = new ArrayList<EmailAccount>();
			
			for (int i = 0; i < accounts.size(); i++) {
				EmailAccount account = accounts.get(i);
				String active = "";
				String checked = "";
				if (email_accounts.contains(account.getEmail())) {
					checked = "checked";
					active = " active";
				}
					
				%>
			<li class="email-account<%=active%>">
			  	<div class="checkbox-wrapper">
			  		<input type="checkbox" name="selected_accounts" id="<%=i%>c" value="<%=account.getEmail()%>" <%=checked%>>
			  		<label for="<%=i%>c" class="toggle">
			  		</label>
			  	</div><span><%=account.getEmail()%></span>
			</li>
				<%
			}
		%>
		  <!--  <li class="email-account">
		  	<div class="checkbox-wrapper">
		  		<input type="checkbox" name="selected_accounts" id="1c" value="jose.ferreira@gmail.com">
		  		<label for="1c" class="toggle">
		  		</label>
		  	</div><span>jose.ferreira@gmail.com</span>
		  </li> -->
		</ul>
		<a class="compose-button" onclick="$('form#select_email_accounts').submit()">View</a>
       </form>
     </menu>
     <div class="separator"></div>
     <div class="menu-segment">
       <ul class="labels">
         <li class="title">Labels <span class="icon">+</span></li>
         <li><a href="#">Dribbble <span class="ball pink"></span></a></li>
         <li><a href="#">Roommates <span class="ball green"></span></a></li>
         <li><a href="#">Bills <span class="ball blue"></span></a></li>
       </ul>
     </div>
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
   <div class="action-bar">
     <ul>
       <li><a class="icon circle-icon glyphicon glyphicon-chevron-down"></a></li>
       <li><a class="icon circle-icon glyphicon glyphicon-refresh"></a></li>
       <li><a class="icon circle-icon glyphicon glyphicon-share-alt"></a></li>
       <li><a class="icon circle-icon red glyphicon glyphicon-remove"></a></li>
       <li><a class="icon circle-icon red glyphicon glyphicon-flag"></a></li>
     </ul>
   </div>
   <div id="main-nano-wrapper" class="nano has-scrollbar">
     <div class="nano-content" tabindex="0" style="right: -17px;">
       <ul class="message-list">
       </ul><a href="#" class="load-more-link">Show more messages</a>
     </div>
   <div class="nano-pane"><div class="nano-slider" style="height: 20px; transform: translate(0px, 0px);"></div></div></div>
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
           <div class="tool-box"><a href="#" class="circle-icon small glyphicon glyphicon-share-alt"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove"></a><a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag"></a></div>
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
         <script id="rendered-js">
           
           var cols, messageIsOpen;
 jQuery(document).ready(function ($) {
 
   cols = {},
 
   messageIsOpen = false;
 
   cols.showOverlay = function () {
     $('body').addClass('show-main-overlay');
   };
   cols.hideOverlay = function () {
     $('body').removeClass('show-main-overlay');
   };
 
 
   cols.showMessage = function () {
     $('body').addClass('show-message');
     messageIsOpen = true;
   };
   cols.hideMessage = function () {
     $('body').removeClass('show-message');
     $('#main .message-list li').removeClass('active');
     messageIsOpen = false;
   };
 
 
   cols.showSidebar = function () {
     $('body').addClass('show-sidebar');
   };
   cols.hideSidebar = function () {
     $('body').removeClass('show-sidebar');
   };
 
 
   // Show sidebar when trigger is clicked
 
   $('.trigger-toggle-sidebar').on('click', function () {
     cols.showSidebar();
     cols.showOverlay();
   });
 
 
   $('.trigger-message-close').on('click', function () {
     cols.hideMessage();
     cols.hideOverlay();
   });
 
 
   // When you click on a message, show it
 
   $('#main .message-list li').on('click', function (e) {
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
   });
 
 
   // This will prevent click from triggering twice when clicking checkbox/label
 
   $('input[type=checkbox]').on('click', function (e) {
     e.stopImmediatePropagation();
   });
 
 
 
   // When you click the overlay, close everything
 
   $('#main > .overlay').on('click', function () {
     cols.hideOverlay();
     cols.hideMessage();
     cols.hideSidebar();
   });
 
 
 
   // Enable sexy scrollbars
   $('.nano').nanoScroller();
 
 
 
   // Disable links
 
   $('a').on('click', function (e) {
     e.preventDefault();
   });
 
 
 
   // Search box responsive stuff
 
   $('.search-box input').on('focus', function () {
     if ($(window).width() <= 1360) {
       cols.hideMessage();
     }
   });
 });
 
 

 
 /*! nanoScrollerJS - v0.8.0 - 2014
     * https://jamesflorentino.github.com/nanoScrollerJS/
     * Copyright (c) 2014 James Florentino; Licensed MIT */
 (function ($, window, document) {
   "use strict";
   var BROWSER_IS_IE7, BROWSER_SCROLLBAR_WIDTH, DOMSCROLL, DOWN, DRAG, KEYDOWN, KEYUP, MOUSEDOWN, MOUSEMOVE, MOUSEUP, MOUSEWHEEL, NanoScroll, PANEDOWN, RESIZE, SCROLL, SCROLLBAR, TOUCHMOVE, UP, WHEEL, cAF, defaults, getBrowserScrollbarWidth, hasTransform, isFFWithBuggyScrollbar, rAF, transform, _elementStyle, _prefixStyle, _vendor;
   defaults = {
 
     /**
                  a classname for the pane element.
                  @property paneClass
                  @type String
                  @default 'nano-pane'
                 */
     paneClass: 'nano-pane',
 
     /**
                               a classname for the slider element.
                               @property sliderClass
                               @type String
                               @default 'nano-slider'
                              */
     sliderClass: 'nano-slider',
 
     /**
                                   a classname for the content element.
                                   @property contentClass
                                   @type String
                                   @default 'nano-content'
                                  */
     contentClass: 'nano-content',
 
     /**
                                     a setting to enable native scrolling in iOS devices.
                                     @property iOSNativeScrolling
                                     @type Boolean
                                     @default false
                                    */
     iOSNativeScrolling: false,
 
     /**
                                  a setting to prevent the rest of the page being
                                  scrolled when user scrolls the `.content` element.
                                  @property preventPageScrolling
                                  @type Boolean
                                  @default false
                                 */
     preventPageScrolling: false,
 
     /**
                                    a setting to disable binding to the resize event.
                                    @property disableResize
                                    @type Boolean
                                    @default false
                                   */
     disableResize: false,
 
     /**
                             a setting to make the scrollbar always visible.
                             @property alwaysVisible
                             @type Boolean
                             @default false
                            */
     alwaysVisible: false,
 
     /**
                             a default timeout for the `flash()` method.
                             @property flashDelay
                             @type Number
                             @default 1500
                            */
     flashDelay: 1500,
 
     /**
                         a minimum height for the `.slider` element.
                         @property sliderMinHeight
                         @type Number
                         @default 20
                        */
     sliderMinHeight: 20,
 
     /**
                            a maximum height for the `.slider` element.
                            @property sliderMaxHeight
                            @type Number
                            @default null
                           */
     sliderMaxHeight: null,
 
     /**
                              an alternate document context.
                              @property documentContext
                              @type Document
                              @default null
                             */
     documentContext: null,
 
     /**
                              an alternate window context.
                              @property windowContext
                              @type Window
                              @default null
                             */
     windowContext: null };
 
 
   /**
                              @property SCROLLBAR
                              @type String
                              @static
                              @final
                              @private
                             */
   SCROLLBAR = 'scrollbar';
 
   /**
                              @property SCROLL
                              @type String
                              @static
                              @final
                              @private
                             */
   SCROLL = 'scroll';
 
   /**
                        @property MOUSEDOWN
                        @type String
                        @final
                        @private
                       */
   MOUSEDOWN = 'mousedown';
 
   /**
                              @property MOUSEMOVE
                              @type String
                              @static
                              @final
                              @private
                             */
   MOUSEMOVE = 'mousemove';
 
   /**
                              @property MOUSEWHEEL
                              @type String
                              @final
                              @private
                             */
   MOUSEWHEEL = 'mousewheel';
 
   /**
                                @property MOUSEUP
                                @type String
                                @static
                                @final
                                @private
                               */
   MOUSEUP = 'mouseup';
 
   /**
                          @property RESIZE
                          @type String
                          @final
                          @private
                         */
   RESIZE = 'resize';
 
   /**
                        @property DRAG
                        @type String
                        @static
                        @final
                        @private
                       */
   DRAG = 'drag';
 
   /**
                    @property UP
                    @type String
                    @static
                    @final
                    @private
                   */
   UP = 'up';
 
   /**
                @property PANEDOWN
                @type String
                @static
                @final
                @private
               */
   PANEDOWN = 'panedown';
 
   /**
                            @property DOMSCROLL
                            @type String
                            @static
                            @final
                            @private
                           */
   DOMSCROLL = 'DOMMouseScroll';
 
   /**
                                   @property DOWN
                                   @type String
                                   @static
                                   @final
                                   @private
                                  */
   DOWN = 'down';
 
   /**
                    @property WHEEL
                    @type String
                    @static
                    @final
                    @private
                   */
   WHEEL = 'wheel';
 
   /**
                      @property KEYDOWN
                      @type String
                      @static
                      @final
                      @private
                     */
   KEYDOWN = 'keydown';
 
   /**
                          @property KEYUP
                          @type String
                          @static
                          @final
                          @private
                         */
   KEYUP = 'keyup';
 
   /**
                      @property TOUCHMOVE
                      @type String
                      @static
                      @final
                      @private
                     */
   TOUCHMOVE = 'touchmove';
 
   /**
                              @property BROWSER_IS_IE7
                              @type Boolean
                              @static
                              @final
                              @private
                             */
   BROWSER_IS_IE7 = window.navigator.appName === 'Microsoft Internet Explorer' && /msie 7./i.test(window.navigator.appVersion) && window.ActiveXObject;
 
   /**
                                                                                                                                                          @property BROWSER_SCROLLBAR_WIDTH
                                                                                                                                                          @type Number
                                                                                                                                                          @static
                                                                                                                                                          @default null
                                                                                                                                                          @private
                                                                                                                                                         */
   BROWSER_SCROLLBAR_WIDTH = null;
   rAF = window.requestAnimationFrame;
   cAF = window.cancelAnimationFrame;
   _elementStyle = document.createElement('div').style;
   _vendor = function () {
     var i, transform, vendor, vendors, _i, _len;
     vendors = ['t', 'webkitT', 'MozT', 'msT', 'OT'];
     for (i = _i = 0, _len = vendors.length; _i < _len; i = ++_i) {
       vendor = vendors[i];
       transform = vendors[i] + 'ransform';
       if (transform in _elementStyle) {
         return vendors[i].substr(0, vendors[i].length - 1);
       }
     }
     return false;
   }();
   _prefixStyle = function (style) {
     if (_vendor === false) {
       return false;
     }
     if (_vendor === '') {
       return style;
     }
     return _vendor + style.charAt(0).toUpperCase() + style.substr(1);
   };
   transform = _prefixStyle('transform');
   hasTransform = transform !== false;
 
   /**
                                         Returns browser's native scrollbar width
                                         @method getBrowserScrollbarWidth
                                         @return {Number} the scrollbar width in pixels
                                         @static
                                         @private
                                        */
   getBrowserScrollbarWidth = function () {
     var outer, outerStyle, scrollbarWidth;
     outer = document.createElement('div');
     outerStyle = outer.style;
     outerStyle.position = 'absolute';
     outerStyle.width = '100px';
     outerStyle.height = '100px';
     outerStyle.overflow = SCROLL;
     outerStyle.top = '-9999px';
     document.body.appendChild(outer);
     scrollbarWidth = outer.offsetWidth - outer.clientWidth;
     document.body.removeChild(outer);
     return scrollbarWidth;
   };
   isFFWithBuggyScrollbar = function () {
     var isOSXFF, ua, version;
     ua = window.navigator.userAgent;
     isOSXFF = /(?=.+Mac OS X)(?=.+Firefox)/.test(ua);
     if (!isOSXFF) {
       return false;
     }
     version = /Firefox\/\d{2}\./.exec(ua);
     if (version) {
       version = version[0].replace(/\D+/g, '');
     }
     return isOSXFF && +version > 23;
   };
 
   /**
        @class NanoScroll
        @param element {HTMLElement|Node} the main element
        @param options {Object} nanoScroller's options
        @constructor
       */
   NanoScroll = function () {
     function NanoScroll(el, options) {
       this.el = el;
       this.options = options;
       BROWSER_SCROLLBAR_WIDTH || (BROWSER_SCROLLBAR_WIDTH = getBrowserScrollbarWidth());
       this.$el = $(this.el);
       this.doc = $(this.options.documentContext || document);
       this.win = $(this.options.windowContext || window);
       this.$content = this.$el.children("." + options.contentClass);
       this.$content.attr('tabindex', this.options.tabIndex || 0);
       this.content = this.$content[0];
       if (this.options.iOSNativeScrolling && this.el.style.WebkitOverflowScrolling != null) {
         this.nativeScrolling();
       } else {
         this.generate();
       }
       this.createEvents();
       this.addEvents();
       this.reset();
     }
 
 
     /**
         Prevents the rest of the page being scrolled
         when user scrolls the `.nano-content` element.
         @method preventScrolling
         @param event {Event}
         @param direction {String} Scroll direction (up or down)
         @private
        */
 
     NanoScroll.prototype.preventScrolling = function (e, direction) {
       if (!this.isActive) {
         return;
       }
       if (e.type === DOMSCROLL) {
         if (direction === DOWN && e.originalEvent.detail > 0 || direction === UP && e.originalEvent.detail < 0) {
           e.preventDefault();
         }
       } else if (e.type === MOUSEWHEEL) {
         if (!e.originalEvent || !e.originalEvent.wheelDelta) {
           return;
         }
         if (direction === DOWN && e.originalEvent.wheelDelta < 0 || direction === UP && e.originalEvent.wheelDelta > 0) {
           e.preventDefault();
         }
       }
     };
 
 
     /**
          Enable iOS native scrolling
          @method nativeScrolling
          @private
         */
 
     NanoScroll.prototype.nativeScrolling = function () {
       this.$content.css({
         WebkitOverflowScrolling: 'touch' });
 
       this.iOSNativeScrolling = true;
       this.isActive = true;
     };
 
 
     /**
          Updates those nanoScroller properties that
          are related to current scrollbar position.
          @method updateScrollValues
          @private
         */
 
     NanoScroll.prototype.updateScrollValues = function () {
       var content;
       content = this.content;
       this.maxScrollTop = content.scrollHeight - content.clientHeight;
       this.prevScrollTop = this.contentScrollTop || 0;
       this.contentScrollTop = content.scrollTop;
       if (!this.iOSNativeScrolling) {
         this.maxSliderTop = this.paneHeight - this.sliderHeight;
         this.sliderTop = this.maxScrollTop === 0 ? 0 : this.contentScrollTop * this.maxSliderTop / this.maxScrollTop;
       }
     };
 
 
     /**
          Updates CSS styles for current scroll position.
          Uses CSS 2d transfroms and `window.requestAnimationFrame` if available.
          @method setOnScrollStyles
          @private
         */
 
     NanoScroll.prototype.setOnScrollStyles = function () {
       var cssValue;
       if (hasTransform) {
         cssValue = {};
         cssValue[transform] = "translate(0, " + this.sliderTop + "px)";
       } else {
         cssValue = {
           top: this.sliderTop };
 
       }
       if (rAF) {
         if (!this.scrollRAF) {
           this.scrollRAF = rAF(function (_this) {
             return function () {
               _this.scrollRAF = null;
               _this.slider.css(cssValue);
             };
           }(this));
         }
       } else {
         this.slider.css(cssValue);
       }
     };
 
 
     /**
          Creates event related methods
          @method createEvents
          @private
         */
 
     NanoScroll.prototype.createEvents = function () {
       this.events = {
         down: function (_this) {
           return function (e) {
             _this.isBeingDragged = true;
             _this.offsetY = e.pageY - _this.slider.offset().top;
             _this.pane.addClass('active');
             _this.doc.bind(MOUSEMOVE, _this.events[DRAG]).bind(MOUSEUP, _this.events[UP]);
             return false;
           };
         }(this),
         drag: function (_this) {
           return function (e) {
             _this.sliderY = e.pageY - _this.$el.offset().top - _this.offsetY;
             _this.scroll();
             if (_this.contentScrollTop >= _this.maxScrollTop && _this.prevScrollTop !== _this.maxScrollTop) {
               _this.$el.trigger('scrollend');
             } else if (_this.contentScrollTop === 0 && _this.prevScrollTop !== 0) {
               _this.$el.trigger('scrolltop');
             }
             return false;
           };
         }(this),
         up: function (_this) {
           return function (e) {
             _this.isBeingDragged = false;
             _this.pane.removeClass('active');
             _this.doc.unbind(MOUSEMOVE, _this.events[DRAG]).unbind(MOUSEUP, _this.events[UP]);
             return false;
           };
         }(this),
         resize: function (_this) {
           return function (e) {
             _this.reset();
           };
         }(this),
         panedown: function (_this) {
           return function (e) {
             _this.sliderY = (e.offsetY || e.originalEvent.layerY) - _this.sliderHeight * 0.5;
             _this.scroll();
             _this.events.down(e);
             return false;
           };
         }(this),
         scroll: function (_this) {
           return function (e) {
             _this.updateScrollValues();
             if (_this.isBeingDragged) {
               return;
             }
             if (!_this.iOSNativeScrolling) {
               _this.sliderY = _this.sliderTop;
               _this.setOnScrollStyles();
             }
             if (e == null) {
               return;
             }
             if (_this.contentScrollTop >= _this.maxScrollTop) {
               if (_this.options.preventPageScrolling) {
                 _this.preventScrolling(e, DOWN);
               }
               if (_this.prevScrollTop !== _this.maxScrollTop) {
                 _this.$el.trigger('scrollend');
               }
             } else if (_this.contentScrollTop === 0) {
               if (_this.options.preventPageScrolling) {
                 _this.preventScrolling(e, UP);
               }
               if (_this.prevScrollTop !== 0) {
                 _this.$el.trigger('scrolltop');
               }
             }
           };
         }(this),
         wheel: function (_this) {
           return function (e) {
             var delta;
             if (e == null) {
               return;
             }
             delta = e.delta || e.wheelDelta || e.originalEvent && e.originalEvent.wheelDelta || -e.detail || e.originalEvent && -e.originalEvent.detail;
             if (delta) {
               _this.sliderY += -delta / 3;
             }
             _this.scroll();
             return false;
           };
         }(this) };
 
     };
 
 
     /**
          Adds event listeners with jQuery.
          @method addEvents
          @private
         */
 
     NanoScroll.prototype.addEvents = function () {
       var events;
       this.removeEvents();
       events = this.events;
       if (!this.options.disableResize) {
         this.win.bind(RESIZE, events[RESIZE]);
       }
       if (!this.iOSNativeScrolling) {
         this.slider.bind(MOUSEDOWN, events[DOWN]);
         this.pane.bind(MOUSEDOWN, events[PANEDOWN]).bind("" + MOUSEWHEEL + " " + DOMSCROLL, events[WHEEL]);
       }
       this.$content.bind("" + SCROLL + " " + MOUSEWHEEL + " " + DOMSCROLL + " " + TOUCHMOVE, events[SCROLL]);
     };
 
 
     /**
          Removes event listeners with jQuery.
          @method removeEvents
          @private
         */
 
     NanoScroll.prototype.removeEvents = function () {
       var events;
       events = this.events;
       this.win.unbind(RESIZE, events[RESIZE]);
       if (!this.iOSNativeScrolling) {
         this.slider.unbind();
         this.pane.unbind();
       }
       this.$content.unbind("" + SCROLL + " " + MOUSEWHEEL + " " + DOMSCROLL + " " + TOUCHMOVE, events[SCROLL]);
     };
 
 
     /**
          Generates nanoScroller's scrollbar and elements for it.
          @method generate
          @chainable
          @private
         */
 
     NanoScroll.prototype.generate = function () {
       var contentClass, cssRule, currentPadding, options, paneClass, sliderClass;
       options = this.options;
       paneClass = options.paneClass, sliderClass = options.sliderClass, contentClass = options.contentClass;
       if (!this.$el.find("." + paneClass).length && !this.$el.find("." + sliderClass).length) {
         this.$el.append("<div class=\"" + paneClass + "\"><div class=\"" + sliderClass + "\" /></div>");
       }
       this.pane = this.$el.children("." + paneClass);
       this.slider = this.pane.find("." + sliderClass);
       if (BROWSER_SCROLLBAR_WIDTH === 0 && isFFWithBuggyScrollbar()) {
         currentPadding = window.getComputedStyle(this.content, null).getPropertyValue('padding-right').replace(/\D+/g, '');
         cssRule = {
           right: -14,
           paddingRight: +currentPadding + 14 };
 
       } else if (BROWSER_SCROLLBAR_WIDTH) {
         cssRule = {
           right: -BROWSER_SCROLLBAR_WIDTH };
 
         this.$el.addClass('has-scrollbar');
       }
       if (cssRule != null) {
         this.$content.css(cssRule);
       }
       return this;
     };
 
 
     /**
          @method restore
          @private
         */
 
     NanoScroll.prototype.restore = function () {
       this.stopped = false;
       if (!this.iOSNativeScrolling) {
         this.pane.show();
       }
       this.addEvents();
     };
 
 
     /**
          Resets nanoScroller's scrollbar.
          @method reset
          @chainable
          @example
              $(".nano").nanoScroller();
         */
 
     NanoScroll.prototype.reset = function () {
       var content, contentHeight, contentPosition, contentStyle, contentStyleOverflowY, paneBottom, paneHeight, paneOuterHeight, paneTop, parentMaxHeight, right, sliderHeight;
       if (this.iOSNativeScrolling) {
         this.contentHeight = this.content.scrollHeight;
         return;
       }
       if (!this.$el.find("." + this.options.paneClass).length) {
         this.generate().stop();
       }
       if (this.stopped) {
         this.restore();
       }
       content = this.content;
       contentStyle = content.style;
       contentStyleOverflowY = contentStyle.overflowY;
       if (BROWSER_IS_IE7) {
         this.$content.css({
           height: this.$content.height() });
 
       }
       contentHeight = content.scrollHeight + BROWSER_SCROLLBAR_WIDTH;
       parentMaxHeight = parseInt(this.$el.css("max-height"), 10);
       if (parentMaxHeight > 0) {
         this.$el.height("");
         this.$el.height(content.scrollHeight > parentMaxHeight ? parentMaxHeight : content.scrollHeight);
       }
       paneHeight = this.pane.outerHeight(false);
       paneTop = parseInt(this.pane.css('top'), 10);
       paneBottom = parseInt(this.pane.css('bottom'), 10);
       paneOuterHeight = paneHeight + paneTop + paneBottom;
       sliderHeight = Math.round(paneOuterHeight / contentHeight * paneOuterHeight);
       if (sliderHeight < this.options.sliderMinHeight) {
         sliderHeight = this.options.sliderMinHeight;
       } else if (this.options.sliderMaxHeight != null && sliderHeight > this.options.sliderMaxHeight) {
         sliderHeight = this.options.sliderMaxHeight;
       }
       if (contentStyleOverflowY === SCROLL && contentStyle.overflowX !== SCROLL) {
         sliderHeight += BROWSER_SCROLLBAR_WIDTH;
       }
       this.maxSliderTop = paneOuterHeight - sliderHeight;
       this.contentHeight = contentHeight;
       this.paneHeight = paneHeight;
       this.paneOuterHeight = paneOuterHeight;
       this.sliderHeight = sliderHeight;
       this.slider.height(sliderHeight);
       this.events.scroll();
       this.pane.show();
       this.isActive = true;
       if (content.scrollHeight === content.clientHeight || this.pane.outerHeight(true) >= content.scrollHeight && contentStyleOverflowY !== SCROLL) {
         this.pane.hide();
         this.isActive = false;
       } else if (this.el.clientHeight === content.scrollHeight && contentStyleOverflowY === SCROLL) {
         this.slider.hide();
       } else {
         this.slider.show();
       }
       this.pane.css({
         opacity: this.options.alwaysVisible ? 1 : '',
         visibility: this.options.alwaysVisible ? 'visible' : '' });
 
       contentPosition = this.$content.css('position');
       if (contentPosition === 'static' || contentPosition === 'relative') {
         right = parseInt(this.$content.css('right'), 10);
         if (right) {
           this.$content.css({
             right: '',
             marginRight: right });
 
         }
       }
       return this;
     };
 
 
     /**
          @method scroll
          @private
          @example
              $(".nano").nanoScroller({ scroll: 'top' });
         */
 
     NanoScroll.prototype.scroll = function () {
       if (!this.isActive) {
         return;
       }
       this.sliderY = Math.max(0, this.sliderY);
       this.sliderY = Math.min(this.maxSliderTop, this.sliderY);
       this.$content.scrollTop((this.paneHeight - this.contentHeight + BROWSER_SCROLLBAR_WIDTH) * this.sliderY / this.maxSliderTop * -1);
       if (!this.iOSNativeScrolling) {
         this.updateScrollValues();
         this.setOnScrollStyles();
       }
       return this;
     };
 
 
     /**
          Scroll at the bottom with an offset value
          @method scrollBottom
          @param offsetY {Number}
          @chainable
          @example
              $(".nano").nanoScroller({ scrollBottom: value });
         */
 
     NanoScroll.prototype.scrollBottom = function (offsetY) {
       if (!this.isActive) {
         return;
       }
       this.$content.scrollTop(this.contentHeight - this.$content.height() - offsetY).trigger(MOUSEWHEEL);
       this.stop().restore();
       return this;
     };
 
 
     /**
          Scroll at the top with an offset value
          @method scrollTop
          @param offsetY {Number}
          @chainable
          @example
              $(".nano").nanoScroller({ scrollTop: value });
         */
 
     NanoScroll.prototype.scrollTop = function (offsetY) {
       if (!this.isActive) {
         return;
       }
       this.$content.scrollTop(+offsetY).trigger(MOUSEWHEEL);
       this.stop().restore();
       return this;
     };
 
 
     /**
          Scroll to an element
          @method scrollTo
          @param node {Node} A node to scroll to.
          @chainable
          @example
              $(".nano").nanoScroller({ scrollTo: $('#a_node') });
         */
 
     NanoScroll.prototype.scrollTo = function (node) {
       if (!this.isActive) {
         return;
       }
       this.scrollTop(this.$el.find(node).get(0).offsetTop);
       return this;
     };
 
 
     /**
          To stop the operation.
          This option will tell the plugin to disable all event bindings and hide the gadget scrollbar from the UI.
          @method stop
          @chainable
          @example
              $(".nano").nanoScroller({ stop: true });
         */
 
     NanoScroll.prototype.stop = function () {
       if (cAF && this.scrollRAF) {
         cAF(this.scrollRAF);
         this.scrollRAF = null;
       }
       this.stopped = true;
       this.removeEvents();
       if (!this.iOSNativeScrolling) {
         this.pane.hide();
       }
       return this;
     };
 
 
     /**
          Destroys nanoScroller and restores browser's native scrollbar.
          @method destroy
          @chainable
          @example
              $(".nano").nanoScroller({ destroy: true });
         */
 
     NanoScroll.prototype.destroy = function () {
       if (!this.stopped) {
         this.stop();
       }
       if (!this.iOSNativeScrolling && this.pane.length) {
         this.pane.remove();
       }
       if (BROWSER_IS_IE7) {
         this.$content.height('');
       }
       this.$content.removeAttr('tabindex');
       if (this.$el.hasClass('has-scrollbar')) {
         this.$el.removeClass('has-scrollbar');
         this.$content.css({
           right: '' });
 
       }
       return this;
     };
 
 
     /**
          To flash the scrollbar gadget for an amount of time defined in plugin settings (defaults to 1,5s).
          Useful if you want to show the user (e.g. on pageload) that there is more content waiting for him.
          @method flash
          @chainable
          @example
              $(".nano").nanoScroller({ flash: true });
         */
 
     NanoScroll.prototype.flash = function () {
       if (this.iOSNativeScrolling) {
         return;
       }
       if (!this.isActive) {
         return;
       }
       this.reset();
       this.pane.addClass('flashed');
       setTimeout(function (_this) {
         return function () {
           _this.pane.removeClass('flashed');
         };
       }(this), this.options.flashDelay);
       return this;
     };
 
     return NanoScroll;
 
   }();
   $.fn.nanoScroller = function (settings) {
     return this.each(function () {
       var options, scrollbar;
       if (!(scrollbar = this.nanoscroller)) {
         options = $.extend({}, defaults, settings);
         this.nanoscroller = scrollbar = new NanoScroll(this, options);
       }
       if (settings && typeof settings === "object") {
         $.extend(scrollbar.options, settings);
         if (settings.scrollBottom != null) {
           return scrollbar.scrollBottom(settings.scrollBottom);
         }
         if (settings.scrollTop != null) {
           return scrollbar.scrollTop(settings.scrollTop);
         }
         if (settings.scrollTo) {
           return scrollbar.scrollTo(settings.scrollTo);
         }
         if (settings.scroll === 'bottom') {
           return scrollbar.scrollBottom(0);
         }
         if (settings.scroll === 'top') {
           return scrollbar.scrollTop(0);
         }
         if (settings.scroll && settings.scroll instanceof $) {
           return scrollbar.scrollTo(settings.scroll);
         }
         if (settings.stop) {
           return scrollbar.stop();
         }
         if (settings.destroy) {
           return scrollbar.destroy();
         }
         if (settings.flash) {
           return scrollbar.flash();
         }
       }
       return scrollbar.reset();
     });
   };
   $.fn.nanoScroller.Constructor = NanoScroll;

 })(jQuery, window, document);
           //# sourceURL=pen.js
         </script>
   <script src="script/linkify.min.js">
   </script>
   <script src="script/linkify-string.js">
   </script>
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
          id + "'><label for=\"" + id + "\" class=\"toggle\"></label></div><p class=\"title\">" +
              sender + "</p><span class=\"star-toggle glyphicon glyphicon-star-empty\"></span></div>" +
            "<div class=\"col col-2\">" +
              "<div class=\"subject\">" + subject + "<span class=\"teaser\"> &nbsp;â&nbsp; " + body + "</span></div>" +
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
    	<%
    	for(String login : email_accounts)
    	{
    		
    		EmailAccount contaE = EmailAccounts.getEmailAccountByEmail(login);
    		
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
    					  f.open(Folder.READ_ONLY);
    					  Message[] messages = f.getMessages();
    					  
    					  for (int i = 0; i < messages.length; i++) {
    						Message message = messages[i];
    						String senders = "";
    						Address[] addresses = message.getFrom();
    					  
    						if (addresses.length > 0) {
    							senders += addresses[0].toString();
    							for (int j = 1; j < addresses.length; j++) {
    								senders += "; " + addresses[i].toString();  
    							}
    						}
    						
    						String recipients = "";
    						addresses = message.getAllRecipients();
    					  
    						if (addresses.length > 0) {
    							recipients += addresses[0].toString();
    							for (int j = 1; j < addresses.length; j++) {
    								recipients += "; " + addresses[i].toString();  
    							}
    						}
    						
    						Date sent_date = message.getSentDate();
    						SimpleDateFormat time_format = new SimpleDateFormat("HH:mm:ss");
    						String time = time_format.format(sent_date);
    						SimpleDateFormat date_format = new SimpleDateFormat("dd/MM/yyyy");
    						String date = date_format.format(sent_date);
    						%>
    						add_email_to_list('<%=i%>', '<%=senders%>', '<%=
    						recipients%>', '<%=message.getSubject()%>', '<%=EmailHelper.getTextFromMessage(message)
    						.replace("\r", "").replace("'", "\\'").replace("\n", "\\n' + '")%>', '<%=time%>', 
    						'<%=date%>');
    						<%
    					  }
    					  f.close(true);
    				  //}
    				  
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