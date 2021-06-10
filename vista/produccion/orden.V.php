<!DOCTYPE html>
<html>

<?php include_once ("../../componente/libreria/libreria.php"); ?>

<head>
    <!-- <meta charset='utf-8'>
    <title>Orden</title>
    <link rel='stylesheet' type='text/css' media='screen' href='../../componente/css/goblal.css'> -->
    <!-- Iconos de las tablas -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
        integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../../componente/fonts/style.css"> -->
    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-beta3/css/bootstrap.min.css"
        integrity="sha512-N415hCJJdJx+1UBfULt+i+ihvOn42V/kOjOpp1UTh4CZ70Hx5bDlKryWaqEKfY/8EYOu/C2MuyaluJryK1Lb5Q=="
        crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-beta3/js/bootstrap.min.js"
        integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw=="
        crossorigin="anonymous"></script> -->
    <script src="../../js/produccion/orden.js"></script>
    <!-- Auto complete -->
    <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
    <!-- Auto complete -->
</head>

<body>
    <form name="frmOrden" id="frmOrden">
        <div class="margen" align="center">
            <h1><label>Orden</label></h1>
            <div class="container form-group">
                <div class="row">
                    <div class="col-12 col-sm-4">
                        <input type="hidden" name="hidIdOrden1" id="hidIdOrden1" value="">
                        <label class="col-form-label">Empleado</label>
                        <input type="hidden" name="hidIdEmpleado1" id="hidIdEmpleado1" value=""><br>
                        <input type="text" name="txtEmpleado1" id="txtEmpleado1" value="" class="caja form-control"
                            placeholder="Empleado">
                    </div>
                    <div class="col-12 col-sm-4">
                        <label class="col-form-label">Cliente</label>
                        <input type="hidden" name="hidIdCliente1" id="hidIdCliente1" value=""><br>
                        <input type="text" name="txtCliente1" id="txtCliente1" value="" class="caja form-control"
                            placeholder="Cliente">
                    </div>
                    <div class="col-12 col-sm-4">
                        <label class="col-form-label">Fecha y hora de orden</label>
                        <input type="datetime-local" name="datFechaOrden1" id="datFechaOrden1" value=""
                            class="caja form-control" placeholder="Fecha orden">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-4">
                        <label class="col-form-label">Fecha y hora de entrega</label>
                        <input type="datetime-local" name="datFechaEntrega1" id="datFechaEntrega1" value=""
                            class="caja form-control" placeholder="Fecha entrega">
                    </div>
                    <div class="col-12 col-sm-4">
                        <label class="col-form-label">Descripción</label>
                        <input type="text" name="txtDescripcion1" id="txtDescripcion1" class="caja form-control" value=""
                            placeholder="Descripción">
                    </div>
                    <div class="col-12 col-sm-4">
                        <label for="cmbEstado1">Estado</label>
                        <select class="lista form-control" id="cmbEstado1">
                            <option value="" selected="selected">--Seleccione--</option>
                            <option value="1">Activo</option>
                            <option value="0">Inactivo</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-3">
                    <input type="button" class="boton form-control btn-light btn-outline-primary" name="btnBuscar"
                        id="btnBuscar" value="BUSCAR"
                        onclick="Enviar1('CONSULTAR',null);">
                </div>
                <div class="col-12 col-sm-3">
                    <input type="button" class="boton form-control btn-light btn-outline-primary" name="btnRegistrar"
                        value="REGISTRAR" id="btnRegistrar"
                        onclick=" Enviar1('ADICIONAR',null);">
                </div>
                <div class="col-12 col-sm-3">
                    <input type="button" class="boton form-control btn-light btn-outline-primary" name="btnModificar"
                        value="MODIFICAR" id="btnModificar"
                        onclick=" Enviar1('MODIFICAR',null);">
                </div>
                <div class="col-12 col-sm-3">
                    <input type="button" class="boton form-control btn-light btn-outline-primary" name="btnLimpiar"
                        value="LIMPIAR" id="btnLimpiar" onclick=" Limpiar1();">
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-12">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Detalle de orden
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                        <div class="modal-header">
                            <script src="../../js/produccion/detalleOrden.js"></script>
                            <h5 class="modal-title" id="staticBackdropLabel">Detalle de orden</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form name="frmDetalleO" id="frmDetalleO">
                                <div class="margen" align="center">
                                    <h1><label>Detalles de orden</label></h1>
                                    <div class="container form-group">
                                        <div class="row">
                                            <div class="col-12 col-sm-4">
                                                <label class="col-form-label">Id de Orden</label>
                                                <input type="hidden" name="hidIdDetalleOrden" id="hidIdDetalleOrden" value=""><br>
                                                <input type="number" name="idOrden" id="idOrden" value="" class="caja form-control"
                                                    placeholder="Orden">
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <label class="col-form-label">Producto</label>
                                                <input type="hidden" name="hidIdProducto" id="hidIdProducto" value=""><br>
                                                <input type="text" name="txtProducto" id="txtProducto" value="" class="caja form-control"
                                                    placeholder="Producto">
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <label class="col-form-label">Cantidad</label>
                                                <input type="number" name="numCantidad" id="numCantidad" value="" class="caja form-control"
                                                    placeholder="Cantidad">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-4">
                                                <label class="col-form-label">Valor inventario</label>
                                                <input type="number" class="caja form-control" name="numValorinven" value="" id="numValorinven"
                                                    placeholder="Valor inventario">
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <label class="col-form-label">Valor venta</label>
                                                <input type="number" class="caja form-control" name="numValorventa" value="" id="numValorventa"
                                                    placeholder="Valor venta">
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <label for="cmbEstado">Estado</label>
                                                <select class="lista form-control" id="cmbEstado">
                                                    <option value="" selected="selected">--Seleccione--</option>
                                                    <option value="1">Activo</option>
                                                    <option value="0">Inactivo</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-2"></div>
                                        <div class="col-12 col-sm-2">
                                            <input type="button" class="boton form-control btn-light btn-outline-primary" name="btnBuscar" id="btnBuscar" value="BUSCAR" onclick="Enviar('CONSULTAR',null);">
                                        </div>
                                        <div class="col-12 col-sm-2">
                                            <input type="button" class="boton form-control btn-light btn-outline-primary" name="btnRegistrar" value="REGISTRAR" id="btnRegistrar" onclick=" Enviar('ADICIONAR',null);">
                                        </div>
                                        <div class="col-12 col-sm-2">
                                            <input type="button" class="boton form-control btn-light btn-outline-primary" name="btnModificar" value="MODIFICAR" id="btnModificar" onclick=" Enviar('MODIFICAR',null);">
                                        </div>
                                        <div class="col-12 col-sm-2">
                                            <input type="button" class="boton form-control btn-light btn-outline-primary" name="btnLimpiar" value="LIMPIAR" id="btnLimpiar" onclick=" Limpiar();">
                                        </div>
                                    </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="table-responsive">
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <td align="center">Id orden</td>
                                                                    <td align="center">Producto</td>
                                                                    <td align="center">Cantidad</td>
                                                                    <td align="center">Valor inventario</td>
                                                                    <td align="center">Valor venta</td>
                                                                    <td align="center">Estado</td>
                                                                    <td align="center">Modificar</td>
                                                                    <td align="center">Eliminar</td>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="resultado">
                                                                <!-- <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td align="center"><a href="#" class="btn btn-warning"><i
                                                                                class="fas fa-edit"></i></a>
                                                                    </td>
                                                                    <td align="center"><a href="#" class="btn btn-danger"><i
                                                                                class="fas fa-trash"></i></a>
                                                                    </td>
                                                                </tr> -->
                                                            </tbody>
                                                        </table>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td align="center">Id Orden</td>
                                    <td align="center">Empleado</td>
                                    <td align="center">Cliente</td>
                                    <td align="center">Fecha orden</td>
                                    <td align="center">Fecha entrega</td>
                                    <td align="center">Descripción</td>
                                    <td align="center">Estado</td>
                                    <td align="center">Modificar</td>
                                    <td align="center">Eliminar</td>
                                </tr>
                            </thead>
                            <tbody id="resultado1">
                                <!-- <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td align="center"><a href="#" class="btn btn-warning"><i
                                                        class="fas fa-edit"></i></a>
                                            </td>
                                            <td align="center"><a href="#" class="btn btn-danger"><i
                                                        class="fas fa-trash"></i></a>
                                            </td>
                                        </tr> -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </form>
</body>

</html>