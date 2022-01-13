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


public partial class _Default : System.Web.UI.Page
{

    String connectionString = @"Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project;";

    protected void Page_Load(object sender, EventArgs e)
    {

        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {

            sqlCon.Open();
            /*SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT*FROM STUDENTS", sqlCon); 
            DataTable dtb1 = new DataTable();
            sqlDa.Fill(dtb1);
            students.DataSource = dtb1;
            students.DataBind();*/

            SqlDataAdapter sqlDa1 = new SqlDataAdapter("SELECT*FROM[Project].[dbo].[AVAILABLE_LESSON]", sqlCon); /*LIST AVAILABLE_LESSON TABLE*/
            DataTable dtb2 = new DataTable();
            sqlDa1.Fill(dtb2);
            lesson.DataSource = dtb2;
            lesson.DataBind();

            SqlDataAdapter sqlDa2 = new SqlDataAdapter("SELECT*FROM[Project].[dbo].[INSTRUCTOR]", sqlCon); /*LIST INSTRUCTOR TABLE*/
            DataTable dtb3 = new DataTable();
            sqlDa1.Fill(dtb3);
            lesson.DataSource = dtb3;
            lesson.DataBind();



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
            if (Convert.ToInt32(e.Row.Cells[4].Text) == 1)
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
   

}