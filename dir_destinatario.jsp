<%@include file="conexion.jsp" %>
<%--
    Document   : telefono
    Created on : 10/01/2012, 12:37:12 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            String valor = request.getParameter("valor");
            consulta = "SELECT d.direccion,c.idCliente " +
                    "FROM detalleCliente d " +
                    "INNER JOIN cliente c " +
                    "ON c.idCliente=d.idCliente " +
                    "WHERE c.razonSocial=?";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, valor);
            rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>

            <%while (rs.next()) {%>
            <input type="text" value="<%=rs.getString("direccion")%>" size="60" name="treincua_direccion"/>
            <%}conex.close();%>


    </body>
</html>

