<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="PExams.aspx.cs" Inherits="SlnExam.Exam.PExams" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="font-size: 16px"> İmtahan</div>
     <div style="height: 209px"> 
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
         <table class="auto-style2">
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:ScriptManager ID="ScriptManager1" runat="server">
                     </asp:ScriptManager>
                     Imtahan tarixi</td>
                 <td style="width: 300px">
                     <asp:TextBox ID="EXAM_DATE" runat="server" Width="100%"></asp:TextBox>
                     <cc1:CalendarExtender ID="EXAM_DATE_CalendarExtender" runat="server" Format="dd.MM.yyyy"  BehaviorID="EXAM_DATE_CalendarExtender" TargetControlID="EXAM_DATE">
                     </cc1:CalendarExtender>
                 </td>
                 <td rowspan="6" style="width: 120px">
                     <asp:Button ID="btnCancel" runat="server" Height="60px" Text="İmtina" Width="100%" OnClick="btnCancel_Click" />
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">Qiyməti</td>
                 <td style="width: 300px">
                     <asp:TextBox ID="EXAM_RESULT" runat="server" Width="100%"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label1" runat="server" Text="Dərsin Kodu"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:DropDownList ID="LESSONS_ID" runat="server" Width="98%">
                     </asp:DropDownList>
                 </td>
             </tr>
             <tr>
                 <td style="width: 580px; text-align: right;">
                     <asp:Label ID="Label2" runat="server" Text="Şagirdin nömrəsi"></asp:Label>
                 </td>
                 <td style="width: 300px">
                     <asp:DropDownList ID="STUDENTS_ID" runat="server" AutoPostBack="True" Width="98%">
                     </asp:DropDownList>
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
                     <asp:Button ID="btnDelete" runat="server" Text="Sil" Width="48%" OnClick="btnDelete_Click" />
                     <asp:Button ID="btnSave" runat="server" Text="Yadda saxla" Width="48%" OnClick="btnSave_Click" />
                 </td>
             </tr>
         </table>
     </div>
       <div> 
           
               
                   <asp:GridView ID="GV3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GV3_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="GV3_PageIndexChanging" Width="100%">
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       <Columns>
                           <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                           <asp:BoundField DataField="ID" HeaderText="Sıra nömrəsi" SortExpression="ID" />
                           <asp:BoundField DataField="EXAM_DATE" HeaderText="İmtahanın tarixi" SortExpression="EXAM_DATE" DataFormatString="dd.MM.yyyy" />
                           <asp:BoundField DataField="EXAM_RESULT" HeaderText="Qiyməti" SortExpression="EXAM_RESULT" />
                           <asp:BoundField DataField="LESSONS_ID" HeaderText="Dersin kodu" SortExpression="LESSONS_ID" />
                           <asp:BoundField DataField="STUDENTS_ID" HeaderText="Şagirdin nömrəsi" SortExpression="STUDENTS_ID" />
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
