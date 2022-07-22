using ClosedXML.Excel;
using ListasSarlaft.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ListasSarlaft.UserControls.Sarlaft
{
    public partial class RpteTotalSarlaft : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PagIndexInfoGridReporteTotal = 0;
            loadGridReporteTraza();
            LoadInfoReporteTotal();
        }

        private int pagIndexInfoGridReporteTotal;
        private int PagIndexInfoGridReporteTotal
        {
            get
            {
                pagIndexInfoGridReporteTotal = (int)ViewState["pagIndexInfoGridReporteTotal"];
                return pagIndexInfoGridReporteTotal;
            }
            set
            {
                pagIndexInfoGridReporteTotal = value;
                ViewState["pagIndexInfoGridReporteTotal"] = pagIndexInfoGridReporteTotal;
            }
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            PagIndexInfoGridReporteTotal = e.NewPageIndex;
            GridView2.PageIndex = PagIndexInfoGridReporteTotal;
            GridView2.DataSource = InfoGridReporteTraza;
            GridView2.DataBind();
        }

        private cRegistroOperacion cRegistroOperacion = new cRegistroOperacion();
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            exportExcel(InfoGridReporteTraza, Response, "Reporte Total " + System.DateTime.Now.ToString("yyyy-MM-dd"));
        }
        private DataTable infoGridReporteTraza;
        private DataTable InfoGridReporteTraza
        {
            get
            {
                infoGridReporteTraza = (DataTable)ViewState["infoGridReporteTraza"];
                return infoGridReporteTraza;
            }
            set
            {
                infoGridReporteTraza = value;
                ViewState["infoGridReporteTraza"] = infoGridReporteTraza;
            }
        }
        private void loadGridReporteTraza()
        {
            DataTable grid = new DataTable();
            grid.Columns.Add("Registro_Operacion", typeof(string));
            grid.Columns.Add("Identificacion", typeof(string));
            grid.Columns.Add("Nombre", typeof(string));
            grid.Columns.Add("NombreIndicador", typeof(string));
            grid.Columns.Add("Indicador", typeof(string));
            grid.Columns.Add("MensajeCorreo", typeof(string));
            grid.Columns.Add("Estado", typeof(string));
            grid.Columns.Add("Tipo", typeof(string));
            grid.Columns.Add("FechaDeteccion", typeof(string));
            grid.Columns.Add("FechaPosibleSolucion", typeof(string));
            grid.Columns.Add("Responsable", typeof(string));
            grid.Columns.Add("NombreResponsable", typeof(string));
            InfoGridReporteTraza = grid;
            GridView2.DataSource = InfoGridReporteTraza;
            GridView2.DataBind();
        }
        private void LoadInfoReporteTotal()
        {
            DataTable DtTraza = new DataTable();
            DtTraza = cRegistroOperacion.loadRTotal();
            if (DtTraza.Rows.Count > 0)
            {
                for (int rows = 0; rows < DtTraza.Rows.Count; rows++)
                {
                    InfoGridReporteTraza.Rows.Add(new Object[] {
                            DtTraza.Rows[rows]["Registro_Operacion"].ToString().Trim(),
                            DtTraza.Rows[rows]["Identificacion"].ToString().Trim(),
                            DtTraza.Rows[rows]["Nombre"].ToString().Trim(),
                            DtTraza.Rows[rows]["NombreIndicador"].ToString().Trim(),
                            DtTraza.Rows[rows]["Indicador"].ToString().Trim(),
                            DtTraza.Rows[rows]["MensajeCorreo"].ToString().Trim(),
                            DtTraza.Rows[rows]["Estado"].ToString().Trim(),
                            DtTraza.Rows[rows]["Tipo"].ToString().Trim(),
                            DtTraza.Rows[rows]["FechaDeteccion"].ToString().Trim(),
                            DtTraza.Rows[rows]["FechaPosibleSolucion"].ToString().Trim(),
                            DtTraza.Rows[rows]["Responsable"].ToString().Trim(),
                            DtTraza.Rows[rows]["NombreResponsable"].ToString().Trim(),
                    });
                }
                GridView2.PageIndex = PagIndexInfoGridReporteTotal;

                GridView2.DataSource = InfoGridReporteTraza;
                GridView2.DataBind();
            }
            else
            {
                TbTraza.Visible = false;
                Mensaje("No existe información para el periodo seleccionado");
            }
        }

        private void Mensaje(String Mensaje)
        {
            lblMsgBox.Text = Mensaje;
            mpeMsgBox.Show();
        }
        public static void exportExcel(DataTable dt, HttpResponse Response, string filename)
        {
            Response.Clear();
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
            System.Web.UI.WebControls.DataGrid dg = new System.Web.UI.WebControls.DataGrid();
            dg.DataSource = dt;
            dg.DataBind();
            dg.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();


        }
    }
}