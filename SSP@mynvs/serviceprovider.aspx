<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="serviceprovider.aspx.cs" Inherits="serviceprovider" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <link href="css/style1.css" rel="stylesheet" type="text/css" />    
    <style>
        /* Center the registration form */
        div {
            font-family: 'Times New Roman', 'Times New Roman';
            font-size: 16px;
            line-height: 1.5;
            /*color: #151B54;*/
            font-weight: bold;
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
        .star {
            color: red;
        }

        ::placeholder {
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
            color: #151B54;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="email"] {
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

        input[type="checkbox"] {
            width: 200px;
            padding: 5px;
            border: 2px solid #ccc;
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
    <h3 align="center">Service Provider Form</h3>
    <div class="border-b">
        <table align="center">
            <tr>
                <td>SP id<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="spID" runat="server" placeholder="Enter your service provider id" Width="240px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Registration id<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="registrationID" runat="server" placeholder="Enter your registration id" Width="240px"></asp:TextBox>
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
                <td>Address<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtadd" runat="server" placeholder="Enter your address" Width="240px"></asp:TextBox>
                </td>

            </tr>

            
            
            <tr>
                <td>Country<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="Country" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged" Width="240px"></asp:DropDownList>
                </td>


            </tr>
            <tr>
                <td>State<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="State" runat="server" AutoPostBack="true" OnSelectedIndexChanged="State_SelectedIndexChanged" Width="240px"></asp:DropDownList>
                </td>


            </tr>
            <tr>
                <td>City<sup class="star">*</sup> </td>
                <td>
                    <asp:DropDownList ID="City" runat="server" Width="240px"></asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td>Pincode<sup class="star">*</sup> </td>
                <td width="240">
                    <asp:TextBox ID="txtpin" runat="server" placeholder="Enter your pincode" Width="240px"></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td>Contact 1<sup class="star">*</sup> </td>
                <td width="240">
                    <asp:TextBox ID="txtcn1" runat="server" placeholder="Enter contact 1" Width="240px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Contact 2</td>
                <td>
                    <asp:TextBox ID="txtcn2" runat="server" placeholder="Enter contact 2" Width="240px"></asp:TextBox>
                </td>
            </tr>
            
                
            <tr>
                <td>Email<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" placeholder="Enter your email" Width="240px"></asp:TextBox>
                </td>
            </tr>
            
                
            <tr>
                <td>Website<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtweb" runat="server" placeholder="Enter your website" Width="240px"></asp:TextBox>
                </td>
            </tr>
            
                
            <tr>
                <td>Contact Person<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtcp" runat="server" placeholder="Enter contact person" Width="240px"></asp:TextBox>
                </td>
            </tr>
            
                
            <tr>
                <td>Contact Person Number<sup class="star">*</sup> </td>
                <td>
                    <asp:TextBox ID="txtcpno" runat="server" placeholder="Enter Contact Person number" Width="240px"></asp:TextBox>
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