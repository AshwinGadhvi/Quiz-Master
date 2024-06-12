<%@ Page Title="" Language="VB" MasterPageFile="~/user.master" AutoEventWireup="false" CodeFile="exam_start.aspx.vb" Inherits="Admin_exam_start" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label id="name" Text="" runat="server" Visible="false"></asp:Label>
    <div class="container">
        <div class="col-12">
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <asp:HiddenField ID="q_id" runat="server" Value='<%# Eval("q_id") %>' />
                        <div class="form-group" style="padding-top:20px;">
                            <label for="exampleInputPassword1"><i class="fa fa-arrow-right"></i> <%# Eval("question") %></label><br />
                            <asp:RadioButton ID="RadioButton1" runat="server" Text='<%# Eval("a") %>' GroupName="op" style="padding-left:50px;"/>
                            <asp:RadioButton ID="RadioButton2" runat="server" Text='<%# Eval("b") %>' GroupName="op" style="padding-left:10px;"/>
                            <asp:RadioButton ID="RadioButton3" runat="server" Text='<%# Eval("c") %>' GroupName="op" style="padding-left:10px;"/>
                            <asp:RadioButton ID="RadioButton4" runat="server" Text='<%# Eval("d") %>' GroupName="op" style="padding-left:10px;"/>
                            <br />
                        </div><br />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Quiz_ManageConnectionString %>' SelectCommand="SELECT TOP 20 * FROM [question_master] ORDER BY NEWID()"></asp:SqlDataSource>

            </div>
        </div>
    </div>
        <div class="container-fluid">
        <div class="row">
            <div class="d-flex justify-content-center">
                <asp:Button ID="submit" runat="server" Text="Submit Exam" cssclass="btn btn-primary"/>
            </div>
            
        </div>
    </div>
</asp:Content>

