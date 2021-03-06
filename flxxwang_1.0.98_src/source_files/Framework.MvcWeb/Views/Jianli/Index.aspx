﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <%
        var city = ViewData["City"] as City;
    %>
    <meta name="keywords" content="个人简历,简历库" />
    <meta name="description" content="<%=SiteInfo.Name%>个人简历库,为您提供海量优秀的个人简历,您可以搜索销售、客服、文员等数百种职位人才的个人简历.搜简历,找人才就来<%=SiteInfo.Name%>个人简历库。" />
    <link type="text/css" rel="stylesheet" href="/content/fenlei/ui6/zp/resume20111103.css" />
    <script type="text/javascript" src="/content/fenlei/Scripts/c8/28.js"></script>
    <script type="text/javascript" src="/content/fenlei/Scripts/jianli/jquery.js"></script>
    <%--<script type="text/javascript" src="/content/fenlei/Scripts/jianli/search.js"></script>--%>
    
    <%--<script type="text/javascript" src="/content/fenlei/Scripts/jianli/19h.js"></script>--%>
    <%--<script type="text/javascript"> var win = new GetToolTipWindow('tooltipdiv', 'txtSearch', '3', '1', '', false); win.setSearchButton('searchbtn'); </script>--%>
    <title>2011最新个人简历库 - <%=SiteInfo.Name%></title>

</head>
<body>
<%var city = ViewData["City"] as City; %>
<div id="topbar">
    <div id="login">
        <a href="<%=Url.Action("s2","post",new{values="zhaopin"}) %>" class="redfont">发布招聘信息</a>
    </div>
</div>
<div id="logo_center">
    <a id="logo" href="<%=Url.Action("Default","Home") %>">
        <img src="/Content/Fenlei/assets/images/logo/logo.gif" />
    </a>
    <div class="resumedata">
        <h1>简历库</h1>
    </div>
    <div class="clear"></div>
</div>
<div class="search_index">
    <div class="search_keyword">
    	<div style="z-index:10;" class="search_city fl">
            <span id="spanLiveCity" sid="79" sdir="hz"><%=city.ShortName %></span>
            <div class="zhankai" id="divLiveCity" style="display:none"></div>
        </div> 
        <span class="search_input fl">
            <input type="text" class="c_ccc" id="txtSearch" autocomplete="off" value="请输入职位名" />
        </span>
        <input type="button" class="search_btn" id="searchbtn" onclick="Search()" value="搜索简历" />
        <span class="mm">
            <a href="javascript:void(0);" id="simplecondition" class="morea down">高级搜索</a>
            <a href="javascript:void(0);" id="complexcondition" style="display:none" class="morea up">收起高级搜索</a>
        </span>
    </div>
    <div class="moretj">
    	<div id="complex" style="display:none" class="morecon">
            <div class="search_city fl">
                <input type="hidden" id="hidsex" name="hidsex" value="-1" />
                <span id="sex">性别不限</span>
                <div class="selectlist hc">
                    <a href='javascript:void(0)' onclick='PopWindowClear(this,-1)'>性别不限</a>
                    <a href='javascript:void(0)' onclick='PopWindowClear(this,1)'>女</a>
                    <a href='javascript:void(0)' onclick='PopWindowClear(this,2)'>男</a>
                </div>
            </div>
            <div class="search_city fl">
                <input type="hidden" id="hidage" name="hidage" value="-1" />
                <span id="age">年龄不限</span>
            	<div class="selectlist hc">
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,-1)'>年龄不限</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,1)'>16-20岁</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,2)'>21-30岁</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,3)'>31-40岁</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,4)'>41-50岁</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,5)'>50岁以上</a>
                </div>
            </div>
            <div class="search_city fl">
                <input type="hidden" id="hidedu" name="hidedu" value="-1" />
                <span id="edu">学历不限</span>
                <div class="selectlist hc">
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,-1)'>学历不限</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,1)'>技校</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,2)'>高中</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,3)'>中专</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,4)'>大专</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,5)'>本科</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,6)'>硕士</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,7)'>博士</a>
                </div>
                <input type="checkbox" checked="checked" id="eduabove" name="eduabove" style="margin:2px;*margin:0; vertical-align:middle" />
                含以上
            </div>
            <div class="search_city fl">
                <input type="hidden" id="hidexp" name="hidexp" value="-1" />
                <span id="exp" style="width:75px;">工作经验不限</span>
                <div style="width:103px" class="selectlist hc">
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,-1)'>工作经验不限</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,1)'>1-3年</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,2)'>3-5年</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,3)'>5-10年</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,4)'>10年以上</a>
                </div>
                <input type="checkbox"  id="expabove" name="expabove" style="margin:2px;*margin:0; vertical-align:middle; display:none;" />
            </div>
            <div class="search_city fl">
                <input type="hidden" id="hidaddtime" name="hidaddtime" value="-1" />
                <span id="addtime">发布时间</span>
                <div class="selectlist hc">
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,-1)'>全部时间</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,1)'>一天以内</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,2)'>三天以内</a>
            	    <a href='javascript:void(0)' onclick='PopWindowClear(this,3)'>七天以内</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="resume_hot">
	<h2>热门简历</h2>
    <ul>
        <li><a>销售</a></li>
        <li><a>文员</a></li>
        <li><a>前台</a></li>
        <li><a>助理</a></li>
        <li><a>客服</a></li>
        <li><a>服务员</a></li>
        <li><a>收银</a></li>
        <li><a>厨师</a></li>
        <li><a>配菜</a></li>
        <li><a>会计</a></li>
        <li><a>编辑</a></li>
        <li><a>平面设计</a></li>
        <li><a>网页设计</a></li>
        <li><a>装潢设计</a></li>
        <li><a>网管</a></li>
        <li><a>营业员</a></li>
        <li><a>导购</a></li>
        <li><a>司机</a></li>
        <li><a>快递</a></li>
        <li><a>仓库管理员</a></li>
        <li><a>美容师</a></li>
        <li><a>发型师</a></li>
        <li><a>保安</a></li>
        <li><a>保洁</a></li>
        <li><a>保姆</a></li>
    </ul>
    <div class="clear"></div>
</div>
<div id="footer">
    <p class="free">
        <a href="<%=Url.Action("s2","post",new{values="zhaopin"}) %>">免费发布招聘信息</a>
        <a id="addcollect">收藏<%=SiteInfo.Name%>简历库</a>
    </p>
    <p class="s_nav">
        <a href="<%=Url.Action("Index","Qiuzhi") %>"><%=city.ShortName %>求职</a><span>|</span>
        <a href="<%=Url.Action("Index","Zhaopin") %>"><%=city.ShortName %>招聘</a><span>|</span>
        <%--<a href="http://vip.flxxwang.com">招聘通</a>--%>
    </p>
    <p>&copy;2011 flxxwang.com</p>
</div>

<%--<script type="text/javascript">
    $(document).ready(function () {
        InitSearch();
    });
</script>--%>

<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-26929121-1']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>    

<script type="text/javascript">
    $(function () {
        $("a").attr("target", "_blank");
    });
</script>
</body>
</html>
