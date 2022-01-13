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
using System.Windows.Forms;
public partial class LESSON : System.Web.UI.Page
{
    String connectionString = @"Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project;";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateGridview();
        }

      /*  using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {

            sqlCon.Open();
         
            SqlDataAdapter sqlDa1 = new SqlDataAdapter("SELECT*FROM[Project].[dbo].[AVAILABLE_LESSON]", sqlCon); 
            DataTable dtb2 = new DataTable();
            sqlDa1.Fill(dtb2);
            lesson.DataSource = dtb2;
            lesson.DataBind();

        }*/

    }

    void PopulateGridview()
    {
        DataTable dtb2 = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {

            sqlCon.Open();
            SqlDataAdapter sqlDa1 = new SqlDataAdapter("SELECT*FROM[Project].[dbo].[AVAILABLE_LESSON]", sqlCon); /*LIST AVAILABLE_LESSON TABLE*/
            sqlDa1.Fill(dtb2);
        }
        if (dtb2.Rows.Count > 0)
        {
            lesson.DataSource = dtb2;
            lesson.DataBind();
        }

        else
        {
            dtb2.Rows.Add(dtb2.NewRow());
            lesson.DataSource = dtb2;
            lesson.DataBind();
            lesson.Rows[0].Cells.Clear();
            lesson.Rows[0].Cells.Add(new TableCell());
            lesson.Rows[0].Cells[0].ColumnSpan = dtb2.Columns.Count;
            lesson.Rows[0].Cells[0].Text = "No Data";
            lesson.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

        }
    }


    public void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //Checking the RowType of the Row  
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //If Salary is less than 10000 than set the Cell BackColor to Red and ForeColor to White  
            if (Convert.ToInt32(e.Row.Cells[0].Text) == 1)
            {
                e.Row.BackColor = Color.Green;
                e.Row.ForeColor = Color.White;
            }
            else
            {
                e.Row.BackColor = Color.Red;
                e.Row.ForeColor = Color.White;
            }
        }
    }


    public void lnkSelect_Click(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);

        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("Reservation", sqlCon);


            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@STUDENTID", TextBox1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@LESSONID", TextBox2.Text.Trim());
           
            sqlCmd.ExecuteNonQuery();
            
        }
        }

    protected void lesson_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Add"))
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();
                    String query = "INSERT INTO [Project].[dbo].[AVAILABLE_LESSON] (ID,INSTRUCTOR_ID,LESSON_HOUR,LESSON_DATE,LESSON_STATU) VALUES (@ID,@IID,@HOUR,@DATE,@STATU)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@ID", (lesson.FooterRow.FindControl("txtIDFooter") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@IID", (lesson.FooterRow.FindControl("txtINSTRUCTOR_IDFooter") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@HOUR", (lesson.FooterRow.FindControl("txtLESSON_HOURFooter") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@DATE", (lesson.FooterRow.FindControl("txtLESSON_DATEFooter") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@STATU", (lesson.FooterRow.FindControl("txtLESSON_STATUFooter") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    lblSuccess.Text = "New Record Added";
                    lblError.Text = "";
                }

            }
        }
        catch (Exception ex)
        {

            lblSuccess.Text = "";
            lblError.Text = ex.Message;

        }
    }

    protected void lesson_RowEditing(object sender, GridViewEditEventArgs e)
    {
        lesson.EditIndex = e.NewEditIndex;
        PopulateGridview();
    }

    protected void lesson_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        lesson.EditIndex = -1;
        PopulateGridview();
    }

    protected void lesson_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();
                    String query = "UPDATE [Project].[dbo].[AVAILABLE_LESSON] SET INSTRUCTOR_ID=@IID,LESSON_HOUR=@HOUR,LESSON_DATE=@DATE,LESSON_STATU=@STATU WHERE ID=@ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    
                    sqlCmd.Parameters.AddWithValue("@IID", (lesson.Rows[e.RowIndex].FindControl("txtINSTRUCTOR_ID") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@HOUR", (lesson.Rows[e.RowIndex].FindControl("txtLESSON_HOUR") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@DATE", (lesson.Rows[e.RowIndex].FindControl("txtLESSON_DATE") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@STATU", (lesson.Rows[e.RowIndex].FindControl("txtLESSON_STATU") as System.Web.UI.WebControls.TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ID", Convert.ToInt32(lesson.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                lesson.EditIndex = -1;
                    PopulateGridview();
                    lblSuccess.Text = "Selected Record Updated";
                    lblError.Text = "";
                }

            
        }
        catch (Exception ex)
        {

            lblSuccess.Text = "";
            lblError.Text = ex.Message;

        }

    }

    protected void lesson_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                sqlCon.Open();
                String query = "DELETE FROM [Project].[dbo].[AVAILABLE_LESSON]  WHERE ID=@ID";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                
                sqlCmd.Parameters.AddWithValue("@ID", Convert.ToInt32(lesson.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                lesson.EditIndex = -1;
                PopulateGridview();
                lblSuccess.Text = "Selected Record Updated";
                lblError.Text = "";
            }


        }
        catch (Exception ex)
        {

            lblSuccess.Text = "";
            lblError.Text = ex.Message;

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String connectionString = @"Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project;";
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {

            sqlCon.Open();

            SqlCommand cmd2 = new SqlCommand("select * from [AVAILABLE_LESSON] WHERE LESSON_DATE BETWEEN '" + Calendar1.SelectedDate + "' AND '" + Calendar2.SelectedDate + "'" + " AND [LESSON_STATU] =" + DropDownList1.SelectedValue , sqlCon);
            SqlDataReader dr = cmd2.ExecuteReader();
            if (dr.HasRows)
            {
 
                    MessageBox.Show("LESSON FOUND");
 
            }

            else
            {
                MessageBox.Show("LESSON NOT FOUND");
            }

        }
    }
}

