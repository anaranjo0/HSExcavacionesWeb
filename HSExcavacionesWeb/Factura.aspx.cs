using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;

namespace HSExcavacionesWeb
{
    public partial class Factura : System.Web.UI.Page
    {
        private decimal TotalFactura = 0;
        private decimal Totaltte = 0;
        private decimal totalHoras = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgBuscarFactura_Click(object sender, ImageClickEventArgs e)
        {
            grdFactura.Visible = true;
            btnDescargar.Visible = true;
        }

        protected void grdFactura_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Se suma linea por linea el total de la factura
           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TotalFactura += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Valor"));
                Totaltte += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "DblTransporte_Horom"));
                totalHoras += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "IntHorasCobrar_Horom"));
            }
            else if(e.Row.RowType == DataControlRowType.Footer)
            {
                (e.Row.FindControl("lblTFactura") as Label).Text = TotalFactura.ToString("C");
                (e.Row.FindControl("lbltte") as Label).Text = Totaltte.ToString("C");
                (e.Row.FindControl("lblhoras") as Label).Text = totalHoras.ToString();
                e.Row.Font.Bold = true;
               
            }
        }

        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            ExportToExcel("ResumenFactura", grdFactura, txtFactura.Text);
        }

        
        private void ExportToExcel(string nameReport, GridView wControl, string factura)
        {
            HttpResponse response = Response;
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Page pageToRender = new Page();
            HtmlForm form = new HtmlForm();
            form.Controls.Add(wControl);
            pageToRender.Controls.Add(form);
            response.Clear();
            response.Buffer = true;
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=" + nameReport + factura + ".xls");
            response.Charset = "UTF-8";
            response.ContentEncoding = Encoding.Default;
            pageToRender.RenderControl(htw);
            response.Write(sw.ToString());
            response.End();
        }

        protected void dpMaquina_SelectedIndexChanged(object sender, EventArgs e)
        {
            grdFactura.Visible = true;
        }
    }
}