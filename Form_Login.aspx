<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Login.aspx.cs" Inherits="Sistema_Planilla.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" href="Estilos/Login.css"/>
</head>
<body>
    <div class="welcome-message">
        <h1>Bienvenidos</h1>
    </div>
    <form id="Form_Login" runat="server">
        <div>
            <label for="txtUsuario">Usuario:</label>
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            <br />
            <label for="txtContrasena">Contraseña:</label>
            <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" AutoPostBack="true" />

            <br />
            <asp:Label ID="lblMensaje" runat="server" ></asp:Label>
        </div>

        <hr />

        <div>
            <h2>Contáctenos</h2>
            <label for="txtNombre">Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server" ></asp:TextBox>
            <br />
            <label for="txtCorreoElectronico">Correo Electrónico:</label>
            <asp:TextBox ID="txtCorreoElectronico" runat="server"></asp:TextBox>
            <br />
            <label for="txtMensaje">Mensaje:</label>
            <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
            <br />
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
            <br />
            <asp:Label ID="lblMensajeContacto" runat="server" ></asp:Label>
        </div>
    </form>

 <footer>
    <p>&copy; 2024 Sayuri Morales - Javier Murillo. Administracion de base de datos.</p>
</footer>
</body>
</html>
