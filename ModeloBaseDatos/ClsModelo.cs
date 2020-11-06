using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Reflection;
using System.Data;

namespace ModeloBaseDatos
{
    

    public class ClsModelo

    {


        public string strError { get; set; }
        public DataTable dtObras { get; set; }



      
        public string InsertarHoras(string Fhorometro, int codMaquina, decimal Hinicia, decimal Horofinal, 
                                           decimal Standby, decimal HoroIniExtra, decimal HoroFinExtra, decimal HoraIniExtra, decimal HoraFinalExtra,
                                           decimal ValorHora, decimal Transporte, string Factura, int Obra, string Cliente)
        {
            using(DBHSExcavcionesEntities1 Horo = new DBHSExcavcionesEntities1())
            {

              
                try
                {
                    var Horometro = Horo.Insertar_Horas(Convert.ToDateTime(Fhorometro),codMaquina,Hinicia,Horofinal,Standby,HoroIniExtra,HoroFinExtra,
                                                        HoraIniExtra,HoraFinalExtra,ValorHora,Transporte,Factura, Obra,Cliente);
                    return "";
                }
                catch (Exception e)
                {
                    return e.InnerException.ToString();
                }
            }
        }

        public bool InsertarCliente(string docCliente, string nombreCliente)
        {
            using(DBHSExcavcionesEntities1 clie = new DBHSExcavcionesEntities1())
            {
                try
                {
                    var Cliente = clie.Insertar_Cliente(docCliente, nombreCliente);

                    return true;
                    
                }
                catch (Exception e)
                {

                    strError =  e.InnerException.ToString();
                    return false;
                }
            }
        }

        public bool insertarObra(string docCliente,  DataTable obra)
        {
            using(DBHSExcavcionesEntities1 Regobra = new DBHSExcavcionesEntities1())
            {
                try
                {
                    foreach (DataRow valor in obra.Rows)
                    {
                        var clienteobra = Regobra.Insertar_Obra(valor[0].ToString(), docCliente);
                        
                    }
                    return true;
                }
                catch (Exception e)
                {
                    strError = e.InnerException.ToString();
                    return false;
                }
            }
        }

        public List<string> SeleccionarCliente(string docCliente)
        {
            using (DBHSExcavcionesEntities1 SelCliente = new DBHSExcavcionesEntities1())
            {
                
                    var Cliente = SelCliente.Seleccionar_Cliente_Obra(docCliente);
                    return Cliente.ToList();

                
            }
        }

        //public IEnumerable<DataView> slobra(string docclien)
        //{
        //    using (DBHSExcavcionesEntities1 SelObra = new DBHSExcavcionesEntities1())
        //    {
        //     var obra = (from obras in SelObra.TblObra.AsEnumerable()
        //                                    where obras.StrDocumento_Cliente == docclien
        //                                       select obras);

        //        return obra;




        //    }
        //}
        
        public  List<string> SeleccionarObra(string docCliente)
        {
            using (DBHSExcavcionesEntities1 SelObra = new DBHSExcavcionesEntities1())
            {
                var obra = SelObra.Seleccionar_Obras(docCliente).ToList();
                return obra.ToList();
            }
        }

        public bool BorrarObras(string docCliente)
        {
            using(DBHSExcavcionesEntities1 BorrarObra = new DBHSExcavcionesEntities1())
            {
                try
                {
                    var obra = BorrarObra.borrar_Obra(docCliente);
                    return true;
                }
                catch (Exception e)
                {
                    strError = e.InnerException.ToString();
                    return false;
                }
            }
        }

        public bool ActualizarCliente(string docCliente, string NombreCliente)
        {
            using(DBHSExcavcionesEntities1 cliente = new DBHSExcavcionesEntities1())
                try
                {
                    var cli = cliente.Actualizar_Cliente(docCliente, NombreCliente);
                    return true;
                }
                catch(Exception e)
                {
                    strError = e.InnerException.ToString();
                    return false;
                }
        }

        public string ActualizarObservacion(int codHoro,string Observa )
        {
            using (DBHSExcavcionesEntities1 Horo = new DBHSExcavcionesEntities1())
            {


                try
                {
                    var Horometro = Horo.Actualizar_Observaciones(codHoro,Observa);
                    return "Actualizado Correctamente";
                }
                catch (Exception e)
                {
                    return e.InnerException.ToString();
                }
            }
        }

        public List<string> SeleccionarObserva(int CodHorom)
        {
            using (DBHSExcavcionesEntities1 SelObra = new DBHSExcavcionesEntities1())
            {
                var obra = SelObra.Seleccionar_Observaciones(CodHorom);
                return obra.ToList();
            }
        }

    }


}
