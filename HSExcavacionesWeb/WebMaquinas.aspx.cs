﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using ModeloBaseDatos;
using System.Drawing;

namespace HSExcavacionesWeb
{

    public partial class WebMaquinas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Hfinal"] = "0";
          
           
        }




        protected void GRDmaquinaria_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GRDmaquinaria_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                Label Horo = (Label)e.Row.FindControl("lblHinicial");
                if (Horo != null & Session["Hfinal"].ToString() != "0")
                {
                    Double Hini = Double.Parse(Horo.Text);
                    if (Hini != Convert.ToDouble(Session["Hfinal"]))
                    {
                        e.Row.Cells[3].BackColor = Color.FromName("#F78AC9");
                        Label Domingo = (Label)e.Row.FindControl("LblIFecha");

                        if (Domingo != null)
                        {
                            string Valor = Convert.ToString(Domingo.Text);
                            Valor = Valor.Substring(0, 7);
                            if (Valor == "Domingo")
                            {
                                e.Row.Cells[3].BackColor = Color.FromName("#859CBB");

                            }
                        }

                    }
                    else
                    {
                        e.Row.Cells[3].BackColor = e.Row.Cells[5].BackColor;
                    }
                }
                Label Hfinal = (Label)e.Row.FindControl("lblHFinalExtra");
                TextBox HFinaltxt = (TextBox)e.Row.FindControl("txtHFinalExtra");
                if (Hfinal != null)
                {
                    Double HfinalVal = Double.Parse(Hfinal.Text);
                    Session["Hfinal"] = HfinalVal;
                }
                else if(HFinaltxt != null)
                {
                    Double HfinalVal = Double.Parse(HFinaltxt.Text);
                    Session["Hfinal"] = HfinalVal;
                }




                Label tot = (Label)e.Row.FindControl("label5");
                if (tot != null)
                {
                    Double total = Double.Parse(tot.Text);
                    if (total < 5)
                    {
                        e.Row.Cells[6].BackColor = Color.FromName("#f55b5b");
                        Label Domingo = (Label)e.Row.FindControl("LblIFecha");

                        if (Domingo != null)
                        {
                            string Valor = Convert.ToString(Domingo.Text);
                            Valor = Valor.Substring(0, 7);
                            if (Valor == "Domingo")
                            {
                                e.Row.Cells[6].BackColor = Color.FromName("#859CBB");

                            }
                        }
                    }
                    else
                    {
                        e.Row.Cells[6].BackColor = e.Row.Cells[5].BackColor;
                    }
                }

                Label Dom = (Label)e.Row.FindControl("LblIFecha");

                if (Dom != null)
                {
                    string Valor = Convert.ToString(Dom.Text);
                    Valor = Valor.Substring(0, 7);
                    if (Valor == "Domingo")
                    {
                        for (int i = 1; i <= 20; i++)
                        {
                            e.Row.Cells[i].ForeColor = Color.FromName("#ff0000");
                            
                        }
                        

                    }
                }

                
            }
         

        }

   

        protected void LnkIngresar_Click(object sender, EventArgs e)
        {
            ClsModelo BDMod = new ClsModelo();
            lblError.Text = "";
           
            string Fecha = (GRDmaquinaria.FooterRow.FindControl("TxtFFecha") as TextBox).Text;
            int CodMaq = Convert.ToInt32(DPMaquina.SelectedValue);
            decimal Hini = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFHinicial") as TextBox).Text);
            decimal HFin = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFHfinal") as TextBox).Text);
            decimal Standby = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFStandby") as TextBox).Text);
            decimal HiniExtra = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFHoroIniExt") as TextBox).Text);
            decimal HfinExtra = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFHoroFinExt") as TextBox).Text);
            decimal HorainiEx = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFHoraIniExt") as TextBox).Text);
            decimal HorafinEx = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFHoraFinExt") as TextBox).Text);
            int Valorhora = Convert.ToInt32((GRDmaquinaria.FooterRow.FindControl("TxtValorHora") as TextBox).Text.ToString());
            int TTE = Convert.ToInt32((GRDmaquinaria.FooterRow.FindControl("TxtFTransp") as TextBox).Text);
            string Fact = (GRDmaquinaria.FooterRow.FindControl("TxtFFactura") as TextBox).Text;
            string Obra = (GRDmaquinaria.FooterRow.FindControl("DPFObra") as DropDownList).SelectedValue;
            string Cliente = (GRDmaquinaria.FooterRow.FindControl("DPFCliente") as DropDownList).SelectedValue;



            string error = (BDMod.InsertarHoras(Fecha, CodMaq, Hini, HFin, Standby, HiniExtra, HfinExtra, HorainiEx, HorafinEx, Valorhora, TTE, Fact, Convert.ToInt32(Obra), Cliente));
            if(error != "")
            {
                lblError.Text = error.ToString();
            }
            

            
            GRDmaquinaria.PageIndex = GRDmaquinaria.PageCount - 1;
            GRDmaquinaria.DataBind();
           

        }

        protected void DPMaquina_SelectedIndexChanged(object sender, EventArgs e)
        {
            GRDmaquinaria.PageIndex = GRDmaquinaria.PageCount - 1;
        }

        protected void TxtFHfinal_TextChanged(object sender, EventArgs e)
        {

            decimal Hini = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFHinicial") as TextBox).Text);
            decimal Hfinal = Convert.ToDecimal((GRDmaquinaria.FooterRow.FindControl("TxtFHfinal") as TextBox).Text);
            decimal standby = Hfinal - Hini;
            (GRDmaquinaria.FooterRow.FindControl("TxtFStandby") as TextBox).Text = standby.ToString();
            (GRDmaquinaria.FooterRow.FindControl("TxtFHoroIniExt") as TextBox).Text = Hfinal.ToString();
            (GRDmaquinaria.FooterRow.FindControl("TxtFHoroFinExt") as TextBox).Text = Hfinal.ToString();
        }

      

        protected void cargarvalor()
        {


            int ultfila = Convert.ToInt32(GRDmaquinaria.Rows.Count - 1);
            Label HEFinal = (Label)GRDmaquinaria.Rows[ultfila].FindControl("lblHFinalExtra");
            Label ValorHora = (Label)GRDmaquinaria.Rows[ultfila].FindControl("lblValorHora");
            Label Fecha = (Label)GRDmaquinaria.Rows[ultfila].FindControl("lblFeIngreso");
            

            if (HEFinal != null)
            {
                (GRDmaquinaria.FooterRow.FindControl("TxtFHinicial") as TextBox).Text = HEFinal.Text.ToString();
            }
            if (ValorHora != null)
            {
                string VHora = ValorHora.Text.ToString();
                double val = Convert.ToDouble(VHora.Trim(new char[] {'$', ' ' }));
                lblError.Text = "pueba";
                (GRDmaquinaria.FooterRow.FindControl("TxtValorHora") as TextBox).Text = val.ToString();
            }
            if (Fecha != null)
            {
                (GRDmaquinaria.FooterRow.FindControl("TxtFFecha") as TextBox).Text = Fecha.Text.ToString();
            }

        }

        protected void GRDmaquinaria_DataBound(object sender, EventArgs e)
        {
            cargarvalor();
        }

        protected void txtHFin_TextChanged(object sender, EventArgs e)
        {
            int Fila = GRDmaquinaria.EditIndex;
            decimal Hini = Convert.ToDecimal((GRDmaquinaria.Rows[Fila].FindControl("txtHIni") as TextBox).Text);
            decimal Hfinal = Convert.ToDecimal((GRDmaquinaria.Rows[Fila].FindControl("txtHFin") as TextBox).Text);
            decimal standby = Hfinal - Hini;
            (GRDmaquinaria.Rows[Fila].FindControl("TxtEStandby") as TextBox).Text = standby.ToString();
            (GRDmaquinaria.Rows[Fila].FindControl("TxtEHIExtra") as TextBox).Text = Hfinal.ToString();
            (GRDmaquinaria.Rows[Fila].FindControl("txtHFinalExtra") as TextBox).Text = Hfinal.ToString();
        }

        protected void ClFecha_SelectionChanged(object sender, EventArgs e)
        {
            (GRDmaquinaria.FooterRow.FindControl("TxtFFecha") as TextBox).Text = (GRDmaquinaria.FooterRow.FindControl("clfecha") as Calendar).SelectedDate.ToString("dd/MM/yyyy");
            (GRDmaquinaria.FooterRow.FindControl("clfecha") as Calendar).Visible = false;
        }

        protected void btnFecha_Click(object sender, ImageClickEventArgs e)
        {
            if ((GRDmaquinaria.FooterRow.FindControl("clfecha") as Calendar).Visible == false)
            {
                (GRDmaquinaria.FooterRow.FindControl("clfecha") as Calendar).Visible = true;
            }
            else
            {
                (GRDmaquinaria.FooterRow.FindControl("clfecha") as Calendar).Visible = false;
            }
        }

        protected void txtHIni_TextChanged(object sender, EventArgs e)
        {
            int Fila = GRDmaquinaria.EditIndex;
            decimal Hini = Convert.ToDecimal((GRDmaquinaria.Rows[Fila].FindControl("txtHIni") as TextBox).Text);
            decimal Hfinal = Convert.ToDecimal((GRDmaquinaria.Rows[Fila].FindControl("txtHFin") as TextBox).Text);
            decimal standby = Hfinal - Hini;
            (GRDmaquinaria.Rows[Fila].FindControl("TxtEStandby") as TextBox).Text = standby.ToString();
            (GRDmaquinaria.Rows[Fila].FindControl("TxtEHIExtra") as TextBox).Text = Hfinal.ToString();
            (GRDmaquinaria.Rows[Fila].FindControl("txtHFinalExtra") as TextBox).Text = Hfinal.ToString();

        }

     
    }

}