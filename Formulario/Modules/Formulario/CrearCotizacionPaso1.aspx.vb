Option Strict On
Option Explicit On

Partial Public Class CrearCotizacionPaso1
    Inherits System.Web.UI.Page

    Dim strExternalCode As String

    Private intEditQuote As Integer
    Private showModalConfirmacion As Boolean
    Private showModalError As Boolean

    Public Function GetShowModalConfirmacion() As Boolean
        Return showModalConfirmacion
    End Function

    Public Function GetShowModalError() As Boolean
        Return showModalError
    End Function

    Private MinDateFrom As DateTime
    Public Function GetMinDateFrom() As DateTime
        Return MinDateFrom
    End Function

    Public Function GetMaxDateFrom() As DateTime
        Return MinDateFrom.AddDays(30)
    End Function

    ''' <summary>
    ''' Carga la página.
    ''' Obtiene los parámetros necesarios para la página:
    '''  - código de Quote.
    '''  - parámetro de edicion.
    ''' </summary>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.loadCustomComponents()
        Me.ModalConfirmacionShow(False)
        Me.ModalErrorShow(False)

        If Not Page.IsPostBack Then
            Me.languageText()
            numeroQuote = 0
            Me.ObtenerSolicitudCotizacion(numeroQuote)
            CargaMonedas()
        End If
    End Sub

    ''' <summary>
    ''' Carga los títulos y botones de la página, dependiendo del tipo de edición.
    ''' También carga las páginas y los mensajes de los validadores.
    ''' </summary>
    Private Sub languageText()

        lblTitle.Text = "Crear solicitud de cotización"
        divQuote.Visible = False

        Dim strPage As String = "BuscarCotizacion.aspx"
        btnVolver.CommandArgument = strPage

        revElectronicTo.ValidationExpression = "(\d{2}/\d{2}/\d{4})|(\d{2}-\d{2}-\d{4})"
    End Sub

    Private Sub ModalConfirmacionShow(ByVal show As Boolean)

        If show Then
            Me.modalConfirmacion.Style.Add("display", "block")
            Me.showModalConfirmacion = True
        Else
            Me.modalConfirmacion.Style.Add("display", "none")
            Me.showModalConfirmacion = False
        End If
    End Sub

    Private Sub ModalConfirmacionSetText(ByVal text1 As String, ByVal text2 As String, ByVal text3 As String, ByVal btnOutlineText As String, ByVal btnOutlineLink As String, ByVal btnText As String, ByVal btnLink As String)

        lblModalBody1.Visible = False
        If Not String.IsNullOrEmpty(text1) Then
            lblModalBody1.Text = text1
            lblModalBody1.Visible = True
        End If

        lblModalBody2.Visible = False
        If Not String.IsNullOrEmpty(text2) Then
            lblModalBody2.Text = text2
            lblModalBody2.Visible = True
        End If

        lblModalBody3.Visible = False
        paragraphOptionalModal.Style.Add("display", "none")
        If Not String.IsNullOrEmpty(text3) Then
            lblModalBody3.Text = text3
            lblModalBody3.Visible = True
            paragraphOptionalModal.Style.Remove("display")
        End If

        btnModalFooterOutline.Visible = False
        If Not String.IsNullOrEmpty(btnOutlineText) Then
            lblBtnFooterOutline.Text = btnOutlineText
            btnModalFooterOutline.Visible = True
            If String.IsNullOrEmpty(btnOutlineLink) Then
                btnModalFooterOutline.Attributes.Add("data-dismiss", "modal")
                btnModalFooterOutline.Attributes.Remove("href")
            Else
                btnModalFooterOutline.Attributes.Remove("data-dismiss")
                btnModalFooterOutline.Attributes.Add("href", "javascript:void(0)")
                btnModalFooterOutline.Attributes.Add("onclick", "HideParentMask();window.location='" & btnOutlineLink & "';")
                btnCloseModalConfirmacion.Attributes.Remove("data-dismiss")
                btnCloseModalConfirmacion.Attributes.Add("href", "javascript:void(0)")
                btnCloseModalConfirmacion.Attributes.Add("onclick", "HideParentMask();window.location='" & btnOutlineLink & "';")
            End If
        End If

        btnModalFooter.Visible = False
        If Not String.IsNullOrEmpty(btnText) Then
            lblBtnFooter.Text = btnText
            btnModalFooter.Visible = True
            If String.IsNullOrEmpty(btnLink) Then
                btnModalFooter.Attributes.Add("data-dismiss", "modal")
                btnModalFooter.Attributes.Remove("href")
            Else
                btnModalFooter.Attributes.Remove("data-dismiss")
                btnModalFooter.Attributes.Add("href", "javascript:void(0)")
                btnModalFooter.Attributes.Add("onclick", "HideParentMask();window.location='" & btnLink & "';")
                btnCloseModalConfirmacion.Attributes.Remove("data-dismiss")
                btnCloseModalConfirmacion.Attributes.Add("href", "javascript:void(0)")
                btnCloseModalConfirmacion.Attributes.Add("onclick", "HideParentMask();window.location='" & btnLink & "';")
            End If
        End If
    End Sub

    Private Sub ModalErrorShow(ByVal show As Boolean)

        If show Then
            Me.modalError.Style.Add("display", "block")
            Me.showModalError = True
        Else
            Me.modalError.Style.Add("display", "none")
            Me.showModalError = False
        End If
    End Sub

    Private Sub ModalErrorSetText(ByVal text1 As String, ByVal text2 As String, ByVal btnOutlineText As String, ByVal btnOutlineLink As String)

        lblModalErrorBody1.Visible = False
        If Not String.IsNullOrEmpty(text1) Then
            lblModalErrorBody1.Text = text1
            lblModalErrorBody1.Visible = True
        End If

        lblModalErrorBody2.Visible = False
        paragraphOptionalModalError.Style.Add("display", "none")
        If Not String.IsNullOrEmpty(text2) Then
            lblModalErrorBody2.Text = text2
            lblModalErrorBody2.Visible = True
            paragraphOptionalModalError.Style.Remove("display")
        End If

        btnModalErrorFooterOutline.Visible = False
        If Not String.IsNullOrEmpty(btnOutlineText) Then
            lblBtnModalErrorFooter.Text = btnOutlineText
            btnModalErrorFooterOutline.Visible = True
            If String.IsNullOrEmpty(btnOutlineLink) Then
                btnModalErrorFooterOutline.Attributes.Add("data-dismiss", "modal")
                btnModalErrorFooterOutline.Attributes.Remove("href")
            Else
                btnModalErrorFooterOutline.Attributes.Remove("data-dismiss")
                btnModalErrorFooterOutline.Attributes.Add("href", "javascript:void(0)")
                btnModalErrorFooterOutline.Attributes.Add("onclick", "HideParentMask();window.location='" & btnOutlineLink & "';")
                btnCloseModalError.Attributes.Remove("data-dismiss")
                btnCloseModalError.Attributes.Add("href", "javascript:void(0)")
                btnCloseModalError.Attributes.Add("onclick", "HideParentMask();window.location='" & btnOutlineLink & "';")
            End If
        End If
    End Sub

    ''' <summary>
    ''' Carga las fechas por defecto del tipo de convocatoria.
    ''' </summary>
    Private Sub loadCustomComponents()

        MinDateFrom = Today.AddHours(24)
        If Electronic_To.Text = String.Empty Then
            Electronic_To.Text = Today.AddDays(7).ToShortDateString()
            Electronic_To.Text = Electronic_To.Text.Replace("-", "/")
            txtToTime.Text = DateTime.Now.ToString
            If txtToTime.Text.Length <> 5 Then
                txtToTime.Text = "0" & txtToTime.Text
            End If
        End If
    End Sub

    ''' <summary>
    ''' Carga la información general del Quote.
    ''' </summary>
    Private Sub ObtenerSolicitudCotizacion(ByVal idSolicitudCotizacion As Integer)
        Dim objDataSet As DataSet = Nothing
        Dim QuoteList As New ArrayList

        lblExternalCode.Text = "ID de cotización"
        lblExternalCodeQuote.Text = ""
        txtNameQuote.Text = ""
        txtDescriptionQuote.Text = ""

        Dim dateTo As DateTime
        dateTo = Convert.ToDateTime("30-12-2020")
        Electronic_To.Text = dateTo.ToShortDateString
        Electronic_To.Text = Electronic_To.Text.Replace("-", "/")
        txtToTime.Text = dateTo.ToShortTimeString

        MinDateFrom = Today.AddHours(24)
        If dateTo < MinDateFrom Or dateTo > MinDateFrom.AddDays(30) Then
            Electronic_To.Text = Today.AddDays(7).ToShortDateString()
            Electronic_To.Text = Electronic_To.Text.Replace("-", "/")
            txtToTime.Text = DateTime.Now.ToString
            If txtToTime.Text.Length <> 5 Then
                txtToTime.Text = "0" & txtToTime.Text
            End If
        Else
            Electronic_To.Text = dateTo.ToShortDateString
            Electronic_To.Text = Electronic_To.Text.Replace("-", "/")
            txtToTime.Text = dateTo.ToShortTimeString
            If txtToTime.Text.Length <> 5 Then
                txtToTime.Text = "0" & txtToTime.Text
            End If
        End If

        txtMontoTotalDisponible.Text = ""
        ddlMoneda.SelectedValue = "CLP"

        txtContactName.Text = ""
        txtContactPhone.Text = ""
        txtContactEmail.Text = ""

        txtPlazoEntrega.Text = ""

        If txtPlazoEntrega.Text.Equals("0") Then
            txtPlazoEntrega.Text = ""
        End If

    End Sub

    ''' <summary>
    ''' Valida las fechas del sistema.
    ''' Que las fechas no estén vacias, que la fecha desde no sea mayor que la fecha hasta.
    ''' Y que la fecha desde no sea menor a la fecha actual.
    ''' </summary>
    Public Function ValidaData() As Boolean
        Dim datElectronicFrom As DateTime
        Dim datElectronicTo As DateTime

        Try
            If Me.Electronic_To.Text.ToString() <> String.Empty And Me.txtToTime.Text <> String.Empty Then
                datElectronicTo = DateTime.Now
            End If

            Dim _returnErrorCode As String = String.Empty

            Dim strDateTime As String = DateTime.Now.ToString

            If datElectronicTo <> DateTime.MinValue Then
                If datElectronicTo < Convert.ToDateTime(strDateTime) Then
                    ShowMessage(6)
                    Return False
                Else
                    Return True
                End If
            ElseIf Me.Electronic_To.Text = String.Empty Then
                ShowMessage(5)
                Me.Electronic_To.Focus()
                Return False
            Else
                Return True
            End If

        Catch ex As System.FormatException
            ShowMessage(4)
            Return False
        Catch ex As Exception
            ShowMessage(3)
            Return False
        End Try

    End Function

    Public Sub ServerValidation(sender As Object, e As ServerValidateEventArgs)
        Dim datElectronicTo As DateTime

        Try
            If Me.Electronic_To.Text.ToString() <> String.Empty And Me.txtToTime.Text <> String.Empty Then
                datElectronicTo = DateTime.Now 'Me.UserConvert.ToDateTimeMinutePrecision(Me.Electronic_To.Text & " " & txtToTime.Text)
            End If

            Dim _returnErrorCode As String = String.Empty

            Dim strDateTime As String = DateTime.Now.ToString 'Me.UserFormat.FormatDateTimeMinutePrecision(BLGeneral.BLCLUTC.ServerUTCTime)

            If datElectronicTo <> DateTime.MinValue Then
                If datElectronicTo < Convert.ToDateTime(strDateTime) Then
                    ShowMessage(6)
                    e.IsValid = False
                ElseIf datElectronicTo > DateTime.Now.AddDays(30) Then
                    ShowMessage(8)
                    e.IsValid = False
                ElseIf datElectronicTo < DateTime.Now.AddHours(24) Then
                    ShowMessage(7)
                    e.IsValid = False
                Else
                    e.IsValid = True
                End If
            ElseIf Me.Electronic_To.Text = String.Empty Then
                ShowMessage(5)
                Me.Electronic_To.Focus()
                e.IsValid = False
            Else
                e.IsValid = True
            End If
        Catch ex As Exception

        End Try
    End Sub

    ''' <summary>
    ''' Guarda una solicitud de cotización.
    ''' Crea un Id de solicitud de cotización, si no está en modo edición.
    ''' Agrega un histórico de solicitud.
    ''' </summary>
    ''' <remarks></remarks>
    Private Function GuardarSolicitudCotizacion() As Boolean
        Dim QuoteList As New ArrayList

        'Obtiene las fechas
        Dim datElectronicFrom As DateTime
        Dim datElectronicTo As DateTime
        Dim QuoteOrganization As String = "500977"
        Dim sExternalCode As String
        Dim strCode As String = System.Configuration.ConfigurationManager.AppSettings("CodigoSolicitudCotizacion").ToString
        Dim PlazoEntrega As Integer

        If numeroQuote() = 0 Then
            strExternalCode = "STR-CODE-001"
        Else
            If (lblExternalCodeQuote.Text <> String.Empty) Then
                strExternalCode = lblExternalCodeQuote.Text
            Else
                strExternalCode = sExternalCode
            End If
        End If
        Try

            datElectronicFrom = DateTime.Now

            If Me.Electronic_To.Text.ToString() <> String.Empty And Me.txtToTime.Text <> String.Empty Then
                datElectronicTo = DateTime.Now 'Me.UserConvert.ToDateTimeMinutePrecision(Me.Electronic_To.Text & " " & txtToTime.Text)
            End If

            If numeroQuote = 0 Then
                intEditQuote = 0
            Else
                intEditQuote = 1
            End If

            If String.IsNullOrEmpty(txtPlazoEntrega.Text) Then
                PlazoEntrega = 0
            Else
                PlazoEntrega = CInt(txtPlazoEntrega.Text)
            End If


            'TODO: VALIDAR SI OCURRE UN ERROR
            If intEditQuote = 0 Then
                numeroQuote = 1
            End If

            Dim strRFBCode As String = String.Empty
            Dim strRFBState As String = String.Empty
            Dim rbhUser As String = "1221194"
            Dim strComments As String

            If intEditQuote = 0 Then
                strComments = "Formulario Creado"
            Else
                strComments = "Formulario Actualizado"
            End If


        Catch ex As System.FormatException
            Me.lblDateTimeMessage.Text = "El formato ingresado de fecha es incorrecto (o no corresponde con el formato asignado al lenguaje del Usuario)"
            Return False
        Catch ex As Exception
            ShowMessage(3)
            Return False
        End Try
        lblExternalCode.Text = strExternalCode

        Return True

    End Function

    ''' <summary>
    ''' Botón Guardar, valida los datos y comprueba si ha guardado correctamente, mostrando mensajes de validación al usuario.
    ''' </summary>
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        If Me.Page.IsValid Then
            If Me.GuardarSolicitudCotizacion() Then
                If numeroQuote() = 0 Or intEditQuote = 0 Then
                    lblTitle.Text = "Editar formulario para cotizar"
                    divQuote.Visible = True
                    lblExternalCode.Text = "ID de cotización"
                    lblExternalCodeQuote.Text = strExternalCode
                    ModalMessage(1)
                ElseIf intEditQuote = 1 Then
                    ModalMessage(2)
                End If
            Else
                ModalMessage(3)
            End If
        End If
    End Sub

    ''' <summary>
    ''' Botón Siguiente, valida los datos y comprueba si ha guardado correctamente, mostrando mensajes de validación al usuario.
    ''' Redirige a la página "Crear Paso 2", enviando los parámetros según esté o no en modo edición.
    ''' </summary>
    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        If Me.Page.IsValid Then
            If ValidaData() Then
                If Me.GuardarSolicitudCotizacion() Then
                    Response.Redirect("CrearCotizacionPaso2.aspx")
                End If
            End If
        End If
    End Sub

    ''' <summary>
    ''' Muestra los mensajes de error al usuario, dependiendo del tipo de error.
    ''' </summary>
    Sub ShowMessage(ByVal type As Integer)
        Dim message As String
        lblMessage.Visible = True

        Select Case type
            Case 1
                message = "La fecha desde no puede ser mayor a la fecha hasta."
                lblDateTimeMessage.Text = message
            Case 2
                message = "Debe ingresar fecha Desde."
                lblDateTimeMessage.Text = message
            Case 3
                message = "En estos momentos no podemos atender su solicitud"
                lblMessage.Text = message
            Case 4
                message = "La fecha ingresada no se encuentra en el rango permitido"
                lblDateTimeMessage.Text = message
            Case 5
                message = "Debe ingresar fecha Hasta."
                lblDateTimeMessage.Text = message
            Case 6
                message = "La fecha de cierre no puede ser menor a la fecha actual."
                lblDateTimeMessage.Text = message
            Case 7
                message = String.Format("La fecha de cierre debe ser mayor a {0} horas a partir de la fecha actual.", System.Configuration.ConfigurationManager.AppSettings.Get("MinimoHorasPublicado"))
                lblDateTimeMessage.Text = message
            Case 8
                message = String.Format("La fecha de cierre no puede ser mayor a {0} días a partir de la fecha actual.", System.Configuration.ConfigurationManager.AppSettings.Get("MaximoDiasPublicado"))
                lblDateTimeMessage.Text = message
        End Select

    End Sub

    ''' <summary>
    ''' Muestra un modal de mensaje dependiendo del tipo.
    ''' </summary>
    Sub ModalMessage(ByVal type As Integer)

        Select Case type
            Case 1
                Me.ModalConfirmacionSetText("El formulario ha sido guardado satisfactoriamente.", "", "CÓDIGO ID: " & strExternalCode, "Aceptar", "", "", "")
                Me.ModalConfirmacionShow(True)
            Case 2
                Me.ModalConfirmacionSetText("El formulario " & strExternalCode & " ha sido guardado satisfactoriamente.", "", "", "Aceptar", "", "", "")
                Me.ModalConfirmacionShow(True)
            Case 3
                Me.ModalErrorSetText("Falta por llenar algunos datos obligatorios.", "", "Aceptar", "")
                Me.ModalErrorShow(True)
        End Select

    End Sub

    Protected Sub btnVolver_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnVolver.Click
        Response.Redirect(btnVolver.CommandArgument)
    End Sub


    Public Property numeroQuote() As Integer
        Get
            If IsNumeric(Session("QUOTEID")) Then
                Return CInt(Session("QUOTEID"))
            Else
                Return 0
            End If
        End Get
        Set(ByVal value As Integer)
            Session("QUOTEID") = value.ToString
        End Set
    End Property

    Public Sub CargaMonedas()
        Dim currentSelectedValue As String = String.Empty

        If ddlMoneda.SelectedItem IsNot Nothing Then
            currentSelectedValue = ddlMoneda.SelectedValue
        End If

        ddlMoneda.Items.Clear()
        Dim clp As New ListItem("Peso Chileno", "CLP")
        clp.Attributes.Add("data-dec", "0")
        clp.Attributes.Add("data-symbol", "$")
        clp.Attributes.Add("data-fecha", "17-12-2020")
        clp.Attributes.Add("data-valor", "0")

        If Not String.IsNullOrEmpty(currentSelectedValue) Then
            If "CLP".Equals(currentSelectedValue) Then
                clp.Selected = True
            End If
        Else
            clp.Selected = True
        End If

        ddlMoneda.Items.Add(clp)

        Dim usd As New ListItem("Dólar Americano", "USD")
        usd.Attributes.Add("data-dec", "2")
        usd.Attributes.Add("data-symbol", "US$")
        usd.Attributes.Add("data-fecha", "11-12-2020")
        usd.Attributes.Add("data-valor", "738,169982910156")

        If Not String.IsNullOrEmpty(currentSelectedValue) Then
            If "USD".Equals(currentSelectedValue) Then
                usd.Selected = True
            End If
        End If

        ddlMoneda.Items.Add(usd)

        Dim eur As New ListItem("Euro", "EUR")
        usd.Attributes.Add("data-dec", "2")
        usd.Attributes.Add("data-symbol", "€")
        usd.Attributes.Add("data-fecha", "11-12-2020")
        usd.Attributes.Add("data-valor", "894,859985351563")

        If Not String.IsNullOrEmpty(currentSelectedValue) Then
            If "EUR".Equals(currentSelectedValue) Then
                eur.Selected = True
            End If
        End If

        ddlMoneda.Items.Add(eur)

        Dim clf As New ListItem("Unidad de Fomento", "CLF")
        clf.Attributes.Add("data-dec", "4")
        clf.Attributes.Add("data-symbol", "UF")
        clf.Attributes.Add("data-fecha", "11-12-2020")
        clf.Attributes.Add("data-valor", "29088,16015625")

        If Not String.IsNullOrEmpty(currentSelectedValue) Then
            If "CLF".Equals(currentSelectedValue) Then
                clf.Selected = True
            End If
        End If

        ddlMoneda.Items.Add(clf)

        Dim utm As New ListItem("Unidad Tributaria Mensual", "UTM")
        clf.Attributes.Add("data-dec", "4")
        clf.Attributes.Add("data-symbol", "UTM")
        clf.Attributes.Add("data-fecha", "01-12-2020")
        clf.Attributes.Add("data-valor", "51029")

        If Not String.IsNullOrEmpty(currentSelectedValue) Then
            If "UTM".Equals(currentSelectedValue) Then
                utm.Selected = True
            End If
        End If

        ddlMoneda.Items.Add(utm)

    End Sub

End Class