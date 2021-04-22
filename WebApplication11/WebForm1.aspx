<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication11.WebForm1" MasterPageFile="~/Site1.Master" %>

<%@ Register Src="~/WebUserControl1.ascx" TagPrefix="uc1" TagName="ContactUC" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <uc1:ContactUC runat="server" ID="ContactUC" Visible="true" />
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


    <div class="row" id="row_total" runat="server">
        <p style="background-color:#507CD1;color:white"><strong>TOTAL A PAGAR:</strong></p>
        <asp:GridView ID="GridView4" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
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
        </asp:GridView>
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
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Style="margin-left: 389px" Text="ACTUALIZAR" /></td>
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
                    <td colspan="2">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Style="margin-left: 389px" Text="ALTA USUARIO" /></td>
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
                    <asp:Button ID="Button3" runat="server" OnClick="Button2_Click" Style="margin-left: 77px" Text="CONTACTAR" />
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
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

            <tfoot>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </tfoot>
        </table>

        <br />

          

        
        <br />

    </div>

    <div class="row" id="div_movie" runat="server">
        Nombre:<asp:TextBox ID="TextBox18" runat="server" Width="649px" style="margin-top: 0px" OnTextChanged="TextBox18_TextChanged"></asp:TextBox>
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Buscar" Width="145px" OnInit="Button5_Click" />
                
        
        
        
        
        
        <br />
        <br />
        <!--
        <table class="auto-style1 tabla" id="tabla_buscar_usuario" runat="server">
            <tr>
                <td class="auto-style4">id_usuario</td>
                <td class="auto-style4">nombre</td>
                <td class="auto-style4">apellido</td>
                <td class="auto-style4">edad</td>
                <td class="auto-style4">edo civil</td>
                <td class="auto-style4">Telefono</td>
                <td class="auto-style4">Ciudad</td>
                <td class="auto-style4">fecha registro</td>
            </tr>
            
        </table>!-->
                
        
        
        
        
        
        <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%"  AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
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
                </asp:GridView>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        </asp:ScriptManagerProxy>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
            <ContentTemplate>
               <!-- <asp:Timer ID="Timer1" runat="server" Interval="3600" ontick="Timer1_Tick"></asp:Timer>!-->
              
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button5" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="GridView3" EventName="Unload" />
                <asp:AsyncPostBackTrigger ControlID="GridView3" EventName="PageIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>


        <br />
        <br />
        <br />

        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
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

              <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                       CANTIDAD
                    </HeaderTemplate>
                    <ItemTemplate>
                        
                       <asp:TextBox runat="server" Width="50" ID="cantid_a_restar" />
                    </ItemTemplate>

                </asp:TemplateField>
               
            </Columns>


            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                       TIPO
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DropDownList  runat="server"  ID="tipo">
                             <asp:ListItem Text="Comprar" Value="0">------</asp:ListItem>
                            <asp:ListItem Text="Comprar" Value="1"></asp:ListItem>
                             <asp:ListItem Text="Rentar" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                     
                    </ItemTemplate>

                </asp:TemplateField>
               
            </Columns>


        </asp:GridView>
        <asp:Button ID="Button4" runat="server" Height="41px" Style="margin-left: 508px; background-color: #507CD1; color: white; border-radius: 50px" Text="Comprar/Rentar" Width="500px" OnClick="Button4_Click" PostBackUrl="~/WebForm1.aspx" />
    </div>







</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
        }

        .auto-style3 {
            width: 376px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:TextBox ID="TextBox16" runat="server" Visible="False"></asp:TextBox>

    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Larger" ForeColor="#284E98" ItemWrap="True" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" StaticSubMenuIndent="10px" Width="100%" Height="100px" RenderingMode="Table">
        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicMenuStyle BackColor="#B5C7DE" />
        <DynamicSelectedStyle BackColor="#507CD1" />
        <Items>
            <asp:MenuItem Text="Inicio" Value="Inicio" ImageUrl="~/imagenes/home.jpg"></asp:MenuItem>
            <asp:MenuItem Text="Peliculas" ImageUrl="~/imagenes/movie.png" Value="Peliculas"></asp:MenuItem>
            <asp:MenuItem Text="Altas" Value="Altas" ImageUrl="~/imagenes/insert_new.png"></asp:MenuItem>
            <asp:MenuItem Text="Detalles" Value="Detalles" ImageUrl="~/imagenes/view-details.png"></asp:MenuItem>
            <asp:MenuItem Text="Contacto" Value="Contacto" ImageUrl="~/imagenes/email.jpg"></asp:MenuItem>
            <asp:MenuItem Text="About" Value="About" ImageUrl="~/imagenes/about-icon-png-13.jpg"></asp:MenuItem>
            <asp:MenuItem Text="Salir" Value="Salir" ImageUrl="~/imagenes/exit.png"></asp:MenuItem>
        </Items>
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticSelectedStyle BackColor="#507CD1" />
    </asp:Menu>

</asp:Content>
