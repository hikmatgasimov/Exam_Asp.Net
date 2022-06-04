<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="PLessons.aspx.cs" Inherits="SlnExam.Exam.PLessons" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" language ="javascript">
        function AlertFunct() {
            alert("Səhv səbəbindən məlumatlar yazılmadı");
        }
        function AlertSucsessFunct() {
            alert("Məlumatlar uğurla yazıldı");
        }
        function AlertWarning(s) {
            alert(s);
        }
    </script>
      <div style="font-size: 16px"> Dərslər</div>
     <div> 
         <table class="auto-style2" style="height: 150px">
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label1" runat="server" Text="Dərsin kodu"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="LESSON_CODE" runat="server" Width="100%"></asp:TextBox>
                 </td>
                 <td rowspan="7" style="width: 120px">
                     <asp:Button ID="btnCancel" runat="server" Height="60px" Text="İmtina et" Width="100%" OnClick="btnCancel_Click" />
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label2" runat="server" Text="Dərsin adı"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="LESSON_NAME" runat="server" Width="100%"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label3" runat="server" Text="Sinifi"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="CLASS_NO" runat="server" Width="100%"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label4" runat="server" Text="Müellimin adı"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="TEACHER_NAME" runat="server" Width="100%"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label5" runat="server" Text="Müəllimin soyadı"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="TEACHER_SURNAME" runat="server" Width="100%"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">&nbsp;</td>
                 <td style="width: 300px">
                     <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Yenisini əlavə et" Width="48%" />
                     <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Dəyiş" Width="48%" />
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">&nbsp;</td>
                 <td style="width: 300px">
                     <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Sil" Width="48%" />
                     <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Yadda saxla" Width="48%" />
                 </td>
             </tr>
         </table>
     </div>
       <div> 
           <asp:GridView ID="GV1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="GV1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="GV1_PageIndexChanging" HorizontalAlign="Center" Width="100%">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <Columns>
                   <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                   <asp:BoundField DataField="ID" HeaderText="Sıra nömrəsi" SortExpression="Id" />
                   <asp:BoundField DataField="LESSON_NAME" HeaderText="Dərsin adı" SortExpression="LESSON_NAME" />
                   <asp:BoundField DataField="CLASS_NO" HeaderText="Sinif nömrəsi" SortExpression="CLASS_NO" />
                   <asp:BoundField DataField="TEACHER_NAME" HeaderText="Müəllimin adı" SortExpression="TEACHER_NAME" />
                   <asp:BoundField DataField="TEACHER_SURNAME" HeaderText="Müəllimin soyadı" SortExpression="TEACHER_SURNAME" />
                   <asp:BoundField DataField="LESSON_CODE" HeaderText="Dərsin kodu" SortExpression="LESSON_CODE" />
               </Columns>
               <EditRowStyle BackColor="#999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#E9E7E2" />
               <SortedAscendingHeaderStyle BackColor="#506C8C" />
               <SortedDescendingCellStyle BackColor="#FFFDF8" />
               <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </div>
</asp:Content>
