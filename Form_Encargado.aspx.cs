using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Sistema_Planilla
{
    public partial class Form_Encargado : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMensajes();
                CargarConceptos();


            }
        }


        private void CargarMensajes()
        {
            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_ObtenerMensajesContacto", connection);
                command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridViewMensajes.DataSource = dt;
                GridViewMensajes.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                GuardarEmpleado();
                lblMensaje.Text = "Empleado registrado correctamente.";
                lblMensaje.CssClass = "label-success";
            }
            catch (SqlException ex)
            {
                if (ex.Number == 50000) 
                {
                    lblMensaje.Text = ex.Message; 
                    lblMensaje.CssClass = "label-error";
                }
                else
                {
                    lblMensaje.Text = "Error al registrar empleado: " + ex.Message;
                    lblMensaje.CssClass = "label-error";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al registrar empleado: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }
        private void GuardarEmpleado()
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
            string estado = ddlEstado.SelectedValue;
            int idSucursal = Convert.ToInt32(txtIDSucursal.Text.Trim());
            DateTime fechaIngreso = DateTime.Parse(txtFechaIngreso.Text.Trim());

            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_InsertarEmpleado", connection);
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
                command.Parameters.AddWithValue("@Estado", estado);
                command.Parameters.AddWithValue("@ID_Sucursal", idSucursal);
                command.Parameters.AddWithValue("@Fecha_Ingreso", fechaIngreso);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }


        protected void btnEliminarEmpleado_Click(object sender, EventArgs e)
        {
            int idEncargado = Convert.ToInt32(txtID.Text.Trim());

            try
            {
                EliminarEncargado(idEncargado);
                lblMensaje.Text = "Encargado eliminado correctamente.";
                lblMensaje.CssClass = "label-success";

            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al eliminar el encargado: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }
        private void EliminarEncargado(int idEncargado)
        {
            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_EliminarEncargado", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", idEncargado);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            int idEncargado = Convert.ToInt32(txtID.Text.Trim());

            try
            {
                ModificarEncargado(idEncargado);
                lblMensaje.Text = "Datos del encargado modificados correctamente.";
                lblMensaje.CssClass = "label-success";
            }
            catch (SqlException ex)
            {
                if (ex.Number == 50001)
                {
                    lblMensaje.Text = ex.Message;
                    lblMensaje.CssClass = "label-error";
                }
                else
                {
                    lblMensaje.Text = "Error al modificar los datos del encargado: " + ex.Message;
                    lblMensaje.CssClass = "label-error";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al modificar los datos del encargado: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }

        private void ModificarEncargado(int idEncargado)
        {
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
            string estado = ddlEstado.SelectedValue;
            int idSucursal = Convert.ToInt32(txtIDSucursal.Text.Trim());
            DateTime fechaIngreso = DateTime.Parse(txtFechaIngreso.Text.Trim());

            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_ModificarEncargado", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", idEncargado);
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
                command.Parameters.AddWithValue("@Estado", estado);
                command.Parameters.AddWithValue("@ID_Sucursal", idSucursal);
                command.Parameters.AddWithValue("@Fecha_Ingreso", fechaIngreso);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
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
                // Handle the error
                lblMensaje.Text = "Error al cargar los conceptos: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }

        protected void gvConcepto_Editar(object sender, GridViewEditEventArgs e)
        {
            gvConcepto.EditIndex = e.NewEditIndex;
            CargarConceptos();
        }
        protected void gvConcepto_Actualizar(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvConcepto.Rows[e.RowIndex];
            int idConcepto = Convert.ToInt32(gvConcepto.DataKeys[e.RowIndex].Values[0]);

            string nombre = ((TextBox)row.Cells[1].Controls[0]).Text;
            string tipo = ((TextBox)row.Cells[2].Controls[0]).Text;

            try
            {
                string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("usp_ModificarConcepto", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@ID_Concepto", idConcepto);
                    command.Parameters.AddWithValue("@Nombre", nombre);
                    command.Parameters.AddWithValue("@Tipo", tipo);
                    command.Parameters.AddWithValue("@Forma_Calculo", DBNull.Value); // Since 'Forma_Calculo' is not in the GridView

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                gvConcepto.EditIndex = -1;
                CargarConceptos();
            }
            catch (Exception ex)
            {
                // Handle the error
                lblMensaje.Text = "Error al actualizar concepto: " + ex.Message;
                lblMensaje.CssClass = "label-error";
            }
        }


        protected void gvConcepto_Cancel(object sender, GridViewCancelEditEventArgs e)
        {
            gvConcepto.EditIndex = -1;
            CargarConceptos();
        }

        protected void btnBuscarPlanilla_Click(object sender, EventArgs e)
        {
            int idEmpleado;
            if (int.TryParse(txtIDEmpleado.Text, out idEmpleado))
            {
                CargarDatosPlanillaPorID(idEmpleado);
            }
            else
            {
                lblError.Text = "Ingrese un ID de empleado válido.";
                lblError.CssClass = "label-error";
            }
        }

        private void CargarDatosPlanillaPorID(int idEmpleado)
        {
            try
            {
                string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("usp_CargarDetallePlanilla", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID_Empleado", idEmpleado);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();

                    connection.Open();
                    adapter.Fill(dt);
                    connection.Close();

                    if (dt.Rows.Count > 0)
                    {
                        gvDetallePlanilla.DataSource = dt;
                        gvDetallePlanilla.DataBind();
                        lblError.Text = "";
                    }
                    else
                    {
                        gvDetallePlanilla.DataSource = null;
                        gvDetallePlanilla.DataBind();
                        lblError.Text = "No se encontraron datos para el empleado.";
                        lblError.CssClass = "label-error";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error al cargar los datos de la planilla: " + ex.Message;
                lblError.CssClass = "label-error";
            }
        }


        protected void btnInsertarDetallePlanilla_Click(object sender, EventArgs e)
        {
            try
            {
                int idDetalle;
                int idPlanilla;
                int idEmpleado;
                int idConcepto;
                decimal valor;

                // Verificar si los campos de texto tienen valores válidos
                if (!int.TryParse(txtIDDetalle.Text, out idDetalle))
                {
                    throw new FormatException("ID Detalle no es un número válido.");
                }
                if (!int.TryParse(txtIDPlanilla.Text, out idPlanilla))
                {
                    throw new FormatException("ID Planilla no es un número válido.");
                }
                if (!int.TryParse(txtIDEmpleado.Text, out idEmpleado))
                {
                    throw new FormatException("ID Empleado no es un número válido.");
                }
                if (!int.TryParse(txtIDConcepto.Text, out idConcepto))
                {
                    throw new FormatException("ID Concepto no es un número válido.");
                }
                if (!decimal.TryParse(txtValor.Text, out valor))
                {
                    throw new FormatException("Valor no es un número válido.");
                }

                string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("usp_InsertarDetallePlanilla", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID_Detalle", idDetalle);
                    command.Parameters.AddWithValue("@ID_Planilla", idPlanilla);
                    command.Parameters.AddWithValue("@ID_Empleado", idEmpleado);
                    command.Parameters.AddWithValue("@ID_Concepto", idConcepto);
                    command.Parameters.AddWithValue("@Valor", valor);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                lblMensaje.Text = "Detalle de planilla insertado correctamente.";
                lblMensaje.CssClass = "label-success";
            }
            catch (FormatException ex)
            {
                lblMensajeError.Text = "Error de formato: " + ex.Message;
                lblMensajeError.CssClass = "label-error";
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = "Error al insertar detalle de planilla: " + ex.Message;
                lblMensajeError.CssClass = "label-error";
            }
        }


        protected void btnCalcularSalario_Click(object sender, EventArgs e)
        {
            try
            {
                int idEmpleado = Convert.ToInt32(txtIDSal.Text.Trim());
                decimal horasTrabajadas = Convert.ToDecimal(txtHorasTrabajadas.Text.Trim());
                decimal precioHora = Convert.ToDecimal(txtPrecioHora.Text.Trim());
                decimal horasExtras = Convert.ToDecimal(txtHorasExtras.Text.Trim());
                decimal horasExtrasDobles = Convert.ToDecimal(txtHorasExtrasDobles.Text.Trim());
                decimal deduccionFija = Convert.ToDecimal(txtDeduccionFija.Text.Trim());
                decimal porcentajeDeduccion = Convert.ToDecimal(txtPorcentajeDeduccion.Text.Trim());
                string mes = txtMes.Text.Trim();
                string estado = ddlEstado.SelectedValue;

                ValidarRangoSalario(idEmpleado, horasTrabajadas, mes, estado);

                CalcularSalario(idEmpleado, horasTrabajadas, precioHora, horasExtras, horasExtrasDobles);

                // Calcular Cargas Sociales
                CalcularCargasSociales(idEmpleado, horasTrabajadas, precioHora, horasExtras, horasExtrasDobles);

                // Calcular Deducciones
                CalcularDeducciones(idEmpleado, horasTrabajadas, precioHora, horasExtras, horasExtrasDobles, deduccionFija, porcentajeDeduccion);

                Label1.Text = "Salario, cargas sociales y deducciones calculados y guardados correctamente.";
                Label1.CssClass = "label-success";
            }
            catch (Exception ex)
            {
                Label1.Text = "Error al calcular: " + ex.Message;
                Label1.CssClass = "label-error";
            }
        }




        private void ValidarRangoSalario(int idEmpleado, decimal horasTrabajadas, string mes, string estado)
        {
            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_ValidarRangoSalario", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID_Empleado", idEmpleado);
                command.Parameters.AddWithValue("@Horas_Trabajadas", horasTrabajadas);
                command.Parameters.AddWithValue("@Mes", mes);
                command.Parameters.AddWithValue("@Estado", estado);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }



        private void CalcularSalario(int idEmpleado, decimal horasTrabajadas, decimal precioHora, decimal horasExtras, decimal horasExtrasDobles)
        {
            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_CalcularSalario", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID_Empleado", idEmpleado);
                command.Parameters.AddWithValue("@Horas_Trabajadas", horasTrabajadas);
                command.Parameters.AddWithValue("@Precio_Hora", precioHora);
                command.Parameters.AddWithValue("@Horas_Extras", horasExtras);
                command.Parameters.AddWithValue("@Horas_Extras_Dobles", horasExtrasDobles);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private void CalcularCargasSociales(int idEmpleado, decimal horasTrabajadas, decimal precioHora, decimal horasExtras, decimal horasExtrasDobles)
        {
            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_CalcularCargasSociales", connection);
                command.CommandType = CommandType.StoredProcedure;

                // Primero calcular el salario base, horas extras y dobles
                decimal salarioBase = horasTrabajadas * precioHora;
                decimal salarioExtras = horasExtras * precioHora * 1.5m;
                decimal salarioExtrasDobles = horasExtrasDobles * precioHora * 2;

                command.Parameters.AddWithValue("@ID_Empleado", idEmpleado);
                command.Parameters.AddWithValue("@SalarioBase", salarioBase);
                command.Parameters.AddWithValue("@SalarioHorasExtras", salarioExtras);
                command.Parameters.AddWithValue("@SalarioHorasExtrasDobles", salarioExtrasDobles);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private void CalcularDeducciones(int idEmpleado, decimal horasTrabajadas, decimal precioHora, decimal horasExtras, decimal horasExtrasDobles, decimal deduccionFija, decimal porcentajeDeduccion)
        {
            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_CalcularDeducciones", connection);
                command.CommandType = CommandType.StoredProcedure;

                // Calcular el salario bruto
                decimal salarioBase = horasTrabajadas * precioHora;
                decimal salarioExtras = horasExtras * precioHora * 1.5m;
                decimal salarioExtrasDobles = horasExtrasDobles * precioHora * 2;
                decimal salarioBruto = salarioBase + salarioExtras + salarioExtrasDobles;

                command.Parameters.AddWithValue("@ID_Empleado", idEmpleado);
                command.Parameters.AddWithValue("@SalarioBruto", salarioBruto);
                command.Parameters.AddWithValue("@DeduccionFija", deduccionFija);
                command.Parameters.AddWithValue("@PorcentajeDeduccion", porcentajeDeduccion);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private void ValidarTotalHoras(int idEmpleado, decimal horasTrabajadas, decimal horasExtras, decimal horasExtrasDobles)
        {
            string connectionString = "Server=JAY;Database=Sistema_Planilla;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("usp_ValidarTotalHoras", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID_Empleado", idEmpleado);
                command.Parameters.AddWithValue("@HorasTrabajadas", horasTrabajadas);
                command.Parameters.AddWithValue("@HorasExtras", horasExtras);
                command.Parameters.AddWithValue("@HorasExtrasDobles", horasExtrasDobles);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        




    }
}