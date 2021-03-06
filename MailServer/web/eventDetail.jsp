<%-- 
    Document   : event
    Created on : Jul 17, 2014, 12:42:03 PM
    Author     : DANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Welcome</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
        <!-- Daterange picker -->
        <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                <img src="img/logo.png"/>
                Stark Institute
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->

                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->

                        <!-- Notifications: style can be found in dropdown.less -->

                        <!-- Tasks: style can be found in dropdown.less -->

                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="../MailServer/login.jsp" class="dropdown-toggle">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>Log in</span>
                            </a>

                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->

                    <!-- search form -->

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="#">
                                <i class="glyphicon glyphicon-calendar"></i> <span>Events</span>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-stats"></i> <span>Result</span>                                
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-download"></i> <span>Admission Form</span>                                
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-user"></i> <span>Staffs</span>                                
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-bullhorn"></i> <span>Jobs</span>                                
                            </a>
                        </li>

                        <li>
                            <a href="../MailServer/contactUs.jsp">
                                <i class="glyphicon glyphicon-comment"></i> <span>Contact us</span>                                
                            </a>
                        </li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Home

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>

                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Small boxes (Stat box) -->

                    <h4 class="page-header">
                        Welcome to Stark Institute
                        <div class="box box-solid">

                            <div class="box-body">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <img src="http://placehold.it/1280x400/39CCCC/ffffff&text=Stark+Institute" alt="First slide">
                                            <div class="carousel-caption">
                                                Welcome to Stark Institute
                                            </div>
                                        </div>
                                        <div class="item">
                                            <img src="http://placehold.it/1280x400/3c8dbc/ffffff&text=Stark+Institute" alt="Second slide">
                                            <div class="carousel-caption">
                                                Welcome to Stark Institute
                                            </div>
                                        </div>
                                        <div class="item">
                                            <img src="http://placehold.it/1280x400/AA3939/ffffff&text=Stark+Institute" alt="Third slide">
                                            <div class="carousel-caption">
                                                Welcome to Stark Institute
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>
                            </div><!-- /.box-body -->
                        </div><!-- /.box -->
                    </h4>
                    <!-- Solid boxes -->
                    <div>
                        <s:set var="e" value="event"/>

                            <div>
                                <!-- Danger box -->
                                <div class="box box-solid box-danger">
                                    <div class="box-header">
                                        <h3 class="box-title"><s:property value="#e.title"/></h3>

                                    </div>
                                    <div class="box-body">
                                        Author: <code><s:property value="#e.author"/></code>
                                        <p>
                                            <s:property value="#e.content"/>
                                        </p>
                                        <s:property value="#e.photo"/>
                                        <s:property value="#e.date"/>
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!-- /.col -->
                        
                    </div>

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Morris.js charts -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="js/plugins/morris/morris.min.js" type="text/javascript"></script>
        <!-- Sparkline -->
        <script src="js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
        <!-- jvectormap -->
        <script src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
        <script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <!-- fullCalendar -->
        <script src="js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
        <!-- jQuery Knob Chart -->
        <script src="js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        <!-- iCheck -->
        <script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>

        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="js/AdminLTE/dashboard.js" type="text/javascript"></script>     

        <!-- AdminLTE for demo purposes -->
        <script src="js/AdminLTE/demo.js" type="text/javascript"></script>

    </body>
</html>
