<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AdminLTE | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <link href="js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">
    <link href="js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
    <link href="js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
    <link href="js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="js/bootstrap-dialog/dist/css/bootstrap-dialog.css" rel="stylesheet">
    <link href="js/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">
</head>
<body>
<div class="row clearfix">
    <div class="col-md-2 column">
        <div id="tree"> </div>
    </div>
    <div class="col-md-10 column">
        <ul id="myTab" class="nav nav-tabs">
            <li >
                <a href="#home" data-toggle="tab"> 首页</a>
            </li>
        </ul>
        <div class="tab-content">
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap/js/bootstrap.min.js"></script>
<script src="js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
<script src="js/bootStrap-addTabs/bootstrap.addtabs.js"></script>
<script src="js/bootstrap-table/dist/bootstrap-table.js"></script>
<script src="js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<script src="js/bootstrap-fileinput/js/fileinput.js"></script>
<script src="js/bootstrap-fileinput/js/locales/zh.js"></script>
</body>

<script type="text/javascript">
    function getTreeData(){
        var tree_data = "";
        $.ajax({
            url:"/gl/queryTree.do",
            type:"post",
            dataType:"json",
            async:false,
            success:function(data){
                tree_data = data;
            },
            error:function(){
                alert("查询出错");
            }
        });
        return tree_data;
    }
    $(function(){
        $('#tree').treeview(
            {
                data:getTreeData(),
                onNodeSelected:function(event,node){
                    if(node.href != null && node.href != ""){
                        $.ajax({
                            url:node.href,
                            type:"post",
                            success:function(data){
                                $.addtabs.add({
                                    id:node.id,
                                    title:node.text,
                                    content:data,
                                })
                            }
                        })
                    }
                }
            });
    })
</script>
</body>
</html>