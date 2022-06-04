<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="PStudents.aspx.cs" Inherits="SlnExam.Exam.PStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            height: 178px;
        }
    </style>
    <script type="text/javascript" language ="javascript">
        function AlertFunct()
        {
            alert("Səhv səbəbindən məlumatlar yazılmadı");
        }
        function AlertSucsessFunct() {
            alert("Məlumatlar uğurla yazıldı");
        }
        function AlertWarning(s) {
            alert(s);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="font-size: 16px"> Şagirdlər </div>
     <div style="height: 192px"> 
         <table class="auto-style2">
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Nomrəsi" runat="server" Text="Nömrəsi"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="STUDENT_NO" runat="server" Width="100%"></asp:TextBox>
                 </td>
                 <td rowspan="6" style="width: 120px">
                     <asp:Button ID="btnCancel" runat="server" Height="60px" Text="Imtina et" Width="100%" OnClick="Button1_Click" />
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label2" runat="server" Text="Adı"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="NAME" runat="server" Width="100%"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label3" runat="server" Text="Soyadı"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="SURNAME" runat="server" Width="100%"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label4" runat="server" Text="Sinifi"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:TextBox ID="CLASS_NO" runat="server" Width="100%"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">&nbsp;</td>
                 <td style="width: 300px">
                     <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Yenisini əlavə et" Width="48%" />
                     <asp:Button ID="btnUpdate" runat="server" Text="Dəyiş" Width="48%" OnClick="btnUpdate_Click" />
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">&nbsp;</td>
                 <td style="width: 300px">
                     <asp:Button ID="btnDelete" runat="server" Text="Sil" Width="48%" OnClick="btnDelete_Click" />
                     <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Yadda saxla" Width="48%" />
                 </td>
             </tr>
         </table>
     </div>
       <div> 
           <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
           <asp:GridView ID="GV1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="GV1_SelectedIndexChanged" DataKeyNames="ID" AllowPaging="True" OnPageIndexChanging="GV1_PageIndexChanging" Width="100%" HorizontalAlign="Center">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <Columns>
                   <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                   <asp:BoundField DataField="ID" HeaderText="Sıra nömrəsi" SortExpression="ID" />
                   <asp:BoundField DataField="STUDENT_NO" HeaderText="Şagird nömrəsi" SortExpression="STUDENT_NO" />
                   <asp:BoundField DataField="NAME" HeaderText="Adı" SortExpression="NAME" />
                   <asp:BoundField DataField="SURNAME" HeaderText="Soyadı" SortExpression="SURNAME" />
                   <asp:BoundField DataField="CLASS_NO" HeaderText="Sinif nömrəsi" SortExpression="CLASS_NO" />
               </Columns>
               <EditRowStyle BackColor="Black" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerSettings LastPageText="" NextPageText="" PreviousPageText="" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" />
               <SortedAscendingCellStyle BackColor="#E9E7E2" />
               <SortedAscendingHeaderStyle BackColor="#506C8C" />
               <SortedDescendingCellStyle BackColor="#FFFDF8" />
               <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
           </asp:GridView>
    </div>
</asp:Content>
