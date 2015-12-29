<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NEW PRODUCT</title>

    <link href="/resources/adminka/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/adminka/css/datepicker3.css" rel="stylesheet">
    <link href="/resources/adminka/css/styles.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/resources/adminka/js/html5shiv.js"></script>
    <script src="/resources/adminka/js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!--logo-->
<jsp:include page="/resources/adminka/menu/logo.jsp" />
<!--/.logo-->

<!/.sidebar-->
<jsp:include page="/resources/adminka/menu/menu_l.jsp" />
<!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">Dashboard</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Create New</h1>
        </div>
    </div><!--/.row-->

    <div class="row">
        <div class="col-xs-12 col-md-6 col-lg-3">
            <sf:form method="POST" modelAttribute="product" action="/adminka/add">
                <fieldset>
                    <table cellspacing="0">
                        <tr>
                            <th><label for="url">url:</label></th>
                            <td><sf:input path="url" size="50" id="url"/></td>
                        </tr>
                        <tr>
                            <th><label for="typeId">Type:</label></th>
                            <td>
                                <sf:select path="typeId" class="form-control" id="gender" >
                                    <sf:options items="${selectType}" />
                                </sf:select>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="artical">artical:</label></th>
                            <td><sf:input path="artical" size="50" id="artical"/></td>
                        </tr>
                        <tr>
                            <th><label for="name">name:</label></th>
                            <td><sf:input path="name" size="50" id="name"/></td>
                        </tr>
                        <tr>
                            <th><label for="price">price:</label></th>
                            <td><sf:input path="price" size="50" id="price"/></td>
                        </tr>
                        <tr>
                            <th><label for="mainBrandAutoId">zavod:</label></th>
                            <td>
                                <sf:select path="mainBrandAutoId" class="form-control" id="gender" >
                                    <sf:options items="${selectBrandAuto}" />
                                </sf:select>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="description">description:</label></th>
                            <td><sf:textarea path="description" cols="50" rows="15" id="description"/></td>
                        </tr>
                        <tr>
                            <th><label for="suitableModel">description:</label></th>
                            <td><sf:textarea path="suitableModel" cols="30" rows="5" id="suitableModel"/></td>
                        </tr>
                        <tr>
                            <th><label for="video">video:</label></th>
                            <td><sf:input path="video" size="50" id="video"/></td>
                        </tr>
                        <tr>
                            <th><label for="manufacturerId">zavod:</label></th>
                            <td>
                                <sf:select path="manufacturerId" class="form-control" id="gender" >
                                    <sf:options items="${selectManufacturer}" />
                                </sf:select>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="availabilityId">zavod:</label></th>
                            <td>
                                <sf:select path="availabilityId" class="form-control" id="gender" >
                                    <sf:options items="${selectAvailability}" />
                                </sf:select>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="Update"/>
                </fieldset>
            </sf:form>
        </div>

    </div><!--/.row-->



</div><!--/.row-->


</div>	<!--/.main-->

<script src="/resources/adminka/js/jquery-1.11.1.min.js"></script>
<script src="/resources/adminka/js/bootstrap.min.js"></script>
<script src="/resources/adminka/js/chart.min.js"></script>
<script src="/resources/adminka/js/chart-data.js"></script>
<script src="/resources/adminka/js/easypiechart.js"></script>
<script src="/resources/adminka/js/easypiechart-data.js"></script>
<script src="/resources/adminka/js/bootstrap-datepicker.js"></script>
<script>
    $('#calendar').datepicker({
    });

    !function ($) {
        $(document).on("click","ul.nav li.parent > a > span.icon", function(){
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
</script>
</body>

</html>
