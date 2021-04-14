<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormPeliculas.aspx.cs" Inherits="WebApplication11.WebFormPeliculas" MasterPageFile="~/Site1.Master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="row">
        <body>
            <div>
                <br />
                Nombre:<asp:TextBox ID="TextBox1" runat="server" Width="566px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" Width="169px" />
                <br />
                <br />
                <!--
        <table class="auto-style1" style="background-color:#333333;color:white">
            <tr>
                <td></td>
                <td>imagen</td>
                <td>nombre_pelicula</td>
                <td>fecha_registro</td>
                <td>cantidad_disponible</td>
                <td>preview</td>
            </tr>
        </table>!-->

                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="check" Width="50" />
                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                    <Columns>
                        <asp:TemplateField>

                            <ItemTemplate>
                                <asp:Image ID="Image1" src="./imagenes/movie.png" runat="server" Width="50" />
                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
            <script>        
            </script>
    </div>
</asp:Content>

