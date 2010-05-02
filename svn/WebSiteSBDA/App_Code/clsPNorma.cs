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
/// Descripción breve de clsPNorma
/// </summary>
public class clsPNorma : CONB
{

    #region Propiedades

        private String sNombre_nm, iPNorma_id; 

    #endregion

    #region Variables y otros

        private const String tabla = "dbo.tblPNorma";

    #endregion

    #region Setters y Getters

        public String ID
        {
            get { return iPNorma_id; }
            set { iPNorma_id = value; }
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
                return this.EjecutarConsulta("SELECT row_number() over(order by tblPNorma.sNombre_nm) As NRO, " + tabla + ".iPNorma_id As ID, " + tabla + ".sNombre_nm As NOMBRE FROM " + tabla);
            }

            public DataSet ConsultarPorID(String id)
            {
                return this.EjecutarConsulta("SELECT row_number() over(order by tblPNorma.sNombre_nm) As NRO, " + tabla + ".iPNorma_id As ID, " + tabla + ".sNombre_nm As NOMBRE FROM " + tabla + " WHERE " + tabla + ".iPNorma_id =" + id);
            }

            public DataSet ConsultarPorNombre(String nombre)
            {
                String query = "Select * From " + tabla + " where " + tabla + ".sNombre_nm='" + nombre + "'";
                return this.EjecutarConsulta(query);
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
                String query = "UPDATE " + tabla + " SET " + tabla + ".sNombre_nm='" + this.NOMBRE + "' WHERE " + tabla + ".iPNorma_id=" + this.ID;
                return this.EjecutarDML(query);
            }

        #endregion

        #region Baja

            public int Eliminar()
            {
                String sql = String.Format(
                    "Delete  From " + tabla + " Where " + tabla + ".iPNorma_id={0}",
                    this.ID);
                return this.EjecutarDML(sql);
            } 

        #endregion

    #endregion
    
}
