<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Empleado.aspx.cs" Inherits="Sistema_Planilla.Form_Empleado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Empleados</title>
    <link rel="stylesheet" href="/Estilos/Empleados_Principal.css"/>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Datos del Empleado</h2>
            <asp:Label ID="lblDebug" runat="server" Text="" CssClass="debug-label"></asp:Label>
            <label for="txtID">ID:</label>
         <asp:TextBox ID="txtID" runat="server" CssClass="soloLectura" ReadOnly="true"></asp:TextBox>

            <br />
            <label for="txtNombre">Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />
            <label for="txtApellidoP">Apellido Paterno:</label>
            <asp:TextBox ID="txtApellidoP" runat="server"></asp:TextBox>
            <br />
            <label for="txtApellidoS">Apellido Materno:</label>
            <asp:TextBox ID="txtApellidoS" runat="server"></asp:TextBox>
            <br />
            <label for="txtNacionalidad">Nacionalidad:</label>
            <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
            <br />
            <label for="txtFechaNacimiento">Fecha de Nacimiento:</label>
            <asp:TextBox ID="txtFechaNacimiento" runat="server"></asp:TextBox>
            <br />
            <label for="txtProvincia">Provincia:</label>
            <asp:TextBox ID="txtProvincia" runat="server"></asp:TextBox>
            <br />
            <label for="txtCanton">Cantón:</label>
            <asp:TextBox ID="txtCanton" runat="server"></asp:TextBox>
            <br />
            <label for="txtDistrito">Distrito:</label>
            <asp:TextBox ID="txtDistrito" runat="server"></asp:TextBox>
            <br />
            <label for="txtBarrio">Barrio:</label>
            <asp:TextBox ID="txtBarrio" runat="server"></asp:TextBox>
            <br />
            <label for="txtDireccion">Dirección:</label>
            <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
            <br />
            <label for="txtTelefono">Teléfono:</label>
            <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
            <br />
            <label for="txtCorreoElectronico">Correo Electrónico:</label>
            <asp:TextBox ID="txtCorreoElectronico" runat="server"></asp:TextBox>
            <br />
            <br />

            
            <asp:Button ID="btnModificar" runat="server" Text="Modificar Empleado" OnClick="btnModificar_Click" />
            <br />
            <asp:Label ID="lblMensaje" runat="server" ></asp:Label>
            <br />
            <h2>Pagos anteriores y su detalle</h2>
        </div>

        <div class="gridview-container">
        <br />
      
        <br />
        <asp:GridView ID="gvDetallePlanilla" runat="server" AutoGenerateColumns="False" CssClass="gridview">
    <Columns>
        <asp:BoundField DataField="Salario_Base" HeaderText="Salario Base" />
        <asp:BoundField DataField="Salario_Horas_Extras" HeaderText="Salario Horas Extras" />
        <asp:BoundField DataField="Salario_Horas_Extras_Dobles" HeaderText="Salario Horas Extras Dobles" />
        <asp:BoundField DataField="SEM" HeaderText="SEM" />
        <asp:BoundField DataField="IVM" HeaderText="IVM" />
        <asp:BoundField DataField="Aporte_Popular" HeaderText="Aporte Popular" />
        <asp:BoundField DataField="Deduccion_Fija" HeaderText="Deducción Fija" />
        <asp:BoundField DataField="Deduccion_Porcentaje" HeaderText="Deducción Porcentaje" />
        <asp:BoundField DataField="Salario_Neto" HeaderText="Salario Neto" />
        <asp:BoundField DataField="Mes" HeaderText="Mes" /> 
        <asp:BoundField DataField="Estado_Proceso" HeaderText="Estado del Proceso" /> 
    </Columns>
</asp:GridView>


        <br />
      </div>
    
        <div class="gridview-container">
       <asp:GridView ID="gvConcepto" runat="server" AutoGenerateColumns="False" CssClass="gridview">
        <Columns>
            <asp:BoundField DataField="ID_Concepto" HeaderText="ID Concepto" />
            <asp:BoundField DataField="Nombre" HeaderText="Detalle" />
            <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
        </Columns>
        </asp:GridView>

        </div>
    </form>
    <footer>
    <p>&copy; 2024 Sayuri Morales - Javier Murillo. Administracion de base de datos.</p>
    </footer>
</body>
</html>
