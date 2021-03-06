<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Edit Config</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.6.min.js"></script>
    <style type="text/css">
        *{padding: 0;margin: 0;line-height:20px;}
        .main {width: 1000px;margin: 20px auto;}
        table tr td{padding: 6px 16px;}
        table tr td table tr td{padding: 0px;}

        #playlist1,#playlist2,#playlist3,#playlist4{display: none;}
        select{width:240px;height: 24px;}
        div label{display:block;width:260px;overflow:hidden;float: left;}
        input{width:240px;}
        .btn1{width:60px;}
        h2{padding: 33px;}
        h3{padding: 12px 0;}
        .botnav{width: 100%;text-align: right;overflow:hidden;}
        .tagmap label{width:200px;}
    </style>

    <script type="text/javascript">
        $(function(){

            $("#saveBtn").bind("click",function(){
                //var content = $("#form2 input:first").val();
                var cfgid = $("input[name='cfgid']").val();

                if (cfgid == "") {
                    $("#msg").html("Config Id can't be blank").css("color","red");
                } else {
                    $("#saveBtn").attr('disabled',true);
                    $("#msg").html("Sending...");
                    $.ajax({
                        type:"POST",
                        url:"add-cfgid",
                        data:{
                            cfgid:cfgid
                        },
                        success:function(data){		//{"message":"Send Success"}


                            var arr = eval('('+data+')')
                            var msg = arr.message;
                            $("#msg").html(msg).css("color","red")
                            if ((msg.indexOf("Success")) >= 0) {
                                $("input[name='cfgid']").attr('readonly',true)
                                $("#saveBtn").attr('disabled',true);
                            } else {
                                //$("#form input:eq(1)").attr('disabled',false);
                                $("#saveBtn").animate( {"opacity": 1}, 3000  ,function(){
                                    $("#saveBtn").attr('disabled',false);
                                    //$("#msg").html("");
                                });
                            }
                        },
                        error:function(){
                            $("#msg").html("Net error, try again later ");
                        }
                    });
                }
            });

            $(".addBtn").bind("click",function(){
                //取值，添加到input里，删除select中的该元素
                var text = $(this).prev().find("option:selected").text();
                if (text != "") {
                    $(this).next().append('<div><label>' + text + '</label> <input type=input name='+text+' value="2826">' + ' <a href="javascript:" class="delBtn">X</a></div>');
                    $(this).prev().find("option[value='"+text+"']").remove();
                    //$("#country option[value='"+text+"']").remove();
                }
            });

            $(".delBtn").die().live("click",function(){
                var val = $(this).prev().prev().text();
                $(this).parent().parent().prev().prev().prepend("<option value='" + val + "'>" + val + "</option>");
                $("input[name='" + val + "']").attr("value",'');// 清空内容
                $(this).parent().hide();
            });

            $(".addtag").bind("click",function(){
                var index = 0;
                var lastTag = $("#taglist div:last-child");
                var tagName = lastTag.find("input").first().attr('name');
                if (tagName != undefined ) {
                    index = tagName.split('name')[1];
                    index++;
                }
                var name = "tagname"+index;
                var value = "tagvalue"+index;
                $("#taglist").append('<div>Tag name <input type=input name='+name+' value=""> Tag value <input type=input name='+value+' value="">' + ' <a href="javascript:" class="deltag">X</a></div>');

            });
            $(".deltag").die().live("click",function(){
                var val = $(this).prev().prev().text();
                $("input[name='" + val + "']").attr("value",'');// 清空内容
                $(this).parent().hide();
                //$(this).parent().remove();
            });

            $("#nextBtn").bind("click",function(){

                var cfgid = $("input[name='cfgid']").val();
                if (cfgid == "") {
                    $("#msg2").html("Config Id can't be blank").css("color","red");
                    return;
                }
                var header = $("input[name='header']").val();
                if (header == "") {
                    $("#msg2").html("Header can't be blank").css("color","red");
                    return;
                }
                $("#nextForm").submit();
            });

            $("#menus tr").each(function(){
                $(this).find('select').val();

            });

            $("#menus tr select").change(function(){

                var checkValue=$("#menus tr select").val();
                if(checkValue == "playlist") {
                    $("#menus tr td div").show();
                } else {
                    $("#menus tr td div").hide();
                }
            });

        });
    </script>
</head>
<body>
<div class="main">
<c:if test="${cfgid == null}">
    <h2>New Config</h2>
</c:if>
<c:if test="${cfgid != null}">
    <h2>Edit Config</h2>
</c:if>
<form action="create.action" method="post" id="nextForm">
<table width="100%" cellpadding="8">
    <tr bgcolor="#EEE">
        <td width="32%"><h3>Config Id</h3></td>
        <td>
            <c:if test="${cfgid == null}">
                <input type="input" name="cfgid" value="" placeholder="Ex : nokia-1.0.1">
                <input type="button" value="Save" id="saveBtn" class="btn1"/> <span id="msg"></span>
            </c:if>
            <c:if test="${cfgid != null}">
                <input type="input" name="cfgid" value="${cfgid}" placeholder="Ex : nokia-1.0.1" readonly="true">    <!-- 1 -->
            </c:if>
        </td>
    </tr>
</tr>
</table>

<hr/> <br/>
<c:forEach items="${othertag}" var="entry">
    <div class="tagmap"><label>${entry.key}</label>  <input type=input name='${entry.key}' value='${entry.value}'>  <a href="javascript:" class="deltag">X</a></div>
</c:forEach>
    <div id="taglist"></div>
    <a href="javascript:" class="addtag">Add new tag</a><br/><br/><hr/><br/>
    <input type="button" value="Save" id="nextBtn" class="btn1"> <span id="msg2"></span>
</form>
    <div class="botnav"><a href="index.action">Home</a></div>
</div>
</body>
</html>


