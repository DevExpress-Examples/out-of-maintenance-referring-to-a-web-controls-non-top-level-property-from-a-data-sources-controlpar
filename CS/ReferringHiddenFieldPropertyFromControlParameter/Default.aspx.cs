using System;
using System.Web.UI;
using DevExpress.Web.ASPxGridView;

namespace ReferringHiddenFieldPropertyFromControlParameter {
    public partial class _Default : Page {
        protected void Page_Load(object sender, EventArgs e) {
            if(!IsPostBack && !IsCallback)
                hfData["MaxID"] = 5;
        }
        protected void OnGridViewCustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
            if(e.Parameters == "Rebind")
                ((ASPxGridView)sender).DataBind();
        }
    }
}
