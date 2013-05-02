<%@include file="conexion.jsp" %>
<%-- 
    Document   : detalleGuia_edit_fm
    Created on : 26/03/2012, 12:07:35 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <title>Edicion de Detalle de Guia de Remision</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
    </head>
    <body>
        <%
            consulta = "select*from detalleguiaremision where idDetalleGuia=?;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, request.getParameter("idDetalleGuia"));
            rs = ps.executeQuery();
        %>
        <div align="center">
            
        <form action="detalleGuia_save.jsp" method="post">
            <table id="rounded-corner">
                <tr>
                    <th class="rounded-company">Codigo</th>
                    <th>Descripcion</th>
                    <th>Cantidad</th>
                    <th>Unidad de Medida</th>
                    <th class="rounded-q4">Peso Total</th>
                </tr>
                <%if (rs.next()) {%>
                <tr>
                    <td>
                        <input type="text" name="txtCodigo" value="<%=rs.getString("codigo")%>"/>
                    </td>
                    <td>
                        <input type="text" name="txtDescripcion" value="<%=rs.getString("descripcion")%>"/>
                    </td>
                    <td>
                        <input type="text" name="txtCantidad" value="<%=rs.getString("cantidad")%>"/>
                    </td>
                    <td>
                        <input type="text" name="txtUnidMedida" value="<%=rs.getString("unidMedida")%>"/>
                    </td>
                    <td>
                        <input type="text" name="txtPesoTotal" value="<%=rs.getString("pesoTotal")%>"/>
                    </td>
                </tr>
                <%}%>
                <tr>
                    <th colspan="2" class="rounded-foot-left"></th>
                    <th colspan="3" align="right" class="rounded-foot-right">
                        <input type="submit" value="Actualizar"/>
                    </th>
                </tr>
            </table>
                <input type="hidden" name="accion" value="actualizar"/>
                <input type="hidden" name="txtIdGuia" value="<%=rs.getString("idGuia")%>" />
                <input type="hidden" name="txtIdDetalleGuia" value="<%=rs.getString("idDetalleGuia")%>"  />
        </form>
        <br/><br/>
</div>
    </body>
</html>
