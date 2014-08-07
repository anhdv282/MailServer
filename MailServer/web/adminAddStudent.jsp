<%-- 
    Document   : adminAddStudent
    Created on : Aug 1, 2014, 12:02:35 PM
    Author     : DANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administrator</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- DATA TABLES -->
        <link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="admin.html" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                <img src="img/logo.png" />
                Administrator
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i>
                                
                            </a>
                            <ul class="dropdown-menu">
                                
                            </ul>
                        </li>
                        <!-- Notifications: style can be found in dropdown.less -->
                        
                        <!-- Tasks: style can be found in dropdown.less -->
                        
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span><%=session.getAttribute("User").toString()%><i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                                    <p>
                                        <%=session.getAttribute("User").toString()%>
                                        <small>Administrator</small>
                                    </p>
                                </li>
                                <!-- Menu Body -->
                                
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
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
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello,<%=session.getAttribute("User").toString()%></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li >
                            <a href="../MailServer/admin.jsp">
                                <i class="glyphicon glyphicon-calendar"></i><span>Events</span>
                            </a>
                        </li>
                        <li>
                            <a href="<s:url action="viewStaff"/>">
                                <i class="glyphicon glyphicon-user"></i><span>Staffs</span> 
                            </a>
                        </li>
                        <li class="active">
                            <a href="<s:url action="viewStudent"/>">
                                <i class=" glyphicon glyphicon-globe"></i>
                                <span>Students</span>
                            </a>
                        </li>
                        <li>
                            <a href="<s:url action="viewCourse"/>">
                                <i class=" glyphicon glyphicon-book"></i>
                                <span>Course</span>
                            </a>
                        </li>
                        <li>
                            <a href="<s:url action="viewFeedback"/>">
                                <i class=" glyphicon glyphicon-envelope"></i>
                                <span>Feedback</span>
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
                        Add Student
                        
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Add Student</a></li>
                        
                    </ol>
                </section>
                <section class="content">

                    <div class="box box-warning">
                                <div class="box-header">
                                    <h3 class="box-title">General Elements</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <s:form role="form" action="addStudent" method="POST" theme="simple">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Email</label>                                            
                                            <s:textfield cssClass="form-control" placeholder="Enter ..." type="text" name="emailId"/>
                                            <s:fielderror fieldName="emailId" cssStyle="color:red;list-style-type:none;"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <s:textfield cssClass="form-control" placeholder="Enter ..." type="text" name="name"/>
                                            <s:fielderror fieldName="name" cssStyle="color:red;list-style-type:none;"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <s:textfield cssClass="form-control" placeholder="Enter ..." type="text" name="address"/>
                                            <s:fielderror fieldName="address" cssStyle="color:red;list-style-type:none;"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Dob</label>
                                            <s:textfield cssClass="form-control" placeholder="Enter ..." type="text" name="dob"/>
                                            <s:fielderror fieldName="dob" cssStyle="color:red;list-style-type:none;"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Photo</label>
                                            <s:textfield cssClass="form-control" placeholder="Enter ..." type="text" name="photo"/>
                                            <s:fielderror fieldName="photo" cssStyle="color:red;list-style-type:none;"/>
                                        </div>
                                        <div class="box-footer">
                                            
                                        <s:submit cssClass="btn btn-primary" type="submit" value="Submit"/>
                                        </div>   
                                    </s:form>
                                </div><!-- /.box-body -->
                                
                            </div><!-- /.box -->
                </section>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="js/AdminLTE/demo.js" type="text/javascript"></script>
        <!-- page script -->
        

    </body>
</html>

