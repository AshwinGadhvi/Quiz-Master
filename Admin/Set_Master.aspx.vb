
Partial Class Set_Master
    Inherits System.Web.UI.Page

    Private Sub Set_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub


    Private Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        If e.CommandName = "del" Then

            SqlDataSource1.DeleteParameters("set_id").DefaultValue = e.CommandArgument
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
        s_name.Text = ""
        s_disc.Text = ""

    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("set_name").DefaultValue = s_name.Text
                SqlDataSource1.InsertParameters("set_discription").DefaultValue = s_disc.Text

                SqlDataSource1.Insert()
                example1.DataBind()

                clear()
            Else
                SqlDataSource1.UpdateParameters("set_name").DefaultValue = s_name.Text
                SqlDataSource1.UpdateParameters("set_discription").DefaultValue = s_disc.Text
                SqlDataSource1.UpdateParameters("set_id").DefaultValue = s_id.Value
                SqlDataSource1.Update()

                example1.DataBind()



                clear()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        s_name.Text = example1.Rows(index).Cells(1).Text
        s_disc.Text = example1.Rows(index).Cells(2).Text
        s_id.Value = DirectCast(sender, Button).CommandArgument
        Session("Flag") = 1

    End Sub
End Class
