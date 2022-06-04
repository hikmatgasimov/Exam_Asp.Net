<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="PStudents.aspx.cs" Inherits="SlnExam.Exam.PStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
     </asp:Content>
