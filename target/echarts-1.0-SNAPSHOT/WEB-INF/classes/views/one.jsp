<%--
  Created by IntelliJ IDEA.
  User: 占大帅
  Date: 2017/8/5
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="#" id="xiaomi">小米</a>
<a href="#" id="meizu">魅族</a>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
    var allA=$('a');
    for(var i=0;i<allA.length;i++){
        allA.eq(i).bind('click',function () {
            var y=$(this).attr('id')
            alert(y)
        })
    }

</script>
</body>
</html>
