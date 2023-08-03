<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Intern_Pro1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Entries</title>
    <style>
        body {
            background-image: url('https://wallpapers.com/images/high/black-gradient-background-ji5n1dg53r1ygu5m.webp');
            background-size: cover;
            font-family: 'Times New Roman', Times, serif;
            font-size: 18px;
            line-height: 1.5;
            color: #e2e899;
            border: groove thick;
        }


        h1 {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            margin-top: 50px;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: bold;
            color: #e2e899;
        }

        input[type="text"], input[type="password"] {
            display: block;
            margin-bottom: 10px;
            width: 100%;
            max-width: 300px;
            padding: 10px;
            font-size: 16px;
            color: #000000;
            border: 2px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            display: block;
            margin: 20px auto 0;
            background-color: rgb(5 4 93);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            border-radius: 4px;
        }

            input[type="submit"]:hover {
                border: solid;
                border-color: rgb(5 4 93);
                background-color: rgb(5 4 93 / 0.20);
                color: rgb(0 2 255);
                font-size: x-large;
            }
            td{
                width: 300px;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td><label for="fname">Select First Name:</label></td>
                <td><asp:DropDownList ID="flt_fname" runat="server" Width="250px" DataSourceID="SqlDataSource1" DataTextField="FirstName" DataValueField="FirstName"></asp:DropDownList></td>
            </tr>

            <tr>
                <td><label for="fname">Select Last Name:</label></td>
                <td><asp:DropDownList ID="flt_lname" runat="server" Width="250px" DataSourceID="SqlDataSource2" DataTextField="LastName" DataValueField="LastName"></asp:DropDownList></td>
            </tr>

            <tr>
                <td><label for="fname">Select Contact Number:</label></td>
                <td><asp:DropDownList ID="flt_cnum" runat="server" Width="250px" DataSourceID="SqlDataSource3" DataTextField="Phone" DataValueField="Phone"></asp:DropDownList></td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="filall" runat="server" Text="Show All" OnClick="fltall_Click" Height="63px" Width="125px" />
                </td>
                <td>
                    <asp:Button ID="fil" runat="server" Text="Filter" OnClick="flt_Click" Height="63px" Width="125px" />
                </td>
            </tr>
        </table>
        
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" EmptyDataText="No Such Record Exists" Visible="False" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="DateofBirth" HeaderText="Date of Birth" SortExpression="DateofBirth" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" EmptyDataText="No Such Data Exist" Visible="False">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="DateofBirth" HeaderText="DateofBirth" SortExpression="DateofBirth" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:internformConnectionString %>" SelectCommand="SELECT DISTINCT [FirstName] FROM [Regform]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:internformConnectionString %>" SelectCommand="SELECT DISTINCT [LastName] FROM [Regform]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:internformConnectionString %>" SelectCommand="SELECT DISTINCT [Phone] FROM [Regform]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:internformConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Regform] WHERE (([FirstName] = @FirstName) AND ([LastName] = @LastName) AND ([Phone] = @Phone))">
            <SelectParameters>
                <asp:ControlParameter ControlID="flt_fname" Name="FirstName" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="flt_lname" Name="LastName" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="flt_cnum" Name="Phone" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:internformConnectionString %>" SelectCommand="SELECT * FROM [Regform]"></asp:SqlDataSource>
    </form>
</body>
</html>
