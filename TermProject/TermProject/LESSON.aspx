<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LESSON.aspx.cs" Inherits="LESSON" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>AVAILABLE LESSONS'S STATU IS 1 AND COLOR IS GREEN!</h1>
            <label>

    Enter your starting  day:
    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>      
     Enter your last  day:
    <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
            <br />
                <tr>
                    <td> 
                         <asp:DropDownList ID ="DropDownList1" runat="server">
                                <asp:ListItem Value="-1" Text="CHOOSE" disabled="selected"></asp:ListItem>
                                <asp:ListItem Value="1" Text="AVAILABLE"></asp:ListItem>
                                <asp:ListItem Value="0" Text="PASSIVE"></asp:ListItem>

                            </asp:DropDownList>
                        </td>

                     </tr>
               
                <asp:Button ID="Button1" runat="server" Text="SEARCH" OnClick="Button1_Click" />
                 <br />
                 <br />
                <asp:TextBox ID="TextBox1" runat="server" PlaceHolder="WRITE STUDENT ID"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" PlaceHolder="WRITE LESSON ID"></asp:TextBox>
                
  </label>
            
            
            
                
        <br />
            <br />
             <asp:GridView ID="lesson" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" DataKeyNames="ID" onrowdatabound="GridView1_RowDataBound"
                 BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowFooter="true" OnRowCommand="lesson_RowCommand"
                 OnRowEditing="lesson_RowEditing" OnRowCancelingEdit="lesson_RowCancelingEdit" OnRowUpdating="lesson_RowUpdating" OnRowDeleting="lesson_RowDeleting">
              
                 <Columns>
                    
                  
                    <asp:BoundField DataField="LESSON_STATU" HeaderText="LESSON_STATU" />
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR ID" />
                    <asp:BoundField DataField="LESSON_HOUR" HeaderText="DERS SAATİ" />
                    <asp:BoundField DataField="LESSON_DATE" HeaderText="DERS GÜNÜ" />
                    <asp:TemplateField HeaderText="CHOOSE LESSON">
                        <ItemTemplate>
                         <asp:LinkButton ID="lnkSelect" Text="Select" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkSelect_Click"/>
                         </ItemTemplate>
                    </asp:TemplateField>
                     </Columns>
                 <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("ID")%>' runat="server"  />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" runat="server" Text='<%#Eval("ID")%>'/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIDFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="INSTRUCTOR_ID">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("INSTRUCTOR_ID")%>' runat="server"  />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtINSTRUCTOR_ID" runat="server" Text='<%#Eval("INSTRUCTOR_ID")%>'/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtINSTRUCTOR_IDFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="LESSON_HOUR">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("LESSON_HOUR")%>' runat="server"  />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" runat="server" Text='<%#Eval("LESSON_HOUR")%>'/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLESSON_HOURFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="LESSON_DATE">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("LESSON_DATE")%>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" runat="server" Text='<%#Eval("LESSON_DATE")%>'/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLESSON_DATEFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="LESSON_STATU">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("LESSON_STATU")%>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" runat="server" Text='<%#Eval("LESSON_STATU")%>'/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLESSON_STATUFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageURL="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit"/>
                            <asp:ImageButton ImageURL="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete"/>
                            
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageURL="~/images/update.jpg" runat="server" CommandName="Update" ToolTip="Update"/>
                            <asp:ImageButton ImageURL="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageURL="~/images/add.png" runat="server" CommandName="Add" ToolTip="Add"/>
                        </FooterTemplate>
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
            <asp:Label ID="lblSuccess" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="lblError" Text="" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
