
Partial Class login_form_20_login
    Inherits System.Web.UI.Page

    Private Sub signin_Click(sender As Object, e As EventArgs) Handles signin.Click
        Dim d As New Dao
        Dim ds As New Data.DataSet
        ds = d.getData("select e_id,emp_name,emp_email,emp_password from Employee_Master where emp_email='" & u_name.Text & "' and emp_password='" & u_pass.Text & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            Session("client_username") = ds.Tables(0).Rows(0).Item("e_id")
            Session("u_name") = ds.Tables(0).Rows(0).Item("emp_name")
            Response.Redirect("../exam_start.aspx")
        Else
            MsgBox("Enter Valid userName And Password")
        End If
    End Sub
End Class
