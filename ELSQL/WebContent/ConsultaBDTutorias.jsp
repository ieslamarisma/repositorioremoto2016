<%-- BDTutorias.jsp --%>
<%@page contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head><title>Etiquetas SQL</title></head>
<body>
  <%-- Conectar con la base de datos. Resultado: bd  Esto es una linea añadida--%>
  <sql:setDataSource var="bd"
                     driver="com.mysql.jdbc.Driver" 
                     url="jdbc:mysql://localhost:3306/bd_tutorias"
                     user="root"
                     password="" />
  <%-- Realizar una consulta. Resultado: cdr --%>
  
  
  <sql:query var="cdr" dataSource="${bd}" >
    SELECT profesor, dia, hora, alumno 
       FROM profesores, tutorias, citas
       WHERE profesores.id_profesor = tutorias.id_profesor
             AND tutorias.id_tutoria = citas.id_tutoria
  </sql:query>
  
  
  <%-- Mostrar el resultado, cdr, en una tabla --%>
  <table width=100% border=1>
    <%-- Cabeceras --%>
    <tr>
      <th>Alumno</th><th>Día/hora</th><th>Con el profesor</th>
    </tr>
    <%-- Filas --%>
    <c:forEach var="fila" items="${cdr.rows}">
      <tr>
        <td width=40%>${fila.alumno}</td>
        <td width=20%>${fila.dia} a las ${fila.hora}</td>
        <td width=40%>${fila.profesor}</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
