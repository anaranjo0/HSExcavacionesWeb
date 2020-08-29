<%@ Page Title="" Language="C#" MasterPageFile="~/HSExcavaciones.Master" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="HSExcavacionesWeb.Factura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="css/Style.css" />
    <aside>
        <section class="section-dropdown">
            <div>
                <h2>AGRUPACION DE FACTURAS
                </h2>
            </div>
            <div>
                <div class="cliente-obra">
                    <div>Número de Factura</div>
                </div>
                <div class="factura">
                    <div>
                        <asp:TextBox ID="txtFactura" runat="server" CssClass="form-control" Width="300px" Height="30px"></asp:TextBox>
                    </div>
                    <div>
                        <asp:ImageButton ID="imgBuscarFactura" runat="server" Width="30px" Height="30px" ImageUrl="~/Imagenes/buscar.jpg" OnClick="imgBuscarFactura_Click" />
                    </div>
                </div>
                <div class="cliente-obra">
                    <div>Maquina(s)</div>
                </div>
                <div class="factura">
                    <div>
                        <asp:DropDownList ID="dpMaquina" runat="server" CssClass="form-control" Width="350px" Height="30px" DataSourceID="SqlMaquina" DataTextField="StrNombre_Maquina" DataValueField="IntCodigo_Maquina" AutoPostBack="True" OnSelectedIndexChanged="dpMaquina_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlMaquina" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesConnectionString %>" SelectCommand="Seleccionar_Maquinas" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtFactura" Name="IntFactura_Horom" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                   
                </div>
            </div>

        </section>
    </aside>
    <aside>

        <div class="grid">

            <asp:GridView ID="grdFactura" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlFactu" ForeColor="Black" GridLines="Vertical" OnRowDataBound="grdFactura_RowDataBound" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IntFactura_Horom" HeaderText="Número Factura" SortExpression="IntFactura_Horom" />
                    <asp:BoundField DataField="DtmFecha_Horom" HeaderText="Fecha" SortExpression="DtmFecha_Horom" ReadOnly="True" />

                    <asp:BoundField DataField="IntHoroIni_Horom" HeaderText="Horometro Inicial" SortExpression="IntHoroIni_Horom" />
                    <asp:BoundField DataField="IntHoroFin_Horom" HeaderText="Horometro Final" SortExpression="IntHoroFin_Horom" />

                    <asp:BoundField DataField="IntHorasOrdina_Horom" HeaderText="Horas Ordinaria" SortExpression="IntHorasOrdina_Horom" />
                    <asp:BoundField DataField="IntStandBy_Horom" HeaderText="Stand by" SortExpression="IntStandBy_Horom" />
                    <asp:BoundField DataField="IntHoroIniExt_Horom" HeaderText="Horometro Inicial Extra" SortExpression="IntHoroIniExt_Horom" />
                    <asp:BoundField DataField="IntHoroFinExt_Horom" HeaderText="Horometro Final Extra" SortExpression="IntHoroFinExt_Horom" />
                    <asp:BoundField DataField="IntHorasExtras_Horom" HeaderText="Horas Extras" SortExpression="IntHorasExtras_Horom" />

                    <asp:TemplateField HeaderText="Horas a Cobrar" SortExpression="IntHorasCobrar_Horom">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("IntHorasCobrar_Horom") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblhoras" runat="server" Font-Bold="True"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("IntHorasCobrar_Horom") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Valor Hora" SortExpression="DblValorHora_Horom">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DblValorHora_Horom") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("DblValorHora_Horom","{0:C}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subtotal" SortExpression="Total_Horas">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Total_Horas") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Total_Horas","{0:C}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transporte" SortExpression="DblTransporte_Horom">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DblTransporte_Horom") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lbltte" runat="server" Font-Bold="True"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DblTransporte_Horom","{0:C}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>

                 

                    <asp:TemplateField HeaderText="Valor" SortExpression="Valor">
                        <EditItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Valor") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblTFactura" runat="server" Font-Bold="True"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Valor","{0:C}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                    </asp:TemplateField>

                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlFactu" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesConnectionString %>" SelectCommand="Seleccionar_GridFactura" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtFactura" Name="intFactura_horometro" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="dpMaquina" Name="intCodigo_Maquina" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
        <div class="boton">
            <asp:Button ID="btnDescargar" Text="Descargar" runat="server" CssClass="form-control" OnClick="btnDescargar_Click" Width="100px" Visible="False" />
        </div>


        <div>

            <asp:SqlDataSource ID="SqlFactura" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesConnectionString %>" SelectCommand="Seleccionar_GridFactura" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtFactura" Name="intFactura_horometro" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="dpMaquina" Name="intCodigo_Maquina" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

    </aside>


</asp:Content>
