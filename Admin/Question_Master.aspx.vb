
Partial Class Question_Master
    Inherits System.Web.UI.Page

    Private Sub Question_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub
    Public Sub clear()
        question.Text = ""
        mcq1.Text = ""
        mcq2.Text = ""
        mcq3.Text = ""
        mcq4.Text = ""
        answer.Text = ""
        DropDownList1.Text = ""
        DropDownList2.Text = ""
    End Sub
    Private Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        If e.CommandName = "del" Then

            SqlDataSource1.DeleteParameters("q_id").DefaultValue = e.CommandArgument
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
    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("set_id").DefaultValue = DropDownList2.SelectedValue
                SqlDataSource1.InsertParameters("exam_id").DefaultValue = DropDownList1.SelectedValue
                SqlDataSource1.InsertParameters("question").DefaultValue = question.Text
                SqlDataSource1.InsertParameters("a").DefaultValue = mcq1.Text
                SqlDataSource1.InsertParameters("b").DefaultValue = mcq2.Text
                SqlDataSource1.InsertParameters("c").DefaultValue = mcq3.Text
                SqlDataSource1.InsertParameters("d").DefaultValue = mcq4.Text
                SqlDataSource1.InsertParameters("answer").DefaultValue = answer.Text
                SqlDataSource1.Insert()
                example1.DataBind()
                clear()
            Else
                SqlDataSource1.UpdateParameters("set_id").DefaultValue = DropDownList2.SelectedValue
                SqlDataSource1.UpdateParameters("exam_id").DefaultValue = DropDownList1.SelectedValue
                SqlDataSource1.UpdateParameters("question").DefaultValue = question.Text
                SqlDataSource1.UpdateParameters("a").DefaultValue = mcq1.Text
                SqlDataSource1.UpdateParameters("b").DefaultValue = mcq2.Text
                SqlDataSource1.UpdateParameters("c").DefaultValue = mcq3.Text
                SqlDataSource1.UpdateParameters("d").DefaultValue = mcq4.Text
                SqlDataSource1.UpdateParameters("answer").DefaultValue = answer.Text
                SqlDataSource1.UpdateParameters("q_id").DefaultValue = q_id.Value
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
        DropDownList2.SelectedValue = example1.Rows(index).Cells(1).Text
        question.Text = example1.Rows(index).Cells(2).Text
        mcq1.Text = example1.Rows(index).Cells(3).Text
        mcq2.Text = example1.Rows(index).Cells(4).Text
        mcq3.Text = example1.Rows(index).Cells(5).Text
        mcq4.Text = example1.Rows(index).Cells(6).Text
        answer.Text = example1.Rows(index).Cells(7).Text
        DropDownList1.SelectedValue = example1.Rows(index).Cells(8).Text
    End Sub
End Class
