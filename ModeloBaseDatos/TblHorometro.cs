//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ModeloBaseDatos
{
    using System;
    using System.Collections.Generic;
    
    public partial class TblHorometro
    {
        public int IntCodigo_Horom { get; set; }
        public System.DateTime DtmFecha_Horom { get; set; }
        public int IntCodigo_Maquina { get; set; }
        public Nullable<decimal> IntHoroIni_Horom { get; set; }
        public Nullable<decimal> IntHoroFin_Horom { get; set; }
        public Nullable<decimal> IntHorasOrdina_Horom { get; set; }
        public decimal IntStandBy_Horom { get; set; }
        public Nullable<decimal> IntHoroIniExt_Horom { get; set; }
        public Nullable<decimal> IntHoroFinExt_Horom { get; set; }
        public Nullable<decimal> IntHoraIniExt_Horom { get; set; }
        public Nullable<decimal> IntHoraFinExt_Horom { get; set; }
        public Nullable<decimal> IntHorasExtras_Horom { get; set; }
        public Nullable<decimal> IntHorasCobrar_Horom { get; set; }
        public decimal DblValorHora_Horom { get; set; }
        public Nullable<decimal> DblTransporte_Horom { get; set; }
        public string IntFactura_Horom { get; set; }
        public int Intcodigo_Obra { get; set; }
        public string StrDocumento_Cliente { get; set; }
        public string strObservacion_Horom { get; set; }
    
        public virtual TblCliente TblCliente { get; set; }
        public virtual TblObra TblObra { get; set; }
        public virtual TblMaquina TblMaquina { get; set; }
    }
}
