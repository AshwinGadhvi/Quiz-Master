
Partial Class _Default
    Inherits System.Web.UI.Page

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Private Sub Repeater1_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater1.ItemCommand
        If e.CommandArgument <> "" Then
            Session("s_id") = e.CommandArgument
            Response.Redirect("examination.aspx")
        End If
    End Sub
End Class
