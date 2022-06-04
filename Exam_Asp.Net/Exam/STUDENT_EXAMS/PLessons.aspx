<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="PLessons.aspx.cs" Inherits="SlnExam.Exam.PLessons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script type="text/javascript" language="javascript">
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
    <div style="font-size: 16px">Dersler </div>
    <div>
        <table>
            <tr>
                <td style="width: 580px; text-align: right;">
                    <asp:Label ID="Label1" runat="server" Text="Dersin Kodu"></asp:Label></td>

                <td style="width: 400px">
                    <asp:TextBox ID="LESSON_CODE" runat="server" Width="80%"></asp:TextBox></td>
                <td rowspan="6" style="width: 120px;">
                    <asp:Button ID="btn_cancel" runat="server" Text="Imtina Et" Height="100px " Width="100%" /></td>
            </tr>
            <tr>
                <td style="width: 580px; text-align: right;">
                    <asp:Label ID="Label2" runat="server" Text="Dərsin adı"></asp:Label>
                </td>
                <td style="width: 400px">
                    <asp:TextBox ID="LESSON_NAME" runat="server" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 580px; text-align: right;">
                    <asp:Label ID="Label3" runat="server" Text="Sinifi"></asp:Label>
                </td>
                <td style="width: 400px">
                    <asp:TextBox ID="CLASS_NO" runat="server" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 580px; text-align: right;">
                    <asp:Label ID="Label4" runat="server" Text="Muellimin Adi"></asp:Label>
                </td>
                <td style="width: 400px">
                    <asp:TextBox ID="TEACHER_NAME" runat="server" Width="80%"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td style="width: 580px; text-align: right;">
                    <asp:Label ID="Label5" runat="server" Text="Muellimin Soyadi"></asp:Label>
                </td>
                <td style="width: 400px">
                    <asp:TextBox ID="TEACHER_SURNAME" runat="server" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 580px; text-align: right"></td>
                <td style="width: 400px">
                    <asp:Button ID="btn_users_add" runat="server" Width="40%" Text="Yenisini Elave Et" OnClick="btn_users_add_Click" />             
                 <asp:Button ID="btn_users_update" runat="server" Width="40%" Text="Deyis" OnClick="btn_users_update_Click" />
                </td>
            </tr>
            <tr>
                <td  style="width: 580px; text-align: right"></td>
                 <td style="width: 400px">
                    <asp:Button ID="btn_users_delete" runat="server" Width="40%" Text="Sil" OnClick="btn_users_delete_Click" />             
                 <asp:Button ID="btn_users_save" runat="server" Width="40%" Text="Yadda Saxla" OnClick="btn_users_save_Click" />
                </td>
            </tr>
          
        </table>

    </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        
      <asp:GridView ID="DGV_grid" runat="server"  Width="100%" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="DGV_grid_PageIndexChanging" OnSelectedIndexChanged="DGV_grid_SelectedIndexChanged">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
          <Columns>
              <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
              <asp:BoundField DataField="ID" HeaderText="Sıra nömrəsi" SortExpression="ID" />
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
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <SortedAscendingCellStyle BackColor="#E9E7E2" />
          <SortedAscendingHeaderStyle BackColor="#506C8C" />
          <SortedDescendingCellStyle BackColor="#FFFDF8" />
          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
</asp:Content>
