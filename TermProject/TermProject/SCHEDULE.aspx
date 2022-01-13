<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SCHEDULE.aspx.cs" Inherits="SCHEDULE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1>RESERVED LESSONS ARE LISTED ABOVE</h1>
            <h3>If statu is 1, LESSON IS Accredited!</h3>
            <h3>If statu is 0, LESSON IS CANCELLED!</h3>
            <h3>If statu is 2, LESSON IS PENDING APPROVAL!</h3>
             <asp:GridView ID="schedule" runat="server" AutoGenerateColumns="False"  onrowdatabound="GridView1_RowDataBound"
                 BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID"
                 OnRowUpdating="schedule_RowUpdating" OnSelectedIndexChanged="schedule_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT ID" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR ID" />
                    <asp:BoundField DataField="LESSON_ID" HeaderText="LESSON ID" />
                    <asp:BoundField DataField="SCHEDULE_DATE" HeaderText="SCHEDULE DATE" />
                    <asp:BoundField DataField="SCHEDULE_HOUR" HeaderText="SCHEDULE HOUR" />
                    <asp:BoundField DataField="SCHEDULE_STATU" HeaderText="SCHEDULE STATU" />
                </Columns>

                 <Columns>

                     <asp:TemplateField HeaderText="ID">
                         <ItemTemplate>
                             <asp:Label Text='<%# Eval("ID") %>' runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtID" Text='<%# Eval("ID") %>' runat="server"/>
                         </EditItemTemplate>
                     </asp:TemplateField>

                      <asp:TemplateField HeaderText="STUDENT_ID">
                         <ItemTemplate>
                             <asp:Label Text='<%# Eval("STUDENT_ID") %>' runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtSTUDENT_ID" Text='<%# Eval("STUDENT_ID") %>' runat="server"/>
                         </EditItemTemplate>
                     </asp:TemplateField>

                      <asp:TemplateField HeaderText="INSTRUCTOR_ID">
                         <ItemTemplate>
                             <asp:Label Text='<%# Eval("INSTRUCTOR_ID") %>' runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtINSTRUCTOR_ID" Text='<%# Eval("INSTRUCTOR_ID") %>' runat="server"/>
                         </EditItemTemplate>
                     </asp:TemplateField>

                      <asp:TemplateField HeaderText="LESSON_ID">
                         <ItemTemplate>
                             <asp:Label Text='<%# Eval("LESSON_ID") %>' runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtLESSON_ID" Text='<%# Eval("LESSON_ID") %>' runat="server"/>
                         </EditItemTemplate>
                     </asp:TemplateField>

                      <asp:TemplateField HeaderText="SCHEDULE_DATE">
                         <ItemTemplate>
                             <asp:Label Text='<%# Eval("SCHEDULE_DATE") %>' runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtSCHEDULE_DATE" Text='<%# Eval("SCHEDULE_DATE") %>' runat="server"/>
                         </EditItemTemplate>
                     </asp:TemplateField>

                      <asp:TemplateField HeaderText="SCHEDULE_HOUR">
                         <ItemTemplate>
                             <asp:Label Text='<%# Eval("SCHEDULE_HOUR") %>' runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtSCHEDULE_HOUR" Text='<%# Eval("SCHEDULE_HOUR") %>' runat="server"/>
                         </EditItemTemplate>
                     </asp:TemplateField>

                      <asp:TemplateField HeaderText="SCHEDULE_STATU">
                         <ItemTemplate>
                             <asp:Label Text='<%# Eval("SCHEDULE_STATU") %>' runat="server"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtSCHEDULE_STATU" Text='<%# Eval("SCHEDULE_STATU") %>' runat="server"/>
                         </EditItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:ImageButton ImageUrl="~/images/confirm.jpg" runat="server" CommandName="Confirm" ToolTip="Confirm" Width="20px" Height="20px"/>
                             <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel"  Width="20px" Height="20px"/>
                         </ItemTemplate>

                         <EditItemTemplate>
                            <asp:ImageButton ImageURL="~/images/update.jpg" runat="server" CommandName="Update" ToolTip="Update"/>
                            <asp:ImageButton ImageURL="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel"/>
                         </EditItemTemplate>
                     </asp:TemplateField>
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
            <br />
            <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green"/>
            <br />
            <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red"/>
        </div>
    </form>
</body>
</html>
