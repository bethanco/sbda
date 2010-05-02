using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Descripción breve de clsPPalClave
/// </summary>
public class clsPPalClave : CONB
{

    #region Propiedades

        private String sNombre_nm, iPPalClave_id;

    #endregion

    #region Variables y otros

        private const String tabla = "dbo.tblPPalClave";

    #endregion

    #region Setters y Getters

        public String ID
        {
            get { return iPPalClave_id; }
            set { iPPalClave_id = value; }
        }

        public String NOMBRE
        {
            get { return sNombre_nm; }
            set { sNombre_nm = value; }
        }

    #endregion

    #region Metodos

        #region Consultas

            public DataSet ConsultarTodosLosRegistros()
            {
                return this.EjecutarConsulta("SELECT row_number() over(order by tblPPalClave.sNombre_nm) As NRO, " + tabla + ".iPPalClave_id As ID, " + tabla + ".sNombre_nm As NOMBRE FROM " + tabla);
            }

            public DataSet ConsultarPorID(String id)
            {
                return this.EjecutarConsulta("SELECT row_number() over(order by tblPPalClave.sNombre_nm) As NRO, " + tabla + ".iPPalClave_id As ID, " + tabla + ".sNombre_nm As NOMBRE FROM " + tabla + " WHERE " + tabla + ".iPPalClave_id =" + id);
            }

        #endregion

        #region Alta

            public int Insertar()
            {
                String sql = String.Format(
                    "Insert into " + tabla + "(sNombre_nm) VALUES ('{0}')",
                    this.NOMBRE);
                return this.EjecutarDML(sql);
            }

        #endregion

        #region Modificar

            public int Modificar()
            {
                String query = "UPDATE " + tabla + " SET " + tabla + ".sNombre_nm='" + this.NOMBRE + "' WHERE " + tabla + ".iPPalClave_id=" + this.ID;
                return this.EjecutarDML(query);
            }

        #endregion

        #region Baja

        public int Eliminar()
        {
            String sql = String.Format(
                "Delete  From " + tabla + " Where " + tabla + ".iPPalClave_id={0}",
                this.ID);
            return this.EjecutarDML(sql);
        }

        #endregion

    #endregion
    
}
