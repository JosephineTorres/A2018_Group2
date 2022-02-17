using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Adminupload : System.Web.UI.Page
{
    string connectionString = ("Data Source=DESKTOP-KNCIUG5;Initial Catalog=UserDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateGridview();
        }
    }

    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM video", sqlCon);
            sqlDa.Fill(dtbl);
        }
        if (dtbl.Rows.Count > 0)
        {
            gvAdmin.DataSource = dtbl;
            gvAdmin.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            gvAdmin.DataSource = dtbl;
            gvAdmin.DataBind();
            gvAdmin.Rows[0].Cells.Clear();
            gvAdmin.Rows[0].Cells.Add(new TableCell());
            gvAdmin.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            gvAdmin.Rows[0].Cells[0].Text = "No Data Found ..!";
            gvAdmin.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }

    }

    protected void gvPhoneBook_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))
            {
                Response.Redirect("Upload.aspx");
            }
        }
        catch (Exception ex)
        {
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = ex.Message;
        }
    }

    protected void gvPhoneBook_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvAdmin.EditIndex = e.NewEditIndex;
        PopulateGridview();
    }

    protected void gvPhoneBook_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvAdmin.EditIndex = -1;
        PopulateGridview();
    }

    protected void gvPhoneBook_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "UPDATE video SET Title=@Title,Category=@Category WHERE Title = @id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@Title", (gvAdmin.Rows[e.RowIndex].FindControl("txtUsername") as TextBox).Text.Trim());

                sqlCmd.Parameters.AddWithValue("@Category", (gvAdmin.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim());

                sqlCmd.Parameters.AddWithValue("@id", (gvAdmin.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                gvAdmin.EditIndex = -1;
                PopulateGridview();
                lblSuccessMessage.Text = "Selected Record Updated";
                lblErrorMessage.Text = "";
            }
        }
        catch (Exception ex)
        {
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = ex.Message;
        }
    }

    protected void gvPhoneBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();

                string query = "DELETE FROM video WHERE Title = @id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@id", gvAdmin.DataKeys[e.RowIndex].Value.ToString());
                sqlCmd.ExecuteNonQuery();


                PopulateGridview();
                lblSuccessMessage.Text = "Selected Record Deleted";
                lblErrorMessage.Text = "";
            }
        }
        catch (Exception ex)
        {
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = ex.Message;
        }
    }
}
