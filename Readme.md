<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/ReferringHiddenFieldPropertyFromControlParameter/Default.aspx) (VB: [Default.aspx](./VB/ReferringHiddenFieldPropertyFromControlParameter/Default.aspx))
* [Default.aspx.cs](./CS/ReferringHiddenFieldPropertyFromControlParameter/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/ReferringHiddenFieldPropertyFromControlParameter/Default.aspx.vb))
<!-- default file list end -->
# Referring to a web control's non-top-level property from a data source's ControlParameter – illustrated with the ASPxHiddenField


<p>There may be a scenario where a value of a data source parameter should be retrieved from the ASPxHiddenField (or any web control in general). For this, the .NET Framework provides a <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.controlparameter.aspx">ControlParameter class</a> that can refer to a control's property via its ControlID and PropertyName properties:</p>

```ASPX
<newline/>
<asp:AccessDataSource ...><newline/>
    <SelectParameters><newline/>
        <ControlParameter ControlID="..." PropertyName="..." ... /><newline/>
    </SelectParameters><newline/>
</asp:AccessDataSource><newline/>

```

<p>The meaning of the ControlID property is obvious – it's an ID of the control whose property you are referring to. The PropertyName property is more complex. It can represent a name of some property exposed by the referent control. But, if the control's property is not a top-level property of the target control, you can refer to it using the same syntax as for the "expression" parameter of the System.Web.UI.DataBinder's <a href="http://msdn.microsoft.com/en-us/library/4hx47hfe.aspx">Eval method</a>. For example:</p>

```ASPX
<newline/>
C#: <ControlParameter PropertyName="Tables[0].DefaultView.[0].Price" ...><newline/>
VB: <ControlParameter PropertyName="Tables(0).DefaultView.(0).Price" ...><newline/>

```

<p>This example demonstrates how to use this complex syntax for referring to ASPxHiddenField properties.</p>

<br/>


