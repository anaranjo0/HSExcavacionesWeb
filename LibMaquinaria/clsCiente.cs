using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModeloBaseDatos;
using System.Data;

namespace LibMaquinaria
{
    public class clsCiente
    {
        public string strDocCliente { get; set; }
        public DataTable dtNombreObra { get; set; }
        public string strNombreCliente { get; set; }
        public string strError { get; set; }

        
        public bool IngresarCliente()
        {
            ClsModelo cliente = new ClsModelo();

            if(cliente.InsertarCliente(strDocCliente,strNombreCliente))
            {
                return true;
            }
            else
            {
                strError = cliente.strError;
                return false;
            }

        }

        public bool IngresarObra()
        {
            ClsModelo obra = new ClsModelo();
            
            if(obra.insertarObra(strDocCliente,dtNombreObra))
            {
                return true;
            }
            else
            {
                strError = obra.strError;
                return false;
            }
        }

        public  List<string> Cliente()
        {
            ClsModelo SelCli = new ClsModelo();
            var clientes = SelCli.SeleccionarCliente(strDocCliente);
            return clientes.ToList();
           
        }

        public List<string> obras()
        {
            ClsModelo SelObra = new ClsModelo();
            var obras = SelObra.SeleccionarObra(strDocCliente);
            return obras.ToList();
        }

        public bool BorrarObra()
        {
            ClsModelo BorrObra = new ClsModelo();
            if(BorrObra.BorrarObras(strDocCliente))
            {
                return true;
            }
            else
            {
                strError = BorrObra.strError;
                return false;
            }
        }

        public bool ActualizarCliente()
        {
            ClsModelo cli = new ClsModelo();
            if(cli.ActualizarCliente(strDocCliente, strNombreCliente))
            {
                return true;
            }
            else
            {
                strError = cli.strError;
                return false;
            }
        }
    }
}
