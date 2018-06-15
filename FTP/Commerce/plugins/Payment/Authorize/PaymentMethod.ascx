<%@ Control Language="C#" Inherits="EPiServer.Business.Commerce.Enoteca.Templates.Enoteca.Units.Placeable.Plugins.Payment.Authorize.PaymentMethod"
    CodeBehind="PaymentMethod.ascx.cs" AutoEventWireup="True" %>

    <ul class="creditCard">
		<li>
			<asp:Label ID="CreditCardTypeLbl" AssociatedControlID="CreditCardType" runat="server">Credit Card Type</asp:Label>
			<asp:DropDownList ID="CreditCardType" runat="server">
				<asp:ListItem>-- select --</asp:ListItem>
				<asp:ListItem>Visa</asp:ListItem>
				<asp:ListItem>MasterCard</asp:ListItem>
				<asp:ListItem>Discover</asp:ListItem>
				<asp:ListItem>American Express</asp:ListItem>
			</asp:DropDownList>
		</li>
		<li class="name">
			<asp:Label ID="CardHolderNameLbl" AssociatedControlID="CardHolderName" runat="server">Card Holder's Name</asp:Label>
			<asp:TextBox ID="CardHolderName" runat="server" />
            <asp:RequiredFieldValidator ValidationGroup="Authorize" runat="server" ID="CCNameValidator"
                ControlToValidate="CardHolderName" ErrorMessage="*" EnableClientScript="True"
                Display="Dynamic" CssClass="enoGeneralErrorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" id="creditCardNameValidator" ControlToValidate="CardHolderName"
                ValidationExpression="^[a-zA-Z'.\s]{1,255}"
                Display="Dynamic" ValidationGroup="Authorize" CssClass="enoGeneralErrorMessage" />

		</li>
		<li class="two">
			<ul>
				<li class="ccn">
					<asp:Label ID="CardNumberLbl" AssociatedControlID="CardNumber" runat="server">Credit Card Number</asp:Label>
					<asp:TextBox ID="CardNumber" MaxLength="16" runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="Authorize" runat="server" ID="CCRequiredValidator"
                        ControlToValidate="CardNumber" ErrorMessage="*" EnableClientScript="True"
                        Display="Dynamic" CssClass="enoGeneralErrorMessage"></asp:RequiredFieldValidator>
                    <med:creditcardvalidator validationgroup="Authorize" controltovalidate="CardNumber"
                        cssclass="enoGeneralErrorMessage" runat="server" id="CCValidator"
                        enableclientscript="True" display="Dynamic">
                    </med:creditcardvalidator>
				</li>
				<li class="cvv">
					<asp:Label ID="CVVLbl" AssociatedControlID="CVV" runat="server">CVV</asp:Label>
					<asp:TextBox ID="CVV" runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="Authorize" runat="server" ID="CIDValidator"
                        ControlToValidate="CVV" ErrorMessage="*" EnableClientScript="True"
                        Display="Dynamic" CssClass="enoGeneralErrorMessage"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="creditCardCSCNumberValidator" runat="server" ControlToValidate="CVV"
                        ValidationExpression="^\d+$" ValidationGroup="Authorize" EnableClientScript="True"
                        Display="Dynamic" CssClass="enoGeneralErrorMessage"></asp:RegularExpressionValidator> 
				</li>
			</ul>
		</li>
		<li>
			<asp:Label ID="ExpDate" AssociatedControlID="ExpMonth" runat="server">Expiration Date</asp:Label>
			<asp:DropDownList ID="ExpMonth" runat="server">
				<asp:ListItem Value="1">01 - Jan</asp:ListItem>
				<asp:ListItem Value="2">02 - Feb</asp:ListItem>
				<asp:ListItem Value="3">03 - Mar</asp:ListItem>
				<asp:ListItem Value="4">04 - Apr</asp:ListItem>
				<asp:ListItem Value="5">05 - May</asp:ListItem>
				<asp:ListItem Value="6">06 - Jun</asp:ListItem>
				<asp:ListItem Value="7">07 - Jul</asp:ListItem>
				<asp:ListItem Value="8">08 - Aug</asp:ListItem>
				<asp:ListItem Value="9">09 - Sep</asp:ListItem>
				<asp:ListItem Value="10">10 - Oct</asp:ListItem>
				<asp:ListItem Value="11">11 - Nov</asp:ListItem>
				<asp:ListItem Value="12">12 - Dec</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList ID="ExpYear" runat="server">
				<asp:ListItem>2016</asp:ListItem>
				<asp:ListItem>2017</asp:ListItem>
				<asp:ListItem>2018</asp:ListItem>
				<asp:ListItem>2019</asp:ListItem>
				<asp:ListItem>2020</asp:ListItem>
				<asp:ListItem>2021</asp:ListItem>
				<asp:ListItem>2022</asp:ListItem>
				<asp:ListItem>2023</asp:ListItem>
				<asp:ListItem>2024</asp:ListItem>
				<asp:ListItem>2025</asp:ListItem>
				<asp:ListItem>2026</asp:ListItem>
				<%--<asp:ListItem>2027</asp:ListItem>
				<asp:ListItem>2028</asp:ListItem>
				<asp:ListItem>2029</asp:ListItem>
				<asp:ListItem>2030</asp:ListItem>--%>
			</asp:DropDownList>
		</li>
	</ul>




<%--<div class="enoPaymentMethodCardFormArea">
    <ul class="enoPaymentMethodCardLeftForm">
        <li>
            <asp:Label ID="CreditCardTypeLbl" AssociatedControlID="CreditCardType" runat="server">Credit Card Type</asp:Label>
	        <asp:DropDownList ID="CreditCardType" runat="server">
		        <asp:ListItem>-- select --</asp:ListItem>
		        <asp:ListItem>Visa</asp:ListItem>
		        <asp:ListItem>MasterCard</asp:ListItem>
		        <asp:ListItem>Discover</asp:ListItem>
		        <asp:ListItem>American Express</asp:ListItem>
	        </asp:DropDownList>
        </li>
        <li class="enoLabelForm">
            <label for="<%= creditCardNumber.ClientID %>">
                Card Number</label>
        </li>
        <li class="enoInputForm">
            <asp:TextBox ID="creditCardNumber" CssClass="enoInputFirstName enoInputText required creditCardNumber"
                runat="server" MaxLength="16"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="Authorize" runat="server" ID="CCRequiredValidator"
                ControlToValidate="creditCardNumber" ErrorMessage="*" EnableClientScript="True"
                Display="Dynamic" CssClass="enoGeneralErrorMessage"></asp:RequiredFieldValidator>
            <med:creditcardvalidator validationgroup="Authorize" controltovalidate="creditCardNumber"
                cssclass="enoGeneralErrorMessage" runat="server" id="CCValidator"
                enableclientscript="True" display="Dynamic">
            </med:creditcardvalidator>
        </li>
        <li class="enoLabelForm">
            <label for="enoInputDate">
                Expiration Date</label>
        </li>
        <li class="enoInputForm">
            <asp:DropDownList ID="creditCardExpireMonth" runat="server" CssClass="enoSelector enoWhiteBackground creditCardExpireMonth">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="6">6</asp:ListItem>
                <asp:ListItem Value="7">7</asp:ListItem>
                <asp:ListItem Value="8">8</asp:ListItem>
                <asp:ListItem Value="9">9</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
            </asp:DropDownList>
            /
            <asp:DropDownList ID="creditCardExpireYear" runat="server" CssClass="enoSelector enoWhiteBackground creditCardExpireYear" />
        </li>
    </ul>
    <ul class="enoPaymentMethodCardRightForm">
        <li class="enoLabelForm">
            <label for="<%= creditCardName.ClientID %>">
                Name on Card</label>
        </li>
        <li class="enoInputForm">
            <asp:TextBox ID="creditCardName" runat="server" CssClass="enoInputFirstName enoInputText required creditCardName"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="Authorize" runat="server" ID="CCNameValidator"
                ControlToValidate="creditCardName" ErrorMessage="*" EnableClientScript="True"
                Display="Dynamic" CssClass="enoGeneralErrorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" id="creditCardNameValidator" ControlToValidate="creditCardName"
                ValidationExpression="^[a-zA-Z'.\s]{1,255}"
                Display="Dynamic" ValidationGroup="Authorize" CssClass="enoGeneralErrorMessage" />
        </li>
        <li class="enoLabelForm">
            <label for="enoInputNameCard">
                CVV</label>
        </li>
        <li class="enoInputForm">
            <asp:TextBox ID="creditCardCSC" CssClass="enoInputFirstName enoInputText required creditCardCSC"
                runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="Authorize" runat="server" ID="CIDValidator"
                ControlToValidate="creditCardCSC" ErrorMessage="*" EnableClientScript="True"
                Display="Dynamic" CssClass="enoGeneralErrorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="creditCardCSCNumberValidator" runat="server" ControlToValidate="creditCardCSC"
                ValidationExpression="^\d+$" ValidationGroup="Authorize" EnableClientScript="True"
                Display="Dynamic" CssClass="enoGeneralErrorMessage"></asp:RegularExpressionValidator> 

        </li>
    </ul>
</div>--%>
