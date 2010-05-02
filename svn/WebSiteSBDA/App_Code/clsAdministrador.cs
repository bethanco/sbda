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
/// Descripción breve de clsAdministrador
/// </summary>
public class clsAdministrador :CONB
{

    #region Propiedades

        private String sNombre_nm, iUsuario_id, sApellido_nm, sCuenta_nm, sClave_nm;

    #endregion

    #region Variables y otros

        private const String tabla = "dbo.tblAdministrador";

    #endregion

    #region Setters y Getters

        public String ID
        {
            get { return iUsuario_id; }
            set { iUsuario_id = value; }
        }

        public String NOMBRE
        {
            get { return sNombre_nm; }
            set { sNombre_nm = value; }
        }

        public String CLAVE
        {
            get { return sClave_nm; }
            set { sClave_nm = value; }
        }

        public String CUENTA
        {
            get { return sCuenta_nm; }
            set { sCuenta_nm = value; }
        }

        public String APELLIDO
        {
            get { return sApellido_nm; }
            set { sApellido_nm = value; }
        }

    #endregion

    #region Metodos

    #region Consultas

        public DataSet ConsultarTodosLosRegistros()
        {
            return this.EjecutarConsulta("SELECT row_number() over(order by tblAdministrador.sNombre_nm) As NRO, " + tabla + ".iUsuario_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + tabla + ".sApellido_nm As APELLIDO FROM " + tabla);
        }

        public DataSet ConsultarPorID(String id)
        {
            return this.EjecutarConsulta("SELECT row_number() over(order by tblAdministrador.sNombre_nm) As NRO, " + tabla + ".iUsuario_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + tabla + ".sApellido_nm As APELLIDO, " + tabla + ".sCuenta_nm As CUENTA, " + tabla + ".sClave_nm As CLAVE FROM " + tabla + " WHERE " + tabla + ".iUsuario_id =" + id);
        }

    #endregion

    #region Alta

        public int Insertar()
        {
            String sql = String.Format(
                "Insert into " + tabla + "(iUsuario_id,sNombre_nm,sApellido_nm,sCuenta_nm,sClave_nm) VALUES ('{0}','{1}','{2}','{3}','{4}')",
                this.ID, this.NOMBRE, this.APELLIDO, this.CUENTA, this.CLAVE);
            return this.EjecutarDML(sql);
        }

    #endregion

    #region Modificar

        public int Modificar()
        {
            String query = "UPDATE " + tabla + " SET " + tabla + ".sNombre_nm='" + this.NOMBRE + "', " + tabla + ".sApellido_nm='" + this.APELLIDO + "', " + tabla + ".sCuenta_nm='" + this.CUENTA + "', " + tabla + ".sClave_nm='" + this.CLAVE + "' WHERE " + tabla + ".iUsuario_id=" + this.ID;
            return this.EjecutarDML(query);
        }

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
