using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {


            String file_name = "\\Users\\Admin\\Desktop\\DBIDup\\dbid.xml";

           

            int result = file_name.IndexOf("dbid");

            MessageBox.Show("You found the dbid " + result.ToString());


            // working from here///////////////////////
            // http://msdn.microsoft.com/en-us/library/c6cfw35a(v=vs.110).aspx
            //////////////////////////////
            string sourceDir = @"C:\Users\Admin\Desktop\DBIDup\";
            //string[] dbidList = Directory.GetFiles(sourceDir, "*.xml");


            string fName = "dbid-backup.xml";
                


       
        }

        private void button2_Click(object sender, EventArgs e)
        {

            String file_name = "\\Users\\Admin\\Desktop\\DBIDup\\dbid.xml";

               System.IO.StreamReader objReader;
                objReader = new System.IO.StreamReader(file_name);

            //String file_contents = objReader.ReadToEnd();

                textBox1.Text = objReader.ReadToEnd();
                objReader.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            

            // Used to find the end of the XML parameters 
            char[] startChar = { '<' };

            string findConStr = "<DB_CONNSTR_FORMAT>";
            string closeConStr = ("</" + findConStr.TrimStart(startChar));
            int conLen = (findConStr.Length);
            MessageBox.Show(conLen.ToString());

            string findDB = "<DBSERVER_NAME>";
            string findDir = "<PHYSICAL_DIRECTORY>";
            string findPW = "<DB_USER_PASS>";
            
            string dbidFile = "\\Users\\Admin\\Desktop\\DBIDup\\dbid.xml";
            
            string text = File.ReadAllText(dbidFile);

            MessageBox.Show(text);

            int startConStr = text.IndexOf(findConStr)+(conLen);
            int endConStr = text.IndexOf(closeConStr);

            MessageBox.Show(startConStr.ToString());
            MessageBox.Show(endConStr.ToString());

            int oConStrLen = (endConStr - startConStr);

            string oConStr = text.Substring(startConStr, oConStrLen);

            MessageBox.Show(oConStr);


        }

        private void GetFile_Click(object sender, EventArgs e)
        {
            OpenFileDialog of = new OpenFileDialog();
            of.ShowDialog();
            UserFileTextBox.Text = of.FileName;
        }

        private void ReadFilePath_Click(object sender, EventArgs e)
        {
            StreamReader sr = new StreamReader(UserFileTextBox.Text);
            textBox1.Text = sr.ReadToEnd();
            sr.Close();
        }

        private void UpdateText_Click(object sender, EventArgs e)
        {
            StreamWriter sw = new StreamWriter(UserFileTextBox.Text, true);
            sw.WriteLine(textBoxToWrite.Text);
            sw.Close();
        }
    }
}
