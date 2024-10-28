<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Dashboard start -->
    <div class="container meal-plan-section" style="margin-top:100px;height:50vh;">
        <h2>Your Meal Plan</h2>
        <asp:Label ID="lblMealPlan" runat="server" Text="Your meal plan will appear here." CssClass="text-lg text-gray-800" />
    </div>
    <!--Dashboard end -->
</asp:Content>
