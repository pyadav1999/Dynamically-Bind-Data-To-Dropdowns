using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImportCSV(object sender, EventArgs e)
        {
            //Upload and save the file  
            string csvPath =Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
           FileUpload1.SaveAs(csvPath);
            string name = FileUpload1.PostedFile.FileName;
            fileName.Text = name;

            //Create a DataTable.  
            DataTable dt = new DataTable();
            

            //Read the contents of CSV file.  
            string csvData = File.ReadAllText(csvPath);
            int j = 0;
            //Execute a loop over the rows.  
            foreach (string row in csvData.Split('\n'))
            {
                if (!string.IsNullOrEmpty(row))
                {
                    ListItem list = new ListItem();
                    
                    int i = 0;
                    if (j == 0)
                    {
                        ddlFirstName.Items.Clear();
                        ddlLastName.Items.Clear();
                        ddlEmailAddress.Items.Clear();
                        ddlMemberID.Items.Clear();
                        ddlMemberStatus.Items.Clear();
                        ddlUnionName.Items.Clear();

                        ddlFirstName.Items.Add("");
                        ddlLastName.Items.Add("");
                        ddlEmailAddress.Items.Add("");
                        ddlMemberID.Items.Add("");
                        ddlMemberStatus.Items.Add("");
                        ddlUnionName.Items.Add("");
                        int k = 0;
                        foreach (string cell in row.Split(','))
                        {
                            list = new ListItem();

                            if (!string.IsNullOrEmpty(cell))
                            {
                                string cello = cell.Replace("\r", "");
                                if (!string.IsNullOrEmpty(cello))
                                {
                                    list.Text = cello;
                                    list.Value=Convert.ToString(k) ; 
                                    ddlFirstName.Items.Add(list);
                                    ddlLastName.Items.Add(list);
                                    ddlEmailAddress.Items.Add(list);
                                    ddlMemberID.Items.Add(list);
                                    ddlMemberStatus.Items.Add(list);
                                    ddlUnionName.Items.Add(list);

                                    dt.Columns.Add(cello);
                                    k++;
                                }
                            }

                        }
                    }
                    else
                    {
                        dt.Rows.Add();
                     
                        //Execute a loop over the columns.  
                        foreach (string cell in row.Split(','))
                        {
                            dt.Rows[dt.Rows.Count - 1][i] = cell;


                            i++;
                        }
                    }
                    j++;
                }
            }

            //Bind the DataTable.  
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void ExportGridToCSV()
        {

            //Response.Clear();
            //Response.Buffer = true;
            //Response.AddHeader("content-disposition", "attachment;filename=Employee.csv");
            //Response.Charset = "";
            //Response.ContentType = "application/text";

            //StringBuilder columnbind = new StringBuilder();

            //if (!string.IsNullOrEmpty(ddlFirstName.SelectedValue))
            //    columnbind.Append("First Name" + ',');

            //if (!string.IsNullOrEmpty(ddlLastName.SelectedValue))
            //    columnbind.Append("Last Name" + ',');

            //if (!string.IsNullOrEmpty(ddlEmailAddress.SelectedValue))
            //    columnbind.Append("Email Address" + ',');

            //if (!string.IsNullOrEmpty(ddlMemberID.SelectedValue))
            //    columnbind.Append("Member ID" + ',');

            //if (!string.IsNullOrEmpty(ddlMemberStatus.SelectedValue))
            //    columnbind.Append("Member Status" + ',');

            //if (!string.IsNullOrEmpty(ddlUnionName.SelectedValue))
            //{
            //    columnbind.Append("UnionName" + ',');
            //}

            //columnbind.Append("\r\n");

            //for (int i = 0; i <GridView1.Rows.Count; i++)
            //{
            //    for (int k = 0; k <GridView1.Rows[i].Cells.Count; k++)
            //    {

            //        //if (!string.IsNullOrEmpty(ddlFirstName.SelectedValue))
            //        //{
            //        //    columnbind.Append(GridView1.Rows[i].Cells[k].Text + ',');
            //        //}

            //        //if (!string.IsNullOrEmpty(ddlLastName.SelectedValue))
            //        //{
            //        //    columnbind.Append(GridView1.Rows[i].Cells[k].Text + ',');
            //        //}    

            //        //if (!string.IsNullOrEmpty(ddlEmailAddress.SelectedValue))
            //        //{
            //        //    columnbind.Append(GridView1.Rows[i].Cells[k].Text + ',');
            //        //}

            //        //if (!string.IsNullOrEmpty(ddlMemberID.SelectedValue))
            //        //{
            //        //    columnbind.Append(GridView1.Rows[i].Cells[k].Text + ',');
            //        //}
            //        //if (!string.IsNullOrEmpty(ddlMemberStatus.SelectedValue))
            //        //{
            //        //    columnbind.Append(GridView1.Rows[i].Cells[k].Text + ',');
            //        //}

            //        //if (!string.IsNullOrEmpty(ddlUnionName.SelectedValue))
            //        //{
            //        //    columnbind.Append(GridView1.Rows[i].Cells[k].Text + ',');
            //        //}
            //        columnbind.Append(GridView1.Rows[i].Cells[k].Text + ',');
            //        columnbind.Append("\r\n");
            //    }



            //}

            //Response.Output.Write(columnbind.ToString());
            //Response.Flush();
            //Response.End();
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=US_Member_Data.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";

            StringBuilder columnbind = new StringBuilder();
            //for (int k = 0; k < GridView1.Columns.Count; k++)
            //{

            //    columnbind.Append(GridView1.Columns[k].HeaderText + ',');
            //}
            if (!string.IsNullOrEmpty(ddlFirstName.SelectedValue))
                columnbind.Append("First Name" + ',');

            if (!string.IsNullOrEmpty(ddlLastName.SelectedValue))
                columnbind.Append("Last Name" + ',');

            if (!string.IsNullOrEmpty(ddlEmailAddress.SelectedValue))
                columnbind.Append("Email Address" + ',');

            if (!string.IsNullOrEmpty(ddlMemberID.SelectedValue))
                columnbind.Append("Member ID" + ',');

            if (!string.IsNullOrEmpty(ddlMemberStatus.SelectedValue))
                columnbind.Append("Member Status" + ',');

            if (!string.IsNullOrEmpty(ddlUnionName.SelectedValue))
            {
                columnbind.Append("Union Name" + ',');

                columnbind.Append("Unique ID" + ',');
            }

            columnbind.Append("\r\n");

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                string EmailAddressText = "";
                if (!string.IsNullOrEmpty(ddlEmailAddress.SelectedValue))
                {
                    int IdIndex = Convert.ToInt32(ddlEmailAddress.SelectedValue);
                    EmailAddressText = GridView1.Rows[i].Cells[IdIndex].Text;
                    if (EmailAddressText == "&nbsp;")
                    {
                        EmailAddressText = "";
                    }
                    if (!string.IsNullOrEmpty(EmailAddressText))
                        EmailAddressText = EmailAddressText.Replace("\r", "").Trim();

                    if (!string.IsNullOrEmpty(EmailAddressText))
                    {
                        columnbind.Append(EmailAddressText + ',');
                    }

                }
                if (!string.IsNullOrEmpty(EmailAddressText))
                {
                    if (!string.IsNullOrEmpty(ddlFirstName.SelectedValue))
                    {
                        int IdIndex = Convert.ToInt32(ddlFirstName.SelectedValue);
                        string text = GridView1.Rows[i].Cells[IdIndex].Text;
                        if (text == "&nbsp;")
                        {
                            text = "";
                        }
                        if (!string.IsNullOrEmpty(text))
                            text = text.Replace("\r", "").Trim();

                        columnbind.Append(text + ',');
                    }
                    string LastNameText = "";
                    if (!string.IsNullOrEmpty(ddlLastName.SelectedValue))
                    {
                        int IdIndex = Convert.ToInt32(ddlLastName.SelectedValue);
                        LastNameText = GridView1.Rows[i].Cells[IdIndex].Text;
                        if (LastNameText == "&nbsp;")
                        {
                            LastNameText = "";
                        }
                        if (!string.IsNullOrEmpty(LastNameText))
                            LastNameText = LastNameText.Replace("\r", "").Trim();

                        columnbind.Append(LastNameText + ',');
                    }

                    if (!string.IsNullOrEmpty(ddlMemberID.SelectedValue))
                    {
                        int IdIndex = Convert.ToInt32(ddlMemberID.SelectedValue);
                        string text = GridView1.Rows[i].Cells[IdIndex].Text;
                        if (text == "&nbsp;")
                        {
                            text = "";
                        }
                        if (!string.IsNullOrEmpty(text))
                            text = text.Replace("\r", "").Trim();

                        columnbind.Append(text + ',');
                    }
                    if (!string.IsNullOrEmpty(ddlMemberStatus.SelectedValue))
                    {
                        int IdIndex = Convert.ToInt32(ddlMemberStatus.SelectedValue);
                        string text = GridView1.Rows[i].Cells[IdIndex].Text;
                        if (text == "&nbsp;")
                        {
                            text = "";
                        }
                        if (!string.IsNullOrEmpty(text))
                            text = text.Replace("\r", "").Trim();

                        columnbind.Append(text + ',');

                    }
                    if (!string.IsNullOrEmpty(ddlUnionName.SelectedValue))
                    {
                        int IdIndex = Convert.ToInt32(ddlUnionName.SelectedValue);
                        string text = GridView1.Rows[i].Cells[IdIndex].Text;
                        if (text == "&nbsp;")
                        {
                            text = "";
                        }
                        if (!string.IsNullOrEmpty(text))
                            text = text.Replace("\r", "").Trim();

                        columnbind.Append(text + ',');

                        string UnionID = LastNameText + "~" + EmailAddressText + "~" + text;

                        columnbind.Append(UnionID + ',');
                    }

                    columnbind.Append("Union Shopper" + ',');
                    columnbind.Append("\r\n");


                }

               


            }
            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }


    protected void btnDownload_Click(object sender, EventArgs e)
        {
        ExportGridToCSV();
        }
    }
}