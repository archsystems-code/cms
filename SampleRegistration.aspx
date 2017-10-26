<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="SampleRegistration.aspx.cs" Inherits="ASI.Web.Views.Pages.SampleRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="mainContent">
        <div class="registrationWrapper">
            <div class="welcomeText">
                <EPiServer:Property ID="Property1" runat="server" PropertyName="MainBody" />
            </div>
            <EPiServer:Property ID="Property2" runat="server" PropertyName="Image" />
        </div>

        <div class="formsWrapper">
            <div class="requestThirds">
                <EPiServer:Property ID="Property9" runat="server" CustomTagName="h2" PropertyName="ReturnCustomerHeadline" />
                <p>Please log in below:</p>
                <ul>
                    <li>
                        <label>Email Address:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="loginEmail"
                            ErrorMessage="*" ValidationGroup="login" Display="Dynamic" CssClass="error" />
                        <asp:TextBox runat="server" ID="loginEmail" />
                    </li>
                    <li>
                        <label>Password:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="loginPassword"
                            ErrorMessage="*" ValidationGroup="login" Display="Dynamic" CssClass="error" />
                        <asp:TextBox runat="server" ID="loginPassword" TextMode="Password" />
                    </li>
                    <li class="submit">
                        <asp:Button runat="server" ID="btnLogin" CssClass="btn" Text="Log In" ValidationGroup="login"></asp:Button>
                        <a href="/Forgot-Password" class="forgot">Forgot your password?</a>
                    </li>
                </ul>

                <small class="validation" id="errorPanel" visible="false" runat="server">
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></small>

            </div>

            <div class="requestThirds">
                <EPiServer:Property ID="Property6" runat="server" CustomTagName="h2" PropertyName="NewCustomerHeadline" />
                <EPiServer:Property ID="Property3" runat="server" PropertyName="NewCustomerIntroText" />
                <input type="submit" class="registerButton customerBtn" value="Register" />
            </div>

            <div class="requestThirds noMarginRight">
                <EPiServer:Property ID="Property5" runat="server" CustomTagName="h2" PropertyName="StudentHeadline" />
                <EPiServer:Property ID="Property4" runat="server" PropertyName="StudentIntroText" />
                <input type="submit" class="registerButton studentBtn" value="Register" />
            </div>

            <asp:HiddenField runat="server" ID="hidCustomerType" ClientIDMode="Static" />

            <div class="newCustomer">
                <EPiServer:Property ID="Property10" runat="server" CustomTagName="h2" PropertyName="CustomerRegisterHeadline" />
            </div>

            <div class="studentEducators">
                <EPiServer:Property ID="Property7" runat="server" CustomTagName="h2" PropertyName="StudentRegisterHeadline" />
                <EPiServer:Property ID="Property8" runat="server" PropertyName="StudentText" />
            </div>

            <div class="register registration" runat="server" style="display: none" id="RegisterDiv">
                <asp:ValidationSummary ID="ValidationSummary1" CssClass="validation" runat="server"
                    ValidationGroup="create" DisplayMode="BulletList" EnableClientScript="true" ShowMessageBox="false"
                    Visible="true" ShowSummary="true" />
                <asp:CustomValidator runat="server" ID="InvalidUserName" ValidationGroup="create"
                    Display="None" ErrorMessage="This email has already been used. Please use another one."></asp:CustomValidator>

                <div class="requestThirds">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="FirstName">First Name<sup>*</sup></asp:Label>
                    <asp:TextBox runat="server" ID="FirstName" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstName"
                        ErrorMessage="Enter your first name." ValidationGroup="create" Display="None" />

                    <asp:Label ID="Label2" AssociatedControlID="LastName" runat="server">Last Name<sup>*</sup></asp:Label>
                    <asp:TextBox ID="LastName" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="LastName"
                        ErrorMessage="Enter your last name." ValidationGroup="create" Display="None" />
                    <asp:Label ID="Label3" AssociatedControlID="CompanyOrSchoolName" runat="server" CssClass="companyschoolname">Company<sup>*</sup></asp:Label>
                    <asp:TextBox ID="CompanyOrSchoolName" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="CompanyOrSchoolName"
                        ErrorMessage="Enter your company." ValidationGroup="create" Display="None" />
                    <asp:Label ID="Label4" AssociatedControlID="Phone" runat="server">Phone<sup>*</sup></asp:Label>
                    <asp:TextBox ID="Phone" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Phone"
                        ErrorMessage="Enter your phone." ValidationGroup="create" Display="None" />
                    <asp:Label ID="Label5" AssociatedControlID="Profession" runat="server" CssClass="professionlabel"> Professional Information<sup>*</sup></asp:Label>
                    <asp:DropDownList CssClass="profession" runat="server" ID="Profession">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Architect</asp:ListItem>
                        <asp:ListItem>Architectural Millworker</asp:ListItem>
                        <asp:ListItem>Designer</asp:ListItem>
                        <asp:ListItem>General Contractor</asp:ListItem>
                        <asp:ListItem>Flooring Contractor</asp:ListItem>
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Educator</asp:ListItem>
                        <asp:ListItem>ASI Representative</asp:ListItem>
                        <asp:ListItem>Construction Manager</asp:ListItem>
                        <asp:ListItem>Developer</asp:ListItem>
                        <asp:ListItem>Healthcare</asp:ListItem>
                        <asp:ListItem>Franchise</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="Profession"
                        ErrorMessage="Enter your profession." Display="None" ValidationGroup="create" />
                </div>
                <div class="requestThirds">
                    <asp:Label ID="Label6" AssociatedControlID="Address" runat="server">Address<sup>*</sup></asp:Label>
                    <asp:TextBox ID="Address" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Address"
                        ErrorMessage="Enter your address." ValidationGroup="create" Display="None" />
                    <asp:Label ID="Label7" AssociatedControlID="City" runat="server">City<sup>*</sup></asp:Label>
                    <asp:TextBox ID="City" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="City"
                        ErrorMessage="Enter your city." ValidationGroup="create" Display="None" />
                    <asp:Label ID="Label8" AssociatedControlID="Country" runat="server">Country<sup>*</sup></asp:Label>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Country"
                        ErrorMessage="Enter your country." ValidationGroup="create" Display="None" />
                    <asp:Label ID="Label9" AssociatedControlID="State" runat="server" CssClass="statedropdown">State<sup>*</sup></asp:Label>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="State"
                        ErrorMessage="Enter your state." ValidationGroup="create" Display="None" />
                    <asp:Label ID="Label10" AssociatedControlID="PostalCode" runat="server">
                    Postal Code
                    <sup>*</sup></asp:Label>
                    <asp:TextBox ID="PostalCode" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="PostalCode"
                        ErrorMessage="Enter your postal code." ValidationGroup="create" Display="None" />
                </div>
                <div class="requestThirds noMarginRight">
                    <asp:Label ID="Label11" AssociatedControlID="Email" runat="server">
                Email
                <sup>*</sup></asp:Label>
                    <asp:TextBox ID="Email" runat="server" CssClass="username" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Email"
                        SetFocusOnError="false" ErrorMessage="Enter your email." ValidationGroup="create"
                        Display="None" />
                    <asp:RegularExpressionValidator runat="server" ID="ValidateEmailRegEx" ControlToValidate="Email"
                        Display="None" ErrorMessage="Make sure the email is valid" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="create" />
                    <asp:Label ID="Label12" AssociatedControlID="DesiredPassword" runat="server">
                    Password
                    <sup>*</sup></asp:Label>
                    <asp:TextBox ID="DesiredPassword" runat="server" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DesiredPassword"
                        ErrorMessage="Enter your password." ValidationGroup="create" Display="None" />
                    <asp:Label ID="Label13" AssociatedControlID="ConfirmPassword" runat="server">
                    Confirm Password
                    <sup>*</sup></asp:Label>
                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ConfirmPassword"
                        ErrorMessage="Confirm your password." ValidationGroup="create" Display="None" />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Make sure the passwords are the same."
                        ControlToCompare="ConfirmPassword" ControlToValidate="DesiredPassword" ValidationGroup="create"
                        Display="None"></asp:CompareValidator>
                    <asp:LinkButton ID="ButtonRegister" runat="server" Text="Register" CssClass="btn"
                        ValidationGroup="create" CausesValidation="true" />
                    <p class="secure"><small>Your email is secure with us. We will never rent, sell or share your email address. View our <a href="#">Terms of Use</a> for more information.</small></p>
                </div>
            </div>
        </div>
    </div>
    <style>
        fieldset fieldset legend { font-size: 1.25em; }

        fieldset fieldset fieldset legend {
        font-size: 1em;
        font-weight: bold;
        border-bottom: none;
        margin-bottom: 5px;
        }

        .row legend { margin-left: 15px; }

        .submit { margin-top: 25px; }

        .jumbotron ul { font-size: .75em; }

        #progress-bar-wrap {
        min-height: 20px;
        display: none;
        margin-bottom: 0;
        }

        #progress-bar-wrap .encouragement { display: none; }

        #progress-bar-wrap .close:before {
        content: "\f0d7";
        display: inline-block;
        font-family: FontAwesome;
        font-style: normal;
        font-weight: normal;
        line-height: 1;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        }

        #progress-bar-wrap span { line-height: 1.75em; }

        #progress-bar-wrap.collapsed h4 {
        font-size: 14px;
        color: #999999;
        }

        #progress-bar-wrap.collapsed .encouragement { display: none; }

        #progress-bar-wrap.collapsed .progress { display: none; }

        #progress-bar-wrap.collapsed .close:before {
        content: "\f0d8";
        display: inline-block;
        font-family: FontAwesome;
        font-style: normal;
        font-weight: normal;
        line-height: .75em;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#MainContent_FirstName, #MainContent_LastName, #MainContent_CompanyOrSchoolName, #MainContent_Phone, #MainContent_Profession, #MainContent_Address, #MainContent_City, #MainContent_Country, #MainContent_State, #MainContent_PostalCode, #MainContent_Email, #MainContent_DesiredPassword, #MainContent_ConfirmPassword').addClass("required");
            $('#form1').showProgress();
            $('.customerBtn').click(function () {
                $('.studentEducators').hide();
                $('.register').show();
                $('#registerTitle').html('Register');
                $('.companyschoolname').html('Company<sup>*</sup>');
                $('.professionlabel').html('Profession<sup>*</sup>');
                $('.profession').empty();
                $('.profession').append($('<option></option>').val('').html('--Select--'));
                $('.profession').append($('<option></option>').val('Architect').html('Architect'));
                $('.profession').append($('<option></option>').val('Architectural Millworker').html('Architectural Millworker'));
                $('.profession').append($('<option></option>').val('Designer').html('Designer'));
                $('.profession').append($('<option></option>').val('General Contractor').html('General Contractor'));
                $('.profession').append($('<option></option>').val('Flooring Contractor').html('Flooring Contractor'));
                $('.profession').append($('<option></option>').val('ASI Representative').html('ASI Representative'));
                $('.profession').append($('<option></option>').val('Construction Manager').html('Construction Manager'));
                $('.profession').append($('<option></option>').val('Developer').html('Developer'));
                $('.profession').append($('<option></option>').val('Healthcare').html('Healthcare'));
                $('.profession').append($('<option></option>').val('Franchise').html('Franchise'));
                $('.profession').append($('<option></option>').val('Other').html('Other'));
                $('.newCustomer').show();
                $('.studentBtn').show();
                $('.customerBtn').hide();
                $('.student').hide();
                $('#hidCustomerType').val('RegularCustomer');
                return false;
            });
            $('.studentBtn').click(function () {
                $('.newCustomer').hide();
                $('.register').show();
                $('#registerTitle').html('Students / Educators');
                $('.companyschoolname').html('Educational Institution<sup>*</sup>');
                $('.professionlabel').html('Student or Educator<sup>*</sup>');
                $('.profession').empty();
                $('.profession').append($('<option></option>').val('').html('--Select--'));
                $('.profession').append($('<option></option>').val('Student').html('Student'));
                $('.profession').append($('<option></option>').val('Educator').html('Educator'));
                $('.profession').append($('<option></option>').val('Other').html('Other'));
                $('.studentEducators').show();
                $('.studentBtn').hide();
                $('.customerBtn').show();
                $('.student').hide();
                $('#hidCustomerType').val('Student');
                return false;
            });
            ToggleStates(true);
        });



        ValidatorCommonOnSubmit = function () {
            $('.error').removeClass('error');
            var i;
            var pageValid = true;
            for (i = 0; i < Page_Validators.length; i++) {
                if (!Page_Validators[i].isvalid) {
                    $('#' + Page_Validators[i].controltovalidate).addClass('error');
                    pageValid = false;
                }
            }
            return pageValid;
        }
    </script>
    <script src="https://raw.githubusercontent.com/archsystems-code/form-progress-bar/master/assets/js/jq.progress-bar.js"></script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
