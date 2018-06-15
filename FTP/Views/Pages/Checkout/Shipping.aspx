<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="Shipping.aspx.cs" Inherits="ASI.Web.Views.Pages.Checkout.Shipping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="checkout">
		<ul class="crumbs">
			<li class="complete">Billing</li>
			<li class="active">Shipping</li>
			<li>Review Order</li>
			<li>Payment</li>
			<li>Confirmation</li>
		</ul>
		<EPiServer:Property ID="Property2" runat="server" CustomTagName="h2" PropertyName="ShippingHeader" />
		<div class="divide">
			<div class="first">
				<EPiServer:Property ID="Property1" runat="server" PropertyName="ShippingText" />
				<asp:DropDownList runat="server" ID="ddlAddresses" AutoPostBack="true" ClientIDMode="Static" />
				<div class="addressType">
					<p>Address Type:</p>
					<asp:RadioButtonList ID="rblAddressType" runat="server" RepeatLayout="UnorderedList">
						<asp:ListItem Value="Commercial">Commercial Address</asp:ListItem>
						<asp:ListItem Value="Residential">Residential Address</asp:ListItem>
					</asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="rblAddressType" ErrorMessage="Please select an address type." Display="None" />
				</div>
				<div class="read address">
					<ul>
						<li>
							<strong>
								<asp:Literal ID="LiteralName" runat="server"></asp:Literal>
							</strong>
						</li>
                        <li>
							<asp:Literal ID="LiteralCompany" runat="server"></asp:Literal>
						</li>
                        <li>
							<asp:Literal ID="LiteralEmail" runat="server"></asp:Literal>
						</li>
						<li>	
                            <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal></li>
						<li>
							<asp:Literal ID="LiteralCity" runat="server"></asp:Literal>,
							<asp:Literal ID="LiteralState" runat="server"></asp:Literal>
						</li>
						<li>
							<asp:Literal ID="LiteralPostal" runat="server"></asp:Literal>
						</li>
						<li>
							<asp:Literal ID="LiteralCountry" runat="server"></asp:Literal></li>
						<li>
							<asp:Literal ID="LiteralPhone" runat="server"></asp:Literal>
						</li>
						<li>
                            <a runat="server" id="atagEditInfo" href="#" class="editInfo btn smallBtn modalTrigger">Edit Info</a>
                            <a href="#" class="newAddress btn secondary smallBtn modalTrigger">New Address</a>
                        </li>
					</ul>
				</div>
			</div>
			<div class="second edit deliveryType verticalSec right">
				<div class="content">
					<h3>Standard Delivery: Sidewalk</h3>
					<p><strong>Other Delivery Services</strong></p>
					<asp:CheckBoxList ID="cblDeliveryServices" RepeatLayout="UnorderedList" runat="server">
						<asp:ListItem Value="Liftgate">Liftgate</asp:ListItem>
						<asp:ListItem Value="Residential Delivery">Residential Delivery (Does not include Liftgate.  Will be notified on delivery.)</asp:ListItem>
						<asp:ListItem Value="Inside Delivery">Inside delivery</asp:ListItem>
						<asp:ListItem Value="Notify Before Delivery">Notify before delivery</asp:ListItem>
					</asp:CheckBoxList>
					<ul>
						<li>
							<asp:Label ID="InstructionsLbl" AssociatedControlID="Instructions" runat="server">Special Instructions:</asp:Label>
							<asp:TextBox ID="Instructions" runat="server"></asp:TextBox>
						</li>
					</ul>
					<EPiServer:Property ID="Property3" runat="server" PropertyName="DeliveryInstructions" />
				</div>
			</div>
		</div>
		<div class="checkoutModal editInfo">
			<div class="edit modalWrap">
				<a href="#" class="close">x</a>
				<h3>Edit your shipping address</h3>
				<asp:ValidationSummary ID="ValidationSummary1" CssClass="validation" runat="server"
					ValidationGroup="editAddress" DisplayMode="BulletList" EnableClientScript="true" ShowMessageBox="false"
					Visible="true" ShowSummary="true" />
				<ul>
                    <li class="one">
                        <ul>
							<li>
								<asp:Label ID="AddressNicknameLbl" AssociatedControlID="AddressNickname" runat="server">Address Nickname:</asp:Label>
								<asp:TextBox ClientIDMode="Static" ID="AddressNickname" runat="server" />
								<asp:RequiredFieldValidator ID="AddressNicknameValidator" runat="server" ControlToValidate="AddressNickname" ErrorMessage="Enter a nickname for this address." ValidationGroup="editAddress" Display="None" />
                                <asp:CustomValidator runat="server" ID="cfvNicknameExists" ControlToValidate="AddressNickname" ErrorMessage="An address with that nickname already exists." ValidationGroup="editAddress" Display="None" ClientValidationFunction="CheckIfAddressExistsEdit" />

							</li>
                        </ul>
                    </li>
					<li class="three">
						<ul>
							
							<li>
								<asp:Label ID="FirstNameLbl" AssociatedControlID="FirstName" runat="server">First Name:</asp:Label>
								<asp:TextBox ID="FirstName" runat="server" />
								<asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" ControlToValidate="FirstName" ErrorMessage="Enter your first name." ValidationGroup="editAddress" Display="None" />
							</li>
							<li>
								<asp:Label ID="LastNameLbl" AssociatedControlID="LastName" runat="server">Last Name:</asp:Label>
								<asp:TextBox ID="LastName" runat="server" />
								<asp:RequiredFieldValidator ID="LastNameValidator" runat="server" ControlToValidate="LastName" ErrorMessage="Enter your last name." ValidationGroup="editAddress" Display="None" />
							</li>
                            <li>
								<asp:Label ID="CompanyNameLbl" AssociatedControlID="CompanyName" runat="server">Company Name:</asp:Label>
								<asp:TextBox ID="CompanyName" runat="server" />
							</li>
						</ul>
					</li>
					<li>
						<asp:Label ID="AddressLbl" AssociatedControlID="Address" runat="server">Address:</asp:Label>
						<asp:TextBox ID="Address" runat="server" />
						<asp:RequiredFieldValidator ID="RAddressValidator" runat="server" ControlToValidate="Address" ErrorMessage="Enter your address." ValidationGroup="editAddress" Display="None" />
					</li>
					<li class="two">
						<ul>
							<li>
								<asp:Label ID="CityLbl" AssociatedControlID="City" runat="server">City:</asp:Label>
								<asp:TextBox ID="City" runat="server" />
								<asp:RequiredFieldValidator ID="CityValidator" runat="server" ControlToValidate="City" ErrorMessage="Enter your city." ValidationGroup="editAddress" Display="None" />
							</li>
							<li>
								<asp:Label ID="CountryLbl" AssociatedControlID="Country" runat="server">Country:</asp:Label>
								<asp:DropDownList ID="Country" runat="server" onchange="ToggleStates(false);" CssClass="countrydropdown">
									<asp:ListItem Value="">-- Select --</asp:ListItem>
									<asp:ListItem Value="AF">Afghanistan</asp:ListItem>
									<asp:ListItem Value="AL">Albania</asp:ListItem>
									<asp:ListItem Value="DZ">Algeria</asp:ListItem>
									<asp:ListItem Value="AS">American Samoa</asp:ListItem>
									<asp:ListItem Value="AD">Andorra</asp:ListItem>
									<asp:ListItem Value="AO">Angola</asp:ListItem>
									<asp:ListItem Value="AI">Anguilla</asp:ListItem>
									<asp:ListItem Value="AQ">Antarctica</asp:ListItem>
									<asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
									<asp:ListItem Value="AR">Argentina</asp:ListItem>
									<asp:ListItem Value="AM">Armenia</asp:ListItem>
									<asp:ListItem Value="AW">Aruba</asp:ListItem>
									<asp:ListItem Value="AU">Australia</asp:ListItem>
									<asp:ListItem Value="AT">Austria</asp:ListItem>
									<asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
									<asp:ListItem Value="BS">Bahamas</asp:ListItem>
									<asp:ListItem Value="BH">Bahrain</asp:ListItem>
									<asp:ListItem Value="BD">Bangladesh</asp:ListItem>
									<asp:ListItem Value="BB">Barbados</asp:ListItem>
									<asp:ListItem Value="BY">Belarus</asp:ListItem>
									<asp:ListItem Value="BE">Belgium</asp:ListItem>
									<asp:ListItem Value="BZ">Belize</asp:ListItem>
									<asp:ListItem Value="BJ">Benin</asp:ListItem>
									<asp:ListItem Value="BM">Bermuda</asp:ListItem>
									<asp:ListItem Value="BT">Bhutan</asp:ListItem>
									<asp:ListItem Value="BO">Bolivia</asp:ListItem>
									<asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
									<asp:ListItem Value="BW">Botswana</asp:ListItem>
									<asp:ListItem Value="BV">Bouve tIsland</asp:ListItem>
									<asp:ListItem Value="BR">Brazil</asp:ListItem>
									<asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
									<asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
									<asp:ListItem Value="BG">Bulgaria</asp:ListItem>
									<asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
									<asp:ListItem Value="BI">Burundi</asp:ListItem>
									<asp:ListItem Value="KH">Cambodia</asp:ListItem>
									<asp:ListItem Value="CM">Cameroon</asp:ListItem>
									<asp:ListItem Value="CA">Canada</asp:ListItem>
									<asp:ListItem Value="CV">Cape Verde</asp:ListItem>
									<asp:ListItem Value="KY">CaymanIslands</asp:ListItem>
									<asp:ListItem Value="CF">Central African Republic</asp:ListItem>
									<asp:ListItem Value="TD">Chad</asp:ListItem>
									<asp:ListItem Value="CL">Chile</asp:ListItem>
									<asp:ListItem Value="CN">China</asp:ListItem>
									<asp:ListItem Value="CX">Christmas Island</asp:ListItem>
									<asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
									<asp:ListItem Value="CO">Colombia</asp:ListItem>
									<asp:ListItem Value="KM">Comoros</asp:ListItem>
									<asp:ListItem Value="CG">Congo</asp:ListItem>
									<asp:ListItem Value="CK">CookIslands</asp:ListItem>
									<asp:ListItem Value="CR">CostaRica</asp:ListItem>
									<asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
									<asp:ListItem Value="HR">Croatia</asp:ListItem>
									<asp:ListItem Value="CU">Cuba</asp:ListItem>
									<asp:ListItem Value="CY">Cyprus</asp:ListItem>
									<asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
									<asp:ListItem Value="DK">Denmark</asp:ListItem>
									<asp:ListItem Value="DJ">Djibouti</asp:ListItem>
									<asp:ListItem Value="DM">Dominica</asp:ListItem>
									<asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
									<asp:ListItem Value="TP">EastTimor</asp:ListItem>
									<asp:ListItem Value="EC">Ecuador</asp:ListItem>
									<asp:ListItem Value="EG">Egypt</asp:ListItem>
									<asp:ListItem Value="SV">ElSalvador</asp:ListItem>
									<asp:ListItem Value="GQ">EquatorialGuinea</asp:ListItem>
									<asp:ListItem Value="ER">Eritrea</asp:ListItem>
									<asp:ListItem Value="EE">Estonia</asp:ListItem>
									<asp:ListItem Value="ET">Ethiopia</asp:ListItem>
									<asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
									<asp:ListItem Value="FO">FaroeIslands</asp:ListItem>
									<asp:ListItem Value="FJ">Fiji</asp:ListItem>
									<asp:ListItem Value="FI">Finland</asp:ListItem>
									<asp:ListItem Value="FR">France</asp:ListItem>
									<asp:ListItem Value="GF">French Guiana</asp:ListItem>
									<asp:ListItem Value="PF">French Polynesia</asp:ListItem>
									<asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
									<asp:ListItem Value="GA">Gabon</asp:ListItem>
									<asp:ListItem Value="GM">Gambia</asp:ListItem>
									<asp:ListItem Value="GE">Georgia</asp:ListItem>
									<asp:ListItem Value="DE">Germany</asp:ListItem>
									<asp:ListItem Value="GH">Ghana</asp:ListItem>
									<asp:ListItem Value="GI">Gibraltar</asp:ListItem>
									<asp:ListItem Value="GR">Greece</asp:ListItem>
									<asp:ListItem Value="GL">Greenland</asp:ListItem>
									<asp:ListItem Value="GD">Grenada</asp:ListItem>
									<asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
									<asp:ListItem Value="GU">Guam</asp:ListItem>
									<asp:ListItem Value="GT">Guatemala</asp:ListItem>
									<asp:ListItem Value="GN">Guinea</asp:ListItem>
									<asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
									<asp:ListItem Value="GY">Guyana</asp:ListItem>
									<asp:ListItem Value="HT">Haiti</asp:ListItem>
									<asp:ListItem Value="HM">HeardAnd Mc Donald Islands</asp:ListItem>
									<asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
									<asp:ListItem Value="HN">Honduras</asp:ListItem>
									<asp:ListItem Value="HK">Hong Kong</asp:ListItem>
									<asp:ListItem Value="HU">Hungary</asp:ListItem>
									<asp:ListItem Value="IS">IcelAnd</asp:ListItem>
									<asp:ListItem Value="IN">India</asp:ListItem>
									<asp:ListItem Value="ID">Indonesia</asp:ListItem>
									<asp:ListItem Value="IR">Iran(Islamic Republic Of)</asp:ListItem>
									<asp:ListItem Value="IQ">Iraq</asp:ListItem>
									<asp:ListItem Value="IE">Ireland</asp:ListItem>
									<asp:ListItem Value="IL">Israel</asp:ListItem>
									<asp:ListItem Value="IT">Italy</asp:ListItem>
									<asp:ListItem Value="JM">Jamaica</asp:ListItem>
									<asp:ListItem Value="JP">Japan</asp:ListItem>
									<asp:ListItem Value="JO">Jordan</asp:ListItem>
									<asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
									<asp:ListItem Value="KE">Kenya</asp:ListItem>
									<asp:ListItem Value="KI">Kiribati</asp:ListItem>
									<asp:ListItem Value="KP">Korea, Dem People's Republic</asp:ListItem>
									<asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
									<asp:ListItem Value="KW">Kuwait</asp:ListItem>
									<asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
									<asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
									<asp:ListItem Value="LV">Latvia</asp:ListItem>
									<asp:ListItem Value="LB">Lebanon</asp:ListItem>
									<asp:ListItem Value="LS">Lesotho</asp:ListItem>
									<asp:ListItem Value="LR">Liberia</asp:ListItem>
									<asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
									<asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
									<asp:ListItem Value="LT">Lithuania</asp:ListItem>
									<asp:ListItem Value="LU">Luxembourg</asp:ListItem>
									<asp:ListItem Value="MO">Macau</asp:ListItem>
									<asp:ListItem Value="MK">Macedonia</asp:ListItem>
									<asp:ListItem Value="MG">Madagascar</asp:ListItem>
									<asp:ListItem Value="MW">Malawi</asp:ListItem>
									<asp:ListItem Value="MY">Malaysia</asp:ListItem>
									<asp:ListItem Value="MV">Maldives</asp:ListItem>
									<asp:ListItem Value="ML">Mali</asp:ListItem>
									<asp:ListItem Value="MT">Malta</asp:ListItem>
									<asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
									<asp:ListItem Value="MQ">Martinique</asp:ListItem>
									<asp:ListItem Value="MR">Mauritania</asp:ListItem>
									<asp:ListItem Value="MU">Mauritius</asp:ListItem>
									<asp:ListItem Value="YT">Mayotte</asp:ListItem>
									<asp:ListItem Value="MX">Mexico</asp:ListItem>
									<asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
									<asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
									<asp:ListItem Value="MC">Monaco</asp:ListItem>
									<asp:ListItem Value="MN">Mongolia</asp:ListItem>
									<asp:ListItem Value="MS">Montserrat</asp:ListItem>
									<asp:ListItem Value="MA">Morocco</asp:ListItem>
									<asp:ListItem Value="MZ">Mozambique</asp:ListItem>
									<asp:ListItem Value="MM">Myanmar</asp:ListItem>
									<asp:ListItem Value="NA">Namibia</asp:ListItem>
									<asp:ListItem Value="NR">Nauru</asp:ListItem>
									<asp:ListItem Value="NP">Nepal</asp:ListItem>
									<asp:ListItem Value="NL">Netherlands</asp:ListItem>
									<asp:ListItem Value="AN">Netherlands AntIlles</asp:ListItem>
									<asp:ListItem Value="NC">New Caledonia</asp:ListItem>
									<asp:ListItem Value="NZ">New Zealand</asp:ListItem>
									<asp:ListItem Value="NI">Nicaragua</asp:ListItem>
									<asp:ListItem Value="NE">Niger</asp:ListItem>
									<asp:ListItem Value="NG">Nigeria</asp:ListItem>
									<asp:ListItem Value="NU">Niue</asp:ListItem>
									<asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
									<asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
									<asp:ListItem Value="NO">Norway</asp:ListItem>
									<asp:ListItem Value="OM">Oman</asp:ListItem>
									<asp:ListItem Value="PK">Pakistan</asp:ListItem>
									<asp:ListItem Value="PW">Palau</asp:ListItem>
									<asp:ListItem Value="PA">Panama</asp:ListItem>
									<asp:ListItem Value="PG">PapuaNew Guinea</asp:ListItem>
									<asp:ListItem Value="PY">Paraguay</asp:ListItem> 
									<asp:ListItem Value="PE">Peru</asp:ListItem>
									<asp:ListItem Value="PH">Philippines</asp:ListItem>
									<asp:ListItem Value="PN">Pitcairn</asp:ListItem>
									<asp:ListItem Value="PL">Poland</asp:ListItem>
									<asp:ListItem Value="PT">Portugal</asp:ListItem>
									<asp:ListItem Value="PR">PuertoRico</asp:ListItem>
									<asp:ListItem Value="QA">Qatar</asp:ListItem>
									<asp:ListItem Value="RE">Reunion</asp:ListItem>
									<asp:ListItem Value="RO">Romania</asp:ListItem>
									<asp:ListItem Value="RU">Russian Federation</asp:ListItem>
									<asp:ListItem Value="RW">Rwanda</asp:ListItem>
									<asp:ListItem Value="KN">Saint KItts And Nevis</asp:ListItem>
									<asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
									<asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
									<asp:ListItem Value="WS">Samoa</asp:ListItem>
									<asp:ListItem Value="SM">San Marino</asp:ListItem>
									<asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
									<asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
									<asp:ListItem Value="SN">Senegal</asp:ListItem>
									<asp:ListItem Value="SC">Seychelles</asp:ListItem>
									<asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
									<asp:ListItem Value="SG">Singapore</asp:ListItem>
									<asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
									<asp:ListItem Value="SI">Slovenia</asp:ListItem>
									<asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
									<asp:ListItem Value="SO">Somalia</asp:ListItem>
									<asp:ListItem Value="ZA">South Africa</asp:ListItem>
									<asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
									<asp:ListItem Value="ES">Spain</asp:ListItem>
									<asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
									<asp:ListItem Value="SH">St. Helena</asp:ListItem>
									<asp:ListItem Value="PM">St.Pierre And Miquelon</asp:ListItem>
									<asp:ListItem Value="SD">Sudan</asp:ListItem>
									<asp:ListItem Value="SR">Suriname</asp:ListItem>
									<asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
									<asp:ListItem Value="SZ">Swaziland</asp:ListItem>
									<asp:ListItem Value="SE">Sweden</asp:ListItem>
									<asp:ListItem Value="CH">Switzerland</asp:ListItem>
									<asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
									<asp:ListItem Value="TW">Taiwan</asp:ListItem>
									<asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
									<asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
									<asp:ListItem Value="TH">Thailand</asp:ListItem>
									<asp:ListItem Value="TG">Togo</asp:ListItem>
									<asp:ListItem Value="TK">Tokelau</asp:ListItem>
									<asp:ListItem Value="TO">Tonga</asp:ListItem>
									<asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
									<asp:ListItem Value="TN">Tunisia</asp:ListItem>
									<asp:ListItem Value="TR">Turkey</asp:ListItem>
									<asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
									<asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
									<asp:ListItem Value="TV">Tuvalu</asp:ListItem>
									<asp:ListItem Value="UG">Uganda</asp:ListItem>
									<asp:ListItem Value="UA">Ukraine</asp:ListItem>
									<asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
									<asp:ListItem Value="GB">United Kingdom</asp:ListItem>
									<asp:ListItem Value="US" Selected="True">United States</asp:ListItem>
									<asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
									<asp:ListItem Value="UY">Uruguay</asp:ListItem>
									<asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
									<asp:ListItem Value="VU">Vanuatu</asp:ListItem>
									<asp:ListItem Value="VE">Venezuela</asp:ListItem>
									<asp:ListItem Value="VN">VietNam</asp:ListItem>
									<asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
									<asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
									<asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
									<asp:ListItem Value="EH">Western Sahara</asp:ListItem>
									<asp:ListItem Value="YE">Yemen</asp:ListItem>
									<asp:ListItem Value="YU">Yugoslavia</asp:ListItem>
									<asp:ListItem Value="ZR">Zaire</asp:ListItem>
									<asp:ListItem Value="ZM">Zambia</asp:ListItem>
									<asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
								</asp:DropDownList>
								<asp:RequiredFieldValidator ID="CountryValidator" runat="server" ControlToValidate="Country" ErrorMessage="Enter your country." ValidationGroup="editAddress" Display="None" />
							</li>
						</ul>
					</li>
					<li class="two">
						<ul>
							<li class="statedropdown">
								<asp:Label ID="StateLbl" AssociatedControlID="State" runat="server">State:</asp:Label>
								<asp:DropDownList runat="server" ID="State" CssClass="statedropdown">
									<asp:ListItem Value="">-- Select --</asp:ListItem>
									<asp:ListItem Value="AL">Alabama</asp:ListItem>
									<asp:ListItem Value="AK">Alaska</asp:ListItem>
									<asp:ListItem Value="AZ">Arizona</asp:ListItem>
									<asp:ListItem Value="AR">Arkansas</asp:ListItem>
									<asp:ListItem Value="CA">California</asp:ListItem>
									<asp:ListItem Value="CO">Colorado</asp:ListItem>
									<asp:ListItem Value="CT">Connecticut</asp:ListItem>
									<asp:ListItem Value="DC">District of Columbia</asp:ListItem>
									<asp:ListItem Value="DE">Delaware</asp:ListItem>
									<asp:ListItem Value="FL">Florida</asp:ListItem>
									<asp:ListItem Value="GA">Georgia</asp:ListItem>
									<asp:ListItem Value="HI">Hawaii</asp:ListItem>
									<asp:ListItem Value="ID">Idaho</asp:ListItem>
									<asp:ListItem Value="IL">Illinois</asp:ListItem>
									<asp:ListItem Value="IN">Indiana</asp:ListItem>
									<asp:ListItem Value="IA">Iowa</asp:ListItem>
									<asp:ListItem Value="KS">Kansas</asp:ListItem>
									<asp:ListItem Value="KY">Kentucky</asp:ListItem>
									<asp:ListItem Value="LA">Louisiana</asp:ListItem>
									<asp:ListItem Value="ME">Maine</asp:ListItem>
									<asp:ListItem Value="MD">Maryland</asp:ListItem>
									<asp:ListItem Value="MA">Massachusetts</asp:ListItem>
									<asp:ListItem Value="MI">Michigan</asp:ListItem>
									<asp:ListItem Value="MN">Minnesota</asp:ListItem>
									<asp:ListItem Value="MS">Mississippi</asp:ListItem>
									<asp:ListItem Value="MO">Missouri</asp:ListItem>
									<asp:ListItem Value="MT">Montana</asp:ListItem>
									<asp:ListItem Value="NE">Nebraska</asp:ListItem>
									<asp:ListItem Value="NV">Nevada</asp:ListItem>
									<asp:ListItem Value="NH">New Hampshire</asp:ListItem>
									<asp:ListItem Value="NJ">New Jersey</asp:ListItem>
									<asp:ListItem Value="NM">New Mexico</asp:ListItem>
									<asp:ListItem Value="NY">New York</asp:ListItem>
									<asp:ListItem Value="NC">North Carolina</asp:ListItem>
									<asp:ListItem Value="ND">North Dakota</asp:ListItem>
									<asp:ListItem Value="OH">Ohio</asp:ListItem>
									<asp:ListItem Value="OK">Oklahoma</asp:ListItem>
									<asp:ListItem Value="OR">Oregon</asp:ListItem>
									<asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
									<asp:ListItem Value="RI">Rhode Island</asp:ListItem>
									<asp:ListItem Value="SC">South Carolina</asp:ListItem>
									<asp:ListItem Value="SD">South Dakota</asp:ListItem>
									<asp:ListItem Value="TN">Tennessee</asp:ListItem>
									<asp:ListItem Value="TX">Texas</asp:ListItem>
									<asp:ListItem Value="UT">Utah</asp:ListItem>
									<asp:ListItem Value="VT">Vermont</asp:ListItem>
									<asp:ListItem Value="VA">Virginia</asp:ListItem>
									<asp:ListItem Value="WA">Washington</asp:ListItem>
									<asp:ListItem Value="WV">West Virginia</asp:ListItem>
									<asp:ListItem Value="WI">Wisconsin</asp:ListItem>
									<asp:ListItem Value="WY">Wyoming</asp:ListItem>
									<asp:ListItem Value="None">None</asp:ListItem>
								</asp:DropDownList>
								<asp:RequiredFieldValidator ID="StateValidator" runat="server" ControlToValidate="State" ErrorMessage="Enter your state." ValidationGroup="editAddress" Display="None" />
							</li>
							<li>
								<asp:Label ID="PostalCodeLbl" AssociatedControlID="PostalCode" runat="server">Postal Code:</asp:Label>
								<asp:TextBox ID="PostalCode" runat="server"></asp:TextBox>
								<asp:RequiredFieldValidator ID="PostalCodeValidator" runat="server" ControlToValidate="PostalCode" ErrorMessage="Enter your postal code." ValidationGroup="editAddress" Display="None" />
							</li>
						</ul>
					</li>
					<li class="two">
						<ul>
                            <li>
								<asp:Label ID="EmailLbl" AssociatedControlID="Email" runat="server">Email:</asp:Label>
								<asp:TextBox ID="Email" runat="server"></asp:TextBox>
							</li>
							<li>
								<asp:Label ID="PhoneLbl" AssociatedControlID="Phone" runat="server">Phone:</asp:Label>
								<asp:TextBox ID="Phone" runat="server"></asp:TextBox>
								<asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ControlToValidate="Phone" ErrorMessage="Enter your phone." ValidationGroup="editAddress" Display="None" />
							</li>
						</ul>
					</li>
					<li>
						<asp:LinkButton ID="lbUpdateShippingAddress" runat="server" Text="Save" CssClass="save btn"
							ValidationGroup="editAddress" CausesValidation="true" />
					</li>
				</ul>
			</div>
			<div class="modalOverlay"></div>
		</div>
        <div class="checkoutModal newAddress">
			<div class="edit modalWrap">
				<a href="#" class="close">x</a>
				<h3>Add a new shipping address</h3>
				<asp:ValidationSummary ID="ValidationSummary2" CssClass="validation" runat="server"
					ValidationGroup="create" DisplayMode="BulletList" EnableClientScript="true" ShowMessageBox="false"
					Visible="true" ShowSummary="true" />
				<ul>
                    <li class="one">
                        <ul>
                            <li>
								<asp:Label ID="Label1" AssociatedControlID="tbAddNickname" runat="server">Address Nickname:</asp:Label>
								<asp:TextBox ID="tbAddNickname" ClientIDMode="Static" runat="server" />
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbAddNickname" ErrorMessage="Enter a nickname for this address." ValidationGroup="create" Display="None" />
                                <asp:CustomValidator runat="server" ID="cvNicknameAlreadyExists" ControlToValidate="tbAddNickname" ErrorMessage="An address with that nickname already exists." ValidationGroup="create" Display="None" ClientValidationFunction="CheckIfAddressExistsNew" />

							</li>
                        </ul>
                    </li>
					<li class="three">
						<ul>
							
							<li>
								<asp:Label ID="Label2" AssociatedControlID="tbAddFirstName" runat="server">First Name:</asp:Label>
								<asp:TextBox ID="tbAddFirstName" runat="server" />
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbAddFirstName" ErrorMessage="Enter your first name." ValidationGroup="create" Display="None" />
							</li>
							<li>
								<asp:Label ID="Label3" AssociatedControlID="tbAddLastName" runat="server">Last Name:</asp:Label>
								<asp:TextBox ID="tbAddLastName" runat="server" />
								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbAddLastName" ErrorMessage="Enter your last name." ValidationGroup="create" Display="None" />
							</li>
                            <li>
								<asp:Label ID="Label10" AssociatedControlID="tbAddCompanyName" runat="server">Company Name:</asp:Label>
								<asp:TextBox ID="tbAddCompanyName" runat="server" />
							</li>
						</ul>
					</li>
					<li>
						<asp:Label ID="Label4" AssociatedControlID="tbAddAddress" runat="server">Address:</asp:Label>
						<asp:TextBox ID="tbAddAddress" runat="server" />
						<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbAddAddress" ErrorMessage="Enter your address." ValidationGroup="create" Display="None" />
					</li>
					<li class="two">
						<ul>
							<li>
								<asp:Label ID="Label5" AssociatedControlID="tbAddCity" runat="server">City:</asp:Label>
								<asp:TextBox ID="tbAddCity" runat="server" />
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbAddCity" ErrorMessage="Enter your city." ValidationGroup="create" Display="None" />
							</li>
							<li>
								<asp:Label ID="Label6" AssociatedControlID="ddlAddCountry" runat="server">Country:</asp:Label>
								<asp:DropDownList ID="ddlAddCountry" runat="server" onchange="ToggleStates(false);" CssClass="countrydropdown">
									<asp:ListItem Value="">-- Select --</asp:ListItem>
									<asp:ListItem Value="AF">Afghanistan</asp:ListItem>
									<asp:ListItem Value="AL">Albania</asp:ListItem>
									<asp:ListItem Value="DZ">Algeria</asp:ListItem>
									<asp:ListItem Value="AS">American Samoa</asp:ListItem>
									<asp:ListItem Value="AD">Andorra</asp:ListItem>
									<asp:ListItem Value="AO">Angola</asp:ListItem>
									<asp:ListItem Value="AI">Anguilla</asp:ListItem>
									<asp:ListItem Value="AQ">Antarctica</asp:ListItem>
									<asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
									<asp:ListItem Value="AR">Argentina</asp:ListItem>
									<asp:ListItem Value="AM">Armenia</asp:ListItem>
									<asp:ListItem Value="AW">Aruba</asp:ListItem>
									<asp:ListItem Value="AU">Australia</asp:ListItem>
									<asp:ListItem Value="AT">Austria</asp:ListItem>
									<asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
									<asp:ListItem Value="BS">Bahamas</asp:ListItem>
									<asp:ListItem Value="BH">Bahrain</asp:ListItem>
									<asp:ListItem Value="BD">Bangladesh</asp:ListItem>
									<asp:ListItem Value="BB">Barbados</asp:ListItem>
									<asp:ListItem Value="BY">Belarus</asp:ListItem>
									<asp:ListItem Value="BE">Belgium</asp:ListItem>
									<asp:ListItem Value="BZ">Belize</asp:ListItem>
									<asp:ListItem Value="BJ">Benin</asp:ListItem>
									<asp:ListItem Value="BM">Bermuda</asp:ListItem>
									<asp:ListItem Value="BT">Bhutan</asp:ListItem>
									<asp:ListItem Value="BO">Bolivia</asp:ListItem>
									<asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
									<asp:ListItem Value="BW">Botswana</asp:ListItem>
									<asp:ListItem Value="BV">Bouve tIsland</asp:ListItem>
									<asp:ListItem Value="BR">Brazil</asp:ListItem>
									<asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
									<asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
									<asp:ListItem Value="BG">Bulgaria</asp:ListItem>
									<asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
									<asp:ListItem Value="BI">Burundi</asp:ListItem>
									<asp:ListItem Value="KH">Cambodia</asp:ListItem>
									<asp:ListItem Value="CM">Cameroon</asp:ListItem>
									<asp:ListItem Value="CA">Canada</asp:ListItem>
									<asp:ListItem Value="CV">Cape Verde</asp:ListItem>
									<asp:ListItem Value="KY">CaymanIslands</asp:ListItem>
									<asp:ListItem Value="CF">Central African Republic</asp:ListItem>
									<asp:ListItem Value="TD">Chad</asp:ListItem>
									<asp:ListItem Value="CL">Chile</asp:ListItem>
									<asp:ListItem Value="CN">China</asp:ListItem>
									<asp:ListItem Value="CX">Christmas Island</asp:ListItem>
									<asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
									<asp:ListItem Value="CO">Colombia</asp:ListItem>
									<asp:ListItem Value="KM">Comoros</asp:ListItem>
									<asp:ListItem Value="CG">Congo</asp:ListItem>
									<asp:ListItem Value="CK">CookIslands</asp:ListItem>
									<asp:ListItem Value="CR">CostaRica</asp:ListItem>
									<asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
									<asp:ListItem Value="HR">Croatia</asp:ListItem>
									<asp:ListItem Value="CU">Cuba</asp:ListItem>
									<asp:ListItem Value="CY">Cyprus</asp:ListItem>
									<asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
									<asp:ListItem Value="DK">Denmark</asp:ListItem>
									<asp:ListItem Value="DJ">Djibouti</asp:ListItem>
									<asp:ListItem Value="DM">Dominica</asp:ListItem>
									<asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
									<asp:ListItem Value="TP">EastTimor</asp:ListItem>
									<asp:ListItem Value="EC">Ecuador</asp:ListItem>
									<asp:ListItem Value="EG">Egypt</asp:ListItem>
									<asp:ListItem Value="SV">ElSalvador</asp:ListItem>
									<asp:ListItem Value="GQ">EquatorialGuinea</asp:ListItem>
									<asp:ListItem Value="ER">Eritrea</asp:ListItem>
									<asp:ListItem Value="EE">Estonia</asp:ListItem>
									<asp:ListItem Value="ET">Ethiopia</asp:ListItem>
									<asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
									<asp:ListItem Value="FO">FaroeIslands</asp:ListItem>
									<asp:ListItem Value="FJ">Fiji</asp:ListItem>
									<asp:ListItem Value="FI">Finland</asp:ListItem>
									<asp:ListItem Value="FR">France</asp:ListItem>
									<asp:ListItem Value="GF">French Guiana</asp:ListItem>
									<asp:ListItem Value="PF">French Polynesia</asp:ListItem>
									<asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
									<asp:ListItem Value="GA">Gabon</asp:ListItem>
									<asp:ListItem Value="GM">Gambia</asp:ListItem>
									<asp:ListItem Value="GE">Georgia</asp:ListItem>
									<asp:ListItem Value="DE">Germany</asp:ListItem>
									<asp:ListItem Value="GH">Ghana</asp:ListItem>
									<asp:ListItem Value="GI">Gibraltar</asp:ListItem>
									<asp:ListItem Value="GR">Greece</asp:ListItem>
									<asp:ListItem Value="GL">Greenland</asp:ListItem>
									<asp:ListItem Value="GD">Grenada</asp:ListItem>
									<asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
									<asp:ListItem Value="GU">Guam</asp:ListItem>
									<asp:ListItem Value="GT">Guatemala</asp:ListItem>
									<asp:ListItem Value="GN">Guinea</asp:ListItem>
									<asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
									<asp:ListItem Value="GY">Guyana</asp:ListItem>
									<asp:ListItem Value="HT">Haiti</asp:ListItem>
									<asp:ListItem Value="HM">HeardAnd Mc Donald Islands</asp:ListItem>
									<asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
									<asp:ListItem Value="HN">Honduras</asp:ListItem>
									<asp:ListItem Value="HK">Hong Kong</asp:ListItem>
									<asp:ListItem Value="HU">Hungary</asp:ListItem>
									<asp:ListItem Value="IS">IcelAnd</asp:ListItem>
									<asp:ListItem Value="IN">India</asp:ListItem>
									<asp:ListItem Value="ID">Indonesia</asp:ListItem>
									<asp:ListItem Value="IR">Iran(Islamic Republic Of)</asp:ListItem>
									<asp:ListItem Value="IQ">Iraq</asp:ListItem>
									<asp:ListItem Value="IE">Ireland</asp:ListItem>
									<asp:ListItem Value="IL">Israel</asp:ListItem>
									<asp:ListItem Value="IT">Italy</asp:ListItem>
									<asp:ListItem Value="JM">Jamaica</asp:ListItem>
									<asp:ListItem Value="JP">Japan</asp:ListItem>
									<asp:ListItem Value="JO">Jordan</asp:ListItem>
									<asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
									<asp:ListItem Value="KE">Kenya</asp:ListItem>
									<asp:ListItem Value="KI">Kiribati</asp:ListItem>
									<asp:ListItem Value="KP">Korea, Dem People's Republic</asp:ListItem>
									<asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
									<asp:ListItem Value="KW">Kuwait</asp:ListItem>
									<asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
									<asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
									<asp:ListItem Value="LV">Latvia</asp:ListItem>
									<asp:ListItem Value="LB">Lebanon</asp:ListItem>
									<asp:ListItem Value="LS">Lesotho</asp:ListItem>
									<asp:ListItem Value="LR">Liberia</asp:ListItem>
									<asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
									<asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
									<asp:ListItem Value="LT">Lithuania</asp:ListItem>
									<asp:ListItem Value="LU">Luxembourg</asp:ListItem>
									<asp:ListItem Value="MO">Macau</asp:ListItem>
									<asp:ListItem Value="MK">Macedonia</asp:ListItem>
									<asp:ListItem Value="MG">Madagascar</asp:ListItem>
									<asp:ListItem Value="MW">Malawi</asp:ListItem>
									<asp:ListItem Value="MY">Malaysia</asp:ListItem>
									<asp:ListItem Value="MV">Maldives</asp:ListItem>
									<asp:ListItem Value="ML">Mali</asp:ListItem>
									<asp:ListItem Value="MT">Malta</asp:ListItem>
									<asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
									<asp:ListItem Value="MQ">Martinique</asp:ListItem>
									<asp:ListItem Value="MR">Mauritania</asp:ListItem>
									<asp:ListItem Value="MU">Mauritius</asp:ListItem>
									<asp:ListItem Value="YT">Mayotte</asp:ListItem>
									<asp:ListItem Value="MX">Mexico</asp:ListItem>
									<asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
									<asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
									<asp:ListItem Value="MC">Monaco</asp:ListItem>
									<asp:ListItem Value="MN">Mongolia</asp:ListItem>
									<asp:ListItem Value="MS">Montserrat</asp:ListItem>
									<asp:ListItem Value="MA">Morocco</asp:ListItem>
									<asp:ListItem Value="MZ">Mozambique</asp:ListItem>
									<asp:ListItem Value="MM">Myanmar</asp:ListItem>
									<asp:ListItem Value="NA">Namibia</asp:ListItem>
									<asp:ListItem Value="NR">Nauru</asp:ListItem>
									<asp:ListItem Value="NP">Nepal</asp:ListItem>
									<asp:ListItem Value="NL">Netherlands</asp:ListItem>
									<asp:ListItem Value="AN">Netherlands AntIlles</asp:ListItem>
									<asp:ListItem Value="NC">New Caledonia</asp:ListItem>
									<asp:ListItem Value="NZ">New Zealand</asp:ListItem>
									<asp:ListItem Value="NI">Nicaragua</asp:ListItem>
									<asp:ListItem Value="NE">Niger</asp:ListItem>
									<asp:ListItem Value="NG">Nigeria</asp:ListItem>
									<asp:ListItem Value="NU">Niue</asp:ListItem>
									<asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
									<asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
									<asp:ListItem Value="NO">Norway</asp:ListItem>
									<asp:ListItem Value="OM">Oman</asp:ListItem>
									<asp:ListItem Value="PK">Pakistan</asp:ListItem>
									<asp:ListItem Value="PW">Palau</asp:ListItem>
									<asp:ListItem Value="PA">Panama</asp:ListItem>
									<asp:ListItem Value="PG">PapuaNew Guinea</asp:ListItem>
									<asp:ListItem Value="PY">Paraguay</asp:ListItem> 
									<asp:ListItem Value="PE">Peru</asp:ListItem>
									<asp:ListItem Value="PH">Philippines</asp:ListItem>
									<asp:ListItem Value="PN">Pitcairn</asp:ListItem>
									<asp:ListItem Value="PL">Poland</asp:ListItem>
									<asp:ListItem Value="PT">Portugal</asp:ListItem>
									<asp:ListItem Value="PR">PuertoRico</asp:ListItem>
									<asp:ListItem Value="QA">Qatar</asp:ListItem>
									<asp:ListItem Value="RE">Reunion</asp:ListItem>
									<asp:ListItem Value="RO">Romania</asp:ListItem>
									<asp:ListItem Value="RU">Russian Federation</asp:ListItem>
									<asp:ListItem Value="RW">Rwanda</asp:ListItem>
									<asp:ListItem Value="KN">Saint KItts And Nevis</asp:ListItem>
									<asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
									<asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
									<asp:ListItem Value="WS">Samoa</asp:ListItem>
									<asp:ListItem Value="SM">San Marino</asp:ListItem>
									<asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
									<asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
									<asp:ListItem Value="SN">Senegal</asp:ListItem>
									<asp:ListItem Value="SC">Seychelles</asp:ListItem>
									<asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
									<asp:ListItem Value="SG">Singapore</asp:ListItem>
									<asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
									<asp:ListItem Value="SI">Slovenia</asp:ListItem>
									<asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
									<asp:ListItem Value="SO">Somalia</asp:ListItem>
									<asp:ListItem Value="ZA">South Africa</asp:ListItem>
									<asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
									<asp:ListItem Value="ES">Spain</asp:ListItem>
									<asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
									<asp:ListItem Value="SH">St. Helena</asp:ListItem>
									<asp:ListItem Value="PM">St.Pierre And Miquelon</asp:ListItem>
									<asp:ListItem Value="SD">Sudan</asp:ListItem>
									<asp:ListItem Value="SR">Suriname</asp:ListItem>
									<asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
									<asp:ListItem Value="SZ">Swaziland</asp:ListItem>
									<asp:ListItem Value="SE">Sweden</asp:ListItem>
									<asp:ListItem Value="CH">Switzerland</asp:ListItem>
									<asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
									<asp:ListItem Value="TW">Taiwan</asp:ListItem>
									<asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
									<asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
									<asp:ListItem Value="TH">Thailand</asp:ListItem>
									<asp:ListItem Value="TG">Togo</asp:ListItem>
									<asp:ListItem Value="TK">Tokelau</asp:ListItem>
									<asp:ListItem Value="TO">Tonga</asp:ListItem>
									<asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
									<asp:ListItem Value="TN">Tunisia</asp:ListItem>
									<asp:ListItem Value="TR">Turkey</asp:ListItem>
									<asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
									<asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
									<asp:ListItem Value="TV">Tuvalu</asp:ListItem>
									<asp:ListItem Value="UG">Uganda</asp:ListItem>
									<asp:ListItem Value="UA">Ukraine</asp:ListItem>
									<asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
									<asp:ListItem Value="GB">United Kingdom</asp:ListItem>
									<asp:ListItem Value="US" Selected="True">United States</asp:ListItem>
									<asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
									<asp:ListItem Value="UY">Uruguay</asp:ListItem>
									<asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
									<asp:ListItem Value="VU">Vanuatu</asp:ListItem>
									<asp:ListItem Value="VE">Venezuela</asp:ListItem>
									<asp:ListItem Value="VN">VietNam</asp:ListItem>
									<asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
									<asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
									<asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
									<asp:ListItem Value="EH">Western Sahara</asp:ListItem>
									<asp:ListItem Value="YE">Yemen</asp:ListItem>
									<asp:ListItem Value="YU">Yugoslavia</asp:ListItem>
									<asp:ListItem Value="ZR">Zaire</asp:ListItem>
									<asp:ListItem Value="ZM">Zambia</asp:ListItem>
									<asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
								</asp:DropDownList>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlAddCountry" ErrorMessage="Enter your country." ValidationGroup="create" Display="None" />
							</li>
						</ul>
					</li>
					<li class="two">
						<ul>
							<li class="statedropdown">
								<asp:Label ID="Label7" AssociatedControlID="ddlAddState" runat="server">State:</asp:Label>
								<asp:DropDownList runat="server" ID="ddlAddState" CssClass="statedropdown">
									<asp:ListItem Value="">-- Select --</asp:ListItem>
									<asp:ListItem Value="AL">Alabama</asp:ListItem>
									<asp:ListItem Value="AK">Alaska</asp:ListItem>
									<asp:ListItem Value="AZ">Arizona</asp:ListItem>
									<asp:ListItem Value="AR">Arkansas</asp:ListItem>
									<asp:ListItem Value="CA">California</asp:ListItem>
									<asp:ListItem Value="CO">Colorado</asp:ListItem>
									<asp:ListItem Value="CT">Connecticut</asp:ListItem>
									<asp:ListItem Value="DC">District of Columbia</asp:ListItem>
									<asp:ListItem Value="DE">Delaware</asp:ListItem>
									<asp:ListItem Value="FL">Florida</asp:ListItem>
									<asp:ListItem Value="GA">Georgia</asp:ListItem>
									<asp:ListItem Value="HI">Hawaii</asp:ListItem>
									<asp:ListItem Value="ID">Idaho</asp:ListItem>
									<asp:ListItem Value="IL">Illinois</asp:ListItem>
									<asp:ListItem Value="IN">Indiana</asp:ListItem>
									<asp:ListItem Value="IA">Iowa</asp:ListItem>
									<asp:ListItem Value="KS">Kansas</asp:ListItem>
									<asp:ListItem Value="KY">Kentucky</asp:ListItem>
									<asp:ListItem Value="LA">Louisiana</asp:ListItem>
									<asp:ListItem Value="ME">Maine</asp:ListItem>
									<asp:ListItem Value="MD">Maryland</asp:ListItem>
									<asp:ListItem Value="MA">Massachusetts</asp:ListItem>
									<asp:ListItem Value="MI">Michigan</asp:ListItem>
									<asp:ListItem Value="MN">Minnesota</asp:ListItem>
									<asp:ListItem Value="MS">Mississippi</asp:ListItem>
									<asp:ListItem Value="MO">Missouri</asp:ListItem>
									<asp:ListItem Value="MT">Montana</asp:ListItem>
									<asp:ListItem Value="NE">Nebraska</asp:ListItem>
									<asp:ListItem Value="NV">Nevada</asp:ListItem>
									<asp:ListItem Value="NH">New Hampshire</asp:ListItem>
									<asp:ListItem Value="NJ">New Jersey</asp:ListItem>
									<asp:ListItem Value="NM">New Mexico</asp:ListItem>
									<asp:ListItem Value="NY">New York</asp:ListItem>
									<asp:ListItem Value="NC">North Carolina</asp:ListItem>
									<asp:ListItem Value="ND">North Dakota</asp:ListItem>
									<asp:ListItem Value="OH">Ohio</asp:ListItem>
									<asp:ListItem Value="OK">Oklahoma</asp:ListItem>
									<asp:ListItem Value="OR">Oregon</asp:ListItem>
									<asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
									<asp:ListItem Value="RI">Rhode Island</asp:ListItem>
									<asp:ListItem Value="SC">South Carolina</asp:ListItem>
									<asp:ListItem Value="SD">South Dakota</asp:ListItem>
									<asp:ListItem Value="TN">Tennessee</asp:ListItem>
									<asp:ListItem Value="TX">Texas</asp:ListItem>
									<asp:ListItem Value="UT">Utah</asp:ListItem>
									<asp:ListItem Value="VT">Vermont</asp:ListItem>
									<asp:ListItem Value="VA">Virginia</asp:ListItem>
									<asp:ListItem Value="WA">Washington</asp:ListItem>
									<asp:ListItem Value="WV">West Virginia</asp:ListItem>
									<asp:ListItem Value="WI">Wisconsin</asp:ListItem>
									<asp:ListItem Value="WY">Wyoming</asp:ListItem>
									<asp:ListItem Value="None">None</asp:ListItem>
								</asp:DropDownList>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlAddState" ErrorMessage="Enter your state." ValidationGroup="create" Display="None" />
							</li>
							<li>
								<asp:Label ID="Label8" AssociatedControlID="tbAddPostalCode" runat="server">Postal Code:</asp:Label>
								<asp:TextBox ID="tbAddPostalCode" runat="server"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbAddPostalCode" ErrorMessage="Enter your postal code." ValidationGroup="create" Display="None" />
							</li>
						</ul>
					</li>
					<li class="two">
						<ul>
                            <li>
								<asp:Label ID="Label11" AssociatedControlID="tbAddEmail" runat="server">Email:</asp:Label>
								<asp:TextBox ID="tbAddEmail" runat="server"></asp:TextBox>
							</li>
							<li>
								<asp:Label ID="Label9" AssociatedControlID="tbAddPhone" runat="server">Phone:</asp:Label>
								<asp:TextBox ID="tbAddPhone" runat="server"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbAddPhone" ErrorMessage="Enter your phone." ValidationGroup="create" Display="None" />
							</li>
						</ul>
					</li>
					<li>
						<asp:LinkButton ID="lbAddNewAddress" runat="server" Text="Save" CssClass="save btn"
							ValidationGroup="create" CausesValidation="true" />
					</li>
				</ul>
			</div>
			<div class="modalOverlay"></div>
        </div>
	</div>
	<div class="navBtns">
		<asp:LinkButton runat="server" ID="lbPrevPage" CssClass="btn secondary" Text="Previous Page" OnClientClick="goBack"/>
		<asp:LinkButton runat="server" CssClass="btn" ID="lbNextPage" Text="Next Page" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script type="text/javascript">

        function goBack(source, arguments) {
            window.history.back(1);
            return false;
        }

        var addressNames = "<%= AddressNames %>";

        function CheckIfAddressExistsNew(source, arguments) {
            if (addressNames.indexOf($("#tbAddNickname").val() + ";") !== -1) {
                arguments.IsValid = false;
            }
            else {
                arguments.IsValid = true;
            }
        }

        function CheckIfAddressExistsEdit(source, arguments) {
            // Fails if:
            //  - Address name is different then the one selected in the DDL
            //  - AND the new address name is already assigned to an existing address
            var attemptedName = $("#AddressNickname").val();
            var addressDropdownName = $("#ddlAddresses").val();

            if (attemptedName != addressDropdownName && addressNames.indexOf(attemptedName + ";") !== -1) {
                arguments.IsValid = false;
            }
            else {
                arguments.IsValid = true;
            }
        }
    </script>
</asp:Content>
