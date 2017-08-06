<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>用户注册趋势图</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div style="height:50px;width: 100%" align="right">
    <select id="regularTime">
        <option>一周</option>
        <option>一个月</option>
        <option>一个季度</option>
    </select>
</div>
<div id="main" style="height:800px;width: 100%"></div>
<script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<p id="currentId" align="center">未选择</p>
<div style="height:50px;width: 100%" align="center">
    <a href="#" id="xiaomi">小米</a>
    <a href="#" id="meizu">魅族</a>
    <a href="#" id="huawei">华为</a>
    <a href="#" id="pingguo">苹果</a>
</div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById("main"));
    var option = {
        title: {
            text: '下载量趋势图',
            subtext: 'test'
        },
        tooltip: {
            trigger: 'axis',
        },
        legend: {
            data: ['下载量'],
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        calculable: true,
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: ['一', '二', '三', '四', '五', '六', '日']
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisLabel: {
                    formatter: '{value} 个'
                }
            }
        ],
        series: [
            {
                name: '下载量',
                type: 'line',
                data: [0, 0, 0, 0, 0, 0, 0],
                markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'}
                    ]
                }
            }
        ]
    };
    myChart.setOption(option);
    var allA = $('a');
    for (var i = 0; i < allA.length; i++) {
        allA.eq(i).bind('click', function () {
            var y = $(this).attr('id');
            var myChannel = {};
            myChannel.channel = y;
            myChannel.time = document.getElementById("regularTime").value;
            document.getElementById("currentId").innerHTML = '当前：' + y;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/jsontest",
                data: JSON.stringify(myChannel),
                dataType: "json",
                error: function (dataa) {
                    alert("出错了！！:" + dataa);
                },
                success: function (dataa) {
                    option.xAxis[0].data = dataa.time;
                    option.series[0].data = dataa.number;
                    myChart.setOption(option);
                }
            });
        })
    }
</script>
</body>
</html>