using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SlnExam.Exam
{
    public partial class PLessons : System.Web.UI.Page
    {
        Library Lib = new Library("Data Source=localhost;Initial Catalog=Imtahan;User ID=sa;Password=123");

        protected void Page_Load(object sender, EventArgs e)
        {
            Lib.AddToGrid("select * from [dbo].[LESSONS]", SqlDataSource1, DGV_grid);
            if (!IsPostBack)
            {
                Disable_Component();
                Session["ID"] = "0";
            }

        }
        public void Clear_Component()
        {
            LESSON_CODE.Text = "";
            LESSON_NAME.Text = "";
            CLASS_NO.Text = "";
            TEACHER_NAME.Text = "";
            TEACHER_SURNAME.Text = "";
        }
        public bool Control_Component()
        {
            bool values = false;
            if (LESSON_CODE.Text != "" & LESSON_NAME.Text != "" & CLASS_NO.Text != "" & TEACHER_NAME.Text != "" & TEACHER_SURNAME.Text != "")
            { values = true; } return values;
        }
        public void Disable_Component()
        {
            LESSON_CODE.ReadOnly = true;
            LESSON_NAME.ReadOnly = true;
            CLASS_NO.ReadOnly = true;
            TEACHER_NAME.ReadOnly = true;
            TEACHER_SURNAME.ReadOnly = true;
            btn_users_delete.Enabled = false;
            btn_users_save.Enabled = false;
            btn_users_update.Enabled = false;
        }
        protected void btn_users_add_Click(object sender, EventArgs e)
        {
            Session["ID"] = "1";
            btn_users_add.Enabled = false;
            LESSON_CODE.ReadOnly = false;
            LESSON_NAME.ReadOnly = false;
            CLASS_NO.ReadOnly = false;
            TEACHER_NAME.ReadOnly = false;
            TEACHER_SURNAME.ReadOnly = false;
            btn_users_save.Enabled = true;

        }

        protected void btn_users_save_Click(object sender, EventArgs e)
        {
            if (Session["ID"].ToString() == "1")
            {
                if (Control_Component())
                {
                    string new_query = "";
                    new_query = "INSERT into [dbo].[LESSONS] values('" + LESSON_NAME.Text.Trim() + "',N'" + CLASS_NO.Text.Trim() + "',N'" + TEACHER_NAME.Text.Trim() + "','" + TEACHER_SURNAME.Text.Trim() + "','" + LESSON_CODE.Text.Trim() + "')";
                    if (Lib.ExecuteSQLquery(new_query))
                    {
                        btn_users_add.Enabled = true;
                        Clear_Component();
                        Disable_Component();
                        Lib.AddToGrid("select * from [dbo].[LESSONS]", SqlDataSource1, DGV_grid);
                    }
                }
            }
            if (Session["ID"].ToString() == "2")
            {
                if (Session["LESSON_CODE"].ToString() != LESSON_CODE.Text | Session["LESSON_NAME"].ToString() != LESSON_NAME.Text | Session["CLASS_NO"].ToString() != CLASS_NO.Text | Session["TEACHER_NAME"].ToString() != TEACHER_NAME.Text | Session["TEACHER_SURNAME"].ToString() != TEACHER_SURNAME.Text)
                {
                    string Udate_Query;
                    Udate_Query = "UPDATE [dbo].[LESSONS] set LESSON_NAME='" + LESSON_NAME.Text.Trim() + "',CLASS_NO=N'" + CLASS_NO.Text.Trim() +
                        "', TEACHER_NAME=N'" + TEACHER_NAME.Text.Trim() + "', TEACHER_SURNAME='" + TEACHER_SURNAME.Text.Trim() + "', LESSON_CODE='" + LESSON_CODE.Text.Trim() + "' where ID=" + DGV_grid.SelectedRow.Cells[1].Text;
                    if (Lib.ExecuteSQLquery(Udate_Query))
                    {
                        btn_users_add.Enabled = true;
                        Clear_Component();
                        Disable_Component();
                        Lib.AddToGrid("select * from [dbo].[LESSONS]", SqlDataSource1, DGV_grid);
                    }
                }
            }
            if (Session["ID"].ToString() == "3")
            {
                string delete_query;
                delete_query = "DELETE from [dbo].[LESSONS] where ID=" + DGV_grid.SelectedRow.Cells[1].Text;
                if (Lib.ExecuteSQLquery(delete_query))
                {
                    Lib.AddToGrid("select * from [dbo].[LESSONS]", SqlDataSource1, DGV_grid);
                    btn_users_add.Enabled = true;
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertWarning('Məlumat uğurla silindi')", true);
                    Clear_Component();
                    Disable_Component();
                
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertWarning('Səhv baş verdi məlumat silinmədi')", true);
                }
            }
        }
        public void AddToSession()
        {
            Session["LESSON_CODE"] = LESSON_CODE.Text;
            Session["LESSON_NAME"] = LESSON_NAME.Text;
            Session["CLASS_NO"] = CLASS_NO.Text;
            Session["TEACHER_NAME"] = TEACHER_NAME.Text;
            Session["TEACHER_SURNAME"] = TEACHER_SURNAME.Text;

        }
        protected void btn_users_update_Click(object sender, EventArgs e)
        {
            Session["ID"] = "2";
            AddToSession();
            btn_users_save.Enabled = true;
            btn_users_delete.Enabled = false;
            btn_users_update.Enabled = false;
            LESSON_CODE.ReadOnly = false;
            LESSON_NAME.ReadOnly = false;
            CLASS_NO.ReadOnly = false;
            TEACHER_NAME.ReadOnly = false;
            TEACHER_SURNAME.ReadOnly = false;

        }

        protected void DGV_grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string err = "";
            if (Lib.SelectGrid("select LESSON_NAME, CLASS_NO, TEACHER_NAME, TEACHER_SURNAME,LESSON_CODE from [dbo].[LESSONS] where ID=" + DGV_grid.SelectedRow.Cells[1].Text, ref err, LESSON_NAME, CLASS_NO, TEACHER_NAME, TEACHER_SURNAME, LESSON_CODE))
            {
                btn_users_update.Enabled = true;
                btn_users_delete.Enabled = true;
                btn_users_add.Enabled = false;
            }
            else
            { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertWarning('Məlumat oxuna bilinmədi')", true); }
        }

        protected void DGV_grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DGV_grid.PageIndex = e.NewPageIndex;
            DGV_grid.DataBind();
        }

        protected void btn_users_delete_Click(object sender, EventArgs e)
        {
            Session["ID"] = "3";
            btn_users_save.Enabled = true;
            btn_users_update.Enabled = false;
            btn_users_delete.Enabled = false;
        }







    }
}