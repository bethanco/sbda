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
/// Descripción breve de clsNormaClave
/// </summary>
public class clsNormaClave : CONB
{

    #region Propiedades

        private String iNormaClave_id, iNorma_id, iPPalClave_id;

    #endregion

    #region Variables y otros

        private const String tabla = "dbo.tblNormaClave";

    #endregion

    #region Setters y Getters

        public String PALABRACLAVE
        {
            get { return iPPalClave_id; }
            set { iPPalClave_id = value; }
        }

        public String NORMA
        {
            get { return iNorma_id; }
            set { iNorma_id = value; }
        }

        public String ID
        {
            get { return iNormaClave_id; }
            set { iNormaClave_id = value; }
        }

    #endregion

    #region Metodos

        #region Consultas

            public DataSet ConsultarTodosLosRegistros()
            {
                return this.EjecutarConsulta("SELECT " + tabla + ".iNormaClave_id As ID, " + tabla + ".iNorma_id As NORMA, " + tabla + ".iPPalClave_id As PALABRACLAVE FROM " + tabla);
            }

            public DataSet ConsultarPorID(String id)
            {
                return this.EjecutarConsulta("SELECT " + tabla + ".iNormaClave_id As ID, " + tabla + ".iNorma_id As NORMA, " + "(select tblPPalClave.sNombre_nm from tblPPalClave where tblPPalClave.iPPalClave_id=tblNormaClave.iPPalClave_id) As NOMBRE, " + tabla + ".iPPalClave_id As PALABRACLAVEID FROM " + tabla + " WHERE " + tabla + ".iNorma_id =" + id);
            }

            public DataSet ConsultarPalClave(String id)
            {
                return this.EjecutarConsulta("SELECT * FROM " + tabla + " WHERE " + tabla + ".iPPalClave_id =" + id);
            }

        #endregion

        #region Alta

            public int Insertar()
            {
                String sql = String.Format(
                    "Insert into " + tabla + "(iNorma_id,iPPalClave_id) VALUES ('{0}','{1}')",
                    this.NORMA, this.PALABRACLAVE);
                return this.EjecutarDML(sql);
            }

        #endregion

        #region Modificar

            public int Modificar()
            {
                String query = "UPDATE " + tabla + " SET " + tabla + ".sNombre_nm='" + this.NORMA + "' WHERE " + tabla + ".iPNorma_id=" + this.ID;
                return this.EjecutarDML(query);
            }

        #endregion

        #region Baja

            public int Eliminar()
            {
                String sql = String.Format(
                    "Delete  From " + tabla + " Where " + tabla + ".iNorma_id={0}",
                    this.NORMA);
                return this.EjecutarDML(sql);
            }

        #endregion

    #endregion
    
}
