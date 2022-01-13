<%@ Page Language="C#" AutoEventWireup="true" CodeFile="INSTRUCTORS.aspx.cs" Inherits="INSTRUCTORS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            <asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Write Instructor Name" CssClass="form-control col-md-3" ></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Button1_Click"  />
                </div>
            <br />
            <asp:GridView ID="instructors" runat="server" AutoGenerateColumns="false"  onrowdatabound="GridView1_RowDataBound">
                <Columns>
                   <%-- <asp:BoundField DataField="ID" HeaderText="ID" />--%>
                    <asp:BoundField DataField="NAME" HeaderText="ADI" />
                    <asp:BoundField DataField="SURNAME" HeaderText="SOY ADI" />
                    <asp:BoundField DataField="MAIL" HeaderText="MAIL A." />
                   <%-- <asp:BoundField DataField="PASSWORD" HeaderText="PAROLA" />--%>
                   <%-- <asp:BoundField DataField="ACTIVE" HeaderText="AKTİF" />--%>
                    <asp:BoundField DataField="COUNTRY" HeaderText="ÜLKE" />

                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
