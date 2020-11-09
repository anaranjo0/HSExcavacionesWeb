<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true"  EnableEventValidation="true" MasterPageFile="~/HSExcavaciones.Master" AutoEventWireup="true" CodeBehind="WebMaquinas.aspx.cs" Inherits="HSExcavacionesWeb.WebMaquinas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
      <style type="text/css">
        .lbl {
            background: rgba(0, 0, 0, 0);
            border: none;
            text-align: center;
            
        }
        .auto-style1 {
            width: 152px;
        }
        .auto-style2 {
            width: 72px;
        }
        </style>
   


</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <link rel="stylesheet" href="css/Style.css" />
    <script type="text/javascript" src="js/Funciones.js"></script>
     
   

   <section class="section-dropdown">
       <div>
           <h2>
               HOROMETRO POR MAQUINA
           </h2>
       </div>
       <div>
           <div>Maquina</div>
       </div>
       <div>
            <asp:DropDownList ID="DPMaquina" runat="server" CssClass="form-control" Width="400px" DataSourceID="SqlMaquina" DataTextField="StrNombre_Maquina" DataValueField="IntCodigo_Maquina" AutoPostBack="True" OnSelectedIndexChanged="DPMaquina_SelectedIndexChanged">
                <asp:ListItem Selected="True">Seleccionar</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlMaquina" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesConnectionString %>" SelectCommand="SELECT [IntCodigo_Maquina], [StrNombre_Maquina] FROM [TblMaquina] ORDER BY [StrNombre_Maquina] ASC"></asp:SqlDataSource>
       </div>
    </section>

       <section>
       <div >
           
                <div >
                <asp:GridView ID="GRDmaquinaria" runat="server"  AutoGenerateColumns="False" DataSourceID="SQLDTGHorometro" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IntCodigo_Horom" ForeColor="Black" GridLines="Vertical" Height="247px" ShowFooter="True" OnRowDataBound="GRDmaquinaria_RowDataBound" OnDataBound="GRDmaquinaria_DataBound" PageSize="360"  >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="IntCodigo_Horom" InsertVisible="False" ShowHeader="False" SortExpression="IntCodigo_Horom" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("IntCodigo_Horom") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblcodhorom" runat="server" Text='<%# Bind("IntCodigo_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha" SortExpression="DtmFecha_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEFecha" runat="server" CssClass="form-control" onKeyPress="return NumCheck(event,this)" Text='<%# Bind("FechaActualiza") %>' Width="180px"></asp:TextBox>
                            </EditItemTemplate>
                             <FooterTemplate>
                                <table style="width:100%;">
                                    <tr>
                                        <td class="auto-style1">
                                            <asp:TextBox ID="TxtFFecha" runat="server" CssClass="form-control" MaxLength="10" ReadOnly="True" Text='<%# Bind("FechaInsertar") %>' Width="140px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style2">
                                            <asp:ImageButton ID="btnFecha" runat="server" Height="26px" ImageUrl="~/Imagenes/calendario3.jpg" OnClick="btnFecha_Click" Width="31px" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:Calendar ID="ClFecha" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="150px" NextPrevFormat="ShortMonth" Width="100px" DayNameFormat="FirstLetter" FirstDayOfWeek="Sunday" OnSelectionChanged="ClFecha_SelectionChanged" TitleFormat="Month" Visible="False">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtFFecha" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblIFecha" runat="server" Text='<%# Bind("DtmFecha_Horom") %>' Width="180px"></asp:Label>
                                 <br />
                                <asp:Label ID="lblFeIngreso" runat="server" Text='<%# Bind("FechaInsertar") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:BoundField DataField="IntCodigo_Maquina" SortExpression="IntCodigo_Maquina" ReadOnly="True" Visible="False" HeaderText="IntCodigo_Maquina" />
                       
                        <asp:TemplateField HeaderText="Horometo Inicial" SortExpression="IntHoroIni_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtHIni" runat="server" Text='<%# Bind("IntHoroIni_Horom") %>' CssClass="form-control" MaxLength="9" Width="70px" onKeyPress="return NumCheck(event,this)" AutoPostBack="True" OnTextChanged="txtHIni_TextChanged"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFHinicial" runat="server" CssClass="form-control" MaxLength="9" Width="70px" onKeyPress="return NumCheck(event,this)">0</asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtFHinicial" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblHinicial" runat="server" Text='<%# Bind("IntHoroIni_Horom") %>'></asp:Label>
                                &nbsp;<asp:ImageButton ID="ImgObservaHoro" runat="server" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagenes/t1.png" Visible="False"  onClick="ImgObserva_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Horometro Final" SortExpression="IntHoroFin_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtHFin" runat="server" Text='<%# Bind("IntHoroFin_Horom") %>' CssClass="form-control" MaxLength="9" Width="70px" onKeyPress="return NumCheck(event,this)" AutoPostBack="True" OnTextChanged="txtHFin_TextChanged"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFHfinal" runat="server" CssClass="form-control" MaxLength="9" Width="70px" onKeyPress="return NumCheck(event,this)" AutoPostBack="True" OnTextChanged="TxtFHfinal_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtFHfinal" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblHFinal" runat="server" Text='<%# Bind("IntHoroFin_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Horas Ordinarias" SortExpression="IntHorasOrdina_Horom">
                            <EditItemTemplate>
                                
                                <asp:Label ID="LblHOrdi" runat="server" Text='<%# Bind("IntHorasOrdina_Horom") %>' ></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("IntHorasOrdina_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="StandBy" SortExpression="IntStandBy_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtEStandby" runat="server" Text='<%# Bind("IntStandBy_Horom") %>' CssClass="form-control" MaxLength="4" Width="60px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFStandby" runat="server" CssClass="form-control" MaxLength="4" Width="60px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtFStandby" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("IntStandBy_Horom") %>'></asp:Label>
                                &nbsp;<asp:ImageButton ID="ImgObserva" runat="server" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagenes/t1.png" Visible="False"  onClick="ImgObserva_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Horometro Inicial Extra" SortExpression="IntHoroIniExt_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtEHIExtra" runat="server" Text='<%# Bind("IntHoroIniExt_Horom") %>' CssClass="form-control" MaxLength="9" Width="70px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFHoroIniExt" runat="server" CssClass="form-control" MaxLength="9" Text='0' Width="70px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtFHoroIniExt" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("IntHoroIniExt_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Horometro Final Extra" SortExpression="IntHoroFinExt_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtHFinalExtra" runat="server" Text='<%# Bind("IntHoroFinExt_Horom") %>' CssClass="form-control" MaxLength="9" Width="70px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFHoroFinExt" runat="server" CssClass="form-control" MaxLength="9" Text='0' Width="70px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtFHoroFinExt" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblHFinalExtra" runat="server" Text='<%# Bind("IntHoroFinExt_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora Inicial Extra" SortExpression="IntHoraIniExt_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("IntHoraIniExt_Horom") %>' CssClass="form-control" MaxLength="4" Width="60px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFHoraIniExt" runat="server" CssClass="form-control" MaxLength="4" Text='0' Width="60px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TxtFHoraIniExt" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("IntHoraIniExt_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora Final Extra" SortExpression="IntHoraFinExt_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("IntHoraFinExt_Horom") %>' CssClass="form-control" MaxLength="4" Width="60px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFHoraFinExt" runat="server" CssClass="form-control" MaxLength="4" Text='0' Width="60px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TxtFHoraFinExt" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("IntHoraFinExt_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Horas Extras" SortExpression="IntHorasExtras_Horom">
                            <EditItemTemplate>
                                <asp:Label ID="LblHExtras" runat="server" Text='<%# Bind("IntHorasExtras_Horom") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("IntHorasExtras_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Horas a Cobrar" SortExpression="IntHorasCobrar_Horom">
                            <EditItemTemplate>
                                <asp:Label ID="LblHCobrar" runat="server" Text='<%# Bind("IntHorasCobrar_Horom") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("IntHorasCobrar_Horom") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Font-Bold="True" Font-Size="Large" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Valor Hora" SortExpression="DblValorHora_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("DblValorHora_Horom") %>' CssClass="form-control" MaxLength="6" Width="100px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtValorHora" runat="server" CssClass="form-control" MaxLength="6" Width="100px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TxtValorHora" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblValorHora" runat="server" Text='<%# Bind("DblValorHora_Horom","{0:C}") %>' Width="100px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subtotal" SortExpression="Total_Horas">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Total_Horas") %>' Width="120px"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label17" runat="server" Text='<%# Bind("Total_Horas","{0:C}") %>' Width="120px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Transporte" SortExpression="DblTransporte_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("DblTransporte_Horom") %>' CssClass="form-control" MaxLength="7" Width="120px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFTransp" runat="server" CssClass="form-control" MaxLength="7" Text='0' Width="120px" onKeyPress="return NumCheck(event,this)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TxtFTransp" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("DblTransporte_Horom","{0:C}") %>' Width="120px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total a Pagar" SortExpression="Cobrar_Diario">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cobrar_Diario") %>' Width="120px"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label18" runat="server" Text='<%# Bind("Cobrar_Diario","{0:C}") %>' Width="120px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Factura" SortExpression="IntFactura_Horom">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("IntFactura_Horom") %>' CssClass="form-control" MaxLength="15" Width="70px" ></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TxtFFactura" runat="server" CssClass="form-control" MaxLength="15" Width="70px" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TxtFFactura" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("IntFactura_Horom") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Cliente" SortExpression="StrDocumento_Cliente">
                            <EditItemTemplate>
                                
                                <asp:DropDownList ID="DPECliente" runat="server" CssClass="form-control" DataSourceID="SqlECliente" DataTextField="StrNombre_Cliente" DataValueField="StrDocumento_Cliente" SelectedValue='<%# Bind("StrDocumento_Cliente") %>' Width="90px" OnSelectedIndexChanged="DPECliente_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlECliente" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesCOIMAQ %>" SelectCommand="SELECT [StrDocumento_Cliente], [StrNombre_Cliente] FROM [TblCliente] ORDER BY [StrNombre_Cliente]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <FooterTemplate>
                               
                                <asp:DropDownList ID="DPFCliente" runat="server" CssClass="form-control" DataSourceID="SqlFcliente" DataTextField="StrNombre_Cliente" DataValueField="StrDocumento_Cliente" Width="90px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlFcliente" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesConnectionString %>" SelectCommand="SELECT [StrDocumento_Cliente], [StrNombre_Cliente] FROM [TblCliente] ORDER BY [StrNombre_Cliente]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="DPFCliente" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>

                                

                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Bind("StrNombre_Cliente") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Obra" >
                            <EditItemTemplate>
                               <asp:DropDownList ID="DPEObra" runat="server" CssClass="form-control"  DataTextField="StrNombre_Obra" DataValueField="Intcodigo_Obra" Width="90px" DataSourceID="Sqldpobra" SelectedValue='<%# Bind("Intcodigo_Obra") %>'>
                                </asp:DropDownList>
                                
                                <asp:SqlDataSource ID="Sqldpobra" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesCOIMAQ %>" SelectCommand="SELECT [Intcodigo_Obra], [StrNombre_Obra] FROM [TblObra] ORDER BY [StrNombre_Obra]">
                                    
                                </asp:SqlDataSource>
                                
                           <%--       <asp:DropDownList ID="DPEObra" runat="server" CssClass="form-control" DataSourceID="SQLObra" DataTextField="StrNombre_Obra" DataValueField="Intcodigo_Obra" SelectedValue='<%# Bind("Intcodigo_Obra") %>' Width="90px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SQLObra" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesConnectionString %>" SelectCommand="SELECT [Intcodigo_Obra], [StrNombre_Obra] FROM [TblObra] ORDER BY [StrNombre_Obra]"></asp:SqlDataSource>
                          --%>

                      
                            </EditItemTemplate>
                            <FooterTemplate>
                                
                                <asp:DropDownList ID="DPFObra" runat="server" CssClass="form-control" DataSourceID="SQLFObra" DataTextField="StrNombre_Obra" DataValueField="Intcodigo_Obra" Width="110px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SQLFObra" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesConnectionString %>" SelectCommand="SELECT [Intcodigo_Obra], [StrNombre_Obra] FROM [TblObra] ORDER BY [StrNombre_Obra]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="DPFObra" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="Ingresar"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("StrNombre_Obra") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Observaciones" SortExpression="strObservacion_Horom">
                            <ItemTemplate>
                                <asp:Label ID="lblObserva" runat="server" Text='<%# Bind("strObservacion_Horom") %>' Visible="False"></asp:Label>
                                <asp:Label ID="lblObsSiNo" runat="server"></asp:Label>
                                &nbsp;<asp:ImageButton ID="ImgObservabtn" runat="server" Height="25px" ImageAlign="AbsMiddle" ImageUrl="~/Imagenes/t1.png" onClick="ImgObserva_Click" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <asp:LinkButton ID="LnkIngresar" runat="server" ForeColor="Black" OnClick="LnkIngresar_Click" ValidationGroup="Ingresar">Ingresar</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" CssClass="headerFreez" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                </div>
                <div class="error">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </div>
                <asp:SqlDataSource ID="SQLDTGHorometro" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesCOIMAQ %>" SelectCommand="SELECT TblHorometro.IntCodigo_Horom, (CASE DATEPART(dw , DtmFecha_Horom) WHEN 2 THEN 'Lunes' WHEN 3 THEN 'Martes' WHEN 4 THEN 'Miércoles' 
WHEN 5 THEN 'Jueves' WHEN 6 THEN 'Viernes' WHEN 7 THEN 'Sábado' WHEN 1 THEN 'Domingo' END) + ' ' + FORMAT(TblHorometro.DtmFecha_Horom, 
'dd MMM yyyy') AS DtmFecha_Horom, FORMAT(TblHorometro.DtmFecha_Horom, 'dd/MM/yyyy') AS FechaActualiza, TblHorometro.IntCodigo_Maquina, 
TblHorometro.IntHoroIni_Horom, TblHorometro.IntHoroFin_Horom, TblHorometro.IntHoroFin_Horom - TblHorometro.IntHoroIni_Horom AS 
IntHorasOrdina_Horom, TblHorometro.IntStandBy_Horom, TblHorometro.IntHoroIniExt_Horom, TblHorometro.IntHoroFinExt_Horom, 
TblHorometro.IntHoraIniExt_Horom, TblHorometro.IntHoraFinExt_Horom, TblHorometro.IntHoraFinExt_Horom - TblHorometro.IntHoraIniExt_Horom 
AS IntHorasExtras_Horom, TblHorometro.IntStandBy_Horom + (TblHorometro.IntHoraFinExt_Horom - TblHorometro.IntHoraIniExt_Horom) 
AS IntHorasCobrar_Horom, TblHorometro.DblValorHora_Horom, (TblHorometro.IntStandBy_Horom + (TblHorometro.IntHoraFinExt_Horom - 
TblHorometro.IntHoraIniExt_Horom)) * TblHorometro.DblValorHora_Horom AS Total_Horas, TblHorometro.DblTransporte_Horom, 
(TblHorometro.IntStandBy_Horom + (TblHorometro.IntHoraFinExt_Horom - TblHorometro.IntHoraIniExt_Horom)) * TblHorometro.DblValorHora_Horom 
+ TblHorometro.DblTransporte_Horom AS Cobrar_Diario, trim(TblHorometro.IntFactura_Horom) as IntFactura_Horom, TblHorometro.Intcodigo_Obra, 
TblHorometro.StrDocumento_Cliente, TblObra.StrNombre_Obra, TblCliente.StrNombre_Cliente,TblHorometro.strObservacion_Horom,
(select top 1 format((DATEADD(DAY,1,DtmFecha_Horom)),'dd/MM/yyyy') from TblHorometro where TblHorometro.IntCodigo_Maquina = @original_IntCodigo_Maquina order by DtmFecha_Horom desc) as FechaInsertar
FROM TblHorometro INNER JOIN TblObra ON TblHorometro.Intcodigo_Obra = 
TblObra.Intcodigo_Obra INNER JOIN TblCliente ON TblHorometro.StrDocumento_Cliente = TblCliente.StrDocumento_Cliente 
WHERE (TblHorometro.IntCodigo_Maquina = @original_IntCodigo_Maquina) ORDER BY TblHorometro.DtmFecha_Horom ASC

" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [TblHorometro] WHERE [IntCodigo_Horom] = @original_IntCodigo_Horom AND [DtmFecha_Horom] = @original_DtmFecha_Horom AND [IntCodigo_Maquina] = @original_IntCodigo_Maquina AND [IntHoroIni_Horom] = @original_IntHoroIni_Horom AND [IntHoroFin_Horom] = @original_IntHoroFin_Horom AND [IntHorasOrdina_Horom] = @original_IntHorasOrdina_Horom AND [IntStandBy_Horom] = @original_IntStandBy_Horom AND [IntHoroIniExt_Horom] = @original_IntHoroIniExt_Horom AND [IntHoroFinExt_Horom] = @original_IntHoroFinExt_Horom AND [IntHoraIniExt_Horom] = @original_IntHoraIniExt_Horom AND [IntHoraFinExt_Horom] = @original_IntHoraFinExt_Horom AND [IntHorasExtras_Horom] = @original_IntHorasExtras_Horom AND [IntHorasCobrar_Horom] = @original_IntHorasCobrar_Horom AND [DblValorHora_Horom] = @original_DblValorHora_Horom AND [DblTransporte_Horom] = @original_DblTransporte_Horom AND [IntFactura_Horom] = @original_IntFactura_Horom AND [Intcodigo_Obra] = @original_Intcodigo_Obra AND [StrDocumento_Cliente] = @original_StrDocumento_Cliente" InsertCommand="INSERT INTO [TblHorometro] ([DtmFecha_Horom], [IntCodigo_Maquina], [IntHoroIni_Horom], [IntHoroFin_Horom], [IntHorasOrdina_Horom], [IntStandBy_Horom], [IntHoroIniExt_Horom], [IntHoroFinExt_Horom], [IntHoraIniExt_Horom], [IntHoraFinExt_Horom], [IntHorasExtras_Horom], [IntHorasCobrar_Horom], [DblValorHora_Horom], [DblTransporte_Horom], [IntFactura_Horom], [Intcodigo_Obra], [StrDocumento_Cliente]) VALUES (@DtmFecha_Horom, @IntCodigo_Maquina, @IntHoroIni_Horom, @IntHoroFin_Horom, @IntHorasOrdina_Horom, @IntStandBy_Horom, @IntHoroIniExt_Horom, @IntHoroFinExt_Horom, @IntHoraIniExt_Horom, @IntHoraFinExt_Horom, @IntHorasExtras_Horom, @IntHorasCobrar_Horom, @DblValorHora_Horom, @DblTransporte_Horom, @IntFactura_Horom, @Intcodigo_Obra, @StrDocumento_Cliente)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE TblHorometro SET DtmFecha_Horom = CONVERT(DATETIME,@FechaActualiza,103), 
IntHoroIni_Horom = @IntHoroIni_Horom, 
IntHoroFin_Horom = @IntHoroFin_Horom, 
IntStandBy_Horom = @IntStandBy_Horom, 
IntHoroIniExt_Horom = @IntHoroIniExt_Horom, 
IntHoroFinExt_Horom = @IntHoroFinExt_Horom, 
IntHoraIniExt_Horom = @IntHoraIniExt_Horom, 
IntHoraFinExt_Horom = @IntHoraFinExt_Horom, 
DblValorHora_Horom = @DblValorHora_Horom, 
DblTransporte_Horom = @DblTransporte_Horom, 
IntFactura_Horom = @IntFactura_Horom, 
Intcodigo_Obra = @Intcodigo_Obra, 
StrDocumento_Cliente = @StrDocumento_Cliente 
WHERE (IntCodigo_Horom = @original_IntCodigo_Horom)">
                    <DeleteParameters>
                        <asp:Parameter Name="original_IntCodigo_Horom" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="original_DtmFecha_Horom" />
                        <asp:Parameter Name="original_IntCodigo_Maquina" Type="Int32" />
                        <asp:Parameter Name="original_IntHoroIni_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntHoroFin_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntHorasOrdina_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntStandBy_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntHoroIniExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntHoroFinExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntHoraIniExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntHoraFinExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntHorasExtras_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntHorasCobrar_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_DblValorHora_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_DblTransporte_Horom" Type="Decimal" />
                        <asp:Parameter Name="original_IntFactura_Horom" Type="String" />
                        <asp:Parameter Name="original_Intcodigo_Obra" Type="Int32" />
                        <asp:Parameter Name="original_StrDocumento_Cliente" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter DbType="Date" Name="DtmFecha_Horom" />
                        <asp:Parameter Name="IntCodigo_Maquina" Type="Int32" />
                        <asp:Parameter Name="IntHoroIni_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoroFin_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHorasOrdina_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntStandBy_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoroIniExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoroFinExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoraIniExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoraFinExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHorasExtras_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHorasCobrar_Horom" Type="Decimal" />
                        <asp:Parameter Name="DblValorHora_Horom" Type="Decimal" />
                        <asp:Parameter Name="DblTransporte_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntFactura_Horom" Type="String" />
                        <asp:Parameter Name="Intcodigo_Obra" Type="Int32" />
                        <asp:Parameter Name="StrDocumento_Cliente" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DPMaquina" Name="original_IntCodigo_Maquina" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FechaActualiza" />
                        <asp:Parameter Name="IntHoroIni_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoroFin_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntStandBy_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoroIniExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoroFinExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoraIniExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntHoraFinExt_Horom" Type="Decimal" />
                        <asp:Parameter Name="DblValorHora_Horom" Type="Decimal" />
                        <asp:Parameter Name="DblTransporte_Horom" Type="Decimal" />
                        <asp:Parameter Name="IntFactura_Horom" Type="string" />
                        <asp:Parameter Name="Intcodigo_Obra" Type="string" />
                        <asp:Parameter Name="StrDocumento_Cliente" Type="String" />
                        <asp:Parameter Name="original_IntCodigo_Horom" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
   </div>
   </section>
    
   
</asp:Content>

