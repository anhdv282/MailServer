<%-- 
    Document   : userPanel
    Created on : Aug 7, 2014, 9:56:56 PM
    Author     : DucNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Panel Page</title>
    </head>
    <body>
        <s:if test="#session.User !=null">
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope"></i>                                
                        </a>                            
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
                                    <!--<s:if test='#session.User.accType.equalsIgnoreCase("staff")'>
                                        <a href="<s:url action="viewStaffById"><s:param name="id" value=""/></s:url>" class="btn btn-default btn-flat">Profile</a>
                                    </s:if>
                                    <s:elseif test='#session.User.accType.equalsIgnoreCase("student")'>
                                        <a href="<s:url action="viewStudentById"><s:param name="id" value=""/></s:url>" class="btn btn-default btn-flat">Profile</a>
                                    </s:elseif> -->
                                </div>
                                <div class="pull-right">
                                    <a href="<s:url action="Logout"/>" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </s:if>
        <s:else>
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
        </s:else>
    </body>
</html>
