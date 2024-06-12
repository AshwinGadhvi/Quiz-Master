
Partial Class Login_Master
    Inherits System.Web.UI.Page

    Private Sub Login_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub

    Private Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        If e.CommandName = "del" Then

            SqlDataSource1.DeleteParameters("u_id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            example1.DataBind()
            clear()
        End If
    End Sub

    Private Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound
        If (e.Row.RowType = DataControlCellType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub
    Public Sub clear()
        u_name.Text = ""
        u_pass.Text = ""
        DropDownList1.SelectedValue = "Admin"
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("u_name").DefaultValue = u_name.Text
                SqlDataSource1.InsertParameters("u_pass").DefaultValue = u_pass.Text
                SqlDataSource1.InsertParameters("u_type").DefaultValue = DropDownList1.SelectedValue
                SqlDataSource1.Insert()
                example1.DataBind()

                clear()
            Else
                SqlDataSource1.UpdateParameters("u_name").DefaultValue = u_name.Text
                SqlDataSource1.UpdateParameters("u_pass").DefaultValue = u_pass.Text
                SqlDataSource1.UpdateParameters("u_type").DefaultValue = DropDownList1.SelectedValue
                SqlDataSource1.UpdateParameters("u_id").DefaultValue = uid.Value
                SqlDataSource1.Update()

                example1.DataBind()



                clear()
            End If
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        u_name.Text = example1.Rows(index).Cells(1).Text
        u_pass.Text = example1.Rows(index).Cells(2).Text
        DropDownList1.SelectedValue = example1.Rows(index).Cells(3).Text
        uid.Value = DirectCast(sender, Button).CommandArgument
        Session("Flag") = 1

    End Sub
End Class
