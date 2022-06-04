using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SlnExam.Exam
{
    public partial class PStudents : System.Web.UI.Page
    {
        Library Lib = new Library("Data Source=localhost;Initial Catalog=Imtahan;User ID=sa;Password=123");


        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}