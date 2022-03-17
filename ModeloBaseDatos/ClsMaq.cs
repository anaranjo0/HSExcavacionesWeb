using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModeloBaseDatos
{
    

    public partial class ClsMaq
    {

        public ClsMaq()
        {
            
        }
        public int IntCodigo_Maquina { get; set; }
        public string StrNombre_Maquina { get; set; }

        public string StrModelo_Maquina { get; set; }

        public int IntEstado { get; set; }
    }
}
