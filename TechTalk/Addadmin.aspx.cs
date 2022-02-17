using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Addadmin : System.Web.UI.Page
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
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM admin", sqlCon);
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
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO admin (Username,Password) VALUES (@Username,@Password)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.Parameters.AddWithValue("@Username", (gvAdmin.FooterRow.FindControl("txtUsernameFooter") as TextBox).Text.Trim());
                    
                    sqlCmd.Parameters.AddWithValue("@Password", (gvAdmin.FooterRow.FindControl("txtPasswordFooter") as TextBox).Text.Trim());
                    
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    lblSuccessMessage.Text = "New Record Added";
                    lblErrorMessage.Text = "";
                }
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
                string query = "UPDATE admin SET Username=@Username,Password=@Password WHERE ID = @id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@Username", (gvAdmin.Rows[e.RowIndex].FindControl("txtUsername") as TextBox).Text.Trim());
                
                sqlCmd.Parameters.AddWithValue("@Password", (gvAdmin.Rows[e.RowIndex].FindControl("txtPassword") as TextBox).Text.Trim());
               
                sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvAdmin.DataKeys[e.RowIndex].Value.ToString()));
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

                string query = "DELETE FROM admin WHERE Username = @id";
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
