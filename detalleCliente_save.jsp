modificado en curso ingles


<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>


<%
String accion = request.getParameter("accion");

String idDetalleCliente =request.getParameter("idDetalleCliente");
String direccion=request.getParameter("direccion");
String telefono=request.getParameter("telefono");
String email=request.getParameter("email");
String descrip=request.getParameter("descrip");
String idCliente=request.getParameter("idCliente");


if(accion.equals("guardar"))
{
consulta="insert into detalleCliente(direccion,telefono,email,descrip,idCliente) values(?,?,?,?,?);";
ps=conex.prepareStatement(consulta);


ps.setString(1, direccion);
ps.setString(2, telefono);
ps.setString(3, email);
ps.setString(4, descrip);
ps.setString(5, idCliente);

    if(ps.executeUpdate()==1){response.sendRedirect("detalleCliente_list.jsp");}
    else{out.print("No es posible guardar Detalle");}
}

else
    if(accion.equals("actualizar") &&(idDetalleCliente.length()>0)&&(direccion.length()>0)){
       consulta="UPDATE detalleCliente set direccion=?,telefono=?,email=?,descrip=?,idCliente=? where idDetalleCliente=?;";
       ps=conex.prepareStatement(consulta);

       ps.setString(1, direccion);
       ps.setString(2, telefono);
       ps.setString(3, email);
       ps.setString(4, descrip);
       ps.setString(5, idCliente);
       ps.setString(6, idDetalleCliente);
    if(ps.executeUpdate()==1){response.sendRedirect("detalleCliente_list.jsp");}
    else{out.print("No es posible actualizar Detalle");}

 
}else
    if(accion.equals("eliminar")){
       consulta="delete from detalleCliente where idDetalleCliente=?";
       ps=conex.prepareStatement(consulta);

       ps.setString(1, request.getParameter("idDetalleCliente"));
       if(ps.executeUpdate()==1){response.sendRedirect("detalleCliente_list.jsp");}
       else{out.print("No es posible eliminar");}
}
else{
    out.print("Accion invalida...");
} 

conex.close();
%>
