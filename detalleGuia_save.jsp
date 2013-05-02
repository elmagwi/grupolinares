<%@include file="conexion.jsp" %>
<%-- 
    Document   : detalleGuia_save
    Created on : 25/03/2012, 01:50:47 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edicion de Guia de Remision</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        <%
            String orden = request.getParameter("accion");

            String idGuia = request.getParameter("txtIdGuia");
            String idDetalleGuia = request.getParameter("txtIdDetalleGuia");
            String codigo = request.getParameter("txtCodigo");
            String descripcion = request.getParameter("txtDescripcion");
            String cantidad = request.getParameter("txtCantidad");
            String unidMedida = request.getParameter("txtUnidMedida");
            String pesoTotal = request.getParameter("txtPesoTotal");
            
            if(orden.equals("actualizar")){
            
                consulta="update detalleguiaremision set codigo=?,"
                        + "descripcion=?,cantidad=?,unidMedida=?,"
                        + "pesoTotal=? where idDetalleGuia=?";
                ps=conex.prepareStatement(consulta);
                ps.setString(1, codigo);
                ps.setString(2, descripcion);
                ps.setString(3, cantidad);
                ps.setString(4, unidMedida);
                ps.setString(5, pesoTotal);
                ps.setString(6, idDetalleGuia);
                
                if(ps.executeUpdate()==1){
                
                   %>
                   <h1 align="center">LA ACTUALIZACIÓN SE REALIZÓ CON ÉXITO</h1><br/>
                   <div align="center">
                       <a href="guia_edit_fm.jsp?idGuia=<%=idGuia%>"><button type="button">Volver</button></a>
                   </div>
                   <%
                }
            }
            
       /*     
            out.print(idGuia);
            out.print("<br>");
            out.print(idDetalleGuia);
            out.print("<br>");
            out.print(codigo);
            out.print("<br>");
            out.print(descripcion);
            out.print("<br>");
            out.print(cantidad);
            out.print("<br>");
            out.print(unidMedida);
            out.print("<br>");
            out.print(pesoTotal);
            out.print("<br>");
  */
        %>
    </body>
</html>
