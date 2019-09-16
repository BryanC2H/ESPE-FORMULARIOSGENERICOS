<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>        
    <head>
        <meta name="description" content="Guia 1 HTML/JavaScript - ADSI 259128"/>
        <%      out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>

        <script>
            /*function valMatriz(fil, col){
             if(fil>5){
             alert('A sobrepasado el tamaño máximo permitido')
             }else if(col>5){
             alert('A sobrepasado el tamaño máximo permitido')
             }else if(fil>5 && col>5){
             alert('A sobrepasado el tamaño máximo permitido')
             }else{
             genMatrices(fil, col);
             }
             }*/
            function genMatrices(fil, col) {
                                c = new String();
                                e = document.getElementById('Matriz');
                                c += '<table name"tblMatriz" id="tblMatriz" border=1>';
                                c += '<tr>';
                    
                                c += '<td align="center" valing="middle">';
                                c += '<table name="tblMtz">';
                                for (i = 0; i <= fil; i++) {
                                        c += '<tr>';
                                        for (j = 0; j <= col; j++) {
                                                c += '<td><input type="text" name=' + i + j + ' id=' + i + j + ' size="30" maxlength="30" placeholder=' + i + j + '></td>';
                                        }
                                        c += '</tr>';
                                }
                                c += '</table>';
                                c += '</td>';
                                e.innerHTML = c;     
                        }
        </script>
    </head>
    <body>
        <div class="row bg-default">
            <div class="col-md-2"><center><img src="Imagenes/espelogo.jpg"/></center></div> -->
            <div class="col-md-8"><center><h1>Formularios</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">
                <button align="center" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Volver"> <div class="col-md-3"><a href="pregunta.jsp" ><i class='	fas fa-arrow-left' style='font-size:40px;color:white'></i></a></button>
        </ul>
        <form action="nuevaMatriz.jsp" name="frmArreglo" id="frmArreglo">
            <hr/>
            <h2 align="center"><strong><h3 class="text-success">DESCRIPCION MATRIZ</h3></strong></h2>
            <table align="center" border="3">
                <tr>
                    <td>
                        <table>
                            <tr>
                            <div class="col-md-6"><h5>Descripcion de la Matriz: </h5></div>
                            <div class="col-md-6"><center><input id="descripcion" type="text" name="descripcion" class="form-control" placeholder="DESCRIPCION MATRIZ" required/></center></div>
                </tr>

            </table></td>
    </tr>
</table>
<h2 align="center"><strong><h3 class="text-success">INGRESO DE MATRICES</h3></strong></h2>
<table align="center" border="3">
    <tr>
        <td>
            <table>
                <tr>
                    <td align="center" colspan="4"><b>MATRIZ A GENERAR</b></td>
                </tr>
                <tr>
                    <td><strong>Filas:</strong></td><td>
                        <div class="col-md-6"><center><input id="filas" type="number" name="filas" class="form-control-label" placeholder="numero de filas" required/></center></div>


                        </div>
                    </td>
                    <td><strong>Columnas:</strong></td><td>
                        <div class="col-md-6"><center><input id="columnas" type="number" name="columnas" class="form-control-label" placeholder="numero de columnas" required/></center></div>

                        </div>
                    </td>
                </tr>

            </table></td>
    </tr>
</table>

<br />
<div align="center">
    <button class="btn btn-success" type="submit" name="Submit" value="guardar"><strong>Aceptar</strong></button>
</div>
<br/>
<div id="Matriz">
</div>
</form>
</body>
</html>
