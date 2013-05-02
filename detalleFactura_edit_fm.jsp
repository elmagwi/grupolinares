<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
 <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
    <%
consulta="select*from detalleFactura where idDetalleFactura=?";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idDetalleFactura"));
rs=ps.executeQuery();
%>

<form action="detalleFactura_save.jsp" method="post">
    <table align="center" id="rounded-corner-list">
                <%if(rs.next()){%>
                <tr>
                    <th class="rounded-company">Cant</th>
                    <th>Descripcion</th>
                    <th>Precio Unit</th>
                    <th class="rounded-q4">Importe</th>
                    
                </tr>
                <tr>
                    <td><input size="4"type="text" value="<%=rs.getString("cantidad")%>" name="txtCantidad"/></td>
                    <td><textarea cols="60" rows="1" name="txtDescripcion"><%=rs.getString("descripcion")%></textarea></td>
                    <td><input size="17" type="text" value="<%=rs.getString("precioUnit")%>" name=""/></td>
                    <td><input size="10"type="text" value="<%=rs.getString("importe")%>" name="txtImporte"/></td>
                    
                </tr>
                <tr>
                    <th colspan="2" class="rounded-foot-left"></th>
                    <th colspan="2" class="rounded-foot-right" align="right">
                        <input size="5"type="submit" value="Actualizar"/>
                    </th>
                </tr>

                <%}%>
            </table>
            <input type="hidden" value="editar" name="accion"/>
            <input type="hidden" value="<%=rs.getString("idDetalleFactura")%>" name="idDetalleFactura"/>
            <input type="hidden" value="<%=rs.getString("idFactura")%>" name="idFactura"/>
     <%conex.close();%>
</form>
    <br><br>
    
    </body>
</html>
