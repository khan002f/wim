var xmlhttp
var div_name
var div_ajax
function set_name(temp)
{
    div_ajax=temp;
    //alert(div_ajax);

}
function update_val(url,rn)
{
	var temp=document.getElementById("updt").value;
	url=url+"&evalue="+temp;
	
	loadContent(url,rn);
	

}
function toggle_bool(id,tempvalue)
{	
	//alert("test");
	var btn=document.getElementById(id).value;
	if(btn=="pending")
	{
		document.getElementById("id_"+id).value=1;
		document.getElementById(id).value=tempvalue;
	}
	else
	{
		document.getElementById("id_"+id).value=0;
		document.getElementById(id).value="pending";
	}
}


function load_text(tab_val)
{
    //alert(tab_val)
	var test=document.getElementById('select_advnc_seacrh')[document.getElementById('select_advnc_seacrh').selectedIndex].value;
	var temp=test.toLowerCase().search('date');
	var temp1;
	var textbox="test";
	var srch="<button onclick=\"search_setting('"+tab_val+"','1')\"><img src=\"img/search.png\" height=\"17\" width=\"17\"/></button>";
	var cal1="<button onClick=\"return showCalendar('ad_search_1', '%Y/%m/%d')\" ><img src=\"Calendar/img.gif\" alt=\"Clik to open calender\" height=\"17\" width=\"17\"/></button>";
	var cal2="<button onClick=\"return showCalendar('ad_search_2', '%Y/%m/%d')\" ><img src=\"Calendar/img.gif\" alt=\"Clik to open calender\" height=\"17\" width=\"17\"/></button>";

    var temp_hide=document.getElementById('select_order_by_hide').value;
    var temp_hide_list=temp_hide.split(',');
    var i=temp_hide_list[document.getElementById('select_advnc_seacrh').selectedIndex];
    //alert(i)
    temp1="<table border='0'><tr><td><input type='hidden' id='srch_cat' value='"+i+"'/>";
	if(i=="D")
	{	
		temp1+="From: <input type='text' id='ad_search_1' readonly />"+cal1+"</td><td> To: <input type='text' id='ad_search_2' readonly />"+cal2+"</td><td>"+srch+"</td></tr></table>";
	}	
    else if(i=="B"){
        temp1+="<input type='button' id='ad_search_B' value='pending' onClick=\"toggle_bool('ad_search_B','Done/True')\"/></td><td>"+srch+"</td><td><input type='hidden' id='id_ad_search_B' value='0'/></td></tr></table>";
    }
    else if(i=="I"){
        temp1+="Between:<input type='text' id='ad_search_4' /></td><td>and<input type='text' id='ad_search_5' /></td><td>"+srch+"</td></tr></table>";
    }   
    else if(i=="T")
	{
		temp1+="Time between <input type='text' id='ad_search_6'/></td><td> and <input type='text' id='ad_search_7'/></td><td>"+srch+"</td></tr></table>";
	}
    else{
         j="<select id='select_options'><option>Equals</option><option>Contains</option><option>Starts with</option><option>Ends With</option></select>";
		temp1+="<table border='0' ><tr><td>"+j+"</td><td><input type='text' id='ad_search_3'/></td><td>"+srch+"</td></tr></table>";

    }
    document.getElementById("search_2").innerHTML=temp1;
}
function select_func(tab_val,sid)
{
	if(sid=="select_order_by")
		check_order(tab_val,sid);
	else if(sid=="select_advnc_seacrh")
		load_text(tab_val);
}

	function check_order(tab_val,sid)
   {
		
        var indx;
        
        if(document.getElementById('srch1').value.length>0||document.getElementById('chk').checked)
        {
            
            indx=document.getElementById('d_d').selectedIndex;
            if(indx<0)
                indx=0;
            search_setting(tab_val,indx+1);
        }
        else{
            indx=document.getElementById(sid).selectedIndex;
            var temp=document.getElementById('arw_img').src.search('img/downarrow.PNG');
            if(temp>=0){
                desc=1;
            }
            else{
                desc=0;
            }
            
            document.getElementById('disp').innerHTML="";
            var url="tableLoadJSP.jsp?drop_down=1&top-navigation="+tab_val+"&orderby="+indx+"&desc="+desc;
            loadContent(url,'data');
        }
   }


function submit_data(tab_val)
{	
    var indx,desc=0;
    if(document.getElementById('srch1').value.length>0||document.getElementById('chk').checked)
    {
        indx=document.getElementById('d_d').selectedIndex;
        search_setting(tab_val,indx+1);
    }
    else
    {
        //alert("test_1")
        var temp=document.getElementById('arw_img').src.search('img/downarrow.PNG');
            if(temp>=0){
                desc=1;
            }
	indx=document.getElementById('select_order_by').selectedIndex;
	//alert(indx);
	var dd=document.getElementById('d_d').selectedIndex;
	dd++;
	var url="tableLoadJSP.jsp?drop_down="+dd+"&top-navigation="+tab_val+"&orderby="+indx+"&desc="+desc;
	
	document.getElementById('disp').innerHTML="";
	loadContent(url,'data');
    }
}

function loadContent(str,temp,fname)
{
		//alert(str)
		try{
		//alert(str)
		}
		catch(e)
		{
			//alert(e)
		}
	div_name=temp;
	xmlhttp=GetXmlHttpObject();
        /*if(div_name=="disp")
         {
             document.getElementById("msg").innerHTML="";
         } */
         
	  if (xmlhttp==null)
	  {
	   //alert ("Your browser does not support Ajax HTTP");
	   return;
	  }

   // var url="loadJSP.jsp";
   // url=url+"?"+str;
   var url=str;

	xmlhttp.onreadystatechange=function()
	{
	  if (xmlhttp.readyState==4)
	  {
		 // alert(xmlhttp.responseText)
         
	  document.getElementById(div_name).innerHTML=document.getElementById(div_name).innerHTML+xmlhttp.responseText;
      //document.getElementById("msg").innerHTML="";

		  if(!fname)
		  {
		  }
		 else
		 {
			fname();
		 }
	//  document.getElementById("test").innerHTML="";
	  }
	  else 
	  {
		  //document.getElementById(div_name).innerHTML="Loading  <img src='admin/img/preloader/ajax-loader_temp.gif'/>";
		  
		// document.getElementById("test").innerHTML="The content is loading below <img src='img/ajax-loader_temp.gif'/>";
	  }
	};
    pos=url.indexOf("?");
    len=url.length;
    if(pos>0){
        url1=url.substring(0,pos);
        param=url.substring(pos+1,len);
        //alert(url);
    }
    xmlhttp.open("POST",url1,true);
    //Send the proper header information along with the request
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.setRequestHeader("Content-length", param.length);
    xmlhttp.setRequestHeader("Connection", "close");

    xmlhttp.send(param);
}



function GetXmlHttpObject()
{
    if (window.XMLHttpRequest)
    {
       return new XMLHttpRequest();
    }
    if (window.ActiveXObject)
    {
      return new ActiveXObject("Microsoft.XMLHTTP");
    }
 return null;
}
function hide_me()
{
    document.getElementById("msg").innerHTML="";
}
function hide_me_1(temp)
{
    document.getElementById(temp).innerHTML="";
}
function search_setting(tname,dd)
{
    var ss="",ss1="",ss2="";
    var desc=0;
    var ad_search="";
    var temp_ad="";
    var col_indx="";
    if(document.getElementById('chk').checked){
        document.getElementById('disp').innerHTML="";
        var sc=document.getElementById('srch_cat').value;
        //alert(sc);
        if(sc=="D"){
            
           // alert("D")
            
            if(document.getElementById('ad_search_1').value.length==0||document.getElementById('ad_search_2').value.length==0||(new Date(document.getElementById('ad_search_1').value)>new Date(document.getElementById('ad_search_2').value))){
                document.getElementById('msg').innerHTML="Please enter proper date range";
                document.getElementById('msg').style.color="red";
                return;
            }

            ss1=document.getElementById('ad_search_1').value;
            ss2=document.getElementById('ad_search_2').value;
            col_indx=document.getElementById('select_advnc_seacrh').selectedIndex;
            temp_ad="ad_type="+sc+"&ss1="+ss1+"&ss2="+ss2+"&col_indx="+col_indx;
            
        }else if(sc=="C"||sc=="U"){
            //alert("CD")
             if(sc=="U")
                  sc="C";
            if(document.getElementById('ad_search_3').value.length==0){
                 document.getElementById('msg').innerHTML="Please enter proper search String";
                 document.getElementById('msg').style.color="red";
                 return;
            }
            col_indx=document.getElementById('select_advnc_seacrh').selectedIndex;
            var srch_prf=document.getElementById('select_options').selectedIndex;
            ss=document.getElementById('ad_search_3').value;
            temp_ad="ad_type="+sc+"&ss="+ss+"&col_indx="+col_indx+"&srch_prf="+srch_prf;
        }else if(sc=="B"){
            //alert("B")
            ss=document.getElementById('id_ad_search_B').value;
            col_indx=document.getElementById('select_advnc_seacrh').selectedIndex;
            temp_ad="ad_type="+sc+"&ss="+ss+"&col_indx="+col_indx;
        }else if(sc=="I"){
            var text4=document.getElementById('ad_search_4');
            var text5=document.getElementById('ad_search_5');
            //alert(new Number(text4.value)>new Number(text5.value))
            if(text4.value.length==0||text5.value.length==0||(new Number(text4.value)>new Number(text5.value))||isNaN(text4.value)||isNaN(text5.value)){
                 document.getElementById('msg').innerHTML="Please enter proper number range";
                 document.getElementById('msg').style.color="red";
                 return;
            }

            ss1=document.getElementById('ad_search_4').value;
            ss2=document.getElementById('ad_search_5').value;
            col_indx=document.getElementById('select_advnc_seacrh').selectedIndex;
            temp_ad="ad_type="+sc+"&ss1="+ss1+"&ss2="+ss2+"&col_indx="+col_indx;
        }else if(sc=="T"){
           
            if(document.getElementById('ad_search_6').value.length==0||document.getElementById('ad_search_7').value.length==0||(document.getElementById('ad_search_6').value>document.getElementById('ad_search_7').value)){
                 document.getElementById('msg').innerHTML="Please enter proper number range";
                 document.getElementById('msg').style.color="red";
                 return;
            }
            ss1=document.getElementById('ad_search_6').value;
            ss2=document.getElementById('ad_search_7').value;
            col_indx=document.getElementById('select_advnc_seacrh').selectedIndex;
            temp_ad="ad_type="+sc+"&ss1="+ss1+"&ss2="+ss2+"&col_indx="+col_indx;
        }
        else{
          
            document.getElementById('msg').innerHTML="Unsupported Data type";
            document.getElementById('msg').style.color="red";
            return;
        }
        document.getElementById('msg').innerHTML="";
       // alert(temp_ad)
        var temp=document.getElementById('arw_img').src.search('img/downarrow.PNG');
            if(temp>=0){
                desc=1;
            }
        var ob=document.getElementById('select_order_by').selectedIndex;
        var temp2="tableLoadJSP.jsp?desc="+desc+"&orderby="+ob+"&top-navigation="+tname+"&drop_down="+dd+"&"+temp_ad;
        //alert(temp2)
        loadContent(temp2,'data');
        
    }
    else{
        if(document.getElementById('srch1').value.length==0){
            document.getElementById('msg').innerHTML="Plese Enter any Search String into the Text box(Click on it to hide)";
            document.getElementById('msg').style.color="red";
            return;

        }
        else{
            document.getElementById("disp").innerHTML="";
            document.getElementById('msg').innerHTML="";
            ss=document.getElementById('srch1').value;
            var temp=document.getElementById('arw_img').src.search('img/downarrow.PNG');
            if(temp>=0){
                desc=1;
            }

           //var ob=document.getElementById('select_order_by')[document.getElementById('select_order_by').selectedIndex].value;
           var ob=document.getElementById('select_order_by').selectedIndex;
           var temp1="tableLoadJSP.jsp?search1=true&desc="+desc+"&ss="+ss+"&orderby="+ob+"&top-navigation="+tname+"&drop_down="+dd;
           //alert(temp1)
           loadContent(temp1,'data');

        }
    }
    
}

function clear_text(temp){
    document.getElementById(temp).value="";
}




function startCallback() {
   // alert(div_ajax);
    if(div_ajax=="report_msg")
    {
        if(document.fest_image.val.value==0)
        {
            document.getElementById('report_msg').innerHTML="Please select a title from the Drop-down";
            return false;
        }
        else if(document.fest_image.fest_image.value==0||document.fest_image.fest_image.value==null||document.fest_image.fest_image.value=='')
        {
            document.getElementById('report_msg').innerHTML="Please select an image";
            return false;
        }
    }
    else if(div_ajax=="table_mail")
    {
        if(!submit_mail())
        {
            document.getElementById('report_msg').innerHTML="Please Enter Subject / Message";
            return false;
        }
    }
    

    //set_name(getElementById('column_ajax').value);
// make something useful before submit (onStart)
// getNameFromPath(form[file])
return true;
}

function completeCallback(response)
{
// make something useful after (onComplete)
if(div_ajax=="report_msg")
    loadimage();
document.getElementById(div_ajax).innerHTML = response;
}
function aom_selection()
{
    var temp=document.getElementById('aom_select').value;
    loadContent('authorofthemonth.jsp?authid='+temp,'center-column');
}




