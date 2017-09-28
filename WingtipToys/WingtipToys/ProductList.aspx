<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ProductList.aspx.cs" Inherits="WingtipToys.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup class="page-header" style="text-align: center">
                <h2><%: Page.Title %></h2>
            </hgroup>
            <div class="row">
                <asp:ListView ID="productList" runat="server"
                    DataKeyNames="ProductID"
                    ItemType="WingtipToys.Models.Product" SelectMethod="GetProducts">
                    <EmptyDataTemplate>
                        <table runat="server">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>

                        <div class="col-sm-6 col-md-6 col-lg-4" runat="server">
                            <div class="thumbnail" style="text-align: center">
                                <div class="caption">
                                    <h3><%#:Item.ProductName%></h3>
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>">
                                        <img class="toy" src="/Catalog/Images/Thumbs/<%#:Item.ImagePath%>" alt="">
                                    </a>
                                    <p>
                                        </a>
                                    <br />
                                        <span>
                                            <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                        </span>
                                        <br />

                                    </p>
                                    <p>
                                        <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>" class="btn btn-primary">Buy</a>

                                        <a class="btn btn-default" data-toggle="modal" href='#modal-id'>Details</a>
                                        <div class="modal fade" id="modal-id">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title"><%#: Item.ProductName %></h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <img src="/Catalog/Images/<%#:Item.ImagePath %>" style="border: solid; height: 300px" alt="<%#:Item.ProductName %>" />
                                                        <p><%#: Item.Description %> </p>
                                                        <p><b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%> </p>
                                                        <p><b>Product Number:</b> <%#: Item.ProductID %></p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>" class="btn btn-primary">Add to Cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>" class="btn btn-default">Details</a>--%>
                                    </p>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" style="width: 100%;">
                            <tbody>
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                            <tr id="groupPlaceholder" runat="server"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server"></td>
                                </tr>
                                <tr></tr>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
</asp:Content>
