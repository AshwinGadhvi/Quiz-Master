<%@ Page Title="" Language="VB" MasterPageFile="~/user.master" AutoEventWireup="false" CodeFile="examination.aspx.vb" Inherits="examination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:label id="lt" Text="" runat="server" Visible="false"></asp:label>
    <div class="container-fluid">
        <div class="row">
            <div class="d-flex justify-content-center">
                <asp:Button ID="submit" runat="server" Text="Start Exam" cssclass="btn btn-primary"/>
            </div>
            
        </div>
    </div>
</asp:Content>

