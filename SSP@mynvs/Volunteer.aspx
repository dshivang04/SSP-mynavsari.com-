<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Volunteer.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <h3>Volunteer Form </h3>
    </center>

    <div class="border-b">
        <table align="center">
            <tr>
                <td>Volunteer ID</td>
                <td>
                    <asp:TextBox ID="vid" runat="server" placeholder="Enter your registration id" ReadOnly="True" Width="238px"></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td>Name <sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="vname" runat="server" placeholder="Enter your name" Width="238px"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>Contact number 1<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="vnumber1" runat="server" placeholder="Enter your number" Width="238px"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>Contact number 2</td>
                <td>
                    <asp:TextBox ID="vnumber2" runat="server" placeholder="Enter your number" Width="238px"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>Email<sup class="star">*</sup></td>
                <td>
                    <asp:TextBox ID="vemail" runat="server" placeholder="example@example.com" TextMode="Email" Width="238px"></asp:TextBox></td>

            </tr>
            <tr>
                <td>Address<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="vadd" runat="server" placeholder="Enter your address" Width="238px"></asp:TextBox>
                </td>

            </tr>
            
            <tr>
                <td>Country<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="vctry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged" Width="238px"></asp:DropDownList>
                </td>


            </tr>
            <tr>
                <td>State<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="vst" runat="server" AutoPostBack="true" OnSelectedIndexChanged="State_SelectedIndexChanged" Width="238px"></asp:DropDownList>
                </td>


            </tr>
            <tr>
                <td>City<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="vcity" runat="server" Width="238px"></asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td>Pincode<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="vpin" runat="server" placeholder="Enter your pincode" Width="238px"></asp:TextBox>
                </td>


            </tr>
           <tr>
                <td>Types<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="Type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Type_SelectedIndexChanged" Width="240px"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Category<sup class="star">*</sup> </td>
                <td> 
                    <asp:DropDownList ID="Category" runat="server" SelectionMode="Multiple" Width="240px"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                    <td>Start Date:</td>
                    <td><asp:TextBox ID="vstdt" runat="server" TextMode="Date" MinimumValue=""></asp:TextBox></td>
            </tr>

            <tr>
                    <td>End Date:</td>
                    <td><asp:TextBox ID="vendt" runat="server" TextMode="Date"></asp:TextBox></td>
            </tr>

            <tr>
                <td></td>
                <td align="right">
                    <asp:Button ID="vreg" runat="server" Text="Register" OnClick="txtReg_Click" Width="96px" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label ID="vlbl" runat="server"></asp:Label>
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>