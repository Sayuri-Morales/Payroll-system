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
    public partial class Form_Empleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
               
                ObtenerDatosEmpleado();
                CargarDatosPlanilla();
                CargarConceptos();
            }
        }
        private void ObtenerDatosEmpleado()
        {
            try
            {
                int idEmpleado = ObtenerIdEmpleadoLogueado();

                string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("usp_ObtenerEmpleadoPorID", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID", idEmpleado);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        txtID.Text = idEmpleado.ToString();
                        txtNombre.Text = reader["Nombre"].ToString();
                        txtApellidoP.Text = reader["ApellidoP"].ToString();
                        txtApellidoS.Text = reader["ApellidoS"].ToString();
                        txtNacionalidad.Text = reader["Nacionalidad"].ToString();
                        txtFechaNacimiento.Text = ((DateTime)reader["Fecha_Nacimiento"]).ToString("yyyy-MM-dd");
                        txtProvincia.Text = reader["Provincia"].ToString();
                        txtCanton.Text = reader["Canton"].ToString();
                        txtDistrito.Text = reader["Distrito"].ToString();
                        txtBarrio.Text = reader["Barrio"].ToString();
                        txtDireccion.Text = reader["Direccion_Ubicacion"].ToString();
                        txtTelefono.Text = reader["Telefono"].ToString();
                        txtCorreoElectronico.Text = reader["Correo_Electronico"].ToString();

                        // Almacena la RowVersion como cadena Base64
                        ViewState["RowVersion"] = Convert.ToBase64String((byte[])reader["RowVersion"]);
                    }
                    else
                    {
                        lblMensaje.Text = "No se encontraron datos para el empleado con ID: " + idEmpleado;
                        lblMensaje.CssClass = "label-error";
                    }

                    reader.Close();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al obtener datos del empleado: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }




        private int ObtenerIdEmpleadoLogueado()
        {
            if (Session["ID_Empleado"] != null)
            {
                int idEmpleado = Convert.ToInt32(Session["ID_Empleado"]);
                return idEmpleado;
            }
            else
            {
                throw new Exception("No se encontró el ID del empleado en la sesión.");
            }
        }




        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                ModificarEmpleado();
                lblMensaje.Text = "Empleado modificado correctamente.";
                lblMensaje.CssClass = "label-success";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al modificar empleado: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }
        private void ModificarEmpleado()
        {
            int id = Convert.ToInt32(txtID.Text.Trim());
            string nombre = txtNombre.Text.Trim();
            string apellidoP = txtApellidoP.Text.Trim();
            string apellidoS = txtApellidoS.Text.Trim();
            string nacionalidad = txtNacionalidad.Text.Trim();
            DateTime fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text.Trim());
            string provincia = txtProvincia.Text.Trim();
            string canton = txtCanton.Text.Trim();
            string distrito = txtDistrito.Text.Trim();
            string barrio = txtBarrio.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string correoElectronico = txtCorreoElectronico.Text.Trim();
            byte[] rowVersion = Convert.FromBase64String(ViewState["RowVersion"].ToString());

            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_ActualizarEmpleado", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", id);
                command.Parameters.AddWithValue("@Nombre", nombre);
                command.Parameters.AddWithValue("@ApellidoP", apellidoP);
                command.Parameters.AddWithValue("@ApellidoS", apellidoS);
                command.Parameters.AddWithValue("@Nacionalidad", nacionalidad);
                command.Parameters.AddWithValue("@Fecha_Nacimiento", fechaNacimiento);
                command.Parameters.AddWithValue("@Provincia", provincia);
                command.Parameters.AddWithValue("@Canton", canton);
                command.Parameters.AddWithValue("@Distrito", distrito);
                command.Parameters.AddWithValue("@Barrio", barrio);
                command.Parameters.AddWithValue("@Direccion_Ubicacion", direccion);
                command.Parameters.AddWithValue("@Telefono", telefono);
                command.Parameters.AddWithValue("@Correo_Electronico", correoElectronico);
                command.Parameters.AddWithValue("@RowVersion", rowVersion);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }


        private void CargarDatosPlanilla()
        {
            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_CargarDetallePlanilla", connection);
                command.CommandType = CommandType.StoredProcedure;

                int id = ObtenerIdEmpleadoLogueado();
                command.Parameters.AddWithValue("@ID_Empleado", id);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();

                connection.Open();
                adapter.Fill(dt);
                connection.Close();

                gvDetallePlanilla.DataSource = dt;
                gvDetallePlanilla.DataBind();
            }
        }



        private void CargarConceptos()
        {
            try
            {
                string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("usp_CargarConceptos", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();

                    connection.Open();
                    adapter.Fill(dt);
                    connection.Close();

                    gvConcepto.DataSource = dt;
                    gvConcepto.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al cargar los conceptos: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }



    }
}