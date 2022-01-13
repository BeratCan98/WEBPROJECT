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
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading.Tasks;
using System.Windows.Forms;

public partial class Default2 : System.Web.UI.Page
{
    String connectionString = @"Data Source=(localdb)\MSSQLLocalDb;Integrated Security=SSPI;Initial Catalog=Project;";


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("UserAdd", sqlCon);


            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@FirstName", txtName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@LastName", txtSurname.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Mail", TxtMail.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Password", TxtPassword.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Country", TxtCountry.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@TYPE", DropDownList1.SelectedValue);
            sqlCmd.ExecuteNonQuery();
            string name = txtName.Text + txtSurname.Text;


            string type = DropDownList1.SelectedValue;
            if (type == "0")
            {
                SqlCommand cmd2 = new SqlCommand("select * from STUDENTS WHERE MAIL = '" + TxtMail.Text + "'", sqlCon);
                SqlDataReader dr2 = cmd2.ExecuteReader();

                if (dr2.HasRows)
                {
                    while (dr2.Read())
                    {
                        Response.Write("<script>alert('Already Taken.');</script>");
                    }

                }

            }
            else if (type == "1")
            {

                SqlCommand cmd = new SqlCommand("select * FROM INSTRUCTOR WHERE MAIL = '" + TxtMail.Text + "'", sqlCon);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Already Taken.');</script>");
                    }

                }
            }
            else
            {
                Response.Write("<script>alert('Not Taken.');</script>");
            }


            if (txtName.Text != "" && txtSurname.Text != "" && TxtCountry.Text != "" && TxtMail.Text != "" && TxtPassword.Text != "")
            {
                
                Response.Write("<script>alert('" + "Registration is Succesfull" + "');</script>");
                Response.Redirect("http://localhost:30200/login.aspx");
                try
                {

                    SmtpClient client = new SmtpClient("smtp.gmail.com", Convert.ToInt32(587));
                    client.EnableSsl = true;

                    client.Timeout = 100000;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("kwaiforme4@gmail.com", "Kwai12345");
                    MailMessage msg = new MailMessage();
                    msg.To.Add(TxtMail.Text);
                    msg.From = new MailAddress("kwaiforme4@gmail.com");
                    msg.Subject = "Accepted";
                    msg.Body = "Your account was created.";
                    client.Send(msg);
                    MessageBox.Show("Successfully Sent message.");
                    Clear();

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }

            }
            else
            {
                Response.Write("<script>alert('" + "Ooops Error occur. \n Fill blanks!!" + "');</script>");
                Clear();
            }
        }

    }
    void Clear()
    {
        txtName.Text = txtSurname.Text = TxtMail.Text = TxtPassword.Text = TxtCountry.Text = DropDownList1.Text = "";

    }

    protected void txtPassword0_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtPassword1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}