<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Login_Master.aspx.vb" Inherits="Login_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
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
            <h1 class="m-0">Login Master</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
              <li class="breadcrumb-item active">Login Master</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <asp:HiddenField ID="uid" runat="server" />
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Login Master</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                      <asp:TextBox ID="u_name" runat="server" class="form-control" placeholder="Enter email"></asp:TextBox>
                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                      <asp:TextBox ID="u_pass" runat="server" class="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                      </div>
                    <div class="form-group">
                    <label for="exampleInputPassword1">User Type</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>
                        </asp:DropDownList>
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
                <h3 class="card-title">User List</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
<asp:GridView ID="example1" runat="server" class="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="u_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="u_id" HeaderText="u_id" ReadOnly="True" InsertVisible="False" SortExpression="u_id" Visible="false"></asp:BoundField>
                                    <asp:BoundField DataField="u_name" HeaderText="User Name" SortExpression="u_name"></asp:BoundField>
                                    <asp:BoundField DataField="u_pass" HeaderText="u_pass" SortExpression="u_pass" Visible="false"></asp:BoundField>
                                    <asp:BoundField DataField="u_type" HeaderText="User Type" SortExpression="u_type"></asp:BoundField>
                                     <asp:TemplateField HeaderText="Action">
                           <ItemTemplate>
                                    <asp:Button ID="Edit1" runat="server" CssClass="btn btn-success" Text="Edit" CommandName="Edit1" CommandArgument='<%#Eval("u_id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" />
                                    <asp:Button ID="del" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="del" CommandArgument='<%#Eval("u_id") %>' CausesValidation="false" ToolTip="Delete User"  UseSubmitBehavior="false"  />
                                </ItemTemplate>
                                                                                         </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' DeleteCommand="DELETE FROM [Login_Master] WHERE [u_id] = @u_id" InsertCommand="INSERT INTO [Login_Master] ([u_name], [u_pass], [u_type]) VALUES (@u_name, @u_pass, @u_type)" SelectCommand="SELECT * FROM [Login_Master]" UpdateCommand="UPDATE [Login_Master] SET [u_name] = @u_name, [u_pass] = @u_pass, [u_type] = @u_type WHERE [u_id] = @u_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="u_id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="u_name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="u_pass" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="u_type" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="u_name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="u_pass" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="u_type" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="u_id" Type="Int32"></asp:Parameter>
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

