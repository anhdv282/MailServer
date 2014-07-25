<%-- 
    Document   : sendmail
    Created on : Jul 22, 2014, 9:04:20 PM
    Author     : DucNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Mail Page</title>
    </head>
    <body>
        Hello <%=session.getAttribute("User").toString()%>
        <s:form action="SendMail" method="POST">
            Receiver <s:textfield type="text" name="receiver"/><br/>
            Subject <s:textfield type="text" name="subject"/><br/>
            Content <s:textarea type="text" name="content"/><br/>
            <s:submit type="submit" value="Send"/>
        </s:form>
    </body>
</html>
