using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    String strcon;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project;");
            if (con.State == ConnectionState.Closed)
            {

                con.Open();
            }
            int password = Convert.ToInt32(txtPassword.Text);


            string type = DropDownList2.SelectedValue;
            if (type == "0")
            {
                SqlCommand cmd = new SqlCommand("select * from STUDENTS WHERE MAIL = '" + txtUsername.Text + "' AND PASSWORD ='" + password + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Redirect("http://localhost:30200/mainpage.aspx");
                        Response.Write("<script>alert('" + "Student In." + "');</script>");
                    }
                }
            }

            else if (type == "1")
            {
                SqlCommand cmd2 = new SqlCommand("select * from INSTRUCTOR WHERE MAIL = '" + txtUsername.Text + "' AND PASSWORD ='" + password + "'", con);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.HasRows)
                {
                    while (dr2.Read())
                    {
                        Response.Redirect(String.Format("http://localhost:30200/mainpage.aspx",txtUsername.Text));
                        Response.Write("<script>alert('Instructor In.');</script>");
                    }

                }
            }
            else
            {
                Response.Write("<script>alert('Invalid');</script>");
            }
        }
        catch { }

    }

}