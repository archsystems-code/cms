<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="SampleCheckout.aspx.cs" Inherits="ASI.Web.Views.Pages.SampleCheckout" %>

<%@ Register Src="~/Views/Controls/SampleRequests.ascx" TagName="SampleRequests" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ValidationSummary ID="ValidationSummary2" CssClass="samples validation" runat="server"
        DisplayMode="BulletList" EnableClientScript="true" ShowMessageBox="false" Visible="true"
        ShowSummary="true" />
    <div class="sampleCheckout left">



        <section>
            <uc:SampleRequests ID="SampleRequests1" runat="server" HideCheckoutLink="true" />
            <div class="altSelection">
                <EPiServer:Property ID="Property3" runat="server" PropertyName="AltSelection" />
                <asp:RadioButtonList runat="server" ID="AlternativeSelection" RepeatLayout="UnorderedList" ClientIDMode="Static">
                    <asp:ListItem Selected="True">Yes, send me an alternative sample</asp:ListItem>
                    <asp:ListItem>No, please backorder original sample request</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </section>
        <section>
            <div class="shipping">
                <h2>Shipping Address</h2>
                <a href="#" class="editInfo">Edit Information</a>
                <div class="read">
                    <ul>
                        <li>
                            <asp:Literal ID="LiteralName" runat="server"></asp:Literal></li>
                        <li>
                            <asp:Literal ID="LiteralCompany" runat="server"></asp:Literal></li>
                        <li>
                            <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal></li>
                        <li>
                            <asp:Literal ID="LiteralCity" runat="server"></asp:Literal>,
                        <asp:Literal ID="LiteralState" runat="server"></asp:Literal>
                            <asp:Literal ID="LiteralPostal" runat="server"></asp:Literal></li>
                        <li>
                            <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal></li>
                    </ul>
                    <ul>
                        <li>
                            <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal></li>
                        <li>
                            <asp:Literal ID="LiteralPhone" runat="server"></asp:Literal></li>
                    </ul>
                </div>
                <div class="edit" style="display: none;">
                    <asp:ValidationSummary ID="ValidationSummary1" CssClass="validation" runat="server"
                        ValidationGroup="create" DisplayMode="BulletList" EnableClientScript="true" ShowMessageBox="false"
                        Visible="true" ShowSummary="true" />
                    <ul>
                        <li class="three">
                            <ul>
                                <li>
                                    <asp:Label ID="FirstNameLbl" AssociatedControlID="FirstName" runat="server">First Name:</asp:Label>
                                    <asp:TextBox ID="FirstName" runat="server" />
                                    <asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" ControlToValidate="FirstName" ErrorMessage="Enter your first name." ValidationGroup="create" Display="None" />
                                </li>
                                <li>
                                    <asp:Label ID="LastNameLbl" AssociatedControlID="LastName" runat="server">Last Name:</asp:Label>
                                    <asp:TextBox ID="LastName" runat="server" />
                                    <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" ControlToValidate="LastName" ErrorMessage="Enter your last name." ValidationGroup="create" Display="None" />
                                </li>
                                <li>
                                    <asp:Label ID="CompanyNameLbl" AssociatedControlID="CompanyName" runat="server">Company Name:</asp:Label>
                                    <asp:TextBox ID="CompanyName" runat="server" />
                                    <asp:RequiredFieldValidator ID="CompanyValidator" runat="server" ControlToValidate="CompanyName" ErrorMessage="Enter your company." ValidationGroup="create" Display="None" />
                                </li>
                            </ul>
                        </li>
                        <li>
                            <asp:Label ID="AddressLbl" AssociatedControlID="Address" runat="server">Address:</asp:Label>
                            <asp:TextBox ID="Address" runat="server" />
                            <asp:RequiredFieldValidator ID="RAddressValidator" runat="server" ControlToValidate="Address" ErrorMessage="Enter your address." ValidationGroup="create" Display="None" />
                        </li>
                        <li class="two">
                            <ul>
                                <li>
                                    <asp:Label ID="CityLbl" AssociatedControlID="City" runat="server">City:</asp:Label>
                                    <asp:TextBox ID="City" runat="server" />
                                    <asp:RequiredFieldValidator ID="CityValidator" runat="server" ControlToValidate="City" ErrorMessage="Enter your city." ValidationGroup="create" Display="None" />
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
                                    <asp:RequiredFieldValidator ID="CountryValidator" runat="server" ControlToValidate="Country" ErrorMessage="Enter your country." ValidationGroup="create" Display="None" />
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
                                    <asp:RequiredFieldValidator ID="StateValidator" runat="server" ControlToValidate="State" ErrorMessage="Enter your state." ValidationGroup="create" Display="None" />
                                </li>
                                <li>
                                    <asp:Label ID="PostalCodeLbl" AssociatedControlID="PostalCode" runat="server">Postal Code:</asp:Label>
                                    <asp:TextBox ID="PostalCode" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PostalCodeValidator" runat="server" ControlToValidate="PostalCode" ErrorMessage="Enter your postal code." ValidationGroup="create" Display="None" />
                                </li>
                            </ul>
                        </li>
                        <li class="two">
                            <ul>
                                <li>
                                    <asp:Label ID="EmailLbl" AssociatedControlID="Email" runat="server">Email:</asp:Label>
                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="Email" SetFocusOnError="false" ErrorMessage="Enter your email." ValidationGroup="create" Display="None" />
                                    <asp:RegularExpressionValidator runat="server" ID="ValidateEmailRegEx" ControlToValidate="Email" Display="None" ErrorMessage="Make sure the email is valid" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="create" />
                                </li>
                                <li>
                                    <asp:Label ID="PhoneLbl" AssociatedControlID="Phone" runat="server">Phone:</asp:Label>
                                    <asp:TextBox ID="Phone" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ControlToValidate="Phone" ErrorMessage="Enter your phone." ValidationGroup="create" Display="None" />
                                </li>
                            </ul>
                        </li>
                        <li>
                            <asp:LinkButton ID="SaveButton" runat="server" Text="Save" CssClass="save btn"
                                ValidationGroup="create" />
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <section>
            <h2>Shipping Method</h2>
            <EPiServer:Property ID="Property2" runat="server" PropertyName="MainBody" />
            <ajax:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server" TargetControlID="ShippingUpdatePanel">
                <Animations>
                <OnUpdated>
                    <FadeIn Duration=".5" Fps="20" />
                </OnUpdated>
                </Animations>
            </ajax:UpdatePanelAnimationExtender>
            <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" ID="ShippingUpdatePanel">
                <ContentTemplate>
                    <ul class="shipMethod">
                        <li>
                            <asp:Label ID="ShippingMethodLbl" AssociatedControlID="ShippingMethod" runat="server">Method:</asp:Label>


                            <asp:DropDownList runat="server" AutoPostBack="true" ID="ShippingMethod"
                                CssClass="ctrDropDown" onBlur="this.className='ctrDropDown';" onMouseDown="this.className='ctrDropDownClick';"
                                onChange="this.className='ctrDropDown';">
                                <asp:ListItem Value="">-- Select --</asp:ListItem>
                                <asp:ListItem>1. Domestic- Shipping account number provided below (plus $15 processing fee)</asp:ListItem>
                                <asp:ListItem>2. Domestic- Shipping account number not provided  $40 ($25 delivery + $15 processing fee)</asp:ListItem>
                                <asp:ListItem>3. Canada- Shipping account number provided below (plus $15 processing fee) </asp:ListItem>
                                <asp:ListItem>4. Canada- Shipping account number not provided $50 ($35 delivery + $15 processing fee) </asp:ListItem>
                                <asp:ListItem>5. Other International- Shipping account number provided below (plus $15 processing fee) </asp:ListItem>
                                <asp:ListItem>6. Other International- Shipping account number not provided $90 ($75 delivery + $15 processing fee) </asp:ListItem>
                                <asp:ListItem>7. Ground Shipping – Promo Code </asp:ListItem>
                                <asp:ListItem>8. New York City- Pick Up in ASI Showroom (no charge)</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ShippingMethodValidator" runat="server" ControlToValidate="ShippingMethod" ErrorMessage="Enter your shipping method." Display="None" />
                        </li>
                        <li>
                            <ul class="optOne">
                                <li class="shippingCarrier" runat="server" id="ShippingCarrierLI" visible="false">
                                    <asp:Label ID="ShippingCarrierLbl" AssociatedControlID="ShippingCarrier" runat="server">Send via:</asp:Label>
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="ShippingCarrier">
                                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                                        <asp:ListItem>FedEx</asp:ListItem>
                                        <asp:ListItem>UPS</asp:ListItem>
                                        <asp:ListItem>DHL</asp:ListItem>
                                        <asp:ListItem>TNT</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ShippingCarrier" ErrorMessage="Enter your shipping carrier." Display="None" />
                                </li>
                                <li runat="server" id="ShippingTimeLI" visible="false">
                                    <asp:Label ID="OptionLbl" runat="server">Option:</asp:Label>
                                    <asp:MultiView ID="MultiViewShip" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            <asp:DropDownList runat="server" ID="ShippingTimeFedex">
                                                <asp:ListItem Value="">-- Select --</asp:ListItem>
                                                <asp:ListItem>Ground</asp:ListItem>
                                                <asp:ListItem>Next-day Priority (by 10:00 am)</asp:ListItem>
                                                <asp:ListItem>Next-day standard (by 3:00 pm)</asp:ListItem>
                                                <asp:ListItem>2-day</asp:ListItem>
                                                <asp:ListItem>International FedEx</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ShippingTimeFedex"
                                                ErrorMessage="Enter your shipping option." Display="None" />
                                        </asp:View>
                                        <asp:View ID="View2" runat="server">
                                            <asp:DropDownList runat="server" ID="ShippingTimeUPS">
                                                <asp:ListItem Value="">-- Select --</asp:ListItem>
                                                <asp:ListItem>Ground</asp:ListItem>
                                                <asp:ListItem>Next Day</asp:ListItem>
                                                <asp:ListItem>2-day</asp:ListItem>
                                                <asp:ListItem>3-day</asp:ListItem>
                                                <asp:ListItem>International UPS</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ShippingTimeUPS"
                                                ErrorMessage="Enter your shipping option." Display="None" />
                                        </asp:View>
                                    </asp:MultiView>
                                </li>
                                <li runat="server" id="ShippingNumberLI" visible="false">
                                    <asp:Label ID="ShippingNumberLbl" AssociatedControlID="ShippingNumber" runat="server">Shipping Account #</asp:Label>
                                    <asp:TextBox ID="ShippingNumber" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ShippingNumber"
                                        ErrorMessage="Enter your shipping account number." Display="None" />
                                </li>
                                <li>
                                    <asp:Label ID="PromoCodeTextLbl" AssociatedControlID="PromoCodeText" runat="server">Promo Code:</asp:Label>
                                    <asp:TextBox ID="PromoCodeText" runat="server"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidatorPromoCodeText" runat="server" ErrorMessage="The promo code is not valid." Display="None"></asp:CustomValidator>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </ContentTemplate>
            </asp:UpdatePanel>
        </section>
    </div>
    <div class="sampleCheckout right">
        <section>
            <h2>Request the most current ASI product catalogue!</h2>
            <div class="catalog">
                <AdageEpiLibrary:ImageProperty runat="server" PropertyName="BindersImage" PageLink='<%# ProductBinderPageLink %>' AltTextMetaName="Description" />

                <asp:Repeater runat="server" ID="rptBinders">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <span><%# Eval("Text") %></span>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" CommandName="AddBinder"
                                OnClientClick="return IsLoggedIn();" CommandArgument='<%# Eval("Text") %>'
                                CausesValidation="false">Add to Cart</asp:LinkButton>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </section>
        <section>
            <div class="projectInfo">
                <h2>Project Information</h2>
                <h3>I'd like to request the sample(s) for:</h3>
                <ul class="concern">
                    <li>
                        <asp:RadioButton ID="CurrentProject" GroupName="concern" runat="server" />
                        <asp:Label ID="CurrentProjectLbl" AssociatedControlID="CurrentProject" runat="server">Current Project</asp:Label>
                        <ul>
                            <li class="text">
                                <asp:Label ID="ProjectNameLbl" AssociatedControlID="ProjectName" runat="server">Project Name:</asp:Label>
                                <asp:TextBox ID="ProjectName" runat="server" />
                            </li>
                            <li class="text">
                                <asp:Label ID="NDALbl" AssociatedControlID="NDA" runat="server">If this project if under an NDA, enter Project #:</asp:Label>
                                <asp:TextBox ID="NDA" runat="server" />
                            </li>
                        </ul>
                    </li>
                    <li>
                        <asp:RadioButton ID="FutureProject" GroupName="concern" runat="server" />
                        <asp:Label ID="FutureProjectLbl" AssociatedControlID="FutureProject" runat="server">Future Project</asp:Label>
                    </li>
                    <li>
                        <asp:RadioButton ID="ResourceLibrary" GroupName="concern" runat="server" />
                        <asp:Label ID="ResourceLibraryLbl" AssociatedControlID="ResourceLibrary" runat="server">Resource Library</asp:Label>
                    </li>
                </ul>
                <h3>Project Type</h3>

                <asp:DropDownList runat="server" ID="ddlProject">
                    <asp:ListItem Value="">--Select--</asp:ListItem>
                    <asp:ListItem>Bank</asp:ListItem>
                    <asp:ListItem>Corp Interiors</asp:ListItem>
                    <asp:ListItem>Corporate Cafeteria</asp:ListItem>
                    <asp:ListItem>Distribution</asp:ListItem>
                    <asp:ListItem>Education</asp:ListItem>
                    <asp:ListItem>Franchise</asp:ListItem>
                    <asp:ListItem>Government</asp:ListItem>
                    <asp:ListItem>Healthcare</asp:ListItem>
                    <asp:ListItem>Hospitality</asp:ListItem>
                    <asp:ListItem>Institutional, Museums, etc.</asp:ListItem>
                    <asp:ListItem>Liturgy</asp:ListItem>
                    <asp:ListItem>Lobby</asp:ListItem>
                    <asp:ListItem>Multi-Family</asp:ListItem>
                    <asp:ListItem>National Account</asp:ListItem>
                    <asp:ListItem>Recreational (Health Club/Gym/Fitness)</asp:ListItem>
                    <asp:ListItem>Residential</asp:ListItem>
                    <asp:ListItem>Restaurant</asp:ListItem>
                    <asp:ListItem>Retail</asp:ListItem>
                    <asp:ListItem>Showroom</asp:ListItem>
                    <asp:ListItem>Spa</asp:ListItem>
                    <asp:ListItem>Supermarket</asp:ListItem>
                    <asp:ListItem>Theme/Entertainment</asp:ListItem>
                    <asp:ListItem>Trade Show Booth</asp:ListItem>
                    <asp:ListItem>Wholesale</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                <ul>
                    <li>
                        <asp:CheckBox ID="ContactMe" runat="server"></asp:CheckBox>
                        <asp:Label ID="ContactMeLbl" AssociatedControlID="ContactMe" runat="server">I would like to have an ASI Representative contact me.</asp:Label>
                    </li>
                </ul>
            </div>
        </section>
        <section>
            <h2>What Inspired This Request?</h2>
            <asp:CustomValidator ID="CustomValidatorReferred" runat="server" Display="None" ErrorMessage="Please specify how you were referred"></asp:CustomValidator>
            <ul class="refer">
                <li>
                    <ul>
                        <li>
                            <asp:CheckBox ID="EmailChecked" runat="server"></asp:CheckBox>
                            <asp:Label ID="EmailCheckedLbl" AssociatedControlID="EmailChecked" runat="server">ASI Product/Project E-mail</asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="EmailNameLbl" AssociatedControlID="EmailName" runat="server">Name:</asp:Label>
                            <asp:TextBox ID="EmailName" runat="server"></asp:TextBox>
                        </li>
                    </ul>
                    </li>
                    <li>
                   <ul> <li>
                            <asp:CheckBox ID="WebSearch" runat="server" Checked="true"></asp:CheckBox>
                            <asp:Label ID="WebSearchLbl" AssociatedControlID="WebSearch" CssClass="checkLabel" runat="server">Web Search</asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="SearchEngineNameLbl" AssociatedControlID="SearchEngineName" runat="server">Name:</asp:Label>
                            <asp:DropDownList ID="SearchEngineName" runat="server">
                                <asp:ListItem Value="">-- Select --</asp:ListItem>
                                <asp:ListItem>Google</asp:ListItem>
                                <asp:ListItem>Bing</asp:ListItem>
                                <asp:ListItem>Yahoo</asp:ListItem>
                                <asp:ListItem>Facebook</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li>
                            <asp:CheckBox ID="SalesRepChecked" runat="server"></asp:CheckBox>
                            <asp:Label ID="SalesRepCheckedLbl" AssociatedControlID="SalesRepChecked" runat="server">ASI Sales Rep</asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="SalesRepNameLbl" AssociatedControlID="SalesRepName" runat="server">Name:</asp:Label>
                            <asp:TextBox ID="SalesRepName" runat="server"></asp:TextBox>
                        </li>
                    </ul>
                </li>
                  <li>
                    <ul>
                        <li>
                            <asp:CheckBox ID="ColleagueChecked" runat="server"></asp:CheckBox>
                            <asp:Label ID="ColleagueCheckedLbl" AssociatedControlID="ColleagueChecked" runat="server">Friend / Colleague</asp:Label>

                        </li>
                        <li>
                            <asp:Label ID="ColleagueNameLbl" AssociatedControlID="ColleagueName" runat="server">Name:</asp:Label>
                            <asp:TextBox ID="ColleagueName" runat="server"></asp:TextBox>
                        </li>
                    </ul>
                </li>
                <li>
                   <ul> <li>
                            <asp:CheckBox ID="Social" runat="server"></asp:CheckBox>
                            <asp:Label ID="SocialLbl" AssociatedControlID="Social" CssClass="checkLabel" runat="server">Social Media</asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="SocialMediaNameLbl" AssociatedControlID="SocialMediaName" runat="server">Name:</asp:Label>
                            <asp:DropDownList ID="SocialMediaName" runat="server">
                                <asp:ListItem Value="">-- Select --</asp:ListItem>
                                <asp:ListItem>Facebook</asp:ListItem>
                                <asp:ListItem>Instagram</asp:ListItem>
                                <asp:ListItem>Pinterest</asp:ListItem>
                                <asp:ListItem>Twitter</asp:ListItem>
                                <asp:ListItem>LinkedIn</asp:ListItem>
                                <asp:ListItem>YouTube</asp:ListItem>
                                <asp:ListItem>Materialista Blog</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </li>
                 <li>
                    <ul>
                        <li>
                            <asp:CheckBox ID="TradeshowChecked" runat="server"></asp:CheckBox>
                            <asp:Label ID="TradeshowCheckedLbl" AssociatedControlID="TradeshowChecked" runat="server">Tradeshow</asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="TradeshowNameLbl" AssociatedControlID="TradeshowName" runat="server">Name:</asp:Label>
                            <asp:TextBox ID="TradeshowName" runat="server"></asp:TextBox>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li>
                            <asp:CheckBox ID="PressChecked" runat="server"></asp:CheckBox>
                            <asp:Label ID="PressCheckedLbl" AssociatedControlID="PressChecked" runat="server">Press / Advertisement</asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="PressNameLbl" AssociatedControlID="PressName" runat="server">Name:</asp:Label>
                            <asp:TextBox ID="PressName" runat="server"></asp:TextBox>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li>
                            <asp:CheckBox ID="OtherChecked" runat="server"></asp:CheckBox>
                            <asp:Label ID="OtherCheckedLbl" AssociatedControlID="OtherChecked" CssClass="checkLabel" runat="server">Other</asp:Label>

                        </li>
                        <li>
                            <asp:Label ID="OtherNameLbl" AssociatedControlID="OtherName" runat="server">Name:</asp:Label>
                            <asp:TextBox ID="OtherName" runat="server"></asp:TextBox>
                        </li>
                    </ul>
                </li>
            </ul>
            <EPiServer:Property ID="Property1" runat="server" PropertyName="Assistance" />
        </section>
    </div>
    <div class="payPalCheckout">
        <asp:MultiView ID="MultiViewCheckout" runat="server">
            <asp:View ID="View3" runat="server">
                <asp:LinkButton ID="LinkButtonCheckOut" runat="server" CssClass="btn submit">Submit Request</asp:LinkButton>
                <p>Payments are handled by Paypal. Credit cards also accepted - select Paypal Guest to pay with credit card.</p>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <p>You have not requested any samples and cannot checkout</p>
                <asp:HyperLink ID="hlNoSamples" runat="server" NavigateUrl="~/Templates/SamplesLanding.aspx">Find Samples To Request</asp:HyperLink>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
