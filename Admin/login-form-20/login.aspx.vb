
Partial Class login_form_20_login
    Inherits System.Web.UI.Page

    Private Sub signin_Click(sender As Object, e As EventArgs) Handles signin.Click
        Dim d As New Dao
        Dim ds As New Data.DataSet
        ds = d.getData("select u_name,u_pass from Login_Master where u_name='" & u_name.Text & "' and u_pass='" & u_pass.Text & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            Response.Redirect("../Default.aspx")
        Else
            MsgBox("Enter Valid userName And Password")
        End If
    End Sub
End Class
