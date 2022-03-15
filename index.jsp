<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,MyConnection.DB_con" errorPage="" %>
<%
//response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Cache-Control","no-store"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<htmL>

<head>
<script src="ajaxjs.js"></script>
<script type="text/javascript">
/*for(i=0;i<2;i++)
{
	
setTimeout(function()
		{
        	alert("I am setTimeout");
   		},10000);
//alert("I out");
	//alert(document.getElementById('live_data').innerHTML)
	//loadContent('fetch_data.jsp?test=test','live_data');
}*/

(function myLoop(i) {
	  setTimeout(function() {
	   // console.log('hello'); //  your code here      
	   loadContent('fetch_data.jsp?test=test','live_data');
	   //alert("Hi")
	    if (--i) myLoop(i);   //  decrement i and call myLoop again if i > 0
	  }, 5000)
	})(1000); 
</script>
<style type="text/css">
    .divTable
    {
        display:  table;
        width:auto;
        background-color:#eee;
        border:1px solid  rgb(0, 0, 255);
        border-spacing:5px;/*cellspacing:poor IE support for  this*/
       /* border-collapse:separate;*/
      
    }

    .divRow
    {
       display:table-row;
       width:auto;
    }
    .divCell
    {
        float:left;/*fix for  buggy browsers*/
        display:table-column;
        width:100px;
        background-color:#ccc;
    }
    .upper{
    position: fixed;
    top: 0px;
    background: #c9c9c9;   
    display: block;
    
    .hover_bkgr_fricc{
    background:rgba(0,0,0,.4);
    cursor:pointer;
    display:none;
    height:100%;
    position:fixed;
    text-align:center;
    top:0;
    width:100%;
    z-index:10000;
	}
	
}
</style>
<title>Live Feed</title>
</head>
<body>

<!-- div class="hover_bkgr_fricc">
    <span class="helper"></span>
    <div>
        <div class="popupCloseButton">&times;</div>
        <p>Add any HTML content<br />inside the popup box!</p>
    </div>
</div-->

  <!-- form id="form1"-->
   <input type=hidden value="success" id="tt" />
    <input type=button name=test value='Click Me' onClick="javascript:loadContent('fetch_data.jsp?test=test','live_data')" /> 
      <div class="upper" id="live_header">
     
             <div class="headRow">
                <div class="divCell" align="center">Plate Number</div>
                <div  class="divCell">Speed</div>
                <div  class="divCell">Length</div>
                <div  class="divCell">Direction</div>
                <div  class="divCell">Class</div>
                <div  class="divCell">Lane</div>
                <div  class="divCell">Height</div>
                <div  class="divCell">Tire Pressure</div>
                <div  class="divCell">Weight</div>
                <div  class="divCell">Timestamp</div>
                <div  class="divCell">Action</div>          
             </div>
             
      </div>
      
      <!-- div class="divTable">
            <div class="divRow" style="color:red">
                <div class="divCell" align="center">CSGt1092</div>
                <div  class="divCell">50</div>
                <div  class="divCell">15</div>
                <div  class="divCell">N</div>
                <div  class="divCell">9</div>
                <div  class="divCell">2</div>
                <div  class="divCell">10</div>
                <div  class="divCell" id="tuhin">90</div>
                <div  class="divCell">8000</div>
                <div  class="divCell">Timestamp</div>
             </div>
      </div-->
      <div class="divTable" id="live_data">          
 
      </div>
  	<!-- /form-->
	</body>
  </html>