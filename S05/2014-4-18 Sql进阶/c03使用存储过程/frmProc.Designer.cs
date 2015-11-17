namespace c03使用存储过程
{
    partial class frmProc
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnNoPARA = new System.Windows.Forms.Button();
            this.dgvList = new System.Windows.Forms.DataGridView();
            this.btnHasPara1 = new System.Windows.Forms.Button();
            this.btnOutput = new System.Windows.Forms.Button();
            this.rdoMale = new System.Windows.Forms.RadioButton();
            this.rdoFemle = new System.Windows.Forms.RadioButton();
            ((System.ComponentModel.ISupportInitialize)(this.dgvList)).BeginInit();
            this.SuspendLayout();
            // 
            // btnNoPARA
            // 
            this.btnNoPARA.Location = new System.Drawing.Point(12, 12);
            this.btnNoPARA.Name = "btnNoPARA";
            this.btnNoPARA.Size = new System.Drawing.Size(224, 23);
            this.btnNoPARA.TabIndex = 0;
            this.btnNoPARA.Text = "执行没有参数的返回结果集的存储过程";
            this.btnNoPARA.UseVisualStyleBackColor = true;
            this.btnNoPARA.Click += new System.EventHandler(this.btnNoPARA_Click);
            // 
            // dgvList
            // 
            this.dgvList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvList.Location = new System.Drawing.Point(265, 35);
            this.dgvList.Name = "dgvList";
            this.dgvList.RowTemplate.Height = 23;
            this.dgvList.Size = new System.Drawing.Size(627, 445);
            this.dgvList.TabIndex = 1;
            // 
            // btnHasPara1
            // 
            this.btnHasPara1.Location = new System.Drawing.Point(12, 54);
            this.btnHasPara1.Name = "btnHasPara1";
            this.btnHasPara1.Size = new System.Drawing.Size(223, 23);
            this.btnHasPara1.TabIndex = 2;
            this.btnHasPara1.Text = "执行有输入参数的存储过程";
            this.btnHasPara1.UseVisualStyleBackColor = true;
            this.btnHasPara1.Click += new System.EventHandler(this.btnHasPara1_Click);
            // 
            // btnOutput
            // 
            this.btnOutput.Location = new System.Drawing.Point(13, 134);
            this.btnOutput.Name = "btnOutput";
            this.btnOutput.Size = new System.Drawing.Size(222, 23);
            this.btnOutput.TabIndex = 3;
            this.btnOutput.Text = "执行的输出参数的存储过程";
            this.btnOutput.UseVisualStyleBackColor = true;
            this.btnOutput.Click += new System.EventHandler(this.btnOutput_Click);
            // 
            // rdoMale
            // 
            this.rdoMale.AutoSize = true;
            this.rdoMale.Checked = true;
            this.rdoMale.Location = new System.Drawing.Point(28, 100);
            this.rdoMale.Name = "rdoMale";
            this.rdoMale.Size = new System.Drawing.Size(35, 16);
            this.rdoMale.TabIndex = 4;
            this.rdoMale.TabStop = true;
            this.rdoMale.Text = "男";
            this.rdoMale.UseVisualStyleBackColor = true;
            // 
            // rdoFemle
            // 
            this.rdoFemle.AutoSize = true;
            this.rdoFemle.Location = new System.Drawing.Point(89, 100);
            this.rdoFemle.Name = "rdoFemle";
            this.rdoFemle.Size = new System.Drawing.Size(35, 16);
            this.rdoFemle.TabIndex = 4;
            this.rdoFemle.Text = "女";
            this.rdoFemle.UseVisualStyleBackColor = true;
            // 
            // frmProc
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(895, 507);
            this.Controls.Add(this.rdoFemle);
            this.Controls.Add(this.rdoMale);
            this.Controls.Add(this.btnOutput);
            this.Controls.Add(this.btnHasPara1);
            this.Controls.Add(this.dgvList);
            this.Controls.Add(this.btnNoPARA);
            this.Name = "frmProc";
            this.Text = "frmProc";
            ((System.ComponentModel.ISupportInitialize)(this.dgvList)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnNoPARA;
        private System.Windows.Forms.DataGridView dgvList;
        private System.Windows.Forms.Button btnHasPara1;
        private System.Windows.Forms.Button btnOutput;
        private System.Windows.Forms.RadioButton rdoMale;
        private System.Windows.Forms.RadioButton rdoFemle;
    }
}