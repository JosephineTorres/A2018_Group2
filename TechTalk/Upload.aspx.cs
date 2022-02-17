using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

public partial class Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnregister_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-KNCIUG5;Initial Catalog=UserDB;Integrated Security=True");
        FileUpload1.SaveAs(Server.MapPath("~/video/") + Path.GetFileName(FileUpload1.FileName));
        string link = ("video/" + Path.GetFileName(FileUpload1.FileName));
        link = "<Video width=400 Controls><Source src=" + link + " type = video/mp4></video> ";

        SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[video]
           ([Title]
           ,[Category],[videolink])
     VALUES
          ('" + txttitle.Text + "',@Category,'" + link + "')", con);
        cmd.Parameters.AddWithValue("@Category", select.SelectedItem.Value);
        con.Open();
       cmd.ExecuteNonQuery();
        con.Close();
        Label1.Text = "Upload Successfully";
        txttitle.Text = "";

    }


    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Adminupload.aspx");
    }
}