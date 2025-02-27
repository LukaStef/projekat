﻿<%@ Page Title="Edit database" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Projekat.Admin.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Database</h1>
    <br />
    <h5>View, edit, delete or add a new entry into the database</h5>
    <br />
    Load data for: <asp:DropDownList ID="ddlSearch" runat="server" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true" CssClass="dropdown">
        <asp:ListItem Value="b">Band</asp:ListItem>
        <asp:ListItem Value="a">Album</asp:ListItem>
        <asp:ListItem Value="s">Song</asp:ListItem>
    </asp:DropDownList><br />

    <asp:Panel ID="panelBand" runat="server">
        <asp:Label ID="lblIdB" runat="server" Text="ID"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqIdBand" runat="server" Enabled="false" ErrorMessage="Band ID required" ControlToValidate="tbId" Text="*"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="ranIdBand" runat="server" Enabled="false"  ErrorMessage="Band ID must be a number that is not below 1" MinimumValue="1" MaximumValue="99999999" ControlToValidate="tbId" Text="*"></asp:RangeValidator>
        <asp:TextBox ID="tbId" runat="server" CssClass="form-control"></asp:TextBox>
        
        
        <asp:Label ID="lblNameB" runat="server" Text="Name:"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqNameBand" runat="server" ErrorMessage="Band name required" ControlToValidate="tbName" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tbName" runat="server" CssClass="form-control"></asp:TextBox>
        

        
        <asp:Label ID="lblLogoB" runat="server" Text="Logo (file path):"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqLogo" runat="server" ErrorMessage="Logo file path required" ControlToValidate="tbLogo" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tbLogo" runat="server" CssClass="form-control"></asp:TextBox>
        
        
        <asp:Label ID="lblDateB" runat="server" Text="Date (yyyy-mm-dd):" ></asp:Label> 
        <asp:RequiredFieldValidator ID="reqDateBand" runat="server" ErrorMessage="Date of formation required" ControlToValidate="tbDate" Text="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexDateBand" runat="server" ErrorMessage="Invalid date" ValidationExpression="^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$" ControlToValidate="tbDate" Text="*"></asp:RegularExpressionValidator>
        <asp:TextBox ID="tbDate" runat="server" CssClass="form-control"></asp:TextBox>
        
        
        <asp:Label ID="lblSiteB" runat="server" Text="Site:" ></asp:Label> 
        <asp:RequiredFieldValidator ID="reqSite" runat="server" ErrorMessage="Official site link required" ControlToValidate="tbSite" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tbSite" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        

    </asp:Panel>

    <asp:Panel ID="panelAlbum" runat="server" Visible="false">
        <asp:Label ID="lblIdA" runat="server" Text="ID:"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqIdAlbum" Enabled="false" runat="server" ErrorMessage="Album ID required" ControlToValidate="tbIdA" Text="*"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="ranIdAlbum" Enabled="false" runat="server" ErrorMessage="Album ID must be a number that is not below 1" MinimumValue="1" MaximumValue="99999999" Text="*" ControlToValidate="tbIdA"></asp:RangeValidator>
        <asp:TextBox ID="tbIdA" runat="server" CssClass="form-control"></asp:TextBox>
        

        <asp:Label ID="lblNameA" runat="server" Text="Name:"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqNameAlbum" runat="server" ErrorMessage="Album name is required" ControlToValidate="tbNameA" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tbNameA" runat="server" CssClass="form-control"></asp:TextBox>
        

        <asp:Label ID="lblCover" runat="server" Text="Album cover (file path):"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqCover" runat="server" ErrorMessage="Album cover path is required" ControlToValidate="tbCover" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tbCover" runat="server" CssClass="form-control"></asp:TextBox>
        

        <asp:Label ID="lblDateA" runat="server" Text="Date (yyyy-mm-dd):" ></asp:Label> 
        <asp:RequiredFieldValidator ID="reqDateAlbum" runat="server" ErrorMessage="Album release date required" ControlToValidate="tbDateA" Text="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexDateAlbum" runat="server" ErrorMessage="Invalid date" ValidationExpression="^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$" ControlToValidate="tbDateA" Text="*"></asp:RegularExpressionValidator>
        <asp:TextBox ID="tbDateA" runat="server" CssClass="form-control"></asp:TextBox>
        

        <asp:Label ID="lblBand" runat="server" Text="Band (ID):" ></asp:Label> 
        <asp:RequiredFieldValidator ID="reqBand" runat="server" ErrorMessage="Band ID reference required" ControlToValidate="tbBand" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tbBand" runat="server" CssClass="form-control"></asp:TextBox>
        

    </asp:Panel>

    <asp:Panel ID="panelSong" runat="server" Visible="false">
        <asp:Label ID="lblIdS" runat="server" Text="ID (used for editing and deleting, no effect on inserting):"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqIdSong" Enabled="false" runat="server" ErrorMessage="Song ID required" ControlToValidate="tbIdS" Text="*"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="ranIdSong" Enabled="false" runat="server" ErrorMessage="Song ID must be a number that is not below 1" MinimumValue="1" MaximumValue="99999999" ControlToValidate="tbIdS" Text="*"></asp:RangeValidator>
        <asp:TextBox ID="tbIdS" runat="server" CssClass="form-control"></asp:TextBox>
        

        <asp:Label ID="lblNameS" runat="server" Text="Name:"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqNameSong" runat="server" ErrorMessage="Song name required" ControlToValidate="tbNameS" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tbNameS" runat="server" CssClass="form-control"></asp:TextBox>
        

        <asp:Label ID="lblAlbum" runat="server" Text="Album (ID):"></asp:Label> 
        <asp:RequiredFieldValidator ID="reqAlbum" runat="server" ErrorMessage="Album ID reference required" ControlToValidate="tbAlbum" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tbAlbum" runat="server" CssClass="form-control"></asp:TextBox>
        

        <asp:Label ID="lblLink" runat="server" Text="Youtube link:" ></asp:Label> 
        <asp:RequiredFieldValidator ID="reqLink" runat="server" ErrorMessage="Youtube link required" ControlToValidate="tbLink" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tblink" runat="server" CssClass="form-control"></asp:TextBox>
        

    </asp:Panel>
    <br />
    <asp:Panel ID="Panel1" runat="server">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <br />
        <asp:Label ID="lblError" runat="server" Text="" Font-Bold="True"></asp:Label><br />
        <asp:Button ID="btnClear" runat="server" Text="Clear parameters" OnClick="btnClear_Click" CssClass="btn btn-danger" /><br />
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary bold" OnClick="btnAdd_Click"/>&emsp;
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-warning bold" OnClick="btnEdit_Click"/>&emsp;
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger bold" OnClick="btnDelete_Click"/><br />
        
    </asp:Panel>
    <br />
    <div class="centriraj">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table" SelectedRowStyle-BackColor="LightGray" SelectedRowStyle-ForeColor="Black"></asp:GridView>
    </div>
    
</asp:Content>
