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
/// Descripción breve de clsUsuario
/// </summary>
public class clsUsuario : CONB
{

    #region Propiedades

        private String iTipoUsuario_fl, iUsuario_id;

    #endregion

    #region Variables y otros

        private const String tabla = "dbo.tblUsuario";

    #endregion

    #region Setters y Getters

        public String ID
        {
            get { return iUsuario_id; }
            set { iUsuario_id = value; }
        }

        public String TIPOUSUARIO
        {
            get { return iTipoUsuario_fl; }
            set { iTipoUsuario_fl = value; }
        }

    #endregion

    #region Metodos

        #region Consultas

            public DataSet ConsultarTodosLosRegistros()
            {
                return this.EjecutarConsulta("SELECT " + tabla + ".iUsuario_id As ID, " + tabla + ".iTipoUsuario_fl As TIPOUSUARIO FROM " + tabla);
            }

            public DataSet ConsultarPorID(String id)
            {
                return this.EjecutarConsulta("SELECT " + tabla + ".iUsuario_id As ID, " + tabla + ".iTipoUsuario_fl As TIPOUSUARIO FROM " + tabla + " WHERE " + tabla + ".iUsuario_id =" + id);
            }

            public DataSet ConsultarUsuario(String cuenta, String clave)
            {
                return this.EjecutarConsulta("select distinct tblUsuario.iUsuario_id As ID, tblUsuario.iTipoUsuario_fl As TIPO from tblUsuario, tblAdministrador, tblCliente where ((tblUsuario.iUsuario_id=tblAdministrador.iUsuario_id AND tblAdministrador.sCuenta_nm='" + cuenta + "' AND tblAdministrador.sClave_nm='" + clave + "') OR (tblUsuario.iUsuario_id=tblCliente.iUsuario_id AND tblCliente.sCuenta_nm='" + cuenta + "' AND tblCliente.sClave_nm='" + clave + "' AND tblCliente.sEstado_fl='si'))");
            }

        #endregion

        #region Alta

            public int Insertar()
            {
                String sql = String.Format(
                    "Insert into " + tabla + "(iTipoUsuario_fl) VALUES ('{0}') SELECT CAST(scope_identity() AS int)",
                    this.TIPOUSUARIO);
                return this.EjecutarDMLNEW(sql);
            }

        #endregion

        #region Modificar
               
        #endregion

        #region Baja

            public int Eliminar()
            {
                String sql = String.Format(
                    "Delete  From " + tabla + " Where " + tabla + ".iUsuario_id={0}",
                    this.ID);
                return this.EjecutarDML(sql);
            }

        #endregion

    #endregion
    
}
