using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModeloBaseDatos;


namespace LibMaquinaria
{

    public class ClsMaquinaria
    {

        public string Fhorometro { get; set; }
        public double Hinicial { get; set; }
        public double Horofinal { get; set; }
        public double HorasOrdi { get; set; }
        public double Standby { get; set; }
        public double HoroIniExtra { get; set; }
        public double HoroFinExtra { get; set; }
        public double HoraIniExtra { get; set; }
        public double HoraFinalExtra { get; set; }
        public double HorasExtras { get; set; }
        public double HorasCobrar { get; set; }
        public double ValorHora { get; set; }
        public double Transporte { get; set; }
        public int Factura { get; set; }
        public int Obra { get; set; }
        public string Cliente { get; set; }

        public int codMaquina { get; set; }

        public string strError { get; set; }
        public string strNombreMaquina { get; set; }
        public string strModeloMaquina { get; set; }
        public int IntEstadoMaquina { get; set; }


        public string GuardarObserva(int CodHoro, string observa)
        {
            ClsModelo mod = new ClsModelo();
            string resultado = mod.ActualizarObservacion(CodHoro, observa);
            return resultado;
        }

       
        public List<string> SelObserva(int codHorom)
        {
            ClsModelo SelCli = new ClsModelo();
            var clientes = SelCli.SeleccionarObserva(codHorom);
            return clientes.ToList();

        }

        public IEnumerable<ClsMaq> ConsultarMaq()
        {
            return ClsModelo.SelectMaquina(codMaquina);
        }

    

        public List<string> ConsultaMaquinaHorom()
        {
            ClsModelo Cmaqu = new ClsModelo();
            return Cmaqu.SeleccionarMaquinaHorometro(codMaquina);
        }


        public bool EliminarMaquinas()
        {
            ClsModelo maq = new ClsModelo();

            if(maq.BorrarMaquinas(codMaquina))
            {
                return true;
            }
            else
            {
                strError = maq.strError;
                return false;
            }

        }

        public bool InsertarMaquina()
        {
            ClsModelo maq = new ClsModelo();
            if(maq.insertarMaquina(strNombreMaquina, strModeloMaquina, IntEstadoMaquina))
            {
                return true;
            }
            else
            {
                strError = maq.strError;
                return false;
            }
        }

        public bool ActualizarMaquina()
        {
            ClsModelo maq = new ClsModelo();
            if (maq.actualizarMaquina(codMaquina, strNombreMaquina, strModeloMaquina, IntEstadoMaquina))
            {
                return true;
            }
            else
            {
                strError = maq.strError;
                return false;
            }
        }
    }
}
