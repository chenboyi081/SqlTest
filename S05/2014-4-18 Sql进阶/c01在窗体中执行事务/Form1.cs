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

namespace c01在窗体中执行事务
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnTransfer_Click(object sender, EventArgs e)
        {
            string connStr = "Data Source=.;Initial Catalog=MySchoolMoreData;Integrated Security=True";
            using(SqlConnection conn=new SqlConnection(connStr))
            {
                SqlTransaction tan=null;
                try
                {
                    conn.Open();
                    //1.事务并不是一种操作，而只是对一些操作的相应的处理机制，你让我处理，处理谁？在那里处理？事务是通过连接通道创建的
                    tan= conn.BeginTransaction();//创建事务，并开启事务                
                    string sql = "update bank set cmoney=cmoney-500 where name='aa'";
                    string sql2 = "update bank set cmoney=cmoney+500 where name='bb'";
                    SqlCommand command = new SqlCommand(sql2, conn);
                    //2.让命令对象告诉服务器，接下来的语句使用事务机制进行处理
                    command.Transaction = tan;
                    command.ExecuteNonQuery();
                    MessageBox.Show("ok");
                    //修改命令对象需要执行的命令语句
                    command.CommandText = sql;
                    command.ExecuteNonQuery();
                    MessageBox.Show("ok2");
                    //3.事务提交
                    tan.Commit();
                }
                catch(Exception ex)
                {
                    MessageBox.Show("操作错误，操作会回滚");
                    //4，事务的回滚
                    tan.Rollback();
                }
            }
        }
    }
}
