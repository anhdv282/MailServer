<%-- 
    Document   : changePass
    Created on : Aug 6, 2014, 9:17:41 AM
    Author     : DANG
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html class="bg-blue">
    <head>
        <meta charset="UTF-8">
        <title>Change Password</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-blue">

        <div class="form-box" id="login-box">
            <div class="header">Change Password</div>
            
            <s:form action="changePass" method="POST" theme="simple">
                <div class="body bg-gray">

                    <div class="form-group">
<!--                        <input type="password" name="password" class="form-control" placeholder="Password"/>-->
                        <s:password type="password" name="pass" cssClass="form-control" placeholder="Your Password"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="RePassword"/>
                        <%--<s:password type="password" name="newPass" cssClass="form-control" placeholder="Retype your Password"/>--%>
                    </div>

                </div>
                <div class="footer">                                                               
<!--                    <button type="submit" class="btn bg-olive btn-block">Sign me in</button>  -->
                    <s:submit value="Change" cssClass="btn bg-olive btn-block" type="submit"/>
                    
                </div>
            </s:form>
            

            <div class="margin text-center">
                
            </div>
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>

