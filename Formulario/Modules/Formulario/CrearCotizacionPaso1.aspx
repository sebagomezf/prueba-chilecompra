<%@ Page Language="vb" EnableEventValidation="false" AutoEventWireup="false" CodeBehind="CrearCotizacionPaso1.aspx.vb" Inherits="Formulario.CrearCotizacionPaso1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Crear Solicitud de Cotización</title>
    
    <!-- Bootstrap v4.4.1 -->
    <link type="text/css" rel="Stylesheet" href="../../Content/bootstrap.min.css" />

    <!-- FONT-AWESOME 5.13.0 -->
    <link type="text/css" rel="Stylesheet" href="../../Content/fontawesome-all.min.css" />

    <!-- DATETIMEPICKER -->
    <link type="text/css" href="../../Includes/styles/datetimepicker-css/bootstrap-datetimepicker.min.css" rel="Stylesheet" />
    <link type="text/css" href="../../Includes/styles/datetimepicker-css/bootstrap-datetimepicker-standalone.css" rel="Stylesheet" />

    <!-- SELECT 2 -->
    <link type="text/css" href="../../Content/plugins/select2/select2.min.css" rel="Stylesheet" />

    <!-- Base de css desde proyecto Registro -->
    <link type="text/css" rel="Stylesheet" href="../../Content/Custom/animations.css" />
    <link type="text/css" rel="Stylesheet" href="../../Content/Custom/layout-registro.css" />
    <link type="text/css" rel="Stylesheet" href="../../Content/Custom/modal.css" />

    <!-- Al final de este archivo agregar cualquier css que sea valido para todo el modulo -->
    <link type="text/css" rel="Stylesheet" href="../../Content/Custom/main.css?v=0" />
</head>
<body onload="window_onload();">
    <div id="container-content" class="container">
        <div class="d-flex flex-md-row content-form row slide-fade-up">
            <!-- BREADCRUMB -->
            <div class="breadcrumb-section col-md-12 col-xs-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Crear Formulario</li>
                    </ol>
                </nav>
            </div>

            <!-- TITULO PÁGINA Y ENCABEZADO -->
            <div class="col-md-12 head">
                <p class="text-gray">PASO 1 DE 2</p>
                <h2 class="content-title mb-0">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </h2>
                <h4 class="font-weight-normal">Una vez publicada la solicitud, se le informará a todos los proveedores que ofertan los productos o servicios.</h4>
            </div>

            <!-- COMIENZA EL FORMULARIO -->
            <form id="form1" runat="server" class="col-md-12 form-chilecompra">
                <!-- ID DE LA COTIZACIÓN -->
                <!-- La visibilidad de este campo depende de si es una nueva cotización o se esta editando una ya existente -->
                <div class="col-md-9 border-top py-3 px-4" runat="server" id="divQuote">
                    <div class="form-group row">
                        <asp:Label ID="lblExternalCode" runat="server" CssClass="col-md-3 col-sm-12 col-form-label form-label-chilecompra" Text="ID de cotización"></asp:Label>

                        <div class="col-md-7 col-sm-12">
                            <asp:Label ID="lblExternalCodeQuote" runat="server" CssClass="form-label-chilecompra font-weight-regular"></asp:Label>
                            <input id="hdnQuote" runat="server" type="hidden" />
                        </div>
                    </div>
                </div>

                <!-- NOMBRE DE LA COTIZACIÓN -->
                <div class="col-md-9 border-top py-3 px-4">
                    <div class="form-group row">
                        <asp:Label ID="lblNameQuote" runat="server" CssClass="col-md-3 col-sm-12 col-form-label form-label-chilecompra required">Nombre de la cotización&nbsp;</asp:Label>

                        <div class="col-md-7 col-sm-12">
                            <asp:TextBox ID="txtNameQuote" MaxLength="200" runat="server" CssClass="form-control"></asp:TextBox>

                            <div class="invalid-feedback mt-0">
                                <ul class="m-0 list-unstyled">
                                    <li class="d-none">
                                        <asp:RequiredFieldValidator ID="rfvNameQuote" runat="server" ControlToValidate="txtNameQuote" Text="Debe ingresar nombre de la cotización" ValidationGroup="next"></asp:RequiredFieldValidator>
                                    </li>
                                </ul>
                            </div>

                            <p class="input-description mb-0 mt-1">
                                <label class="mb-0">Este será el nombre que verán los proveedores al momento de cotizar.</label>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- DESCRIPCIÓN DE LA COTIZACIÓN -->
                <div class="col-md-9 border-top py-3 px-4">
                    <div class="form-group row">
                        <asp:Label ID="lblDescriptionQuote" runat="server" CssClass="col-md-3 col-sm-12 col-form-label form-label-chilecompra required">Descripción de la cotización&nbsp;</asp:Label>

                        <div class="col-md-7 col-sm-12">
                            <asp:TextBox ID="txtDescriptionQuote" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>

                            <p class="input-description mb-0 mt-1 d-flex">
                                <label class="mb-0 mr-1">Ingresa una descripción breve que explique de qué se trata este llamado a cotizar.</label>
                                <label class="mb-0 text-right ml-1" id="countChars">500/500</label>
                            </p>

                            <div class="invalid-feedback mt-0">
                                <ul class="m-0 list-unstyled">
                                    <li class="d-none">
                                        <asp:RequiredFieldValidator ID="rfvDescriptionQuote" runat="server" ControlToValidate="txtDescriptionQuote" SetFocusOnError="True" Text="Debe ingresar descripción de la cotización" ValidationGroup="next"></asp:RequiredFieldValidator>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- FECHA DE CIERRE -->
                <div class="col-md-9 border-top py-3 px-4">
                    <div class="form-group row">
                        <div class="col-md-3 col-sm-12 col-form-label">
                            <asp:Label ID="lblElectronicTo" runat="server" CssClass="form-label-chilecompra required d-block">Fecha de cierre&nbsp;</asp:Label>
                            <label class="label-description font-italic mt-1">Te recomendamos seleccionar un día hábil.</label>
                        </div>

                        <div class="col-md-7 col-sm-12">
                            <div class="d-flex">
                                <div class="inner-addon right-addon w-50 mr-1">
                                    <asp:TextBox ID="Electronic_To" CssClass="form-control" runat="server"></asp:TextBox>
                                    <span class="far fa-calendar-alt open-datetimepicker-Electronic_To"></span>
                                </div>

                                <div class="inner-addon right-addon w-50 ml-2">
                                    <asp:TextBox ID="txtToTime" runat="server" MaxLength="5" CssClass="form-control"></asp:TextBox>
                                    <span class="far fas fa-clock input-group-addon open-txtToTime"></span>

                                    <div class="invalid-feedback mt-0">
                                        <ul class="m-0 list-unstyled">
                                            <li class="d-none">
                                                <asp:RegularExpressionValidator ID="revElectronicToTime" runat="server" ControlToValidate="txtToTime" ErrorMessage="Hora no válida" SetFocusOnError="False" ValidationExpression="^(0[0-9]|1\d|2[0-3]|[0-9]):([0-5]\d)$" ValidationGroup="next"></asp:RegularExpressionValidator>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="invalid-feedback mt-0">
                                <ul class="m-0 list-unstyled">
                                    <li class="d-none">
                                        <asp:RegularExpressionValidator ID="revElectronicTo" runat="server" ControlToValidate="Electronic_To" SetFocusOnError="True" Text="Formato Fecha (dd/mm/yyyy)" ValidationGroup="next"></asp:RegularExpressionValidator>
                                    </li>
                                    <li class="d-none">
                                        <asp:RequiredFieldValidator ID="rfvElectronicTo" runat="server" ControlToValidate="Electronic_To" SetFocusOnError="True" Text="Debe ingresar fecha de cierre" ValidationGroup="next"></asp:RequiredFieldValidator>
                                    </li>
                                    <li class="d-none">
                                        <asp:CustomValidator ID="cvFecga" runat="server" OnServerValidate="ServerValidation" SetFocusOnError="true" ControlToValidate="Electronic_To" ValidationGroup="next"></asp:CustomValidator>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblDateTimeMessage" runat="server"></asp:Label>
                                    </li>
                                </ul>
                            </div>

                            <p class="input-description mb-0 mt-1 w-50">
                                <asp:Label runat="server" ID="lblExampleElectronicDateTo" CssClass="mb-0" Text="Ejemplo: 17/09/2009"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- PLAZO DE ENTREGA -->
                <div class="col-md-9 border-top py-3 px-4">
                    <div class="form-group row">
                        <div class="col-md-3 col-sm-12 col-form-label">
                            <asp:Label ID="lblPlazoEntrega" runat="server" CssClass="form-label-chilecompra required d-block">Plazo de entrega&nbsp;</asp:Label>
                            <label class="label-description font-italic mt-1">Días hábiles referenciales.</label>
                        </div>

                        <div class="col-md-7 col-sm-12">
                            <div class="inner-addon right-addon w-25 mr-1" style="min-width: 125px;">
                                <asp:TextBox ID="txtPlazoEntrega" runat="server" CssClass="form-control"></asp:TextBox>
                                <span class="far far-right-days">|&nbsp;&nbsp;días&nbsp;</span>
                            </div>

                            <div class="invalid-feedback mt-0">
				                <ul class="m-0 list-unstyled">
					                <li class="d-none">
                                        <asp:RequiredFieldValidator ID="rfvPlazoEntrega" runat="server" ControlToValidate="txtPlazoEntrega" SetFocusOnError="True" Text="Debe ingresar un plazo de entrega" ValidationGroup="next"></asp:RequiredFieldValidator>
					                </li>
				                </ul>
			                </div>

                            <p class="input-description mb-0 mt-1">
                                <label class="mb-0">Selecciona el plazo de ejecución o entrega una vez aceptada la orden de compra.</label>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- MONTO TOTAL DISPONIBLE -->
                <div class="col-md-9 border-top py-3 px-4">
                    <div class="form-group row">
                        <div class="col-md-3 col-sm-12 col-form-label">
                            <asp:Label ID="lblMontoTotalDisponible" runat="server" CssClass="form-label-chilecompra required d-block">Monto total estimado disponible&nbsp;</asp:Label>
                            <label class="label-description font-italic mt-1">Monto referencial</label>
                        </div>

                        <div class="col-md-9 col-sm-12">
                            <div class="row ml-0">
                                <div class="input-group group-currency bg-white mr-2">
                                    <div class="inner-addon left-addon bg-white">
                                        <asp:TextBox ID="txtMontoTotalDisponible" CssClass="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                        <span id="lblMonedaSign" class="fas fa-dollar-sign moneda-symbol"></span>
                                    </div>
                                
                                    <div class="separator separator-left my-2 bg-white">&nbsp;</div>

                                    <!-- MONEDA -->
                                    <div class="input-group-append bg-white">
                                        <label class="wrap bg-white">
                                            <asp:DropDownList ID="ddlMoneda" runat="server" ViewStateMode="Enabled" CssClass="form-control dropdown text-gray" onchange="Moneda(this);">
                                        </asp:DropDownList>
                                            <span class="fas fa-chevron-down" aria-hidden="true"></span>
                                        </label>
                                    </div>
                                </div>

                                <div id="divMontoCalculado">
                                    <p class="mb-0 fnt-14">Monto referencial calculado en pesos $ <asp:Label ID="lblMontoCalculado" runat="server"></asp:Label></p>
                                    <p class="text-gray mb-0 fnt-14">Tipo de cambio: $<asp:Label ID="lblMontoCambio" runat="server"></asp:Label> con fecha <asp:Label ID="lblFechaCambio" runat="server"></asp:Label></p>
                                </div>
                            </div>
                            
                            <div class="invalid-feedback mt-0">
                                <ul class="m-0 list-unstyled">
                                    <li class="d-none">
                                        <asp:RequiredFieldValidator ID="rfvMontoTotalDisponible" runat="server" ControlToValidate="txtMontoTotalDisponible" Text="Debe ingresar un monto total disponible"></asp:RequiredFieldValidator>
                                    </li>
                                </ul>
                            </div>

                            <p class="input-description mt-1 mb-0">
                                <label>El monto no podrá superar las 30 UTM.</label>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- CONTACTO PARA ESTA COTIZACIÓN -->
                <h3 class="mb-3">Contacto para esta cotización</h3>

                <!-- NOMBRE DEL CONTACTO -->
                <div class="col-md-9 border-top py-3 px-4">
                    <div class="form-group row">
                        <asp:Label ID="lblContactName" runat="server" CssClass="col-md-3 col-sm-12 col-form-label form-label-chilecompra required">Nombre del contacto&nbsp;</asp:Label>
                        <div class="col-md-7 col-sm-12">
                            <asp:TextBox ID="txtContactName" MaxLength="200" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="invalid-feedback mt-0">
                                <ul class="m-0 list-unstyled">
                                    <li class="d-none">
                                       <asp:RequiredFieldValidator ID="rfvContactName" runat="server" ControlToValidate="txtContactName" SetFocusOnError="True" Text="Debe ingresar un nombre de contacto" ValidationGroup="next"></asp:RequiredFieldValidator>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- TELEFONO DEL CONTACTO -->
                <div class="col-md-9 border-top py-3 px-4">
                    <div class="form-group row">
                        <asp:Label ID="lblContactPhone" runat="server" CssClass="col-md-3 col-sm-12 col-form-label form-label-chilecompra required">Teléfono de contacto&nbsp;</asp:Label>

                        <div class="col-md-7 col-sm-12">

                        
                            <asp:TextBox ID="txtContactPhone" MaxLength="15" runat="server" CssClass="form-control" placeholder="+56"></asp:TextBox>
                            <div class="invalid-feedback mt-0">
                                <ul class="m-0 list-unstyled">
                                    <li class="d-none">
                                        <asp:RequiredFieldValidator ID="rfvContactPhone" runat="server" ControlToValidate="txtContactPhone" SetFocusOnError="True" Text="Debe ingresar un teléfono de contacto" ValidationGroup="next" ></asp:RequiredFieldValidator>   
                                    </li>
                                </ul>
                            </div>


                             <p class="input-description mt-1 mb-0">
                                <label>Ejemplo: +56 2 4256 3212</label>
                            </p>
                        </div>

                    </div>
                </div>


                <!-- MAIL DEL CONTACTO -->
                <div class="col-md-9 border-top py-3 px-4">
                    <div class="form-group row">
                        <asp:Label ID="lblContactEmail" runat="server" CssClass="col-md-3 col-sm-12 col-form-label form-label-chilecompra required">Mail del contacto&nbsp;*</asp:Label>
                        
                        <div class="col-md-7 col-sm-12">

                             <asp:TextBox ID="txtContactEmail" MaxLength="200" runat="server" CssClass="form-control"></asp:TextBox>

                            <div class="invalid-feedback mt-0">
                                <ul class="m-0 list-unstyled">
                                    <li class="d-none">
                                       <asp:RequiredFieldValidator ID="rfvContactEmail" runat="server" ControlToValidate="txtContactEmail" SetFocusOnError="True" Text="Debe ingresar un mail de contacto" ValidationGroup="next"></asp:RequiredFieldValidator>
                                       <asp:RegularExpressionValidator ID="revContactEmail" runat="server" ControlToValidate="txtContactEmail" ErrorMessage="Mail no válido" SetFocusOnError="False" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="next"></asp:RegularExpressionValidator>
                                       </li>
                                </ul>
                            </div>


                             <p class="input-description mt-1 mb-0">
                                <label>Ejemplo: juan@empresa.cl</label>
                            </p>

                        </div>

                    </div>
                </div>


                <!-- ERRORES NO CONTROLADOS -->
                <div class="col-md-9 py-3 px-4 text-center">
                    <div class="invalid-feedback mt-0">
                        <ul class="m-0 list-unstyled">
                            <li>
                                <asp:Label ID="lblMessage" runat="server" Font-Bold="False"></asp:Label>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- BOTONES DE ABAJO -->
                <div class="col-md-12 col-lg-9 mb-5 d-flex justify-content-between align-items-center flex-column flex-md-row flex-wrap border-top py-3">
                    <div class="w-100 w-md-25 w-xl-50">
                        <asp:Button CssClass="btn btn-chilecompra-outline btn-default py-2 px-5 my-2 w-100 w-md-75 w-xl-50" ID="btnVolver" runat="server" Text="Volver" ToolTip="Volver a Busqueda de Cotizaciones" CausesValidation="false"></asp:Button>
                    </div>
                    <div class="d-flex flex-column flex-md-row align-items-center justify-content-end w-100 w-md-50 w-lg-75 w-xl-50">
                        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-chilecompra btn-default py-2 px-5 my-2 w-100 w-md-50" Text="Guardar Borrador" CausesValidation="true" />
                        <asp:Button runat="server" ID="btnNext" CssClass="btn btn-chilecompra btn-primary py-2 px-5 my-2 ml-md-2 w-100 w-md-33 w-xl-50" Text="Siguiente" CausesValidation="true" />
                    </div>
                </div>
                
                
            </form>
        </div>
    </div>

    <!-- MODAL CONFIRMACION -->
    <div class="modal fade" id="modalConfirmacion" role="dialog" tabindex="-1" aria-hidden="true" runat="server">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header pb-2">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnCloseModalConfirmacion" runat="server">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body py-0">
                    <div class="text-center circle-icon circle-icon-success mx-auto mb-3">
                        <i class="fas fa-check text-success"></i>
                    </div>
                    <p class="style1 text-center">
                        <asp:Label ID="lblModalBody1" runat="server"></asp:Label>
                        <asp:Label ID="lblModalBody2" runat="server"></asp:Label>
                    </p>
                    <p class="style2 text-center text-uppercase" runat="server" id="paragraphOptionalModal">
                        <asp:Label ID="lblModalBody3" runat="server"></asp:Label>
                    </p>
                </div>
                <div class="modal-footer text-center pb-4">
                    <a id="btnModalFooterOutline" type="button" class="btn btn-chilecompra-outline btn-primary py-2 px-5" data-dismiss="modal" runat="server">
                        <asp:Label ID="lblBtnFooterOutline" runat="server"></asp:Label>
                    </a>

                    <a id="btnModalFooter" type="button" class="btn btn-chilecompra btn-primary py-2 px-5" data-dismiss="modal" runat="server">
                        <asp:Label ID="lblBtnFooter" runat="server"></asp:Label>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL ERROR -->
    <div class="modal fade" id="modalError" role="dialog" tabindex="-1" aria-hidden="true" runat="server">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header pb-2">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnCloseModalError" runat="server">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body py-0">
                    <div class="text-center circle-icon circle-icon-danger mx-auto mb-3">
                        <i class="fas fa-times text-danger"></i>
                    </div>
                    <p class="style1 text-center">
                        <asp:Label ID="lblModalErrorBody1" runat="server"></asp:Label>
                    </p>
                    <p class="style2 text-center text-uppercase" runat="server" id="paragraphOptionalModalError">
                        <asp:Label ID="lblModalErrorBody2" runat="server"></asp:Label>
                    </p>
                </div>
                <div class="modal-footer text-center pb-4">
                    <button id="btnModalErrorFooterOutline" type="button" class="btn btn-chilecompra-outline btn-primary py-2 px-5" data-dismiss="modal" runat="server">
                        <asp:Label ID="lblBtnModalErrorFooter" runat="server"></asp:Label>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- SECCION DE JAVASCRIPT DE LA PAGINA -->
    <!-- JS necesario para bootstrap -->
    <script src="../../Scripts/jquery-3.0.0.min.js" type="text/javascript"></script>
    <script src="../../Scripts/popper.min.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.js" type="text/javascript"></script>

    <!-- FONT-AWESOME 5.13.0 -->
    <script src="../../Scripts/fontawesome/fontawesome.min.js" type="text/javascript"></script>

    <script src="../../Includes/scripts/moment.js" type="text/javascript" charset="UTF-8"></script>
    <script src="../../Includes/scripts/locale.js" type="text/javascript" charset="UTF-8"></script>

    <!-- DATETIMEPICKER -->
    <script src="../../Includes/scripts/bootstrap-datetimepicker.js" type="text/javascript" charset="UTF-8"></script>

    <!-- INPUTMASK -->
    <script src="../../Includes/scripts/jquery.mask.min.js" type="text/javascript"></script>
    <script src="../../Scripts/plugins/inputmask/jquery.inputmask.min.js" type="text/javascript"></script>
    <script src="../../Scripts/plugins/inputmask/inputmaskExtendAliases.js" type="text/javascript"></script>

    <!-- CUSTOM MODAL -->
    <script src="../../Scripts/customModal.js" type="text/javascript"></script>

    <!-- LABEL INPUT LENGHT LIMIT -->
    <script type="text/javascript" src="../../Includes/scripts/inputLengthLimit.js"></script>

    <!-- SELECT 2 -->
    <script src="../../Scripts/plugins/select2/select2.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            window.parent.postMessage({ type: "toggleLoading", isLoading: false }, "*");

            $('#btnVolver').on('click', function (e) {
                $('#btnSave').prop('disabled', true);
                $('#btnNext').prop('disabled', true);

                if (!$('#btnVolver').hasClass('disabled')) {
                    $('#btnVolver').addClass('disabled');
                }
                if (!$('#btnSave').hasClass('disabled')) {
                    $('#btnSave').addClass('disabled');
                }
                if (!$('#btnNext').hasClass('disabled')) {
                    $('#btnNext').addClass('disabled');
                }
            });
            $('#btnSave').on('click', function (e) {
                if (!Page_ClientValidate("next")) {
                    event.preventDefault();
                    return false;
                }

                window.parent.postMessage({ type: "toggleLoading", isLoading: true }, "*");
            });

            $('#btnNext').on('click', function (e) {
                if (!Page_ClientValidate("next")) {
                    event.preventDefault();
                    return false;
                }
                window.parent.postMessage({ type: "toggleLoading", isLoading: true }, "*");
            });
        });
    </script>

    <script type="text/javascript">
        moment.locale('es-CL');

        //Select2
        $('.select2').select2({
            language: {
                noResults: function () {
                    return "No se encontraron resultados";
                },
            }
        });

        $(document).ready(function () {
            var minDate = '<%= GetMinDateFrom() %>';
            var maxDate = '<%= GetMaxDateFrom() %>';

            $('#modalConfirmacion').on('hidden.bs.modal', function (e) {
                HideParentMask();
            });
            $('#modalError').on('hidden.bs.modal', function (e) {
                HideParentMask();
            });

            var showModalConfirmacion = '<%= GetShowModalConfirmacion() %>';
            if (showModalConfirmacion === 'True') {
                ShowParentMask();
                $('#modalConfirmacion').modal('show');
                window.parent.scrollTo(0, 0);
            }
            var showModalError = '<%= GetShowModalError() %>';
            if (showModalError === 'True') {
                ShowParentMask();
                $('#modalError').modal('show');
                window.parent.scrollTo(0, 0);
            }

            //Inicialización de input mask para inputs de fechas
            $('#Electronic_To').inputmask({
                mask: '99/99/9999',
                placeholder: '',
                showMaskOnHover: false,
                showMaskOnFocus: false
            });
            $('#txtToTime').inputmask({
                mask: '99:99',
                placeholder: '',
                showMaskOnHover: false,
                showMaskOnFocus: false
            });
            $('#txtContactPhone').mask('0 0000 0000 000');
            $('#txtContactEmail').mask("A", {
                translation: {
                    "A": { pattern: /[\w@\-.+]/, recursive: true }
                }
            });

            $('#Electronic_To').datetimepicker({
                format: 'DD/MM/YYYY',
                useCurrent: false,
                allowInputToggle: true
            })

            $('#txtToTime').datetimepicker({
                format: 'HH:mm',
                useCurrent: false,
                allowInputToggle: true
            })

            //Comportamiento de los span icon del calendario para mostrar el calendario cuando se hace click
            $('.open-datetimepicker-Electronic_To').click(function () {
                $("#Electronic_To").focus();
            });
            $('.open-txtToTime').click(function () {
                $("#txtToTime").focus();
            });

            $('#txtPlazoEntrega').inputmask({
                alias: 'numericPositive',
                rightAlign: false
            });

            $('#Electronic_To').data("DateTimePicker").minDate(minDate);
            $('#Electronic_To').data("DateTimePicker").maxDate(maxDate);

            //INPUTS LENGHT LIMIT
            labelInputLengthLimit('#txtDescriptionQuote', 'countChars', 500)

            //TO UP
            window.parent.scrollTo(0, 0);
        });
    </script>

    <script type="text/javascript">
        function AsignaSimboloMoneda(obj) {
            const symbol = obj.selectedOptions[0].attributes['data-symbol'].value;
            switch (obj.selectedOptions[0].value) {
                case "CLP":
                    document.getElementById("lblMonedaSign").className = "fas fa-dollar-sign moneda-symbol";
                    document.getElementById("lblMonedaSign").innerText = "";
                    document.getElementById("divMontoCalculado").className = "d-none";
                    break;

                case "EUR":
                    document.getElementById("lblMonedaSign").className = "fas fa-euro-sign moneda-symbol";
                    document.getElementById("lblMonedaSign").innerText = "";
                    document.getElementById("divMontoCalculado").className = "d-block";
                    break;

                default:
                    document.getElementById("lblMonedaSign").className = "far far-left-text text-center moneda-symbol";
                    document.getElementById("lblMonedaSign").innerText = symbol;
                    document.getElementById("divMontoCalculado").className = "d-block";
                    break;
            }
        }

        function MascaraMoneda(monto, decimals) {
            let montos = monto.toString().split('.');

            if (montos.length === 1) {
                return montos[0].replace(/(\d)(?=(?:[0-9,]{3})+\b)/g, '$1.');
            }

            return montos[0].replace(/(\d)(?=(?:[0-9,]{3})+\b)/g, '$1.') + ',' + montos[1].substring(0, decimals);
        }

        // Por aca pasa al cargar el componente
        function InicializaMoneda(obj) {
            const decimalPlaces = parseInt(obj.selectedOptions[0].attributes['data-dec'].value);

            $('#txtMontoTotalDisponible').inputmask({
                alias: obj.selectedOptions[0].value
            });
            switch (obj.selectedOptions[0].value) {
                case "USD":
                case "EUR":
                case "CLF":
                    var monto = parseFloat(obj.selectedOptions[0].attributes['data-valor'].value.replace(',', '.')).toFixed(decimalPlaces);
                    var fecha = obj.selectedOptions[0].attributes['data-fecha'].value;
                    $('#lblMontoCambio').text(MascaraMoneda(monto, decimalPlaces));
                    $('#lblFechaCambio').text(fecha);
                    break;
                case "UTM":
                    var monto = parseFloat(obj.selectedOptions[0].attributes['data-valor'].value.replace(',', '.'));
                    var fecha = obj.selectedOptions[0].attributes['data-fecha'].value;
                    $('#lblMontoCambio').text(MascaraMoneda(monto, 0));
                    $('#lblFechaCambio').text(fecha);
                    break;
                default:
                    break;
            }

            AsignaSimboloMoneda(obj);
            calcular(obj, $('#txtMontoTotalDisponible').val());
        }

        // Por aca pasa en el onchange
        function Moneda(obj) {
            const decimalPlaces = parseInt(obj.selectedOptions[0].attributes['data-dec'].value);

            $('#txtMontoTotalDisponible').val('');
            $('#txtMontoTotalDisponible').inputmask({
                alias: obj.selectedOptions[0].value
            });
            switch (obj.selectedOptions[0].value) {
                case "CLP":
                    $('#lblMontoCalculado').text(0);
                    break;
                case "USD":
                case "EUR":
                    var monto = parseFloat(obj.selectedOptions[0].attributes['data-valor'].value.replace(',', '.')).toFixed(decimalPlaces);
                    var fecha = obj.selectedOptions[0].attributes['data-fecha'].value;
                    $('#lblMontoCambio').text(MascaraMoneda(monto, decimalPlaces));
                    $('#lblFechaCambio').text(fecha);
                    $('#lblMontoCalculado').text("0,00");
                    break;
                case "UTM":
                    var monto = parseFloat(obj.selectedOptions[0].attributes['data-valor'].value.replace(',', '.'));
                    var fecha = obj.selectedOptions[0].attributes['data-fecha'].value;
                    $('#lblMontoCambio').text(MascaraMoneda(monto, 0));
                    $('#lblFechaCambio').text(fecha);
                    $('#lblMontoCalculado').text("0,0000");
                    break;
                case "CLF":
                    var monto = parseFloat(obj.selectedOptions[0].attributes['data-valor'].value.replace(',', '.')).toFixed(decimalPlaces);
                    var fecha = obj.selectedOptions[0].attributes['data-fecha'].value;
                    $('#lblMontoCambio').text(MascaraMoneda(monto, decimalPlaces));
                    $('#lblFechaCambio').text(fecha);
                    $('#lblMontoCalculado').text("0,0000");
                    break;
                default:
                    break;
            }
            AsignaSimboloMoneda(obj);
        }

        function calcular(obj, val) {
            if (obj.selectedOptions[0].value != "CLP") {
                let montoText = val.replace('.', '').replace(',', '.');
                if (montoText === '') {
                    montoText = '0';
                }
                var monto = parseFloat(montoText);
                var valor = parseFloat(obj.selectedOptions[0].attributes['data-valor'].value.replace(',', '.'));
                var dec = parseInt(obj.selectedOptions[0].attributes['data-dec'].value);
                $('#lblMontoCalculado').text(MascaraMoneda((monto * valor).toFixed(dec), dec));
            }
        }
    </script>

    <script type="text/javascript">
        // ---------- Sección para cuando se ejecuten las validaciones del servidor y detectar los RequiredFieldValidator ---------- //
        // -------------------- REQUIRED NOMBRE DE LA COTIZACIÓN -------------------- //
        // Select the node that will be observed for mutations
        const rfvNameQuoteTarget = document.getElementById('rfvNameQuote');
        // Options for the observer (which mutations to observe)
        const config = { attributes: true };
        // Callback function to execute when mutations are observed
        const rfvNameQuoteCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (rfvNameQuoteTarget.style.visibility === 'visible' || rfvNameQuoteTarget.style.display === 'inline') {
                            rfvNameQuoteTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('txtNameQuote').className = "form-control is-invalid";
                        }
                        else {
                            rfvNameQuoteTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('txtNameQuote').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const rfvNameQuoteObserver = new MutationObserver(rfvNameQuoteCallback);
            // Start observing the target node for configured mutations
            rfvNameQuoteObserver.observe(rfvNameQuoteTarget, config);
        } catch (e) {

        }

        // -------------------- REQUIRED DESCRIPCIÓN DE LA COTIZACIÓN -------------------- //
        // Select the node that will be observed for mutations
        const rfvDescriptionQuoteTarget = document.getElementById('rfvDescriptionQuote');
        // Callback function to execute when mutations are observed
        const rfvDescriptionQuoteCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (rfvDescriptionQuoteTarget.style.visibility === 'visible' || rfvDescriptionQuoteTarget.style.display === 'inline') {
                            rfvDescriptionQuoteTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('txtDescriptionQuote').className = "form-control is-invalid";
                        }
                        else {
                            rfvDescriptionQuoteTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('txtDescriptionQuote').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const rfvDescriptionQuoteObserver = new MutationObserver(rfvDescriptionQuoteCallback);
            // Start observing the target node for configured mutations
            rfvDescriptionQuoteObserver.observe(rfvDescriptionQuoteTarget, config);
        } catch (e) {

        }

        // -------------------- REGULAR EXPRESSION - HORA CIERRE -------------------- //
        // Select the node that will be observed for mutations
        const revElectronicToTimeTarget = document.getElementById('revElectronicToTime');
        // Callback function to execute when mutations are observed
        const revElectronicToTimeCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (revElectronicToTimeTarget.style.visibility === 'visible' || revElectronicToTimeTarget.style.display === 'inline') {
                            revElectronicToTimeTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('txtToTime').className = "form-control is-invalid";
                        }
                        else {
                            revElectronicToTimeTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('txtToTime').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const revElectronicToTimeObserver = new MutationObserver(revElectronicToTimeCallback);
            // Start observing the target node for configured mutations
            revElectronicToTimeObserver.observe(revElectronicToTimeTarget, config);
        } catch (e) {

        }


        // -------------------- REGULAR EXPRESSION - FECHA CIERRE -------------------- //
        // Select the node that will be observed for mutations
        const revElectronicToTarget = document.getElementById('revElectronicTo');
        // Callback function to execute when mutations are observed
        const revElectronicToCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (revElectronicToTarget.style.visibility === 'visible' || revElectronicToTarget.style.display === 'inline') {
                            revElectronicToTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('Electronic_To').className = "form-control is-invalid";
                        }
                        else {
                            revElectronicToTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('Electronic_To').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const revElectronicToObserver = new MutationObserver(revElectronicToCallback);
            // Start observing the target node for configured mutations
            revElectronicToObserver.observe(revElectronicToTarget, config);
        } catch (e) {

        }


        // -------------------- REQUIRED - FECHA CIERRE -------------------- //
        // Select the node that will be observed for mutations
        const rfvElectronicToTarget = document.getElementById('rfvElectronicTo');
        // Callback function to execute when mutations are observed
        const rfvElectronicToCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (rfvElectronicToTarget.style.visibility === 'visible' || rfvElectronicToTarget.style.display === 'inline') {
                            rfvElectronicToTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('Electronic_To').className = "form-control is-invalid";
                        }
                        else {
                            rfvElectronicToTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('Electronic_To').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const rfvElectronicToObserver = new MutationObserver(rfvElectronicToCallback);
            // Start observing the target node for configured mutations
            rfvElectronicToObserver.observe(rfvElectronicToTarget, config);
        } catch (e) {

        }


        // -------------------- REQUIRED - PLAZO DE ENTREGA -------------------- //
        // Select the node that will be observed for mutations
        const rfvPlazoEntregaTarget = document.getElementById('rfvPlazoEntrega');
        // Callback function to execute when mutations are observed
        const rfvPlazoEntregaCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (rfvPlazoEntregaTarget.style.visibility === 'visible' || rfvPlazoEntregaTarget.style.display === 'inline') {
                            rfvPlazoEntregaTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('txtPlazoEntrega').className = "form-control is-invalid";
                        }
                        else {
                            rfvPlazoEntregaTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('txtPlazoEntrega').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const rfvPlazoEntregaObserver = new MutationObserver(rfvPlazoEntregaCallback);
            // Start observing the target node for configured mutations
            rfvPlazoEntregaObserver.observe(rfvPlazoEntregaTarget, config);

        } catch (e) {

        }


        // -------------------- REQUIRED - NOMBRE CONTACTO -------------------- //
        // Select the node that will be observed for mutations
        const rfvContactNameTarget = document.getElementById('rfvContactName');
        // Callback function to execute when mutations are observed
        const rfvContactNameCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (rfvContactNameTarget.style.visibility === 'visible' || rfvContactNameTarget.style.display === 'inline') {
                            rfvContactNameTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('txtContactName').className = "form-control is-invalid";
                        }
                        else {
                            rfvContactNameTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('txtContactName').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const rfvContactNameObserver = new MutationObserver(rfvContactNameCallback);
            // Start observing the target node for configured mutations
            rfvContactNameObserver.observe(rfvContactNameTarget, config);

        } catch (e) {

        }

        // -------------------- REQUIRED - TELÉFONO CONTACTO -------------------- //
        // Select the node that will be observed for mutations
        const rfvContactPhoneTarget = document.getElementById('rfvContactPhone');
        // Callback function to execute when mutations are observed
        const rfvContactPhoneCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (rfvContactPhoneTarget.style.visibility === 'visible' || rfvContactPhoneTarget.style.display === 'inline') {
                            rfvContactPhoneTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('txtContactPhone').className = "form-control is-invalid";
                        }
                        else {
                            rfvContactPhoneTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('txtContactPhone').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const rfvContactPhoneObserver = new MutationObserver(rfvContactPhoneCallback);
            // Start observing the target node for configured mutations
            rfvContactPhoneObserver.observe(rfvContactPhoneTarget, config);
        } catch (e) {

        }


        // -------------------- REQUIRED - MAIL CONTACTO -------------------- //
        // Select the node that will be observed for mutations
        const rfvContactEmailTarget = document.getElementById('rfvContactEmail');
        // Callback function to execute when mutations are observed
        const rfvContactEmailCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (rfvContactEmailTarget.style.visibility === 'visible' || rfvContactEmailTarget.style.display === 'inline') {
                            rfvContactEmailTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('txtContactEmail').className = "form-control is-invalid";
                        }
                        else {
                            rfvContactEmailTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('txtContactEmail').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const rfvContactEmailObserver = new MutationObserver(rfvContactEmailCallback);
            // Start observing the target node for configured mutations
            rfvContactEmailObserver.observe(rfvContactEmailTarget, config);
        } catch (e) {

        }

        // -------------------- REGULAR EXPRESSION - MAIL CONTACTO -------------------- //
        // Select the node that will be observed for mutations
        const revContactEmailTarget = document.getElementById('revContactEmail');
        // Callback function to execute when mutations are observed
        const revContactEmailCallback = function (mutationsList, observer) {
            // Use traditional 'for loops' for IE 11
            for (let mutation of mutationsList) {
                if (mutation.type === 'attributes') {
                    if (mutation.attributeName === 'style') {
                        if (revContactEmailTarget.style.visibility === 'visible' || revContactEmailTarget.style.display === 'inline') {
                            revContactEmailTarget.closest('li.d-none').style = "display: block !important;";
                            document.getElementById('txtContactEmail').className = "form-control is-invalid";
                        }
                        else {
                            revContactEmailTarget.closest('li.d-none').style = "display: none !important;";
                            document.getElementById('txtContactEmail').className = "form-control";
                        }
                    }
                }
            }
        };
        try {
            // Create an observer instance linked to the callback function
            const revContactEmailObserver = new MutationObserver(revContactEmailCallback);
            // Start observing the target node for configured mutations
            revContactEmailObserver.observe(revContactEmailTarget, config);
        } catch (e) {

        }

    </script>
</body>
</html>

