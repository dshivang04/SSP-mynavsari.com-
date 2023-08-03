<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebForm1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
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
        .auto-style1 {
            height: 58px;
        }
        </style>
</head>
<body>
    <br />
    <asp:Image ID="Image1" runat="server" src="syn.jpg" Width="250px" Height="50px"/>
    <h1> Application Form </h1>
    <form id="form1" runat="server" style="max-width: 900px; margin: auto ;">
        <div style="color: white">
            <table>
                
                <tr>
                    <td><label for="fname">First Name:</label></td>
                    <td><asp:TextBox ID="fname" runat="server"  Width="250px" placeholder="Enter First Name"></asp:TextBox></td>
                    <td rowspan="4"><label for="img">Insert Your Image:</label></td>
                    <td rowspan="4">
                        <asp:FileUpload ID="aplimg" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td><label for="lname">Last Name:</label></td>
                    <td><asp:TextBox ID="lname" runat="server" Width="250px" placeholder="Enter Last Name"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="phone">Contact Number:</label></td>
                    <td><asp:TextBox ID="cnum" runat="server"  Width="250px" TextMode="Phone" placeholder="Enter Mobile Number"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="dob">Date Of Birth:</label></td>
                    <td><asp:TextBox ID="dob" runat="server" TextMode="Date" Width="250px" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="gen">Gender:</label></td>
                    <td><asp:RadioButton GroupName="gen" ID="RadioButton1" runat="server" Text="Male" OnCheckedChanged="RadioButton1_CheckedChanged" width="100px"/></td>
                    <td><asp:RadioButton GroupName="gen" ID="RadioButton2" runat="server" Text="Female" OnCheckedChanged="RadioButton2_CheckedChanged" width="100px"/></td>
                    <td><asp:RadioButton GroupName="gen" ID="RadioButton3" runat="server" Text="Other" OnCheckedChanged="RadioButton3_CheckedChanged" width="100px"/></td>
                </tr>
                <tr>
                    <td><label for="adr">Address:</label></td>
                    <td colspan="3"><asp:TextBox ID="adr" runat="server" Width="500px" Height="100px" placeholder="Enter Permanent Address"></asp:TextBox></td>
                </tr>
                <tr>
                    
                    <td class="auto-style1"><label for="email">Email:</label></td>
                    <td class="auto-style1"><asp:TextBox ID="email" runat="server" Width="250px" TextMode="Email" placeholder="Enter Email"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="reg" runat="server" Text="Register" OnClick="reg_Click" Height="63px" Width="120px" />
                        <asp:Label ID="ins" runat="server"></asp:Label>
                        </td>
                    <td>

                        <asp:Button ID="upd" runat="server" Text="Update" OnClick="upd_Click" Height="63px" Width="120px" />
                        <asp:Label ID="updt" runat="server"></asp:Label>
                        </td>
                    <td>
                        <asp:Button ID="del" runat="server" Text="Delete" OnClick="del_Click" Height="62px" Width="120px" />
                        <asp:Label ID="delt" runat="server"></asp:Label>
                        </td>
                    <td>
                        <asp:Button ID="sea" runat="server" Text="Search" OnClick="sea_Click" Height="63px" Width="120px"/>
                        <asp:Label ID="srch" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            <br />
        </div>
        
        <br />
    </form>

</body>
</html>
