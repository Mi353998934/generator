<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="+=">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
    <script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>
    <!-- Demo page code -->
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="lib/html5.js"></script>
    <![endif]-->
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
<!--<![endif]-->
<div id="head"></div>
<div id="left"></div>
<div class="content">
    <div class="header">
        <h1 class="page-title">新增</h1>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="btn-toolbar">
                <button class="btn btn-primary" onclick="javascript:document:sub_form('insert${table.className}')">
                    <i class="icon-save"></i> 保存
                </button>
                <button class="btn btn-primary" onclick="javascript:window.location.href='${table.objectName}List'">
                    <i class="icon-save"></i> 返回
                </button>
                <div class="btn-group"></div>
            </div>
            <div class="well">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <form id="form" action="insert${table.className}" method="POST">
                            <label>${table.comment}</label>
                            <input type="text" id="${table.primaryKeyO}" name="${table.primaryKeyO}" th:value="<#noparse>${id}</#noparse>" class="input-xlarge">
                            <#list columns as column>
                            <label>${column.comment}</label>
                            <input type="text" id="${column.columnName}" name="${column.columnName}" value="" class="input-xlarge">
                            </#list>
                        </form>
                    </div>
                </div>
            </div>
            <div id="foot"></div>
        </div>
    </div>
</div>
<script>
    $("#head").load("head.html");
    $("#left").load("left.html");
    $("#foot").load("foot.html");
</script>
<script src="lib/bootstrap/js/bootstrap.js"></script>
<script src="My97DatePicker/WdatePicker.js"></script>
<script src="lib/method.js"></script>
<script src="lib/layer/layer.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function() {
        $('.demo-cancel-click').click(function() {
            return false;
        });
    });
</script>
</body>
</html>