using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibMaquinaria;
using System.Data;


namespace HSExcavacionesWeb
{
    public partial class Clientes : System.Web.UI.Page
    {
        string[] obras;
        DataTable dtsGridObra;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dimensionarGridOBra();
            }
        }

        private void dimensionarGridOBra()
        {
            DataTable dtsObra = new DataTable();
            dtsObra.Columns.Add(new DataColumn("Obra", typeof(string)));
            Session["gridObra"] = dtsObra;

        }
        protected void lnkAgregarOb_Click(object sender, EventArgs e)
        {
            if (txtObra.Text != "")
            {
                dtsGridObra = (DataTable)Session["gridObra"];
                DataRow dr = dtsGridObra.NewRow();
                dr["Obra"] = this.txtObra.Text;
                dtsGridObra.Rows.Add(dr);

                grdClientes.DataSource = dtsGridObra;
                grdClientes.DataBind();
                grdClientes.Visible = true;
                txtObra.Text = "";
                lblError.Text = "";
                lnkGuardar.Visible = true;
            }
            else
            {
                lblError.Text = "Debe ingresar una obra al cliente";
            }
            
        }

        protected void lnkGuardar_Click(object sender, EventArgs e)
        {

            if (txtDocCliente.Enabled != true)
            {
                Actualizar();
            }
            else
            {
                Guardar();
            }

        }

        private void Guardar()
        {
            clsCiente cliente = new clsCiente();
            lblError.Text = "";
            cliente.strDocCliente = txtDocCliente.Text;
            cliente.strNombreCliente = txtNombreCliente.Text;
            cliente.dtNombreObra = (DataTable)Session["gridObra"];

            if (cliente.IngresarCliente())
            {
                if (cliente.IngresarObra())
                {
                    lblError.Text = "Cliente ingresado correctamente";
                    Limpiar();
                    dpConsultaCliente.DataBind();
                }
                else
                {
                    lblError.Text = cliente.strError.ToString();
                }
            }
            else
            {
                lblError.Text = cliente.strError.ToString();
            }

        }

        private void Actualizar()
        {
            clsCiente ActCliente = new clsCiente();
            ActCliente.strDocCliente = txtDocCliente.Text;
            ActCliente.dtNombreObra = (DataTable)Session["gridObra"];
            ActCliente.strNombreCliente = txtNombreCliente.Text;

            if (ActCliente.ActualizarCliente())
            {
                if (ActCliente.BorrarObra())
                {
                    if (ActCliente.IngresarObra())
                    {
                        lblError.Text = "Cliente - Obra actualizado correctamente";
                        Limpiar();
                        dpConsultaCliente.DataBind();
                    }
                    else
                    {
                        lblError.Text = "Se presento error ingrensando las obras: " + ActCliente.strError;
                    }
                }
                else
                {
                    lblError.Text = "Se presento error borrando las obras: " + ActCliente.strError;
                }
            }
            else
            {
                lblError.Text = "Se presento error actualizando el cliente: " + ActCliente.strError;
            }
        }

        private void Limpiar()
        {
            txtDocCliente.Text = "";
            txtNombreCliente.Text = "";
            txtObra.Text = "";
            grdClientes.Visible = false;
            lnkGuardar.Visible = false;
        }

        protected void dpConsultaCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            clsCiente cliente = new clsCiente();
            lblError.Text = "";
            cliente.strDocCliente = dpConsultaCliente.SelectedValue.ToString();
            List<string> Selcli = cliente.Cliente();
            txtDocCliente.Text = dpConsultaCliente.SelectedValue.ToString();
            foreach(string cli in Selcli)
            {
                txtNombreCliente.Text = cli.ToString();
            }

            List<string> obras = cliente.obras();
            grdClientes.DataSource = obras;
            grdClientes.DataBind();
            grdClientes.Visible = true;
            txtDocCliente.Enabled = false;
            lnkGuardar.Visible = true;
            Session["gridObra"] = ListToDatatable(obras);

            

        }
        
        protected static DataTable ListToDatatable(List<string> lista)
        {
            
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add(new DataColumn("Obra", typeof(string)));
            foreach (var row in lista)
            {
                dataTable.Rows.Add(row);
            }
            return dataTable;
        }

        protected void lnkNuevo_Click(object sender, EventArgs e)
        {
            
            Limpiar();
            txtDocCliente.Enabled = true;
            Session["gridObra"] = null;
            dimensionarGridOBra();
        }

        protected void grdClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dtsGridObra = (DataTable)Session["gridObra"];
            dtsGridObra.Rows.RemoveAt(e.RowIndex);
            grdClientes.DataSource = dtsGridObra.DefaultView;
            grdClientes.DataBind();
        }
    }
}