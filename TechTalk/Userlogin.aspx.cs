using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class login : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

        con.ConnectionString = "Data Source=DESKTOP-KNCIUG5;Initial Catalog=UserDB;Integrated Security=True";
        con.Open();
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string user = txtuser.Text;
        string pass = txtpass.Text.Trim();
        int i = 0;
        cmd.CommandText = "select * from UserDatabase where Username ='" + txtuser.Text + "' and Password ='" + txtpass.Text + "'";
        cmd.Connection = con;
        sda.SelectCommand = cmd;
        sda.Fill(ds, "pass");
        if (ds.Tables[i].Rows.Count > 0)
        {
            if (pass == ds.Tables[i].Rows[i]["Password"].ToString())
            {
                Session["user"] = user;
                Response.Redirect("dashboards.aspx");

            }
        }
        else
        {
            Response.Write("<script>alert('Wrong Username or Password')</script>");
        }
    }
       
    


}