using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Sistema_Planilla
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text.Trim();
            string contrasena = txtContrasena.Text.Trim();

            try
            {
                string redirectPage = Autenticar(usuario, contrasena);
                if (!string.IsNullOrEmpty(redirectPage))
                {
                    // Redirigir a la página correspondiente
                    Response.Redirect(redirectPage);
                }
                else
                {
                    lblMensaje.Text = "Nombre de usuario o contraseña incorrectos, o usuario inactivo.";
                    lblMensaje.CssClass = "label-error";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al intentar iniciar sesión: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }


        private string Autenticar(string nombreUsuario, string contrasena)
        {
            if (string.IsNullOrWhiteSpace(nombreUsuario) || string.IsNullOrWhiteSpace(contrasena))
            {
                throw new ArgumentException("El nombre de usuario y la contraseña no pueden estar vacíos.");
            }


            //string genericConnectionString = "Server=JAY;Database=Sistema_Planilla;User Id=UsuarioGenerico;Password=UsuarioGenerico;";
            string genericConnectionString = "Server=JAY;Database=Sistema_Planilla;integrated Security=SSPI";

            using (SqlConnection connection = new SqlConnection(genericConnectionString))
            {
                SqlCommand command = new SqlCommand("usp_AutenticarUsuario", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Nombre_Usuario", nombreUsuario);
                command.Parameters.AddWithValue("@Contrasena", contrasena);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    string tipoUsuario = reader["Tipo_Usuario"].ToString();
                    string estado = reader["Estado"].ToString();

                    if (estado == "Activo")
                    {
                        // Save the employee ID in the session
                        int idEmpleado = ObtenerIDEmpleado(nombreUsuario, genericConnectionString);
                        if (idEmpleado != -1)
                        {
                            HttpContext.Current.Session["ID_Empleado"] = idEmpleado;
                            HttpContext.Current.Session["ConnectionString"] = StringDeConexionPorRole(tipoUsuario);

                            
                            return RedirigirPorTipoUsuario(tipoUsuario);
                        }
                    }
                    else
                    {
                        throw new Exception("Usuario no se encuentra activo. Por favor contacte al administrador.");
                    }
                }

                return null;
            }
        }

        private string RedirigirPorTipoUsuario(string tipoUsuario)
        {
            switch (tipoUsuario)
            {
                case "AdminGeneral":
                    return "Form_Encargado.aspx";
                case "Encargado":
                    return "Form_Encargado.aspx";
                case "Empleado":
                    return "Form_Empleado.aspx";
                case "UsuarioGenerico":
                    return "Form_Empleado.aspx";
                default:
                    throw new Exception("Tipo de usuario no válido");
            }
        }


        private string StringDeConexionPorRole(string role)
        {
            switch (role)
            {
                case "AdminGeneral":
                    return "Server=JAY;Database=Sistema_Planilla;User Id=AdminGeneral;Password=AdminGeneralPass123;";
                case "Encargado":
                    return "Server=JAY;Database=Sistema_Planilla;User Id=FuncionarioEncargado;Password=EncargadoPass123;";
                case "Empleado":
                    return "Server=JAY;Database=Sistema_Planilla;User Id=Funcionario;Password=FuncionarioPass123;";
                case "UsuarioGenerico":
                    return "Server=JAY;Database=Sistema_Planilla;User Id=UsuarioGenerico;Password=GenericoPass123;";
                default:
                    throw new Exception("Rol de usuario no válido");
            }
        }



        private int ObtenerIDEmpleado(string nombreUsuario, string connectionString)
        {
            int idEmpleado = -1; // Valor por defecto si no se encuentra el empleado

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT ID_Empleado FROM Usuario WHERE Nombre_Usuario = @Nombre_Usuario", connection);
                command.Parameters.AddWithValue("@Nombre_Usuario", nombreUsuario);

                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    idEmpleado = Convert.ToInt32(result);
                }
            }

            return idEmpleado;
        }



        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string correoElectronico = txtCorreoElectronico.Text.Trim();
            string mensaje = txtMensaje.Text.Trim();

            try
            {
                InsertarMensajeContacto(nombre, correoElectronico, mensaje);
                lblMensajeContacto.Text = "Mensaje enviado exitosamente.";
                lblMensajeContacto.CssClass = "label-success";
                txtNombre.Text = "";
                txtCorreoElectronico.Text = "";
                txtMensaje.Text = "";

            }
            catch (Exception ex)
            {
                lblMensajeContacto.Text = "Error al enviar el mensaje: " + ex.Message;
                lblMensajeContacto.CssClass = "label-error";
            }
        }
        private void InsertarMensajeContacto(string nombre, string correoElectronico, string mensaje)
        {
            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(correoElectronico) || string.IsNullOrWhiteSpace(mensaje))
            {
                throw new ArgumentException("Todos los campos son obligatorios.");

            }

            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_InsertarMensajeContacto", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Nombre", nombre);
                command.Parameters.AddWithValue("@Correo_Electronico", correoElectronico);
                command.Parameters.AddWithValue("@Mensaje", mensaje);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}