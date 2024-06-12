<%@ Page Title="" Language="VB" MasterPageFile="~/user.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="d-flex justify-content-center">
        <h1>Examination</h1>
    </div>
    <div class="container">
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="col-3">
                <div class="card" style="width: 18rem;">
  <img src="img/exam.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Set <%#Eval("set_name") %></h5>
    <p class="card-text"><%# Eval("set_discription") %></p>
      <asp:LinkButton ID="submit" runat="server" class="btn btn-primary" CommandArgument='<%# Eval("set_id")%>'>Start Exam</asp:LinkButton>
    
  </div>
</div>
            </div>
                </ItemTemplate>
            </asp:Repeater>


            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' SelectCommand="SELECT * FROM [set_master]"></asp:SqlDataSource>
            
        </div>
    </div>
</asp:Content>

