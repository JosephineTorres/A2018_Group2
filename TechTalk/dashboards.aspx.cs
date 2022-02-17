using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Web.Security;


public partial class dashboards : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Userlogin.aspx");

        }
        else
            con.ConnectionString = "Data Source=DESKTOP-KNCIUG5;Initial Catalog=UserDB;Integrated Security=True";
        con.Open();
        showdata();
        
    }
    public void showdata()
    {
        cmd.CommandText = "select * from UserDatabase where Username='"+ Session["user"] +"'";
        cmd.Connection = con;
        sda.SelectCommand = cmd;
        sda.Fill(ds, "pass");
        Label1.Text = ds.Tables[0].Rows[0]["Username"].ToString();
    }



protected void btndiscrete_Click(object sender, EventArgs e) {

        Response.Redirect("~/discrete.aspx");
    }
    protected void btnCsharp_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Csharp.aspx");
    }
    protected void btnJava_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Java.aspx");
    }
    protected void btnWeb_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebDevelopment.aspx");
    }
    protected void btnAI_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AI.aspx");
    }
    protected void btnPython_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/python.aspx");
    }
    protected void btnCplus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Cplus.aspx");
    }

}