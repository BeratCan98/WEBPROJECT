<%@ Page Language="C#" AutoEventWireup="true" CodeFile="STUDENTS.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                 <asp:TextBox ID="TextBox1" runat="server" PlaceHolder="Write Student Name"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            </div>
           <br />
             <asp:GridView ID="students" runat="server" AutoGenerateColumns="False"  onrowdatabound="GridView1_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                   <%-- <asp:BoundField DataField="ID" HeaderText="ID" />--%>
                    <asp:BoundField DataField="NAME" HeaderText="ADI" />
                    <asp:BoundField DataField="SURNAME" HeaderText="SOY ADI" />
                    <asp:BoundField DataField="MAIL" HeaderText="MAIL A." />
                   <%-- <asp:BoundField DataField="PASSWORD" HeaderText="PAROLA" />--%>
                   <%-- <asp:BoundField DataField="ACTIVE" HeaderText="AKTİF" />--%>
                    <asp:BoundField DataField="COUNTRY" HeaderText="ÜLKE" />

                </Columns>
                 <FooterStyle BackColor="White" ForeColor="#000066" />
                 <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                 <RowStyle ForeColor="#000066" />
                 <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#F1F1F1" />
                 <SortedAscendingHeaderStyle BackColor="#007DBB" />
                 <SortedDescendingCellStyle BackColor="#CAC9C9" />
                 <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
