using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibMaquinaria;
using ModeloBaseDatos;

namespace HSExcavacionesWeb
{
    public partial class Maquinas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                inactivar();
            }
        }

        protected void dpConsultaMaquinas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Limpiar();
            lblError.Text = "";
            ClsMaquinaria consultaMaq = new ClsMaquinaria();
            consultaMaq.codMaquina = Convert.ToInt32(dpConsultaMaquinas.SelectedValue);
            IEnumerable<ClsMaq> maquina = consultaMaq.ConsultarMaq();
            
            foreach( var maq in maquina)
            {
                txtNomMaquina.Text = maq.StrNombre_Maquina;
                txtModMaquina.Text = maq.StrModelo_Maquina;
                if(maq.IntEstado == 1)
                {
                    RdEstado.Items[0].Selected = true;
                    RdEstado.Items[1].Selected = false;
                }
                else
                {
                    RdEstado.Items[1].Selected = true;
                    RdEstado.Items[0].Selected = false;
                }
            }
        }

        protected void lnkEliminar_Click(object sender, EventArgs e)
        {
            ClsMaquinaria consultaMaqHoro = new ClsMaquinaria();
            consultaMaqHoro.codMaquina = Convert.ToInt32(dpConsultaMaquinas.SelectedValue);
            List<string> Existe = consultaMaqHoro.ConsultaMaquinaHorom();


            if (Existe.Count > 0)
            {
                lblError.Text = "No se puede eliminar la maquina, ya tienen registros de horometro creados, debe inactivarla";
            }
            else
            {
                if (consultaMaqHoro.EliminarMaquinas())
                {
                    lblError.Text = "Registro eliminado correctamente";
                    Limpiar();
                    dpConsultaMaquinas.DataBind();
                }
                else
                {
                    lblError.Text = consultaMaqHoro.strError.ToString();
                }
            }

            

        }

        protected void lnkGuardar_Click(object sender, EventArgs e)
        {
            
            ClsMaquinaria MaqHoro = new ClsMaquinaria();
            MaqHoro.strNombreMaquina = txtNomMaquina.Text.ToUpper();
            MaqHoro.strModeloMaquina = txtModMaquina.Text.ToUpper();
            if(RdEstado.Items[0].Selected == true)
            {
                MaqHoro.IntEstadoMaquina = 1;
            }
            else
            {
                MaqHoro.IntEstadoMaquina = 0;
            }
            
            if(MaqHoro.InsertarMaquina())
            {
                lblError.Text = "El registro se creo correctamente";
                Limpiar();
                dpConsultaMaquinas.DataBind();
            }
            else
            {
                lblError.Text = MaqHoro.strError.ToString();
            }
        }

        protected void lnkActualizar_Click(object sender, EventArgs e)
        {
            Limpiar();
            lblError.Text = "";
            ClsMaquinaria MaqHoro = new ClsMaquinaria();
            MaqHoro.codMaquina = Convert.ToInt16(dpConsultaMaquinas.SelectedValue);
            MaqHoro.strNombreMaquina = txtNomMaquina.Text.ToUpper();
            MaqHoro.strModeloMaquina = txtModMaquina.Text.ToUpper();
            if (RdEstado.Items[0].Selected == true)
            {
                MaqHoro.IntEstadoMaquina = 1;
            }
            else
            {
                MaqHoro.IntEstadoMaquina = 0;
            }

            if (MaqHoro.ActualizarMaquina())
            {
                lblError.Text = "El registro se actualizó correctamente";
                dpConsultaMaquinas.DataBind();
            }
            else
            {
                lblError.Text = MaqHoro.strError.ToString();
            }
        }

        private void Limpiar()
        {
            txtNomMaquina.Text = "";
            txtModMaquina.Text = "";
            RdEstado.Items[0].Selected = true;
            RdEstado.Items[1].Selected = false;

        }

        private void activar()
        {
            txtNomMaquina.Enabled = true;
            txtModMaquina.Enabled = true;
            RdEstado.Enabled = true;
        }
        private void inactivar()
        {
            txtNomMaquina.Enabled = false;
            txtModMaquina.Enabled = false;
            RdEstado.Enabled = false;
        }

        protected void lnkNuevo_Click(object sender, EventArgs e)
        {
            Limpiar();
            activar();
        }
    }
}