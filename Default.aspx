<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridWithBigImage._Default" EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="false">
    <div>


    <dx:ASPxGridView runat="server" ID="grid" Width="100%" ClientInstanceName="grid"
KeyFieldName="Oid" AutoGenerateColumns="False" EnableViewState="false">
<SettingsPager PageSize="3"></SettingsPager>
<ClientSideEvents EndCallback="function(s,e){ SetPopupElementID(); }" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Image" FieldName="Name" Width="115px">
                <DataItemTemplate>
                <img src='<%# Eval("ImgPath") %>' id="img<%# Eval("Oid") %>" alt="" bigsrc='<%# Eval("ImgBigPath") %>' class="grid_img" />
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Name" FieldName="Name">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>

    <dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup"
        EnableViewState="false" ShowHeader="false" PopupAnimationType="Fade"
        PopupVerticalAlign="TopSides" PopupAction="MouseOver" CloseAction="MouseOut"
        PopupHorizontalAlign="OutsideRight" PopupHorizontalOffset="5"
        AppearAfter="0" DisappearAfter="0" BackColor="#2A3333">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <img id="imgViewer" src="" alt="" />
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ContentStyle BackColor="#2A3333" Paddings-Padding="8" />
        <Border BorderStyle="None" />
        <ClientSideEvents PopUp="function(s,e){ popup_Popup(s, e); }" />
    </dx:ASPxPopupControl>

    </div>
    </form>

    <script type="text/javascript">


        $(window).load(function () {

            SetPopupElementID();
        });

        function SetPopupElementID() {
            
            var ids = "";
            $('.grid_img').each(function (i, n) {
                ids += n.id + ";";
            });

            popup.SetPopupElementID(ids);
        }

        function popup_Popup(s, e) {
            var popupElement = s.GetCurrentPopupElement();
            $('#imgViewer').attr("src", $(popupElement).attr("bigsrc"));

        }
    
    </script>

</body>
</html>
