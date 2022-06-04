<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="PExams.aspx.cs" Inherits="SlnExam.Exam.PExams" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-size: 16px">İmtahan</div>
    <div style="height: 209px">
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
        <table class="auto-style2" id="Lessons_users_ID">
            <tr>
                <td style="width: 580px; text-align: right;">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    Imtahan tarixi</td>
                <td style="width: 300px">
                    <asp:TextBox ID="EXAM_DATE" runat="server" Width="100%" style="margin-left: 0px"></asp:TextBox>
                    <cc1:CalendarExtender ID="EXAM_DATE_CalendarExtender" runat="server" Format="dd.MM.yyyy" BehaviorID="EXAM_DATE_CalendarExtender" TargetControlID="EXAM_DATE"></cc1:CalendarExtender>
                </td>
               <td rowspan="6" style="width:120px"> <asp:Button ID="Button1" runat="server" Width="100%" Text="Imtina Et" Height="60px" OnClick="Button1_Click"/></td>
                </tr>
            <tr>
                <td style="width:580px;text-align:right">Qiymeti</td>
                <td style="width:300px"> <asp:TextBox ID="EXAM_RESULT"  Width="100%" runat="server" ></asp:TextBox></td>             
            </tr>
            <tr>
                <td style="width:580px;text-align:right">
                    <asp:Label ID="Label1" runat="server" Text="Dersin Kodu"></asp:Label></td>
                <td style="width:300px">
                     <asp:DropDownList ID="LESSONS_ID" runat="server" Width="100%"></asp:DropDownList> </td>
            </tr>
            <tr>
                <td style="width:580px;text-align:right"> <asp:Label ID="Label2" runat="server" Text="Sagirdin Nomresi"></asp:Label></td>

                <td style="width:300px">
                    <asp:DropDownList ID="STUDENTS_ID" runat="server" Width="100%" style="margin-top: 0px" AutoPostBack="True"></asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width:580px;text-align:right">
                    <td>
                        <asp:Button ID="btn_users_add" runat="server" Width="48%"  Text="Yenisini Elave Et" OnClick="btn_users_add_Click" />
                         <asp:Button ID="btn_users_update" runat="server" Width="48%"  Text="Deyis" OnClick="btn_users_update_Click" />
                    </td>
                    
                </td>
                
            </tr>
            <tr>
                <td style="width:580px;text-align:right"></td>
                <td>
                    <asp:Button ID="btn_users_delete" runat="server" Width="48%" Text="Sil" OnClick="btn_users_delete_Click" />
                    <asp:Button ID="btn_users_save" runat="server" Width="48%" Text="Yadda Saxla" OnClick="btn_users_save_Click" />
                    </td>              
            </tr>
        </table>
    </div>
    <div>
        <asp:GridView ID="DGV_grid" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" Height="402px" OnPageIndexChanged="DGV_grid_PageIndexChanged" OnPageIndexChanging="DGV_grid_PageIndexChanging" OnSelectedIndexChanged="DGV_grid_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="Sıra nömrəsi" SortExpression="ID" />
                <asp:BoundField DataField="EXAM_DATE" DataFormatString="dd.MM.yyyy" HeaderText="İmtahanın tarixi" SortExpression="EXAM_DATE" />
                <asp:BoundField DataField="EXAM_RESULT" HeaderText="Qiyməti" SortExpression="EXAM_RESULT" />
                <asp:BoundField DataField="LESSONS_ID" HeaderText="Dersin kodu" SortExpression="LESSONS_ID" />
                <asp:BoundField DataField="STUDENTS_ID" HeaderText="Şagirdin nömrəsi" SortExpression="STUDENTS_ID" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </div>
</asp:Content>
