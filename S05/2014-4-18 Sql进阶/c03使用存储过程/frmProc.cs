using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace c03使用存储过程
{
    public partial class frmProc : Form
    {
        public frmProc()
        {
            InitializeComponent();
        }
        string connStr = "Data Source=.;Initial Catalog=MySchoolMoreData;Integrated Security=True";

        private void btnNoPARA_Click(object sender, EventArgs e)
        {
            //只是将之前的sql语句替换为存储过程名称
            //如果没有参数，那么就直接执行存储过程
            SqlDataAdapter da = new SqlDataAdapter("usp_getAllStudentInfo", connStr);
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.dgvList.DataSource = dt;
        }

        private void btnHasPara1_Click(object sender, EventArgs e)
        {
            //1.区别1：不再是sql命令而是存储过程名称
            SqlDataAdapter da = new SqlDataAdapter("usp_getAllStudentInfoByClassName", connStr);
            //2.区别2：得告诉服务器当前执行的不再是简单的sql命令，而是存储过程,默认是sql命令
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //SqlDataAdapter da = new SqlDataAdapter("insert into grade values(@va)", connStr);
            DataTable dt = new DataTable();
            //创建一个参数
            SqlParameter p = new SqlParameter("@className","七期班");
            //将参数添加到命令对象
            da.SelectCommand.Parameters.Add(p);

            da.Fill(dt);
            this.dgvList.DataSource = dt;
        }

        private void btnOutput_Click(object sender, EventArgs e)
        {
            //区别1.指定是存储过程名称
            SqlDataAdapter da = new SqlDataAdapter("usp_getCountAndinfoByClassNameAndSex", connStr);
            //2.区别2：告诉服务器当前执行的是存储过程
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlParameter[] ps = { 
                                new SqlParameter("@className","七期班"),
                                //如果参数是输出参数，那么服务器会将对应的输出值返回到指定的参数中。存储到参数对象Value属性中
                                new SqlParameter("@cnt",SqlDbType.Int),
                                new SqlParameter("@name",SqlDbType.NVarChar,50),
                                new SqlParameter("@sex",rdoMale.Checked?"男":"女")
                                };
            //区别3：必须指定输出参数和return返回值的参数的方向。默认是输入 
            //ps[0].Direction = ParameterDirection.Input;
            ps[1].Direction = ParameterDirection.Output;
            ps[2].Direction = ParameterDirection.Output;
            //ps[3].Direction = ParameterDirection.Input;
            da.SelectCommand.Parameters.AddRange(ps);
            //不仅仅服务器愿意给你输出值，而且你得去请求
            da.Fill(dt);
            this.dgvList.DataSource = dt;
            MessageBox.Show(ps[0].Value+"  "+ps[1].Value+"  "+ps[2].Value+"  "+ps[3].Value);
        }
    }
}
