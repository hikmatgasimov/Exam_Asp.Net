using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Kitabxana
{
    public class ClassLibrary
    {
        public string connectionString;
        public  ClassLibrary(string conStr)
        {
            connectionString = conStr;
        }

        public bool QueryRespond(string queryStr)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                result = dr.Read();
            }
            catch
            { result = false; }
            finally { conn.Close(); }
            return result;
        }

        public bool ExecuteSQLquery(string QueryString)
        {
            bool result = true;
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                SqlCommand cmd = new SqlCommand(QueryString, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch { result = false; }
            finally { conn.Close(); }
            return result;
        }

        public bool SaveLogToFile(string FName, string Param, string Func_Name)
        {
            bool result = true;
            string FLine = "Date=" + DateTime.Now.ToShortDateString() + " Time=" + DateTime.Now.ToLongTimeString() + " Error=" + Param + " Function=" + Func_Name;
            if (File.Exists(FName))
            {
                using (StreamWriter FWrite = File.AppendText(FName))
                {
                    FWrite.WriteLine(FLine);
                }
            }
            else
            {
                StreamWriter FWrite = new StreamWriter(FName);
                try
                {
                    FWrite.WriteLine(FLine);
                }
                catch
                {
                    result = false;
                }
                finally { FWrite.Close(); }
            }
            return result;
        }

        public string[] SQLqueryToArray(string SQLquery)
        {
            ArrayList dynamicArray = new ArrayList();
            string[] array = { "" };
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(SQLquery, conn);
            try
            {
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dynamicArray.Add(dr[0]);
                }
                dr.Close();
                array = new string[dynamicArray.Count];
                for (int i = 0; i < dynamicArray.Count; i++)
                {
                    array[i] = dynamicArray[i].ToString();
                }
                return array;
            }
            catch (Exception ex)
            {
                // MessageBox.Show(ex.Message.ToString());
                return array;
            }
            finally
            { conn.Close(); }
        }

        public void AddToListBox(ListBox lb, string Query_Str)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(Query_Str, conn);
            try
            {
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lb.Items.Add(dr[0].ToString());
                }
            }
            catch (Exception ex)
            {
                // MessageBox.Show(ex.Message.ToString());
            }
            finally
            { conn.Close(); }
        }
        public void AddToString(out string lb, string Query_Str, int i)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(Query_Str, conn);
            lb = "";
            try
            {
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lb = dr[i].ToString();
                }
            }
            catch (Exception ex)
            {
                // MessageBox.Show(ex.Message.ToString());
            }
            finally
            { conn.Close(); }
        }
        public void AddToGrid(string QueryStr, SqlDataSource BSource, GridView DGView)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                BSource.ConnectionString = connectionString;
                BSource.SelectCommand = QueryStr;
                DGView.DataSource = null;
                DGView.DataSource = BSource;
                DGView.DataBind();
            }
            catch (Exception ex)
            {
                // MessageBox.Show(ex.Message.ToString());
            }
            finally { conn.Close(); }
        }
        public bool fillComboBGI(DropDownList DDL, string field1, string field2, string sert, string showtext, short mode)
        {
            SqlConnection coon = new SqlConnection(connectionString);
            bool returnvalue = false;
            coon.Open();
            SqlCommand Command = new SqlCommand();
            Command.Connection = coon;
            SqlDataAdapter SQLadapter = new SqlDataAdapter();
            DataSet DataSet_tm = new DataSet();
            int count;
            Command.CommandText = sert;
            SQLadapter = new SqlDataAdapter(Command);
            SQLadapter.Fill(DataSet_tm);
            count = DataSet_tm.Tables[0].Rows.Count;
            if (count > 0) { returnvalue = true; }
            if (mode == 1)
            {
                DDL.Items.Add(new ListItem(showtext, "0"));
            }

            while (count > 0)
            {
                ListItem NewListItem = new ListItem(DataSet_tm.Tables[0].Rows[count - 1][field1].ToString(), DataSet_tm.Tables[0].Rows[count - 1][field2].ToString());
                DDL.Items.Add(NewListItem);
                count = count - 1;
            }
            coon.Close();
            return returnvalue;
        }
        public bool SelectGrid(string sqlcmd, ref string err, params WebControl[] Controls)
        {
            SqlConnection coon = new SqlConnection(connectionString);
            bool returnvalue;
            try
            {
                coon.Open();
                DataSet cedvel = new DataSet();
                SqlCommand Emr = new SqlCommand(sqlcmd, coon);
                SqlDataAdapter InfoAdapter = new SqlDataAdapter(Emr);
                InfoAdapter.Fill(cedvel);
                if (cedvel.Tables[0].Rows.Count == 0)
                {
                    err = "M?lumat mцvcud deyil";
                    returnvalue = false;
                }
                else
                {
                    DataRow setir = cedvel.Tables[0].Rows[0];
                    for (int i = 0; i <= Controls.GetUpperBound(0); i++)
                    {
                        string sutun = Controls[i].ID.ToString();

                        if (Controls[i] is TextBox) ((TextBox)Controls[i]).Text = setir[sutun].ToString();
                        if (Controls[i] is DropDownList) ((DropDownList)Controls[i]).SelectedValue = setir[sutun].ToString();

                    }

                    err = "";
                    returnvalue = true;

                }
                coon.Close();
            }
            catch (Exception ex)
            {
                err = ex.Message;
                returnvalue = false;
            }
            return returnvalue;
        }
    }
}
