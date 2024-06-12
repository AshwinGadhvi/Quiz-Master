<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Question_Master.aspx.vb" Inherits="Question_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                  <!-- Content Wrapper. Contains page content -->
     <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Question Master</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
              <li class="breadcrumb-item active">Question Master</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <asp:HiddenField ID="q_id" runat="server" />
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Question Master</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                    <div class="row">
                  <div class="form-group col-4 d-inline-block">
                    <label for="exampleInputEmail1">Exam Name</label>
                      <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="exam_name" DataValueField="exam_id" CssClass="form-control"></asp:DropDownList>

                      <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' SelectCommand="SELECT [exam_id], [exam_name] FROM [Exam_Master] ORDER BY [exam_name]"></asp:SqlDataSource>
                  </div>
                  <div class="form-group col-4 d-inline-block">
                    <label for="exampleInputPassword1">Set Name</label>
                      <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="set_name" DataValueField="set_id" CssClass="form-control"></asp:DropDownList>
                      <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' SelectCommand="SELECT [set_id], [set_name] FROM [set_master] ORDER BY [set_name]"></asp:SqlDataSource>
                  </div>
                    <div class="form-group col-4 d-inline-block">
                        <label for="example">Question</label>
                        <asp:TextBox ID="question" runat="server" CssClass="form-control" placeholder="Enter Question"></asp:TextBox>
                    </div>
                    <div class="form-group col-4 d-inline-block">
                        <label for="example">MCQ 1</label>
                        <asp:TextBox ID="mcq1" runat="server" CssClass="form-control" placeholder="Enter MCQ 1"></asp:TextBox>
                    </div>
                    <div class="form-group col-4 d-inline-block">
                        <label for="example">MCQ 2</label>
                        <asp:TextBox ID="mcq2" runat="server" CssClass="form-control" placeholder="Enter MCQ 2"></asp:TextBox>
                    </div>
                    <div class="form-group col-4 d-inline-block">
                        <label for="example">MCQ 3</label>
                        <asp:TextBox ID="mcq3" runat="server" CssClass="form-control" placeholder="Enter MCQ 3"></asp:TextBox>
                    </div>
                    <div class="form-group col-4 d-inline-block">
                        <label for="example">MCQ 4</label>
                        <asp:TextBox ID="mcq4" runat="server" CssClass="form-control" placeholder="Enter MCQ 4"></asp:TextBox>
                    </div>
                    <div class="form-group col-4 d-inline-block">
                        <label for="example">Answer</label>
                        <asp:TextBox ID="answer" runat="server" CssClass="form-control" placeholder="Enter Answer"></asp:TextBox>
                    </div>
                        </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <asp:Button ID="submit" class="btn btn-primary" runat="server" Text="Submit" />
                </div>
              
            </div>
            <!-- /.card -->
          </div>
            
            </div>
          </div>
        </section>
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="col-12">
                        <div class="card">
              <div class="card-header bg-primary">
                <h3 class="card-title">Question List</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
<asp:GridView ID="example1"  runat="server" class="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="q_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="q_id" HeaderText="q_id" ReadOnly="True" InsertVisible="False" SortExpression="q_id" visible="false"></asp:BoundField>
                                <asp:BoundField DataField="set_id" HeaderText="set_id" SortExpression="set_id" visible="false"></asp:BoundField>
                                <asp:BoundField DataField="question" HeaderText="question" SortExpression="question" ></asp:BoundField>
                                <asp:BoundField DataField="a" HeaderText="a" SortExpression="a"></asp:BoundField>
                                <asp:BoundField DataField="b" HeaderText="b" SortExpression="b"></asp:BoundField>
                                <asp:BoundField DataField="c" HeaderText="c" SortExpression="c"></asp:BoundField>
                                <asp:BoundField DataField="d" HeaderText="d" SortExpression="d"></asp:BoundField>
                                <asp:BoundField DataField="answer" HeaderText="answer" SortExpression="answer"></asp:BoundField>
                                <asp:BoundField DataField="exam_id" HeaderText="exam_id" SortExpression="exam_id" visible="false"></asp:BoundField>
                                <asp:TemplateField HeaderText="Action">
                           <ItemTemplate>
                                    <asp:Button ID="Edit1" runat="server" CssClass="btn btn-success" Text="Edit" CommandName="Edit1" CommandArgument='<%#Eval("q_id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" />
                                    <asp:Button ID="del" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="del" CommandArgument='<%#Eval("q_id") %>' CausesValidation="false" ToolTip="Delete User"  UseSubmitBehavior="false"  />
                                </ItemTemplate>
                                                                                         </asp:TemplateField>
                            </Columns>
                        </asp:GridView>



                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' DeleteCommand="DELETE FROM [question_master] WHERE [q_id] = @q_id" InsertCommand="INSERT INTO [question_master] ([set_id], [question], [a], [b], [c], [d], [answer], [exam_id]) VALUES (@set_id, @question, @a, @b, @c, @d, @answer, @exam_id)" SelectCommand="SELECT * FROM [question_master]" UpdateCommand="UPDATE [question_master] SET [set_id] = @set_id, [question] = @question, [a] = @a, [b] = @b, [c] = @c, [d] = @d, [answer] = @answer, [exam_id] = @exam_id WHERE [q_id] = @q_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="q_id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="set_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="question" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="a" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="b" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="c" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="d" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="answer" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="exam_id" Type="Int32"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="set_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="question" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="a" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="b" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="c" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="d" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="answer" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="exam_id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="q_id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
              <!-- /.card-body -->
            </div>
                    </div>
            </div>
        </div>
    </div>
</section>
                    

    <script>
  $(function () {
    $("#ContentPlaceHolder1_example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#ContentPlaceHolder1_example1 .col-md-6:eq(0)');
    $('#ContentPlaceHolder1_example1').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
        </ContentTemplate>
    </asp:UpdatePanel>

    
</asp:Content>

