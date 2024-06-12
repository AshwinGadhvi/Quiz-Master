Imports System.Data.SqlClient

Partial Class Admin_result_master
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindResults()
        End If
    End Sub

    Private Sub BindResults()
        GridView1.DataSourceID = "SqlDataSource1"
        GridView1.DataBind()
    End Sub
End Class
