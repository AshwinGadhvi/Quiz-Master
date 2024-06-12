<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Exam_Master.aspx.vb" Inherits="Exam_Master" %>

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
            <h1 class="m-0">Exam Master</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
              <li class="breadcrumb-item active">Exam Master</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <asp:HiddenField ID="e_id" runat="server" />
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Set Master</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Exam Name</label>
                      <asp:TextBox ID="e_name" runat="server" class="form-control" placeholder="Enter Exam Name"></asp:TextBox>
                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Exam Date</label>
                      
                      <asp:TextBox ID="e_date" runat="server" class="form-control" placeholder="Enter Exam Date" type="date" ></asp:TextBox>
                      </div>

                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <asp:Button ID="submit" class="btn btn-primary" runat="server" Text="Submit" />
                </div>
              
            </div>
            <!-- /.card -->
          </div>
            <div class="col-6">
                        <div class="card">
              <div class="card-header bg-primary">
                <h3 class="card-title">Set List</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                            <asp:GridView ID="example1" runat="server" class="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="exam_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="exam_id" HeaderText="exam_id" ReadOnly="True" InsertVisible="False" SortExpression="exam_id" visible="false"></asp:BoundField>
                                    <asp:BoundField DataField="exam_name" HeaderText="exam_name" SortExpression="exam_name"></asp:BoundField>
                                    <asp:BoundField DataField="exam_date" HeaderText="exam_date" SortExpression="exam_date"></asp:BoundField>
                                                                                                        <asp:TemplateField HeaderText="Action">
                           <ItemTemplate>
                                    <asp:Button ID="Edit1" runat="server" CssClass="btn btn-success" Text="Edit" CommandName="Edit1" CommandArgument='<%#Eval("exam_id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" />
                                    <asp:Button ID="del" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="del" CommandArgument='<%#Eval("exam_id") %>' CausesValidation="false" ToolTip="Delete User"  UseSubmitBehavior="false"  />
                                </ItemTemplate>
                                                                                         </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' DeleteCommand="DELETE FROM [Exam_Master] WHERE [exam_id] = @exam_id" InsertCommand="INSERT INTO [Exam_Master] ([exam_name], [exam_date]) VALUES (@exam_name, @exam_date)" SelectCommand="SELECT * FROM [Exam_Master]" UpdateCommand="UPDATE [Exam_Master] SET [exam_name] = @exam_name, [exam_date] = @exam_date WHERE [exam_id] = @exam_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="exam_id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="exam_name" Type="String"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="exam_date"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="exam_name" Type="String"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="exam_date"></asp:Parameter>
                                    <asp:Parameter Name="exam_id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
              <!-- /.card-body -->
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

