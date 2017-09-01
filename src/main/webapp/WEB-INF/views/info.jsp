<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>页面</title>
    <script type="text/javascript" src="<c:url value='/My97DatePicker/WdatePicker.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/jquery/jquery-1.8.3.js'/>"></script>

    <script src="<c:url value='/hplus/js/jquery.min.js-v=2.1.4.js'/>"></script>
    <script src="<c:url value='/hplus/js/bootstrap.min.js-v=3.3.5.js'/>"></script>
    <script src="<c:url value='/hplus/js/plugins/footable/footable.all.min.js'/>"></script>
    <script src="<c:url value='/hplus/js/content.min.js-v=1.0.0.js'/>"></script>
    <script src="<c:url value='/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js'/>"></script>
    <script src="<c:url value='/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js'/>"></script>
    <script src="<c:url value='/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js'/>"></script>
    <script src="<c:url value='/hplus/js/demo/bootstrap-table-demo.min.js'/>"></script>

    <link href="<c:url value='/hplus/css/bootstrap.min.css-v=3.3.5.css'/>" rel="stylesheet">
    <link href="<c:url value='/hplus/css/font-awesome.min.css-v=4.4.0.css'/>" rel="stylesheet">
    <link href="<c:url value='/hplus/css/plugins/footable/footable.core.css'/>" rel="stylesheet">
    <link href="<c:url value='/hplus/css/animate.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/hplus/css/style.min.css-v=4.0.0.css'/>" rel="stylesheet">
    <link href="<c:url value='/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css'/>" rel="stylesheet">
</head>
<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>
                        开始日期：<input type="text" class="Wdate" id="starttime"
                                    onClick="WdatePicker()">
                        &nbsp;&nbsp;&nbsp;
                        结束日期：<input type="text" class="Wdate" id="endtime"
                                    onClick="WdatePicker()">
                        <input type="button" value="查询" onclick="message();"/>
                    </h5>
                </div>
                <div class="ibox-content">

                    <span id="message"></span>


                    <input type="text" placeholder="工单编号">
                    <input type="button" value="查询"/>

                    <table class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>案卷编号</th>
                            <th>工单编号</th>
                            <th>问题描述</th>
                            <th>处置时限</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Trident</td>
                            <td>Internet Explorer 4.0</td>
                            <td>Win 95+</td>
                            <td>4</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>Trident</td>
                            <td>Internet Explorer 4.0</td>
                            <td>Win 95+</td>
                            <td>4</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>Trident</td>
                            <td>Internet Explorer 4.0</td>
                            <td>Win 95+</td>
                            <td>4</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>Trident</td>
                            <td>Internet Explorer 4.0</td>
                            <td>Win 95+</td>
                            <td>4</td>
                            <td>X</td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="5">
                                <ul class="pagination pull-right"></ul>
                            </td>
                        </tr>
                        </tfoot>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script type="application/javascript">
    function xtCaseInfo(type, starttime, endtime) {
        $("#message").html("");

        $.ajax({
            type: "POST",  //提交方式
            url: "${pageContext.request.contextPath}/info/message",//路径
            data: {
                "starttime": starttime, "endtime": endtime
            },//数据，这里使用的是Json格式进行传输
            dataType: "json",//返回数据格式
            success: function (result) {//返回数据根据结果进行相应的处理
                var data = '<table class="table table-striped table-bordered table-hover dataTables-example"><tbody>';
                data += '<tr class="gradeX"><td>监督员上报数量</td><td><a href="javascript:xtCaseInfo(\'PATROLREPORTNUM\');">' + type + '</a></td></tr>';
                data += '</tbody></table>';
                $("#message").append(data);
            }
        });
    }

    function message() {
        var starttime = $("#starttime").val();
        var endtime = $("#endtime").val();

        if (starttime == '' || endtime == '') {
            alert('请选择日期');
            return false;
        }

        $.ajax({
            type: "POST",  //提交方式
            url: "${pageContext.request.contextPath}/info/message",//路径
            data: {
                "starttime": starttime, "endtime": endtime
            },//数据，这里使用的是Json格式进行传输
            dataType: "json",//返回数据格式
            success: function (result) {//返回数据根据结果进行相应的处理
                var data = '<table class="table table-striped table-bordered table-hover dataTables-example"><tbody>';

                data += '<tr class="gradeX"><td>监督员上报数量</td><td><a href="javascript:xtCaseInfo(\'PATROLREPORTNUM\',\'' + starttime + '\',\'' + endtime + '\');">' + result[0].PATROLREPORTNUM + '</a></td></tr>';
//                data += '<tr class="gradeX"><td>监督员有效上报数量</td><td>'+result[0].VALIDPATROLREPORTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>举报数量</td><td>'+result[0].PUBLICREPORTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>有效举报数量</td><td>'+result[0].VALIDPUBLICREPORTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>抓拍数量</td><td>'+result[0].VIDEOREPORTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>有效抓拍数量</td><td>'+result[0].VALIDVIDEOREPORTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>上报总数量</td><td>'+result[0].TOTALREPORTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>有效上报总数量</td><td>'+result[0].TOTALVALIDREPORTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员立案数量</td><td>'+result[0].INSTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员按时立案数量</td><td>'+result[0].INTIMEINSTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报立案数量</td><td>'+result[0].INSTNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报按时立案数量</td><td>'+result[0].INTIMEINSTNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍立案数量</td><td>'+result[0].INSTNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍按时立案数量</td><td>'+result[0].INTIMEINSTNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计立案数量</td><td>'+result[0].TOTALINSTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计按时立案数量</td><td>'+result[0].TOTALINTIMEINSTNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员应派遣数量</td><td>'+result[0].NEEDDISPATCHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员派遣数量</td><td>'+result[0].DISPATCHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员准确派遣数量</td><td>'+result[0].ACCURDISPATCHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员错误派遣数量</td><td>'+result[0].WRONGDISPATCHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员按时派遣数量</td><td>'+result[0].INTIMEDISPACHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报应派遣数量</td><td>'+result[0].NEEDDISPATCHNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报派遣数量</td><td>'+result[0].DISPATCHNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报准确派遣数量</td><td>'+result[0].ACCURDISPATCHNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报错误派遣数量</td><td>'+result[0].WRONGDISPATCHNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报按时派遣数量</td><td>'+result[0].INTIMEDISPACHNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍应派遣数量</td><td>'+result[0].NEEDDISPATCHNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍派遣数量</td><td>'+result[0].DISPATCHNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍准确派遣数量</td><td>'+result[0].ACCURDISPATCHNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍错误派遣数量</td><td>'+result[0].WRONGDISPATCHNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍按时派遣数量</td><td>'+result[0].INTIMEDISPACHNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计应派遣数量</td><td>'+result[0].TOTALNEEDDISPATCHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计派遣数量</td><td>'+result[0].TOTALDISPATCHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计准确派遣数量</td><td>'+result[0].TOTALACCURDISPATCHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计错误派遣数量</td><td>'+result[0].TOTALWRONGDISPATCHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计按时派遣数量</td><td>'+result[0].TOTALINTIMEDISPACHNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员应处置数量</td><td>'+result[0].NEEDDISPOSENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员处置数量</td><td>'+result[0].DISPOSENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员按期处置数量</td><td>'+result[0].INTIMEDISPOSENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报应处置数量</td><td>'+result[0].NEEDDISPOSENUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报处置数量</td><td>'+result[0].DISPOSENUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报按期处置数量</td><td>'+result[0].INTIMEDISPOSENUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍应处置数量</td><td>'+result[0].NEEDDISPOSENUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍处置数量</td><td>'+result[0].DISPOSENUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍按期处置数量</td><td>'+result[0].INTIMEDISPOSENUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计应处置数量</td><td>'+result[0].TOTALNEEDDISPOSENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计处置数量</td><td>'+result[0].TOTALDISPOSENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计按期处置数量</td><td>'+result[0].TOTALINTIMEDISPOSENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员应核查数量</td><td>'+result[0].NEEDCHECKNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员核查数量</td><td>'+result[0].CHECKNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员按时核查数量</td><td>'+result[0].INTIMECHECKNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报应核查数量</td><td>'+result[0].NEEDCHECKNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报核查数量</td><td>'+result[0].CHECKNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报按时核查数量</td><td>'+result[0].INTIMECHECKNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍应核查数量</td><td>'+result[0].NEEDCHECKNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍核查数量</td><td>'+result[0].CHECKNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍按时核查数量</td><td>'+result[0].INTIMECHECKNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计应核查数量</td><td>'+result[0].TOTALNEEDCHECKNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计核查数量</td><td>'+result[0].TOTALCHECKNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计按时核查数量</td><td>'+result[0].TOTALINTIMECHECKNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员应结案数量</td><td>'+result[0].NEEDARCHIVENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员结案数量</td><td>'+result[0].ARCHIVENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员按期结案数量</td><td>'+result[0].INTIMEARCHIVENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报应结案数量</td><td>'+result[0].NEEDARCHIVENUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报结案数量</td><td>'+result[0].ARCHIVENUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报按期结案数量</td><td>'+result[0].INTIMEARCHIVENUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍应结案数量</td><td>'+result[0].NEEDARCHIVENUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍结案数量</td><td>'+result[0].ARCHIVENUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍按期结案数量</td><td>'+result[0].INTIMEARCHIVENUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计应结案数量</td><td>'+result[0].TOTALNEEDARCHIVENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计结案数量</td><td>'+result[0].TOTALARCHIVENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计按期结案数量</td><td>'+result[0].TOTALINTIMEARCHIVENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员应延期数量</td><td>'+result[0].DELAYNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员缓办数量</td><td>'+result[0].HUNGNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>监督员返工数量</td><td>'+result[0].TWICEDONENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报应延期数量</td><td>'+result[0].DELAYNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报缓办数量</td><td>'+result[0].HUNGNUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>公众举报返工数量</td><td>'+result[0].TWICEDONENUM2+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍应延期数量</td><td>'+result[0].DELAYNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍缓办数量</td><td>'+result[0].HUNGNUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>视频抓拍返工数量</td><td>'+result[0].TWICEDONENUM3+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计应延期数量</td><td>'+result[0].TOTALDELAYNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计缓办数量</td><td>'+result[0].TOTALHUNGNUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>合计返工数量</td><td>'+result[0].TOTALTWICEDONENUM+'</td></tr>';
//                data += '<tr class="gradeX"><td>市政公用设施类案件占比</td><td>'+result[0].RATE1+'</td></tr>';
//                data += '<tr class="gradeX"><td>井盖占比</td><td>'+result[0].RATE2+'</td></tr>';
//                data += '<tr class="gradeX"><td>照明设施占比</td><td>'+result[0].RATE3+'</td></tr>';
//                data += '<tr class="gradeX"><td>报刊电话售货亭及邮筒变压器等箱体占比</td><td>'+result[0].RATE4+'</td></tr>';
//                data += '<tr class="gradeX"><td>道路交通设施类案件占比</td><td>'+result[0].RATE5+'</td></tr>';
//                data += '<tr class="gradeX"><td>公交站台占比</td><td>'+result[0].RATE6+'</td></tr>';
//                data += '<tr class="gradeX"><td>交通信号灯等信号设施占比</td><td>'+result[0].RATE7+'</td></tr>';
//                data += '<tr class="gradeX"><td>标志、标牌设置占比</td><td>'+result[0].RATE8+'</td></tr>';
//                data += '<tr class="gradeX"><td>市容环境类案件占比</td><td>'+result[0].RATE9+'</td></tr>';
//                data += '<tr class="gradeX"><td>道路破损占比</td><td>'+result[0].RATE10+'</td></tr>';
//                data += '<tr class="gradeX"><td>违法建设占比</td><td>'+result[0].RATE11+'</td></tr>';
//                data += '<tr class="gradeX"><td>户外广告、店招店牌占比</td><td>'+result[0].RATE12+'</td></tr>';
//                data += '<tr class="gradeX"><td>环卫保洁占比</td><td>'+result[0].RATE13+'</td></tr>';
//                data += '<tr class="gradeX"><td>涂写张贴小广告占比</td><td>'+result[0].RATE14+'</td></tr>';
//                data += '<tr class="gradeX"><td>油烟污染占比</td><td>'+result[0].RATE15+'</td></tr>';
//                data += '<tr class="gradeX"><td>街面秩序类案件占比</td><td>'+result[0].RATE16+'</td></tr>';
//                data += '<tr class="gradeX"><td>占道经营店外经营占比</td><td>'+result[0].RATE17+'</td></tr>';
//                data += '<tr class="gradeX"><td>车辆乱停放占比</td><td>'+result[0].RATE18+'</td></tr>';
//                data += '<tr class="gradeX"><td>乱堆物堆料占比</td><td>'+result[0].RATE19+'</td></tr>';
//                data += '<tr class="gradeX"><td>园林绿化类案件占比</td><td>'+result[0].RATE20+'</td></tr>';
//                data += '<tr class="gradeX"><td>施工管理类案件占比</td><td>'+result[0].RATE21+'</td></tr>';
//                data += '<tr class="gradeX"><td>突发事件类案件占比</td><td>'+result[0].RATE22+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发1名称</td><td>'+result[0].TOP1NAME+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发1占比</td><td>'+result[0].TOP1RATE+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发2名称</td><td>'+result[0].TOP2NAME+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发2占比</td><td>'+result[0].TOP2RATE+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发3名称</td><td>'+result[0].TOP3NAME+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发3占比</td><td>'+result[0].TOP3RATE+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发4名称</td><td>'+result[0].TOP4NAME+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发4占比</td><td>'+result[0].TOP4RATE+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发5名称</td><td>'+result[0].TOP5NAME+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发5占比</td><td>'+result[0].TOP5RATE+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发6名称</td><td>'+result[0].TOP6NAME+'</td></tr>';
//                data += '<tr class="gradeX"><td>高发6占比</td><td>'+result[0].TOP6RATE+'</td></tr>';

                data += '</tbody></table>';

                $("#message").html("");
                $("#message").append(data);
            }
        });
    }
</script>

<script>
    $(document).ready(function(){$(".footable").footable();$(".footable2").footable()});
</script>

</html>
