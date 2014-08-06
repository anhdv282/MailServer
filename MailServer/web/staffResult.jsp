<%-- 
    Document   : staffResult
    Created on : Aug 6, 2014, 1:20:33 PM
    Author     : DucNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Result Page</title>
    </head>
    <body>
        <table id="example1" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Adddress</th>
                    <th>Photo</th>
                    <th>DOB</th>
                </tr>
            </thead>
            <tbody>
               <s:iterator var="c" value="lst">
                <tr>
                    <td><a href="<s:url action="viewStaffById"><s:param name="id" value="#c.id"/></s:url>"><s:property value="#c.name"/></a></td>
                    <td><s:property value="#c.emailId"/></td>
                    <td><s:property value="#c.address"/></td>
                    <td><s:property value="#c.photo"/></td>
                    <td><s:property value="#c.dob"/></td>
                </tr>
                </s:iterator>
            </tbody>
        </table>
    </body>
</html>
