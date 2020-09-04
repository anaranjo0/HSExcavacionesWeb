using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibMaquinaria;

namespace HSExcavacionesWeb
{
    public partial class WebObservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                cargarObserva();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ClsMaquinaria maq = new ClsMaquinaria();
            int codHoro = Convert.ToInt32(Request.QueryString["codigo"]);
            string result = maq.GuardarObserva(codHoro, txtObservacion.Text);
            lblerror.Text = result.ToString();

        }

        private void cargarObserva()
        {
            ClsMaquinaria maq = new ClsMaquinaria();
            int codHoro = Convert.ToInt32(Request.QueryString["codigo"]);
            List<string> Observa = maq.SelObserva(codHoro);
            foreach (string obs in Observa)
            {
                //if (is null or empty obs.ToString() )
                //{
                //    txtObservacion.Text = obs.ToString();
                //}
            }
        }
    }
}