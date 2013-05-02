<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>
<html>
    <head>
   <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
    </head>
    <body>
     <%
String orden=request.getParameter("accion");
String idFac=request.getParameter("idFactura");
String idDetalleFactura=request.getParameter("idDetalleFactura");
String descripcion =request.getParameter("txtDescripcion");
String cantidad=request.getParameter("txtCantidad")==null ? "" : request.getParameter("txtCantidad");
String importe=request.getParameter("txtImporte")==null ? "" : request.getParameter("txtImporte");

if(orden.equals("editar")){

consulta="update detalleFactura set descripcion=?,cantidad=?,importe=? " +
            "where idDetalleFactura=?";
ps=conex.prepareStatement(consulta);

ps.setString(1,descripcion);
ps.setString(2,cantidad);
ps.setString(3,importe);
ps.setString(4,idDetalleFactura);

if(ps.executeUpdate()==1){
    out.println("<h1 align='center'>Se realizo con exito la actualización</h1>");
    %>
    <div align="center">
    <a href="factura_edit_fm.jsp?idFactura=<%=idFac%>"><button type="button">Regresar</button></a>
    </div>
    <%}%>
<%}

conex.close();
%>

    </body>
</html>

