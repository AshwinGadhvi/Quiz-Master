<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Set_Master.aspx.vb" Inherits="Set_Master" %>

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
            <h1 class="m-0">Set Master</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
              <li class="breadcrumb-item active">Set Master</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <asp:HiddenField ID="s_id" runat="server" />
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
                    <label for="exampleInputEmail1">Set Name</label>
                      <asp:TextBox ID="s_name" runat="server" class="form-control" placeholder="Enter Set Name"></asp:TextBox>
                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Set Discription</label>
                      <asp:TextBox ID="s_disc" runat="server" class="form-control" placeholder="Enter Password" ></asp:TextBox>
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
<asp:GridView ID="example1" runat="server" class="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="set_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="set_id" HeaderText="set_id" ReadOnly="True" InsertVisible="False" SortExpression="set_id" Visible="false"></asp:BoundField>
                                    <asp:BoundField DataField="set_name" HeaderText="Set Name" SortExpression="set_name"></asp:BoundField>
                                    <asp:BoundField DataField="set_discription" HeaderText="Set Discription" SortExpression="set_discription"></asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Action">
                           <ItemTemplate>
                                    <asp:Button ID="Edit1" runat="server" CssClass="btn btn-success" Text="Edit" CommandName="Edit1" CommandArgument='<%#Eval("set_id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" />
                                    <asp:Button ID="del" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="del" CommandArgument='<%#Eval("set_id") %>' CausesValidation="false" ToolTip="Delete User"  UseSubmitBehavior="false"  />
                                </ItemTemplate>
                                                                                         </asp:TemplateField>
                                    </Columns>
                            </asp:GridView>


                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' DeleteCommand="DELETE FROM [set_master] WHERE [set_id] = @set_id" InsertCommand="INSERT INTO [set_master] ([set_name], [set_discription]) VALUES (@set_name, @set_discription)" SelectCommand="SELECT * FROM [set_master]" UpdateCommand="UPDATE [set_master] SET [set_name] = @set_name, [set_discription] = @set_discription WHERE [set_id] = @set_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="set_id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="set_name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="set_discription" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="set_name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="set_discription" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="set_id" Type="Int32"></asp:Parameter>
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

