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

public partial class Cplus : System.Web.UI.Page
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
        cmd.CommandText = "select * from UserDatabase where Username='" + Session["user"] + "'";
        cmd.Connection = con;
        sda.SelectCommand = cmd;
        sda.Fill(ds, "pass");
        Label1.Text = ds.Tables[0].Rows[0]["Username"].ToString();
    }

}