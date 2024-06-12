<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="result_master.aspx.vb" Inherits="Admin_result_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Exam Results</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="r_id" CssClass="table table-bordered table-striped">
            <Columns>
                <asp:BoundField DataField="r_id" HeaderText="Result ID" ReadOnly="True" />
                <asp:BoundField DataField="e_id" HeaderText="Employee ID" ReadOnly="True" />
                <asp:BoundField DataField="emp_name" HeaderText="Employee Name" ReadOnly="True" />
                <asp:BoundField DataField="score" HeaderText="Score" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' SelectCommand="SELECT r_id, e_id, emp_name, score FROM result_master"></asp:SqlDataSource>
    </div>
</asp:Content>
