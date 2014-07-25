<%-- 
    Document   : showInbox
    Created on : Jul 23, 2014, 11:23:43 AM
    Author     : DucNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inbox Page</title>
    </head>
    <body>
        <h1>All Mail!</h1>
        <table border="1">
            <tr>
                <td>Subject</td>
                <td>Content</td>
            </tr>
            <s:iterator var="m" value="mails">
                <tr>
                    <td><s:property value="#m.sender"/></td>
                    <td><s:property value="#m.subject"/></td>
                    <td><s:property value="#m.content"/></td>
                </tr>
            </s:iterator>
        </table>
    </body>
</html>
