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

    }
}
