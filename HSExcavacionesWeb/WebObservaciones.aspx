<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebObservaciones.aspx.cs" Inherits="HSExcavacionesWeb.WebObservaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</head>
<body>
    <link rel="stylesheet" href="css/Style.css" />
    <form id="form1" runat="server">
        <section class="observatext">
            <div>
                <h2>OBSERVACIONES
                </h2>
            </div>
            <div class="Multilinetexto">
                <asp:TextBox ID="txtObservacion" runat="server" CssClass="form-control" Height="300px" TextMode="MultiLine" Width="600px"></asp:TextBox>
            </div>
            <div class="botonobserva">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" Height="50px" Width="100px" />
            </div>
        </section>
    </form>
</body>
</html>
