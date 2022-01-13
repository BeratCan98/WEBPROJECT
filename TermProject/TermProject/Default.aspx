<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>web page</title>
    
    <style>
table, th, td {
  border: 1px solid black;
}
</style>
     <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script language="javascript">
        $(document).ready(function () {
            $("#Select1").on("change", function () {
                var selval = $(this).find("option:selected").val();
                var seltext = $(this).find("option:selected").text();
                $("#spnSelectedValue").text(selval);
                $("#spnSelectedText").text(seltext);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <button type="submit" class="btn btn-primary mb-2" onClick="showMessage()">Submit</button> 
    <script type="text/javascript">


    function showMessage() {
        alert("Hello friends, your message was recieved. Thank you for your message. I will contact with you as soon as possible. \n \n BERAT CAN DUMAN");
        }

      


</script>
        </div>
        <div>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Write Student Name or Selected Below ComboBox " size="50"></asp:TextBox>
              <asp:Button ID="Button2" runat="server" Text="Search" />
        </div>
        <div>
            <select id="Select1">
                <option value="-1" disabled selected>CHOOSE</option>
                <option value="1000">BERAT</option>
                <option value="1001">ERHAN</option>
            </select>
              
                  
        </div>
       
        <br />
       
       <%-- <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>--%>
        <label>
    Enter your starting  day:
    
    <input type="date" name="firstday">
     Enter your last  day:
    <input type="date" name="lastday">
            
    <select id="Select2">
                <option value="-1" disabled selected>CHOOSE</option>
                <option value="null">TÜM SAATLER</option>          
                <option value="0">UYGUN OLMAYAN SAATLER</option>
                <option value="1">UYGUN SAATLER</option>
            </select>
  </label>
        <br />
            <br />

          <div>
           <%-- <asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
            <asp:GridView ID="lesson" runat="server" AutoGenerateColumns="false"  onrowdatabound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR ID" />
                    <asp:BoundField DataField="LESSON_HOUR" HeaderText="DERS SAATİ" />
                    <asp:BoundField DataField="LESSON_DATE" HeaderText="DERS GÜNÜ" />
                    <asp:BoundField DataField="LESSON_STATU" HeaderText="LESSON_STATU" />
                    

                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
