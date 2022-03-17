<%@ Page Title="" Language="C#" MasterPageFile="~/HSExcavaciones.Master" AutoEventWireup="true" CodeBehind="Maquinas.aspx.cs" Inherits="HSExcavacionesWeb.Maquinas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="css/Style.css" />
    <aside>
        <section class="section-dropdown" >
            <div>
                <h2>CREACION MAQUINAS
                </h2>
            </div>
            <div >
                <div class="cliente-obra">
                    <div>Maquinas:</div>
                    <div>
                        <asp:DropDownList ID="dpConsultaMaquinas" runat="server" CssClass="form-control" Width="300px" Height="30px" DataSourceID="SqlMaquina" DataTextField="StrNombre_Maquina" DataValueField="IntCodigo_Maquina" AutoPostBack="True" OnSelectedIndexChanged="dpConsultaMaquinas_SelectedIndexChanged" ></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlMaquina" runat="server" ConnectionString="<%$ ConnectionStrings:DBHSExcavcionesConnectionString %>" SelectCommand="SELECT [IntCodigo_Maquina], [StrNombre_Maquina] FROM [TblMaquina] order by  [StrNombre_Maquina] asc"></asp:SqlDataSource>
                    </div>
                    <div>
                        <asp:LinkButton ID="lnkNuevo" runat="server" Text="Nuevo" Width="100px" OnClick="lnkNuevo_Click" ></asp:LinkButton>
                    </div>
                </div>
                <div class="cliente-obra">
                    <div>Nombre Maquina:</div>
                    <div>
                        <asp:TextBox ID="txtNomMaquina" runat="server" CssClass="form-control" Width="300px" Height="30px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVingresar" runat="server" ControlToValidate="txtNomMaquina" ErrorMessage="Campo obligatorio" ForeColor="Red" ValidationGroup="ValIngreso"></asp:RequiredFieldValidator>
                    </div>
                    
                </div>
                <div class="cliente-obra">
                    <div>Modelo Maquina:</div>
                    <div>
                        <asp:TextBox ID="txtModMaquina" runat="server" CssClass="form-control" Width="300px" Height="30px" MaxLength="90"></asp:TextBox>
                    </div>
                </div>
                <div class="cliente-obra">
                    <div>Estado Maquina:</div>
                    <div>
                        <asp:RadioButtonList ID="RdEstado" runat="server" Height="25px" RepeatDirection="Horizontal" Width="174px" AutoPostBack="True">
                            <asp:ListItem> Activo </asp:ListItem>
                            <asp:ListItem> Inactivo </asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                        <br />
                    </div>
                    <div>
                        <asp:LinkButton ID="lnkGuardar" runat="server"  Text="Guardar" Width="100px" OnClick="lnkGuardar_Click" ValidationGroup="ValIngreso"></asp:LinkButton>
                 &nbsp;<asp:LinkButton ID="lnkActualizar" runat="server"  Text="Actualizar" Width="100px" OnClick="lnkActualizar_Click" ValidationGroup="ValIngreso"></asp:LinkButton>
                        <asp:LinkButton ID="lnkEliminar" runat="server"  Text="Eliminar" Width="100px" EnableTheming="True" OnClick="lnkEliminar_Click"></asp:LinkButton>
                    </div>
                    
                   
                </div>
              
                <div class="cliente-obra">
                    <asp:Label ID="lblError" runat="server"></asp:Label> 
                </div>
            </div>
        </section>
    </aside>
</asp:Content>
