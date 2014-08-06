<%-- 
    Document   : result
    Created on : Aug 6, 2014, 10:21:00 AM
    Author     : DucNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
    </head>
    <body>
        <table class="table table-mailbox">
            <th>
                <td class="name">Email</td>
                <td class="name">Subject</td>
                <td class="time">Date</td>
            </th>
            <s:iterator var="m" value="mails">
                <tr>
                    <td class="small-col"><input type="checkbox" /></td>
                    <td class="name"><a href="<s:url action="viewMailDetail"><s:param name="id" value="#m.id"/></s:url>"><s:property value="#m.sender"/></a></td>
                    <td class="subject"><a href="<s:url action="viewMailDetail"><s:param name="id" value="#m.id"/></s:url>"><s:property value="#m.subject"/></a></td>
                    <td class="time"><s:property value="#m.date"/></td>
                </tr>
            </s:iterator>
        </table>
    </body>
</html>
