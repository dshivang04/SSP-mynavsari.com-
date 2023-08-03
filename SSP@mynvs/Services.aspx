<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Search Page</title>
    <style>
        div {
            font-family: 'Times New Roman', 'Times New Roman';
            font-size: 16px;
            line-height: 1.5;
            font-weight: bold;
            text-align: left;
        }
        h1 {
            margin-top: 30px;
            font-weight: bold;
            color: #151B54;
        }
        .border-b{
            border:1px solid #151B54;
            margin-left:5%;
            margin-right:5%;
            margin-bottom:2%;
            align-content:center;
            margin-top:2%;
            box-shadow:inset 0 0 0 1px #5C6397;
            box-sizing: border-box;
        }
        input[type=submit] {
            align-content:center;
            margin: 4px 0;
            margin-right: 5px;
            background-color: #151B54;
            color: white;
            border: none;
            padding: 8px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
        }
        input[type=submit]:hover {
                opacity: 1;
        }
        td {
            padding: 5px;
            color: #151B54;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 align="center">Services</h1>
    <div class="border-b">
        <table> 
        <td align="right">         
            <asp:DropDownList ID="FilterDrop" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filter_SelectedIndexChanged" Height="38px" Width="200px"></asp:DropDownList>
            <asp:DropDownList ID="Drop2" runat="server" Height="38px" Width="200px"></asp:DropDownList>
            <asp:Button ID="txtFilter" runat="server" Text="Filter" OnClick="txtFilter_Click" Width="79px" />
            <asp:Button ID="txtView" runat="server" Text="View All" OnClick="txtView_Click" />   
        </td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="SP ID" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_SP_ID" runat="server" Text='<%# Eval("SP_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Registration ID" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_RegistrationID" runat="server" Text='<%# Eval("RegistrationID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Types" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Types" runat="server" Text='<%# Eval("TypeName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                    <HeaderStyle CssClass="hedargrid" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Category" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                    <HeaderStyle CssClass="hedargrid" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Address" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Country" runat="server" Text='<%# Eval("CountryName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_State" runat="server" Text='<%# Eval("StateName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_City" runat="server" Text='<%# Eval("CityName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pincode" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Pincode" runat="server" Text='<%# Eval("Pincode") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact 1" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Contact1" runat="server" Text='<%# Eval("Contact1") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact 2" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Contact2" runat="server" Text='<%# Eval("Contact2") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Website" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Website" runat="server" Text='<%# Eval("Website") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Person" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ContactPerson" runat="server" Text='<%# Eval("ContactPerson") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Person Number" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ContactPerson_No" runat="server" Text='<%# Eval("ContactPerson_No") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="hedargrid" />
                    <ItemStyle CssClass="gri" HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </table>
        </div>
</asp:Content>

