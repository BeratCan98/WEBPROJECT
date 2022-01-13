using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Configuration;

public partial class SCHEDULE : System.Web.UI.Page
{
    String connectionString = @"Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project;";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateGridView();
        }
    }


    void PopulateGridView()
    {

        DataTable dtb2 = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {

            sqlCon.Open();
            SqlDataAdapter sqlDa1 = new SqlDataAdapter("SELECT*FROM[Project].[dbo].[SCHEDULE]", sqlCon);
            sqlDa1.Fill(dtb2);
        }
        if (dtb2.Rows.Count > 0)
        {
            schedule.DataSource = dtb2;
            schedule.DataBind();
        }


    }

    public void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //Checking the RowType of the Row  
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //If Salary is less than 10000 than set the Cell BackColor to Red and ForeColor to White  
            if (Convert.ToInt32(e.Row.Cells[6].Text) == 1)
            {
                e.Row.BackColor = Color.Green;
                e.Row.ForeColor = Color.White;
            }

            else if (Convert.ToInt32(e.Row.Cells[6].Text) == 2)
            {
                e.Row.BackColor = Color.Orange;
                e.Row.ForeColor = Color.White;
            }
            else
            {
                e.Row.BackColor = Color.Red;
                e.Row.ForeColor = Color.White;
            }
        }
    }

    protected void schedule_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                String query = "UPDATE [Project].[dbo].[SCHEDULE] SET SCHEDULE_STATU=@SCHEDULE_STATU WHERE ID=@ID";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);


                sqlCmd.Parameters.AddWithValue("@STATU", (schedule.Rows[e.RowIndex].FindControl("txtSCHEDULE_STATU") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@ID", Convert.ToInt32(schedule.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                schedule.EditIndex = -1;
                PopulateGridView();
                lblSuccessMsg.Text = "Selected Record Updated";
                lblErrorMsg.Text = "";
            }


        }
        catch (Exception ex)
        {

            lblSuccessMsg.Text = "";
            lblErrorMsg.Text = ex.Message;

        }
    }

    protected void schedule_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("Confirm", sqlCon);


            sqlCmd.CommandType = CommandType.StoredProcedure;
            //sqlCmd.Parameters.AddWithValue("@SCHID", e.Row.Cells[6].Text.Trim());
            
            sqlCmd.ExecuteNonQuery();
        }
        }
}