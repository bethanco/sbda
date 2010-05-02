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
/// Descripción breve de clsCliente
/// </summary>
public class clsCliente : CONB
{

    #region Propiedades

        private String sNombre_nm, iUsuario_id, sApellido_nm, sCuenta_nm, sClave_nm, sCorreo_nm, sEstado_fl;

    #endregion

    #region Variables y otros

        private const String tabla = "dbo.tblCliente";

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

        public String ESTADO
        {
            get { return sEstado_fl; }
            set { sEstado_fl = value; }
        }

        public String CORREO
        {
            get { return sCorreo_nm; }
            set { sCorreo_nm = value; }
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
                return this.EjecutarConsulta("SELECT row_number() over(order by tblCliente.sNombre_nm) As NRO, " + tabla + ".iUsuario_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + tabla + ".sApellido_nm As APELLIDO, " + tabla + ".sEstado_fl As ESTADO, " + tabla + ".sCorreo_nm As CORREO FROM " + tabla);
            }

            public DataSet ConsultarPorID(String id)
            {
                return this.EjecutarConsulta("SELECT row_number() over(order by tblCliente.sNombre_nm) As NRO, " + tabla + ".iUsuario_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + tabla + ".sApellido_nm As APELLIDO, " + tabla + ".sCuenta_nm As CUENTA, " + tabla + ".sClave_nm As CLAVE, " + tabla + ".sEstado_fl As ESTADO, " + tabla + ".sCorreo_nm As CORREO FROM " + tabla + " WHERE " + tabla + ".iUsuario_id =" + id);
            }

            public DataSet ConsultarDatos(String correo)
            {
                return this.EjecutarConsulta("SELECT " + tabla + ".sNombre_nm As NOMBRE, " + tabla + ".sApellido_nm As APELLIDO, " + tabla + ".sCuenta_nm As CUENTA, " + tabla + ".sClave_nm As CLAVE FROM " + tabla + " WHERE " + tabla + ".sCorreo_nm='" + correo+"'");
            }

            public DataSet ConsultarCorreos()
            {
                return this.EjecutarConsulta("select " + tabla + ".sCorreo_nm As CORREO from " + tabla );
            }

        #endregion

        #region Alta

            public int Insertar()
            {
                String sql = String.Format(
                    "Insert into " + tabla + "(iUsuario_id,sNombre_nm,sApellido_nm,sCuenta_nm,sClave_nm,sCorreo_nm,sEstado_fl) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}')",
                    this.ID, this.NOMBRE, this.APELLIDO, this.CUENTA, this.CLAVE, this.CORREO, this.ESTADO);
                return this.EjecutarDML(sql);
            }

        #endregion

        #region Modificar

            public int Modificar()
            {
                String query = "UPDATE " + tabla + " SET " + tabla + ".sNombre_nm='" + this.NOMBRE + "', " + tabla + ".sApellido_nm='" + this.APELLIDO + "', " + tabla + ".sCuenta_nm='" + this.CUENTA + "', " + tabla + ".sClave_nm='" + this.CLAVE + "', " + tabla + ".sCorreo_nm='" + this.CORREO + "', " + tabla + ".sEstado_fl='" + this.ESTADO + "' WHERE " + tabla + ".iUsuario_id=" + this.ID;
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
