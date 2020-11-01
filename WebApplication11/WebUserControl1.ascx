<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="WebApplication11.WebUserControl1" %>


<p></p>
<asp:Panel ID="Panel1" runat="server" BackColor="#CCCCFF" Font-Bold="True" Font-Size="Larger" ForeColor="Black" Visible="False">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DESEAS ELIMINAR LOS DATOS?<br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 261px" Text="ACEPTAR" Width="96px" />
    <asp:Button ID="Button2" runat="server" style="margin-left: 169px" Text="CANCELAR" OnClick="Button2_Click" />
</asp:Panel>


<asp:Panel ID="Panel2" runat="server" BackColor="#CCCCFF" Font-Bold="True" Font-Size="Larger" ForeColor="Black" Visible="False" OnLoad="Panel2_Load">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ACTUALIZADO CON EXITO!!!!!<br />
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click1" style="margin-left: 383px" Text="ACEPTAR" Width="107px" />
    <br />
    </asp:Panel>


<asp:Panel ID="Panel3" runat="server" BackColor="#CCCCFF" Font-Bold="True" Font-Size="Larger" ForeColor="Black" Visible="False" OnLoad="Panel2_Load">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ALTA REALIZADA CON EXITO!!!!!<br />
    <asp:Button ID="Button4" runat="server" OnClick="Button3_Click1" style="margin-left: 383px" Text="ACEPTAR" Width="107px" />
    <br />
    </asp:Panel>