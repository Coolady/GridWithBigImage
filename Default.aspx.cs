using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridWithBigImage
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            BindDataSource();

        }

        void BindDataSource()
        {
            var list = new List<Gallery>();
            list.Add(new Gallery() { Oid = 1, Name = "1", ImgPath = "images/1.jpg", ImgBigPath = "images/1_large.jpg" });
            list.Add(new Gallery() { Oid = 2, Name = "2", ImgPath = "images/2.jpg", ImgBigPath = "images/2_large.jpg" });
            list.Add(new Gallery() { Oid = 3, Name = "3", ImgPath = "images/3.jpg", ImgBigPath = "images/3_large.jpg" });
            list.Add(new Gallery() { Oid = 4, Name = "4", ImgPath = "images/4.jpg", ImgBigPath = "images/4_large.jpg" });

            grid.DataSource = list;
            grid.DataBind();
        }
    
    }

    public class Gallery
    {
        public int Oid { get; set; }

        public string Name { get; set; }

        public string ImgPath { get; set; }

        public string ImgBigPath { get; set; }
    }
}