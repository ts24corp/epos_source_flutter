using Newtonsoft.Json.Linq;
using RestSharp;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using Newtonsoft.Json;

namespace CheckAPIOdoo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        public string strjSon = "";
        private string strToken = string.Empty;

        private void Form1_Load(object sender, EventArgs e)
        {

            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            //var client = new RestClient("https://demo12.mukit.at/api/authentication/oauth2/token");
            //var request = new RestRequest(Method.POST);
            //request.AddHeader("cache-control", "no-cache");
            //request.AddHeader("content-type", "application/x-www-form-urlencoded");
            //request.AddParameter("application/x-www-form-urlencoded", "grant_type=client_credentials&client_id=BackendApplicationFlowDemoClientKey&client_secret=BackendApplicationFlowDemoClientKey", ParameterType.RequestBody);
            //IRestResponse response = client.Execute(request);

            String id = "OXBNFh9a2yj4YBRgSXjI1W4OTO8mrN";
            String secret = "smM4lVzzsnnvHrobQnr1oRUTDl02Ka";

            var client = new RestClient("http://sales24.odoo24.vn/api/authentication/oauth2/token");
            var request = new RestRequest(Method.POST);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/x-www-form-urlencoded");
            request.AddParameter("application/x-www-form-urlencoded", "grant_type=client_credentials&scope=all&client_id=" + id + "&client_secret=" + secret, ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);

            dynamic resp = JObject.Parse(response.Content);
            strToken = resp.access_token;

            client = new RestClient("http://sales24.odoo24.vn/api/authentication/oauth2/authorize");
            request = new RestRequest(Method.GET);
            request.AddHeader("authorization", "Bearer " + strToken);
            request.AddHeader("cache-control", "no-cache");
            response = client.Execute(request);
            lbstatus.Text = response.StatusCode.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //var obj = new Info();
            //obj.name = txtName.Text;
            //obj.phone = txtPhone.Text;
            //obj.company_name = txtCompany.Text;
            //obj.email = txtEmail.Text;
            //obj.street = txtStreet.Text;
            //string json = JsonConvert.SerializeObject(obj, Formatting.Indented);

            //var client = new RestClient("http://sales24.odoo24.vn/api/create");
            //var request = new RestRequest(Method.POST);
            //request.AddHeader("authorization", "Bearer " + strToken);
            //request.AddHeader("cache-control", "no-cache");
            //request.AddHeader("content-type", "application/x-www-form-urlencoded");
            //request.AddParameter("model", txtModel.Text.Trim());
            //request.AddParameter("values", json);
            //IRestResponse response = client.Execute(request);
            //lbstatus.Text = response.StatusCode + " / " + response.Content.Replace("\n", "");

            if (CheckCompany(txtCompany.Text).Replace("[", "").Replace("]", "") == string.Empty)
                InsertData();
            else
                UpdateData(CheckCompany(txtCompany.Text).Replace("[", "").Replace("]", ""));
        }
        private string CheckCompany(string strCompany)
        {
            var obj = new Info();
            //obj.company_name = strCompany;
            //string json = JsonConvert.SerializeObject(obj, Formatting.Indented);
            string json = "[[\"name\", \"=\", " + "\"" + txtName.Text + "\"" + "]]"; //txtName.Text;

            var client = new RestClient("http://sales24.odoo24.vn/api/search");
            var request = new RestRequest(Method.GET);
            request.AddHeader("authorization", "Bearer " + strToken);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/x-www-form-urlencoded");
            request.AddParameter("model", txtModel.Text.Trim());
            request.AddParameter("domain", json);
            IRestResponse response = client.Execute(request);
            string KQ = response.Content.Replace("\n", "").Replace(" ", "").Trim();
            lbstatus.Text = response.StatusCode + " / " + KQ;
            return KQ;
        }
        private void ReadData()
        {

            //string json = JsonConvert.SerializeObject(obj, Formatting.Indented);
            string strContact = "[[\"name\", \"=\", " + "\"" + txtDomain.Text + "\"" + "]]"; //txtDomain.Text;
            string strFields = "["+ txtField.Text + "]";

            var client = new RestClient("http://sales24.odoo24.vn/api/search_read");
            var request = new RestRequest(Method.GET);
            request.AddHeader("authorization", "Bearer " + strToken);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/x-www-form-urlencoded");
            request.AddParameter("model", txtModel.Text.Trim());
            request.AddParameter("domain", strContact);
            request.AddParameter("fields", strFields);

            IRestResponse response = client.Execute(request);
            lbstatus.Text = response.StatusCode + " / " + response.Content.Replace("\n", "").Replace(" ", "");
            Newtonsoft.Json.Linq.JArray Result = JsonConvert.DeserializeObject(response.Content) as Newtonsoft.Json.Linq.JArray;
            
        }
        
        private void InsertData()
        {
            var obj = new Info();
            obj.name = txtName.Text;
            obj.phone = txtPhone.Text;
            obj.parent_id = txtIDCongTy.Text;
            obj.email = txtEmail.Text;
            obj.street = txtStreet.Text;
            if (chkCompany.Checked)
                obj.is_company = "true";
            else
                obj.is_company = "false";
            string json = JsonConvert.SerializeObject(obj, Formatting.Indented);

            var client = new RestClient("http://sales24.odoo24.vn/api/create");
            var request = new RestRequest(Method.POST);
            request.AddHeader("authorization", "Bearer " + strToken);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/x-www-form-urlencoded");
            request.AddParameter("model", txtModel.Text.Trim());
            request.AddParameter("values", json);
            IRestResponse response = client.Execute(request);
            lbstatus.Text = response.StatusCode + " / " + response.Content.Replace("\n", "");
        }

        private void UpdateData(string strId)
        {
            var obj = new Info();
            obj.name =  txtName.Text;
            obj.phone = txtPhone.Text;
            obj.company_name = txtCompany.Text;
            obj.email = txtEmail.Text;
            obj.street = txtStreet.Text;
            if (chkCompany.Checked)
                obj.is_company = "true";
            else
            {
                obj.is_company = "false";
                
                obj.commercial_company_name = txtCompany.Text;
                obj.commercial_partner_id = txtIDCongTy.Text;
                obj.company_name = "";
                obj.parent_id = txtIDCongTy.Text;
            }
                
            string json = JsonConvert.SerializeObject(obj, Formatting.Indented);

            var client = new RestClient("http://sales24.odoo24.vn/api/write");
            var request = new RestRequest(Method.PUT);
            request.AddHeader("authorization", "Bearer " + strToken);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/x-www-form-urlencoded");
            request.AddParameter("model", txtModel.Text.Trim());
            request.AddParameter("ids", strId);
            request.AddParameter("values", json);

            IRestResponse response = client.Execute(request);
            lbstatus.Text = response.StatusCode + " / " + response.Content.Replace("\n", "");
        }

        private void btnCheck_Click(object sender, EventArgs e)
        {
            CheckCompany(txtCompany.Text);
        }

        private void btnRead_Click(object sender, EventArgs e)
        {
            ReadData();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (CheckCompany(txtCompany.Text).Replace("[", "").Replace("]", "") == string.Empty)
                InsertData();
            else
                UpdateData(txtID.Text);
        }
    }

    public class Info
    {
        public string name;
        public string phone;
        public string company_name;
        public string street;
        public string email;
        public string is_company;
        public string ids;
        public string commercial_partner_id;
        public string commercial_company_name;
        public string parent_id;
    }
}