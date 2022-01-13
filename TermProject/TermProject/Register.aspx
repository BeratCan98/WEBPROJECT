<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<!------ Include the above in your HEAD tag ---------->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

 <link rel="StyleSheet" type="text/css" href="/StyleSheet.css" /> 
    
<title> Login Page </title>  
<style>
    body{

    background-color:wheat
    }

</style>
</head>
<body>
    
        <form id="form1" runat="server">
            <div>
                <table style="margin:auto; border:5px solid white">
                    <tr>
                        <td> 
                            <asp:Label ID = "Label1" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID = "txtName" runat="server"></asp:TextBox>
                        </td>
                    </tr> 

                    <tr>
                        <td> 
                            <asp:Label ID = "Label2" runat="server" Text="Surname"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID = "txtSurname" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td> 
                            <asp:Label ID = "Label3" runat="server" Text="Mail"></asp:Label>

                        </td>
                        <td>
                            <asp:TextBox ID = "TxtMail" runat="server"></asp:TextBox>
                        </td>
                    </tr> 
                     <tr>
                        <td> 
                            <asp:Label ID = "Label4" runat="server" Text="Country"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID = "TxtCountry" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td> 
                            <asp:Label ID = "Label5" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID = "TxtPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td> 
                    
                            <asp:DropDownList ID ="DropDownList1" runat="server">
                                <asp:ListItem Value="1" Text="Instructor"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Student"></asp:ListItem>

                            </asp:DropDownList>
                        </td>

                     </tr>

                    <tr>
                        <td> 
                            
                        </td>
                        <td>
                            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnlogin_Click"/> 
                        </td>
                    </tr>

                 

                </table>
            </div>

        </form>
</body>
</html>