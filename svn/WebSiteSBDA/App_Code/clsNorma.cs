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
/// Descripción breve de clsNorma
/// </summary>
public class clsNorma : CONB
{

    #region Propiedades

        private String sNombre_nm, iNorma_id, iPNorma_id, iUsuario_id, iNumero_nt, dtFecha_dt, dtFechaAct_nt, iNorma_fl, iEstado_fl, sUrl_nm;
    
    #endregion

    #region Variables y otros

        private const String tabla = "dbo.tblNorma";

    #endregion

    #region Setters y Getters

        public String URL
        {
            get { return sUrl_nm; }
            set { sUrl_nm = value; }
        }

        public String ESTADO
        {
            get { return iEstado_fl; }
            set { iEstado_fl = value; }
        }

        public String NORMA
        {
            get { return iNorma_fl; }
            set { iNorma_fl = value; }
        }

        public String FECHAACT
        {
            get { return dtFechaAct_nt; }
            set { dtFechaAct_nt = value; }
        }

        public String FECHA
        {
            get { return dtFecha_dt; }
            set { dtFecha_dt = value; }
        }

        public String NUMERO
        {
            get { return iNumero_nt; }
            set { iNumero_nt = value; }
        }

        public String USUARIO
        {
            get { return iUsuario_id; }
            set { iUsuario_id = value; }
        }

        public String TIPO
        {
            get { return iPNorma_id; }
            set { iPNorma_id = value; }
        }

        public String ID
        {
            get { return iNorma_id; }
            set { iNorma_id = value; }
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
                return this.EjecutarConsulta("SELECT row_number() over(order by tblNorma.sNombre_nm) As NRO, " + tabla + ".iNorma_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + "(select tblPNorma.sNombre_nm from tblPNorma where tblPNorma.iPNorma_id=tblNorma.iPNorma_id) As TIPO, " + tabla + ".iNumero_nt As NUMERO, " + tabla + ".dtFecha_dt As FECHA, " + "(CASE WHEN tblNorma.iNorma_fl = 1 THEN 'Informativa' ELSE 'Cumplimiento' END) As NORMA, " + tabla + ".iEstado_fl As ESTADO, " + tabla + ".sUrl_nm As URL FROM " + tabla);
            }

            public DataSet ConsultarTodosLosRegistrosCon()
            {
                return this.EjecutarConsulta("SELECT row_number() over(order by tblNorma.sNombre_nm) As NRO, " + tabla + ".iNorma_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + tabla + ".iPNorma_id As TIPO, " + tabla + ".iNumero_nt As NUMERO, " + tabla + ".dtFecha_dt As FECHA, " + tabla + ".iNorma_fl As NORMA, " + tabla + ".iEstado_fl As ESTADO, " + tabla + ".sUrl_nm As URL FROM " + tabla);
            }

            public DataSet ConsultarPorID(String id)
            {
                return this.EjecutarConsulta("SELECT row_number() over(order by tblNorma.sNombre_nm) As NRO, " + tabla + ".iNorma_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + tabla + ".iPNorma_id As TIPO, " + tabla + ".iNumero_nt As NUMERO, " + tabla + ".dtFecha_dt As FECHA, " + tabla + ".iNorma_fl As NORMA, " + tabla + ".iEstado_fl As ESTADO, " + tabla + ".sUrl_nm As URL FROM " + tabla + " WHERE " + tabla + ".iNorma_id =" + id);
            }

            public DataSet ConsultarBusquedaAvanzada(String bool_palabra, String idPalabra, String bool_nombre, String bool_numero, String bool_fecha, String fecha, String texto)
            {
                String pal="0";
                String nom="";
                String num="";
                String fec="";
                if (bool_palabra.Equals("True"))
                {
                    if (idPalabra!=null)
                    {
                        pal = idPalabra;
                    }
                }

                if (bool_nombre.Equals("True"))
                    nom = "%" + texto + "%";
                
                if (bool_numero.Equals("True"))
                    num = "%" + texto + "%";

                if (bool_fecha.Equals("True"))
                {
                    fecha = fecha.Substring(0, 10);
                    fec = fecha;
                }

                return this.EjecutarConsulta("SELECT row_number() over (order by n.ID desc) As NRO,n.ID As ID, n.NOMBRE As NOMBRE, n.TIPO As TIPO, n.NUMERO As NUMERO, n.FECHA As FECHA, n.NORMA As NORMA, n.ESTADO As ESTADO, n.URL As URL FROM (SELECT distinct " + tabla + ".iNorma_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + "(select tblPNorma.sNombre_nm from tblPNorma where tblPNorma.iPNorma_id=tblNorma.iPNorma_id) As TIPO, " + tabla + ".iNumero_nt As NUMERO, " + tabla + ".dtFecha_dt As FECHA, " + "(CASE WHEN tblNorma.iNorma_fl = 1 THEN 'Informativa' ELSE 'Cumplimiento' END) As NORMA, " + tabla + ".iEstado_fl As ESTADO, " + tabla + ".sUrl_nm As URL FROM " + tabla + ", dbo.tblNormaClave WHERE (" + tabla + ".dtFecha_dt = '" + fec + "' Or " + tabla + ".sNombre_nm LIKE '" + nom + "' OR " + tabla + ".iNumero_nt LIKE '" + num + "' OR (tblNormaClave.iPPalClave_id = " + pal + " And tblNormaClave.iNorma_id= " + tabla + ".iNorma_id))) n");
            }

            public DataSet ConsultarBusquedaAvanzadaPrincipal(String bool_palabra, String idPalabra, String bool_nombre, String bool_numero, String bool_fecha, String fecha, String texto, String norma, String tipo, String tipo_todos, String top)
            {
                String norm = "";
                String tip = "";
                String query = "";
                if (bool_palabra.Equals("True"))
                {
                    if (!idPalabra.Equals(""))
                    {
                        //pal = idPalabra;
                        query = "(tblNormaClave.iPPalClave_id = " + idPalabra + " And tblNormaClave.iNorma_id= " + tabla + ".iNorma_id)";
                    }
                }

                if (bool_nombre.Equals("True"))
                    query = tabla + ".sNombre_nm LIKE '%" + texto + "%'";

                if (bool_numero.Equals("True"))
                    query = tabla + ".iNumero_nt LIKE '%" + texto + "%' ";

                if (bool_fecha.Equals("True"))
                {
                    fecha = fecha.Substring(0, 10);
                    query = tabla + ".dtFecha_dt = '" + fecha + "'";
                }
                if (!norma.Equals("0"))
                    norm = norma;

                if(tipo_todos.Equals("False"))
                {
                    tip = tipo;
                }
                String or_1 = "or";
                String or_2 = "or";
                //todos
                if(norm.Equals("") && tip.Equals(""))
                {
                    or_1 = "or";
                    or_2 = "or";
                }
                //uno de los dos
                if (!norm.Equals("") || !tip.Equals(""))
                {
                    or_1 = "and";
                }
                //los dos
                if (!norm.Equals("") && !tip.Equals(""))
                {
                    or_1 = "and";
                    or_2 = "and";
                }

                return this.EjecutarConsulta("SELECT row_number() over (order by n.ID desc) As NRO,n.ID As ID, n.NOMBRE As NOMBRE, n.TIPO As TIPO, n.NUMERO As NUMERO, n.FECHA As FECHA, n.NORMA As NORMA, n.ESTADO As ESTADO, n.URL As URL FROM (SELECT distinct top " + top + " " + tabla + ".iNorma_id As ID, " + tabla + ".sNombre_nm As NOMBRE, " + "(select tblPNorma.sNombre_nm from tblPNorma where tblPNorma.iPNorma_id=tblNorma.iPNorma_id) As TIPO, " + tabla + ".iNumero_nt As NUMERO, " + tabla + ".dtFecha_dt As FECHA, " + "(CASE WHEN tblNorma.iNorma_fl = 1 THEN 'Informativa' ELSE 'Cumplimiento' END) As NORMA, " + tabla + ".iEstado_fl As ESTADO, " + tabla + ".sUrl_nm As URL FROM " + tabla + ", dbo.tblNormaClave WHERE (" + query +" " + or_1 + " (tblNorma.iNorma_fl = '" + norm + "' " + or_2 + " tblNorma.iPNorma_id = '" + tip + "'))) n");
            }

            public DataSet ConsultarPNorma(String id)
            {
                return this.EjecutarConsulta("SELECT * FROM " + tabla + " WHERE " + tabla + ".iPNorma_id =" + id);
            }

            public DataSet ConsultarUsuario(String id)
            {
                return this.EjecutarConsulta("SELECT * FROM " + tabla + " WHERE " + tabla + ".iUsuario_id =" + id);
            }

            public DataSet ConsultarUltimaActualizacion()
            {
                return this.EjecutarConsulta("select max(" + tabla + ".dtFechaAct_dt) As ULTIMAFECHA from " + tabla);
            }

        #endregion

        #region Alta

            public int Insertar()
            {
                String sql = String.Format(
                    "Insert into " + tabla + "(sNombre_nm,iPNorma_id,iUsuario_id,iNumero_nt,dtFecha_dt,dtFechaAct_dt,iNorma_fl,iEstado_fl,sUrl_nm) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}') SELECT CAST(scope_identity() AS int)",
                    this.NOMBRE, this.TIPO, this.USUARIO, this.NUMERO, this.FECHA, this.FECHAACT, this.NORMA, this.ESTADO, this.URL);
                return this.EjecutarDMLNEW(sql);
            }

        #endregion

        #region Modificar

            public int Modificar()
            {
                String query = "UPDATE " + tabla + " SET " + tabla + ".sNombre_nm='" + this.NOMBRE + "', " + tabla + ".iPNorma_id=" + this.TIPO + ", " + tabla + ".iUsuario_id=" + this.USUARIO + ", " + tabla + ".iNumero_nt=" + this.NUMERO + ", " + tabla + ".dtFecha_dt='" + this.FECHA + "', " + tabla + ".dtFechaAct_dt='" + this.FECHAACT + "', " + tabla + ".iNorma_fl=" + this.NORMA + ", " + tabla + ".iEstado_fl='" + this.ESTADO + "', " + tabla + ".sUrl_nm='" + this.URL + "' WHERE " + tabla + ".iNorma_id=" + this.ID;
                return this.EjecutarDML(query);
            }

        #endregion

        #region Baja

            public int Eliminar()
            {
                String sql = String.Format(
                    "Delete  From " + tabla + " Where " + tabla + ".iNorma_id={0}",
                    this.ID);
                return this.EjecutarDML(sql);
            }

        #endregion

    #endregion
    
}
