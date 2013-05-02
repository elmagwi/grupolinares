<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%

    if (request.getParameter("textoOpc") != null) {
        String orden = request.getParameter("opc");
        if (orden.equals("1")) {
            consulta = "select idGuia,serie,nroGuia,login,"
                    + "puntoPartida,puntoLlegada,fechaTraslado,"
                    + "totCantidad,totPesoTot,estado "
                    + "from guia_remision where nroGuia like ?;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoOpc") + "%");
            rs = ps.executeQuery();
        } else if (orden.equals("2")) {
            consulta = "select idGuia,serie,nroGuia,login,"
                    + "puntoPartida,puntoLlegada,fechaTraslado,"
                    + "totCantidad,totPesoTot,estado "
                    + "from guia_remision where fechaTraslado like ?;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoOpc") + "%");
            rs = ps.executeQuery();
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script type="text/javascript">
            ver=function(direccion)
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:direccion,
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedor').html(msj);
                        $('#contenedor').toggle("normal");

                    }
                });

            }


        </script>
    </head>
    <body>

        <div align="center" >
            <h3>GUIA DE REMISION</h3>
            &nbsp;<a href="registrarVentaGuia.jsp" title="Nueva Guia de Remision"><img alt="" src="../imagenes/icons/add.png" height="38" width="38"/></a>&nbsp;
            &nbsp;<a href="detalleGuia_list.jsp" title="Buscar Guias de Remision"><img alt="" src="../imagenes/icons/search.png" style="margin-bottom: -3px" height="40" width="40"/></a>&nbsp;

            <br><br>       
        </div>

        <br>
        <div align="center">
            <form action="detalleGuia_search.jsp" method="get">
                <table id="rounded-corner">
                    <tr id="rounded-buscar">
                        <th class="rounded-company" colspan="2"></th>
                        <th class="rounded-q4" colspan="2"></th>
                    </tr>
                    <tr>
                        <th width="100">Buscar por:</th>
                        <th width="100">
                            <select name="opc">
                                <option value="1">Numero de Guia</option>
                                <option value="2">Fecha de Guia</option>
                            </select>
                        </th>
                        <th width="45"><input type="text" name="textoOpc" size="30"/></th>
                        <th>
                            <button type="submit" title="Buscar">
                                <img alt=""src="../imagenes/icons/buscar.gif" height="16" width="16"/>
                            </button>
                        </th>
                    </tr>
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-foot-left"></th>
                        <th colspan="2" class="rounded-foot-right"></th>
                    </tr>
                </table>
            </form>
            <div class="style1" id="contenedor" style="display:none" ></div>
            <br>
            <table id="rounded-corner">
                <tr>
                    <th colspan="3" class="rounded-company"></th>
                    <th colspan="4">
                        LISTA DE GUIAS DE REMISION
                    </th>
                    <th colspan="3" class="rounded-q4"></th>
                </tr>
                <tr>
                    <th>Id</th>
                    <th>Numero</th>
                    <th>Partida</th>
                    <th>Llegada</th>
                    <th>Fecha Traslado</th>
                    <th>Cantidad</th>
                    <th>Peso Total</th>
                    <th>Usuario</th>
                    <th>Estado</th>
                    <th>Opciones</th>
                </tr>
                <%while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString("idGuia")%></td>
                    <td><%=rs.getString("serie")%>&nbsp;&nbsp;
                        <%=rs.getString("nroGuia")%>
                    </td>
                    <td><%=rs.getString("puntoPartida")%></td>
                    <td><%=rs.getString("puntoLlegada")%></td>
                    <td><%=rs.getString("fechaTraslado")%></td>
                    <td><%=rs.getString("totCantidad")%></td>
                    <td><%=rs.getString("totPesoTot")%></td>
                    <td><%=rs.getString("login")%></td>
                    <td align="center">
                        <%
                            if (rs.getString("estado").equals("CORRECTO")) {
                        %>
                        <a href="guia_save_opc.jsp?accion=anular&idGuia=<%=rs.getString("idGuia")%>" title="Anular Guia"
                           onclick="return confirm('Va a Anular esta Guia de Remision')">
                            <img alt="" src="../imagenes/icons/tick.png">
                        </a>
                        <%} else if (rs.getString("estado").equals("ANULADO")) {%>
                        <a href="guia_save_opc.jsp?accion=activar&idGuia=<%=rs.getString("idGuia")%>" title="Activar Guia"
                           onclick="return confirm('Va a Activar esta Guia de Remision')">
                            <img alt="" src="../imagenes/icons/publish_x.png">
                        </a>
                        <%} else if (rs.getString("estado").equals("")) {%>
                        <a href="guia_save_opc.jsp?accion=anular&idGuia=<%=rs.getString("idGuia")%>" title="Anular Guia"
                           onclick="return confirm('Va a Anular esta Guia de Remision')">
                            <img alt="" src="../imagenes/icons/tick.png">
                        </a>
                        <%}%>
                    </td>
                    <td align="center">
                        <a href="#" onclick="ver('guia_view.jsp?idGuia=<%=rs.getString("idGuia")%>')" title="Ver">
                            <img alt="" src="../imagenes/icons/view.gif" />
                        </a>&nbsp;
                        <a href="guia_edit_fm.jsp?idGuia=<%=rs.getString("idGuia")%>">
                            <img src="../imagenes/icons/edit_f2.png" alt=""/>
                        </a>
                    </td>


                </tr>
                <%}
                    conex.close();%>
            </table>
        </div>









        <br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br>

    </body>
</html>
