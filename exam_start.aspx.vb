Imports System.Data.SqlClient
Partial Class Admin_exam_start
    Inherits System.Web.UI.Page

    Private Sub Admin_exam_start_Load(sender As Object, e As EventArgs) Handles Me.Load
        name.Text = Session("client_username")
    End Sub
    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Dim employeeId As Integer = Session("client_username")
        Dim employeeName As String = Session("u_name") ' Get this from session or another source
        Dim examId As Integer = Session("s_id")

        Dim answers As New List(Of Tuple(Of Integer, String))()
        Dim correctAnswersCount As Integer = 0

        ' Iterate through the repeater items
        For Each item As RepeaterItem In Repeater1.Items
            Dim questionId As Integer = Convert.ToInt32(CType(item.FindControl("q_id"), HiddenField).Value)
            Dim selectedAnswer As String = String.Empty

            Dim radioButton1 As RadioButton = CType(item.FindControl("RadioButton1"), RadioButton)
            Dim radioButton2 As RadioButton = CType(item.FindControl("RadioButton2"), RadioButton)
            Dim radioButton3 As RadioButton = CType(item.FindControl("RadioButton3"), RadioButton)
            Dim radioButton4 As RadioButton = CType(item.FindControl("RadioButton4"), RadioButton)

            If radioButton1.Checked Then
                selectedAnswer = "a"
            ElseIf radioButton2.Checked Then
                selectedAnswer = "b"
            ElseIf radioButton3.Checked Then
                selectedAnswer = "c"
            ElseIf radioButton4.Checked Then
                selectedAnswer = "d"
            End If

            ' Add the question ID and selected answer to the list
            answers.Add(Tuple.Create(questionId, selectedAnswer))
        Next

        ' Insert the answers into the database and calculate the score
        Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("Quiz_ManageConnectionString").ConnectionString
        Using connection As New SqlConnection(connectionString)
            connection.Open()

            For Each answer In answers
                ' Insert each answer into EmployeeAnswers table
                Dim insertAnswerQuery As String = "INSERT INTO employee_answer (e_id, set_ID, q_id, answer) VALUES (@EmployeeID, @ExamID, @QuestionID, @SelectedAnswer)"
                Using insertCommand As New SqlCommand(insertAnswerQuery, connection)
                    insertCommand.Parameters.AddWithValue("@EmployeeID", employeeId)
                    insertCommand.Parameters.AddWithValue("@ExamID", examId)
                    insertCommand.Parameters.AddWithValue("@QuestionID", answer.Item1)
                    insertCommand.Parameters.AddWithValue("@SelectedAnswer", answer.Item2)
                    insertCommand.ExecuteNonQuery()
                End Using

                ' Check if the answer is correct
                Dim checkAnswerQuery As String = "SELECT answer FROM question_master WHERE q_id = @QuestionID"
                Using checkCommand As New SqlCommand(checkAnswerQuery, connection)
                    checkCommand.Parameters.AddWithValue("@QuestionID", answer.Item1)
                    Dim correctAnswer As String = checkCommand.ExecuteScalar().ToString()

                    ' Debugging output to check the correct answer
                    'Response.Write("Question ID: " & answer.Item1 & " | Selected Answer: " & answer.Item2 & " | Correct Answer: " & correctAnswer & "<br>")

                    If answer.Item2 = correctAnswer Then
                        correctAnswersCount += 1
                    End If
                End Using
            Next

            '' Debugging output to check the score
            'Response.Write("Total Correct Answers: " & correctAnswersCount & "<br>")

            ' Calculate the score
            Dim score As Integer = correctAnswersCount

            ' Insert the result into result_master table
            Dim insertResultQuery As String = "INSERT INTO result_master (e_id, emp_name, score) VALUES (@EmployeeID, @EmployeeName, @Score)"
            Using insertResultCommand As New SqlCommand(insertResultQuery, connection)
                insertResultCommand.Parameters.AddWithValue("@EmployeeID", employeeId)
                insertResultCommand.Parameters.AddWithValue("@EmployeeName", employeeName)
                insertResultCommand.Parameters.AddWithValue("@Score", score)
                insertResultCommand.ExecuteNonQuery()
            End Using
        End Using
        MsgBox("Exam Over")
        Response.Redirect("Default.aspx")
        ' Redirect or show a message after submission
        ' Response.Redirect("ResultPage.aspx")  ' Redirect to a result page or display a message
    End Sub

    'Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
    '    Dim employeeId As Integer = Session("client_username")
    '    Dim employeeName As String = Session("u_name") ' Get this from session or another source
    '    Dim examId As Integer = Session("s_id")

    '    Dim answers As New List(Of Tuple(Of Integer, String))()
    '    Dim correctAnswersCount As Integer = 0

    '    ' Iterate through the repeater items
    '    For Each item As RepeaterItem In Repeater1.Items
    '        Dim questionId As Integer = Convert.ToInt32(CType(item.FindControl("q_id"), HiddenField).Value)
    '        Dim selectedAnswer As String = String.Empty

    '        Dim radioButton1 As RadioButton = CType(item.FindControl("RadioButton1"), RadioButton)
    '        Dim radioButton2 As RadioButton = CType(item.FindControl("RadioButton2"), RadioButton)
    '        Dim radioButton3 As RadioButton = CType(item.FindControl("RadioButton3"), RadioButton)
    '        Dim radioButton4 As RadioButton = CType(item.FindControl("RadioButton4"), RadioButton)

    '        If radioButton1.Checked Then
    '            selectedAnswer = "A"
    '        ElseIf radioButton2.Checked Then
    '            selectedAnswer = "B"
    '        ElseIf radioButton3.Checked Then
    '            selectedAnswer = "C"
    '        ElseIf radioButton4.Checked Then
    '            selectedAnswer = "D"
    '        End If

    '        ' Add the question ID and selected answer to the list
    '        answers.Add(Tuple.Create(questionId, selectedAnswer))
    '    Next

    '    ' Insert the answers into the database and calculate the score
    '    Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("Quiz_ManageConnectionString").ConnectionString
    '    Using connection As New SqlConnection(connectionString)
    '        connection.Open()

    '        For Each answer In answers
    '            ' Insert each answer into EmployeeAnswers table
    '            Dim insertAnswerQuery As String = "INSERT INTO employee_answer (e_id, set_ID, q_id, answer) VALUES (@EmployeeID, @ExamID, @QuestionID, @SelectedAnswer)"
    '            Using insertCommand As New SqlCommand(insertAnswerQuery, connection)
    '                insertCommand.Parameters.AddWithValue("@EmployeeID", employeeId)
    '                insertCommand.Parameters.AddWithValue("@ExamID", examId)
    '                insertCommand.Parameters.AddWithValue("@QuestionID", answer.Item1)
    '                insertCommand.Parameters.AddWithValue("@SelectedAnswer", answer.Item2)
    '                insertCommand.ExecuteNonQuery()
    '            End Using

    '            ' Check if the answer is correct
    '            Dim checkAnswerQuery As String = "SELECT answer FROM question_master WHERE q_id = @QuestionID"
    '            Using checkCommand As New SqlCommand(checkAnswerQuery, connection)
    '                checkCommand.Parameters.AddWithValue("@QuestionID", answer.Item1)
    '                Dim correctAnswer As String = checkCommand.ExecuteScalar().ToString()

    '                If answer.Item2 = correctAnswer Then
    '                    correctAnswersCount += 1
    '                End If
    '            End Using
    '        Next

    '        ' Calculate the score
    '        Dim score As Integer = correctAnswersCount

    '        ' Insert the result into result_master table
    '        Dim insertResultQuery As String = "INSERT INTO result_master (e_id, emp_name, score) VALUES (@EmployeeID, @EmployeeName, @Score)"
    '        Using insertResultCommand As New SqlCommand(insertResultQuery, connection)
    '            insertResultCommand.Parameters.AddWithValue("@EmployeeID", employeeId)
    '            insertResultCommand.Parameters.AddWithValue("@EmployeeName", employeeName)
    '            insertResultCommand.Parameters.AddWithValue("@Score", score)
    '            insertResultCommand.ExecuteNonQuery()
    '        End Using
    '    End Using

    '    ' Redirect or show a message after submission
    '    'Response.Redirect("ResultPage.aspx")  ' Redirect to a result page or display a message
    'End Sub

End Class
