<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication11.WebForm1"  MasterPageFile="~/Site1.Master"%>
<%@ Register Src="~/WebUserControl1.ascx" TagPrefix="uc1" TagName="ContactUC" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder2">
     <uc1:ContactUC runat="server" id="ContactUC" Visible="true"/>  
            <div class="row" runat="server" id="row_lista">
             
                <br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="779px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand" Height="171px">
                    <AlternatingRowStyle BackColor="White" />
               
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:ButtonField ButtonType="Button" CommandName="Eliminar" Text="Eliminar" />
                        <asp:ButtonField ButtonType="Button" CommandName="Editar" Text="Editar" />
                        <asp:ButtonField ButtonType="Button" CommandName="Cancelar" Text="Cancelar" />
                        <asp:ButtonField CommandName="Actualizar" Text="Actualizar" ButtonType="Button" />
                    </Columns>

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
                </asp:GridView>
                <br />
                <br />

            </div>

    <div class="row" id="row_edicion" runat="server">


        <br />
        <table class="auto-style1" runat="server" id="tabla_edicion">
            <tr>
                <td class="auto-style2" colspan="2" style="background-color: #3366CC; color: #FFFFFF; font-weight: bold;">EDICION DE DATOS</td>
            </tr>
            <tr>
                <td class="auto-style3">Id Usuario</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="343px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Nombre</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Apellido</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Edad</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Estado Civil</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Telefono</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Ciudad</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tfoot>
                <tr>
                    <td colspan="2">   <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" style="margin-left: 389px" Text="ACTUALIZAR" /></td>
                </tr>
            </tfoot>
        </table>
     
        <br />
        <br />


    </div>




        <div class="row" id="row_alta" runat="server">
        <br />
        <table class="auto-style1" runat="server" id="Table1">
            <tr>
                <td class="auto-style2" colspan="2" style="background-color: #3366CC; color: #FFFFFF; font-weight: bold;">ALTAS DE USUARIOS</td>
            </tr>
            
            <tr>
                <td class="auto-style3">Nombre</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Apellido</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Edad</td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Estado Civil</td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Telefono</td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Ciudad</td>
                <td>
                    <asp:TextBox ID="TextBox14" runat="server" Width="343px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tfoot>
                <tr>
                    <td colspan="2">   <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 389px" Text="ALTA USUARIO" /></td>
                </tr>
            </tfoot>
        </table>
     
        <br />
        <br />


    </div>


        </asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 376px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
        
            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Larger" ForeColor="#284E98" ItemWrap="True" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" StaticSubMenuIndent="10px" Width="100%" Height="100px" RenderingMode="Table">
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <Items>
                    <asp:MenuItem Text="Inicio" Value="Inicio"></asp:MenuItem>
                    <asp:MenuItem Text="Altas" Value="Altas"></asp:MenuItem>
                    <asp:MenuItem Text="Detalles" Value="Detalles"></asp:MenuItem>
                    <asp:MenuItem Text="Contacto" Value="Contacto"></asp:MenuItem>
                    <asp:MenuItem Text="About" Value="About"></asp:MenuItem>
                    <asp:MenuItem Text="Salir" Value="Salir"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
        
        </asp:Content>




