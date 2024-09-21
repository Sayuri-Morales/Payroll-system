<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Encargado.aspx.cs" Inherits="Sistema_Planilla.Form_Encargado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Encargado</title>
    <link rel="stylesheet" href="Estilos/Encargados_Principal.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Mensajes de Contáctenos</h2>
            <br />
            
            <asp:GridView ID="GridViewMensajes" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="No hay mensajes disponibles">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Correo_Electronico" HeaderText="Correo Electrónico" />
                    <asp:BoundField DataField="Mensaje" HeaderText="Mensaje" />
                </Columns>
            </asp:GridView>
        </div>
        
      <div>
          <br />
            <h2>Datos del Empleado</h2>
            <label for="txtID">ID:</label>
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
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
            <label for="ddlEstado">Estado:</label>
            <asp:DropDownList ID="ddlEstado" runat="server">
                <asp:ListItem Text="Activo" Value="Activo"></asp:ListItem>
                <asp:ListItem Text="Inactivo" Value="Inactivo"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <label for="txtIDSucursal">ID Sucursal:</label>
            <asp:TextBox ID="txtIDSucursal" runat="server"></asp:TextBox>
            <br />
            <label for="txtFechaIngreso">Fecha de Ingreso:</label>
            <asp:TextBox ID="txtFechaIngreso" runat="server"></asp:TextBox>
            <br />
          <br />
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Empleado" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnEliminarEmpleado" runat="server" Text="Eliminar Empleado" OnClick="btnEliminarEmpleado_Click" />

            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />

            <br />
            <asp:Label ID="lblMensaje" runat="server" ></asp:Label>
           <br />
           <br />
          <h2>Sistema de Planillas</h2>
        </div>

       <div>
    <asp:GridView ID="gvConcepto" runat="server" AutoGenerateColumns="False" CssClass="gridview" OnRowEditing="gvConcepto_Editar" OnRowUpdating="gvConcepto_Actualizar" OnRowCancelingEdit="gvConcepto_Cancel" DataKeyNames="ID_Concepto">
    <Columns>
        <asp:BoundField DataField="ID_Concepto" HeaderText="ID Concepto" ReadOnly="True" />
        <asp:BoundField DataField="Nombre" HeaderText="Detalle" />
        <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
        <asp:BoundField DataField="Forma_Calculo" HeaderText="Forma de calculo" />
        <asp:CommandField ShowEditButton="True" />
    </Columns>
</asp:GridView>
        <br />
        <br />
        <div>
    <h2>Planillas de empleados</h2>
</div>
<div>
    <label for="lblID">Id del empleado:</label>
    <asp:TextBox ID="txtIDEmpleado" runat="server"></asp:TextBox>
    <asp:Button ID="btnBuscarPlanilla" runat="server" Text="Buscar Empleado" OnClick="btnBuscarPlanilla_Click" />
    <br />
    <asp:Label ID="lblError" runat="server" CssClass="label-error"></asp:Label>
    <br />
</div>
<div class="gridview-container">
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
</div>

            <br />
            <br />
            <h2>Crear planilla</h2>
        </div>
        <div>
    <label for="lblIDDetalle">ID Detalle:</label>
    <asp:TextBox ID="txtIDDetalle" runat="server"></asp:TextBox>
    <label for="lblIDPlanilla">ID Planilla:</label>
    <asp:TextBox ID="txtIDPlanilla" runat="server"></asp:TextBox>
    <label for="lblIDEmpleado">ID Empleado:</label>
    <asp:TextBox ID="txtIDEmpleadoPlanilla" runat="server"></asp:TextBox>
    <label for="lblIDConcepto">ID Concepto:</label>
    <asp:TextBox ID="txtIDConcepto" runat="server"></asp:TextBox>
    <label for="lblValor">Monto:</label>
    <asp:TextBox ID="txtValor" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnInsertarDetallePlanilla" runat="server" Text="Insertar" OnClick="btnInsertarDetallePlanilla_Click" />
    <br />
    <asp:Label ID="lblMensajeError" runat="server"></asp:Label>
        </div>
        <div>
    <h2>Sistema de Planillas</h2>
             <br />
</div>

<div>
    <label for="txtIDSal">ID del empleado:</label>
    <asp:TextBox ID="txtIDSal" runat="server"></asp:TextBox>
    <br />
        
    <label for="txtHorasTrabajadas">Horas Trabajadas:</label>
    <asp:TextBox ID="txtHorasTrabajadas" runat="server"></asp:TextBox>
    <br />
    
    <label for="txtPrecioHora">Precio por Hora:</label>
    <asp:TextBox ID="txtPrecioHora" runat="server"></asp:TextBox>
    <br />
    
    <label for="txtHorasExtras">Horas Extras Trabajadas:</label>
    <asp:TextBox ID="txtHorasExtras" runat="server"></asp:TextBox>
    <br />
    
    <label for="txtHorasExtrasDobles">Horas Extras Dobles Trabajadas:</label>
    <asp:TextBox ID="txtHorasExtrasDobles" runat="server"></asp:TextBox>
    <br />
    
    <label for="txtDeduccionFija">Deducción Fija:</label>
    <asp:TextBox ID="txtDeduccionFija" runat="server"></asp:TextBox>
    <br />
    
    <label for="txtPorcentajeDeduccion">Porcentaje de Deducción (%):</label>
    <asp:TextBox ID="txtPorcentajeDeduccion" runat="server"></asp:TextBox>
    <br />
    
    <label for="txtMes">Mes:</label>
    <asp:TextBox ID="txtMes" runat="server"></asp:TextBox>
    <br />
    
    <label for="ddlEstado">Estado:</label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Text="Aprobada" Value="Aprobada"></asp:ListItem>
        <asp:ListItem Text="Pendiente" Value="Pendiente"></asp:ListItem>
        <asp:ListItem Text="En proceso" Value="En proceso"></asp:ListItem>
    </asp:DropDownList>
    <br />
     <br />
    
    <asp:Button ID="btnCalcularSalario" runat="server" Text="Calcular Salario Base" OnClick="btnCalcularSalario_Click" />
    <br />
    
    <asp:Label ID="Label1" runat="server" CssClass="label"></asp:Label>
</div>


    </form>
    <footer>
    <p>&copy; 2024 Sayuri Morales - Javier Murillo. Administracion de base de datos.</p>
</footer>
</body>
</html>
