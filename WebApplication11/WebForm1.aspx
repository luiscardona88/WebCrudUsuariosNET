<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication11.WebForm1"  MasterPageFile="~/Site1.Master"%>
<%@ Register Src="~/WebUserControl1.ascx" TagPrefix="uc1" TagName="ContactUC" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder2">
     <uc1:ContactUC runat="server" id="ContactUC" Visible="true"/>  
            <div class="row" runat="server" id="row_lista">
             
                <br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand" Height="171px">
                    <AlternatingRowStyle BackColor="White" />
               
                    <Columns>
                        <asp:TemplateField>

                             <ItemTemplate>
        <asp:Image ID="Image1" ImageUrl="https://www.iconninja.com/files/634/848/842/man-user-customer-icon.png" runat="server" Width="50" />
      </ItemTemplate>

                        </asp:TemplateField>
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
                    <asp:TextBox ID="TextBox1" runat="server" Width="343px" ReadOnly="True" Height="34px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Nombre</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="343px" Height="31px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Apellido</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="343px" Height="29px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Edad</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="343px" Height="31px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Estado Civil</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Width="343px" Height="32px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Telefono</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Width="343px" Height="29px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Ciudad</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" Width="343px" Height="29px"></asp:TextBox>
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
                    <asp:TextBox ID="TextBox9" runat="server" Width="343px" Height="32px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Apellido</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" Width="343px" Height="36px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Edad</td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" Width="343px" Height="32px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Estado Civil</td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server" Width="343px" Height="31px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Telefono</td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server" Width="343px" Height="33px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Ciudad</td>
                <td>
                    <asp:TextBox ID="TextBox14" runat="server" Width="343px" Height="31px"></asp:TextBox>
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



    
        <div class="row" id="div_contacto" runat="server">
        <br />
        <table class="auto-style1" runat="server" id="Table2">
            <tr>
                <td class="auto-style2" colspan="2" style="background-color: #3366CC; color: #FFFFFF; font-weight: bold;">CONTACTO</td>
            </tr>
            
            <tr>
                <td class="auto-style3">Nombre</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" Width="343px" Height="41px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Correo</td>
                <td>
                    <asp:TextBox ID="TextBox15" runat="server" Width="343px" Height="38px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Asunto</td>
                <td>
                    <asp:TextBox ID="TextBox17" runat="server" Width="343px" Height="64px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="30px" Width="380px" OnLoad="FileUpload1_Load" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="Button3" runat="server" OnClick="Button2_Click" style="margin-left: 77px" Text="CONTACTAR" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    &nbsp;</td>
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
                    <td colspan="2">   &nbsp;</td>
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





