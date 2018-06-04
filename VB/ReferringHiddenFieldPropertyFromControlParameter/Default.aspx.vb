Imports System
Imports System.Web.UI
Imports DevExpress.Web.ASPxGridView

Namespace ReferringHiddenFieldPropertyFromControlParameter
    Partial Public Class _Default
        Inherits Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            If Not IsPostBack AndAlso Not IsCallback Then
                hfData("MaxID") = 5
            End If
        End Sub
        Protected Sub OnGridViewCustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
            If e.Parameters = "Rebind" Then
                DirectCast(sender, ASPxGridView).DataBind()
            End If
        End Sub
    End Class
End Namespace
