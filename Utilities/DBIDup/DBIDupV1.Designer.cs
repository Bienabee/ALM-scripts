namespace WindowsFormsApplication1
{
    partial class Form1
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
            this.label1 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.UserFileTextBox = new System.Windows.Forms.TextBox();
            this.GetFile = new System.Windows.Forms.Button();
            this.ReadFilePath = new System.Windows.Forms.Button();
            this.WriteText = new System.Windows.Forms.Label();
            this.textBoxToWrite = new System.Windows.Forms.TextBox();
            this.UpdateText = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(29, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "DBID up v 1.0";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(459, 325);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 1;
            this.button1.Text = "Index Of";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(32, 153);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBox1.Size = new System.Drawing.Size(379, 195);
            this.textBox1.TabIndex = 2;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(459, 296);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 3;
            this.button2.Text = "Read DBID";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(459, 247);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(75, 43);
            this.button3.TabIndex = 4;
            this.button3.Text = "Read Replace";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Location = new System.Drawing.Point(29, 58);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(148, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Select DBID.xml File Directory";
            // 
            // UserFileTextBox
            // 
            this.UserFileTextBox.Location = new System.Drawing.Point(32, 85);
            this.UserFileTextBox.Name = "UserFileTextBox";
            this.UserFileTextBox.Size = new System.Drawing.Size(312, 20);
            this.UserFileTextBox.TabIndex = 6;
            // 
            // GetFile
            // 
            this.GetFile.Location = new System.Drawing.Point(364, 82);
            this.GetFile.Name = "GetFile";
            this.GetFile.Size = new System.Drawing.Size(47, 23);
            this.GetFile.TabIndex = 7;
            this.GetFile.Text = "...";
            this.GetFile.UseVisualStyleBackColor = true;
            this.GetFile.Click += new System.EventHandler(this.GetFile_Click);
            // 
            // ReadFilePath
            // 
            this.ReadFilePath.Location = new System.Drawing.Point(459, 81);
            this.ReadFilePath.Name = "ReadFilePath";
            this.ReadFilePath.Size = new System.Drawing.Size(75, 39);
            this.ReadFilePath.TabIndex = 8;
            this.ReadFilePath.Text = "Read File Path";
            this.ReadFilePath.UseVisualStyleBackColor = true;
            this.ReadFilePath.Click += new System.EventHandler(this.ReadFilePath_Click);
            // 
            // WriteText
            // 
            this.WriteText.AutoSize = true;
            this.WriteText.Location = new System.Drawing.Point(42, 121);
            this.WriteText.Name = "WriteText";
            this.WriteText.Size = new System.Drawing.Size(72, 13);
            this.WriteText.TabIndex = 9;
            this.WriteText.Text = "Text To Write";
            // 
            // textBoxToWrite
            // 
            this.textBoxToWrite.Location = new System.Drawing.Point(146, 121);
            this.textBoxToWrite.Name = "textBoxToWrite";
            this.textBoxToWrite.Size = new System.Drawing.Size(265, 20);
            this.textBoxToWrite.TabIndex = 10;
            // 
            // UpdateText
            // 
            this.UpdateText.Location = new System.Drawing.Point(459, 136);
            this.UpdateText.Name = "UpdateText";
            this.UpdateText.Size = new System.Drawing.Size(75, 23);
            this.UpdateText.TabIndex = 11;
            this.UpdateText.Text = "Update Text";
            this.UpdateText.UseVisualStyleBackColor = true;
            this.UpdateText.Click += new System.EventHandler(this.UpdateText_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(567, 383);
            this.Controls.Add(this.UpdateText);
            this.Controls.Add(this.textBoxToWrite);
            this.Controls.Add(this.WriteText);
            this.Controls.Add(this.ReadFilePath);
            this.Controls.Add(this.GetFile);
            this.Controls.Add(this.UserFileTextBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox UserFileTextBox;

        // Used http://www.youtube.com/watch?v=q9TRNbWv99M for below interactions
        private System.Windows.Forms.Button GetFile;
        private System.Windows.Forms.Button ReadFilePath;
        private System.Windows.Forms.Label WriteText;
        private System.Windows.Forms.TextBox textBoxToWrite;
        private System.Windows.Forms.Button UpdateText;
    }
}

