using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SlnExam.Exam
{
    public partial class PExams : System.Web.UI.Page
    {
        Library Lib = new Library("Data Source=localhost;Initial Catalog=Imtahan;User ID=sa;Password=123");
        protected void Page_Load(object sender, EventArgs e)
        {
            Lib.AddToGrid("select ID,EXAM_DATE, EXAM_RESULT,LESSONS_ID,STUDENTS_ID from [dbo].[EXAMS]", SqlDataSource1, DGV_grid);
            if (!IsPostBack)
            {
                ViewState["SelectStudent"] = "select ID,EXAM_DATE, EXAM_RESULT,LESSONS_ID,STUDENTS_ID from [dbo].[EXAMS]";
                Disable_Component();
                Session["ID"] = "0";
                Fill_Drodowns();
            }

        }
        public void AddTo_Session()
        {
            Session["EXAM_RESULT"] = EXAM_RESULT.Text;
            Session["EXAM_DATE"] = EXAM_DATE.Text;
            Session["STUDENTS_ID"] = STUDENTS_ID.Text;
            Session["EXAM_RESULT"] = LESSONS_ID.Text;
        }
        public void Fill_Drodowns()
        {
            Lib.fillComboBGI(LESSONS_ID, "lesson_name", "ID", "select lesson_name,lesson_code, ID from [dbo].LESSONS ", "-", 1);
            Lib.fillComboBGI(STUDENTS_ID, "name", "ID", "select name,STUDENT_NO, ID from [dbo].students ", "-", 1);
        }
        public void Clear_Component()
        {
            LESSONS_ID.ClearSelection();
            STUDENTS_ID.ClearSelection();
            EXAM_DATE.Text = "";
            EXAM_RESULT.Text = "";

        }
        public bool Control_Component()
        {
            bool value = false;
            if (EXAM_DATE.Text.Trim() != "" & EXAM_RESULT.Text.Trim() != "")
            { value = true; } return value;
        }
        public void Disable_Component()
        {
            EXAM_RESULT.ReadOnly = true;
            EXAM_DATE.ReadOnly = true;
            btn_users_delete.Enabled = false;
            btn_users_save.Enabled = false;
            btn_users_update.Enabled = false;
        }

        protected void btn_users_add_Click(object sender, EventArgs e)
        {
            Session["ID"] = "1";
            btn_users_add.Enabled = false;
            btn_users_save.Enabled = true;
            EXAM_RESULT.ReadOnly = false;
            EXAM_DATE.ReadOnly = false;
        }

        protected void btn_users_save_Click(object sender, EventArgs e)
        {
            if (Session["ID"].ToString() == "1")
            {
                if (Control_Component())
                {
                    string new_query = "";
                    new_query = "INSERT into [dbo].[EXAMS] values('" + EXAM_DATE.Text.Trim() + "',N'" + EXAM_RESULT.Text.Trim() + "','" + LESSONS_ID.SelectedItem.Value.ToString() + "','" + STUDENTS_ID.SelectedItem.Value.ToString() + "')";
                    if (Lib.ExecuteSQLquery(new_query))
                    {
                        btn_users_add.Enabled = true;
                        Clear_Component();
                        Disable_Component();
                        Lib.AddToGrid("select * from [dbo].[EXAMS]", SqlDataSource1, DGV_grid);
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertSucsessFunct()", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertSucsessFunct()", true);
                    }
                }
            }
            if (Session["ID"].ToString() == "2")
            {
                if (Session["EXAM_RESULT"].ToString() != EXAM_RESULT.Text.Trim() | Session["EXAM_DATE"].ToString() != EXAM_DATE.Text.Trim() | Session["STUDENTS_ID"].ToString() != STUDENTS_ID.Text | Session["EXAM_RESULT"].ToString() != LESSONS_ID.Text.Trim())
                {
                    string new_query = "";
                    new_query = "INSERT into [dbo].[EXAMS] values('" + EXAM_DATE.Text.Trim() + "',N'" + EXAM_RESULT.Text.Trim() + "','" + LESSONS_ID.SelectedItem.Value.ToString() + "','" + STUDENTS_ID.SelectedItem.Value.ToString() + "')";
                    if (Lib.ExecuteSQLquery(new_query))
                    {
                        btn_users_add.Enabled = true;
                        Clear_Component();
                        Disable_Component();
                        Lib.AddToGrid("select * from [dbo].[EXAMS]", SqlDataSource1, DGV_grid);
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertSucsessFunct()", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertSucsessFunct()", true);
                    }
                }
            }
            if (Session["ID"].ToString() == "3")
            {
                string delete_query;
                delete_query = "DELETE from [dbo].[EXAMS] where ID=" + DGV_grid.SelectedRow.Cells[1].Text;
                if (Lib.ExecuteSQLquery(delete_query))
                {
                    btn_users_add.Enabled = true;
                    Clear_Component();
                    Disable_Component();
                    Lib.AddToGrid("select * from [dbo].[EXAMS]", SqlDataSource1, DGV_grid);
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertSucsessFunct()", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertSucsessFunct()", true);
                }
            }
        }

        protected void DGV_grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string err = "";
            if (Lib.SelectGrid("select EXAM_DATE,EXAM_RESULT,LESSONS_ID,STUDENTS_ID from [dbo].[EXAMS] where ID=" + DGV_grid.SelectedRow.Cells[1].Text, ref err, EXAM_DATE, EXAM_RESULT, LESSONS_ID, STUDENTS_ID))
            {
                btn_users_add.Enabled = false;
                btn_users_delete.Enabled = true;
                btn_users_update.Enabled = true;
            }
            else
            { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertWarning('Məlumat oxuna bilinmədi')", true); }
        }

        protected void DGV_grid_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DGV_grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGV_grid.PageIndex = e.NewPageIndex;
            DGV_grid.DataBind();
        }

        protected void btn_users_update_Click(object sender, EventArgs e)
        {
            Session["ID"] = "2";
            AddTo_Session();
            btn_users_update.Enabled = false;
            btn_users_save.Enabled = true;
            btn_users_delete.Enabled = false;
            EXAM_DATE.ReadOnly = false;
            EXAM_RESULT.ReadOnly = false;
        }

        protected void btn_users_delete_Click(object sender, EventArgs e)
        {
            Session["ID"] = "3";
            btn_users_update.Enabled = false;
            btn_users_save.Enabled = true;
            btn_users_delete.Enabled = false;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["ID"] = "0";
            Clear_Component();
            Disable_Component();
            btn_users_add.Enabled = true;
            Lib.AddToGrid("select * from [dbo].[EXAMS]", SqlDataSource1, DGV_grid);
        }
    }
}