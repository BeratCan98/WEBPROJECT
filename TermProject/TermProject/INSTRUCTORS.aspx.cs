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

public partial class INSTRUCTORS : System.Web.UI.Page
{
    String connectionString = @"Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project;";

    protected void Page_Load(object sender, EventArgs e)
    {

        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {

            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT [NAME],[SURNAME],[MAIL],[COUNTRY] FROM INSTRUCTOR", sqlCon); /*LIST STUDENTS TABLE*/
            DataTable dtb1 = new DataTable();
            sqlDa.Fill(dtb1);
            instructors.DataSource = dtb1;
            instructors.DataBind();


        }

        //SqlConnection connection = new SqlConnection(@"Provider=SQLNCLI11;Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project");
        //connection.Open();

    }



    public void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //Checking the RowType of the Row  
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //If Salary is less than 10000 than set the Cell BackColor to Red and ForeColor to White  
            if (Convert.ToInt32(e.Row.Cells[0].Text.Length) % 2 == 0)
            {
                e.Row.BackColor = Color.Green;
                e.Row.ForeColor = Color.White;
            }
            else
            {
                e.Row.BackColor = Color.Orange;
                e.Row.ForeColor = Color.White;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String connectionString = @"Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project;";
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {

            sqlCon.Open();

        SqlCommand cmd = new SqlCommand("select * FROM INSTRUCTOR WHERE NAME = '" + txtSearch.Text + "'", sqlCon);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Response.Write("<script>alert('INSTRUCTOR FOUND');</script>");

                }

        }

            else
            {
                Response.Write("<script>alert('INSTRUCTOR NOT FOUND');</script>");
            }

    }
}

}