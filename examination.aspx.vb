
Partial Class examination
    Inherits System.Web.UI.Page

    Private Sub examination_Load(sender As Object, e As EventArgs) Handles Me.Load
        lt.Text = Session("s_id")
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        If Session("u_name") <> "" Then
            Response.Redirect("exam_start.aspx")
        Else
            Response.Redirect("login-form-20/Login.aspx")
        End If
    End Sub
End Class
