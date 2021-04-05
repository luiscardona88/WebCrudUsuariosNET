<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication11.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:Image ID="Image1" runat="server" Height="178px" ImageUrl="~/LOGO.png" Width="100%" />
        <br />
    
    </div>
        <div style="padding-left:30%">
        <p>
            NOMBRE:<asp:TextBox ID="TextBox1" runat="server" style="margin-left: 21px" Width="328px"></asp:TextBox>
        </p>
        <p>
            PASSWORD<asp:TextBox ID="TextBox2" runat="server" style="margin-left: 3px" Width="322px" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" style="margin-left: 183px" Text="ENTRAR" Width="129px" OnClick="Button1_Click" />
        </p>
        <p>
            &nbsp;</p>

        </div>
    </form>
    </div>
</body>
</html>
