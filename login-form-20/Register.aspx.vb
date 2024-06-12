
Partial Class login_form_20_Register
    Inherits System.Web.UI.Page

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Dim d As New Dao
            d.modifyData("insert into Employee_Master (emp_name,emp_email,emp_password,emp_department,emp_mobile) values('" & u_name.Text & "','" & email.Text & "','" & u_pass.Text & "','" & dept.Text & "','" & mobile_no.Text & "')")
            u_name.Text = ""
            u_pass.Text = ""
            mobile_no.Text = ""
            dept.Text = ""
            email.Text = ""
            Response.Redirect("Login.aspx")
        Catch ex As Exception

        End Try

    End Sub
End Class
