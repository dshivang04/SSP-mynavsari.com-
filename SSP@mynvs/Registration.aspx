<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <link href="css/style1.css" rel="stylesheet" type="text/css" />
    <style>
        /* style1.css */

        /* Center the registration form */
        div {
            font-family: 'Times New Roman', 'Times New Roman';
            font-size: 16px;
            line-height: 1.5;
            /*color: #151B54;*/
            font-weight:bold;
            text-align: left;
        }

        /* Style the table */
        table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 400px;
        }

        /* Style table cells */
        td {
            padding: 5px;
            color: #151B54;
            font-weight: bold;
        }

        /* Style the registration form heading */
        h3 {
            margin-top: 30px;
            font-weight: bold;
            color: #151B54;
        }

        /* Style the registration button */
        /*#txtReg {
            margin-top: 20px;
            background-color: #151B54;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
        }*/
        .star{
            color:red;
        }
        ::placeholder{
            color: #151B54;
            opacity: 0.5;
        }
        input[type=submit] { 
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
        /* Style the input textboxes */
        input[type="text"] {
            padding: 5px;
            color:#151B54;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="email"]{
            width: 200px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        /* Style the dropdown lists */
        select {
            width: 200px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #151B54;
            opacity: 1;
        }

        /* Style the registration form labels */
        label {
            font-weight: bold;
            color: #FFFFFF;
        }
        .border-b{
            border:1px solid #151B54;
            margin-left:35%;
            margin-right:35%;
            margin-bottom:2%;
            align-content:center;
            margin-top:2%;
            box-shadow:inset 0 0 0 1px #5C6397;
            box-sizing: border-box;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h3>Registration Form </h3>
    </center>

    <div class="border-b">
        <table align="center">
            <tr>
                <td>Registration id</td>
                <td>
                    <asp:TextBox ID="txtID" runat="server" placeholder="Enter your registration id" ReadOnly="True" Width="238px"></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td>Name <sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtname" runat="server" placeholder="Enter your name" Width="238px"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>Contact number 1<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtnumber1" runat="server" placeholder="Enter your number" Width="238px"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>Contact number 2</td>
                <td>
                    <asp:TextBox ID="txtnumber2" runat="server" placeholder="Enter your number" Width="238px"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>email</td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" placeholder="example@example.com" TextMode="Email" Width="238px"></asp:TextBox></td>

            </tr>
            <tr>
                <td>Address<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtadd" runat="server" placeholder="Enter your address" Width="238px"></asp:TextBox>
                </td>

            </tr>
            
            <tr>
                <td>Country<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="Country" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged" Width="238px"></asp:DropDownList>
                </td>


            </tr>
            <tr>
                <td>State<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="State" runat="server" AutoPostBack="true" OnSelectedIndexChanged="State_SelectedIndexChanged" Width="238px"></asp:DropDownList>
                </td>


            </tr>
            <tr>
                <td>City<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="City" runat="server" Width="238px"></asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td>Pincode<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtpin" runat="server" placeholder="Enter your pincode" Width="238px"></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td>Blood group</td>
                <td>
                    <asp:TextBox ID="txtbg" runat="server" placeholder="Enter your bloodgroup" Width="238px"></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td></td>
                <td align="right">
                    <asp:Button ID="txtReg" runat="server" Text="Register" OnClick="txtReg_Click" Width="96px" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="Label" runat="server"></asp:Label>
                </td>
            </tr>
            
        </table>
    </div>

</asp:Content>

