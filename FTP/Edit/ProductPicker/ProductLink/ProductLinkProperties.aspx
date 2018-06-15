<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductLinkProperties.aspx.cs" Inherits="EPiServer.Business.Commerce.UI.Edit.ProductPicker.ProductLink.ProductLinkProperties" %>
<%@ Register TagPrefix="EPiServerUI" Namespace="EPiServer.UI.WebControls" Assembly="EPiServer.UI" %>
<%@ Register TagPrefix="EPiServer" Namespace="EPiServer.Web.WebControls" Assembly="EPiServer" %>
<%@ Register TagPrefix="EPiServer" Src="~/Edit/ProductPicker/SelectProductControl.ascx" TagName ="SelectProduct"  %>
<asp:Content ContentPlaceHolderID="HeaderContentRegion" runat="server">
    <script type="text/javascript">
    // <![CDATA[
        String.prototype.Trim = new Function("return this.replace(/^\\s+|\\s+$/g,'')");

        var startLink;
        var returnValueValidationErrorMessage = null;
        
        function TabObject() 
        {}

        var WebPageTab = new TabObject();

        TabObject.prototype.GetActiveUrlFieldValue = function()
        {
		    return this.activeUrlField.value.Trim();
        }

        // GetCompleteUrl function
        TabObject.prototype.GetCompleteUrl = function()
        {
	        if(this.GetActiveUrlFieldValue().indexOf(this.activeUrlPrefix) == 0)
		        return this.GetActiveUrlFieldValue();
	        else if(this.GetActiveUrlFieldValue().length > 0)
		        return this.activeUrlPrefix + this.GetActiveUrlFieldValue();
	        else
		        return '';
        }
        
        // GetDisplayUrl function
        TabObject.prototype.GetDisplayUrl = function()
        {
	        return this.InternalPage.value;
        }
        
        // GetDefaultText function
        TabObject.prototype.GetDefaultText = function()
        {
            if (this.InternalPage.value.indexOf('[') > 0)
                return this.InternalPage.value.substring(0, this.InternalPage.value.indexOf('[') - 1);
            else
                return this.InternalPage.value;
        }
        
        // Clone an object
        function CloneObject(obj, deep)
        {
	        var objectClone = new Object();
        	
	        for (var property in obj)
	        {
		        if (!deep)
			        objectClone[property] = obj[property];
		        else if (typeof obj[property] == 'object')
			        objectClone[property] = CloneObject(obj[property], deep);
		        else
			        objectClone[property] = obj[property];
	        }
         
	        return objectClone;
        }

        var _linkinternalurl;
        var _linkinternalurlname;
        var _linklanguages;
        var _linkexternalurl;
        var _linktitle;
        var _linkframe;
        var _linkitemtypetext;
        var _linktypeinternal;
        var _linkInternalAddressContainer;
        var _linkLanguageContainer;

        // initialize a TabObject
        function initializeTabObjects()
        {
	        WebPageTab.TabElement		= document.getElementById('<%=WebPagePanel.ClientID%>');
	        WebPageTab.TabIndex			= '0';
        	
	        WebPageTab.TitleField		= _linktitle;
	        WebPageTab.TargetFrame		= _linkframe;
	        WebPageTab.LanguageList		= _linklanguages;
	        WebPageTab.InternalPage		= _linkinternalurlname;
	        WebPageTab.linkObject		= CloneObject(startLink);
        }
        
        // initialize element References
        function initializeElementReferences()
        {
	        with(document)
	        {
		        _linkinternalurl					= getElementById('<%=ProductCodeFieldId%>');
		        _linkinternalurlname				= getElementById('<%=ProductNameFieldId%>');
		        _linklanguages						= getElementById('<%=linklanguages.ClientID %>');
		        _linktitle							= getElementById('linktitle');
		        _linkframe							= getElementById('<%=linkframe.ClientID %>');
		        _linkitemtypetext					= getElementById('linkitemtypetext');
		        _linkLanguageContainer				= getElementById('linkLanguageContainer');
		        _linkInternalAddressContainer		= getElementById('linkInternalAddressContainer');
	        }
        }

        // Initialize method
        function Initialize()
        {
            startLink = EPi.GetDialog().dialogArguments;
            // initialize the element References
            initializeElementReferences();
            
            // initialize tab object
            initializeTabObjects();
            
            if (startLink.href == null)
	        {
	            document.getElementById('<%= DeleteButton.ClientID %>').disabled = true;
		    }
		    
            if ('<%= !String.IsNullOrEmpty(Language) %>' === "True") {
                startLink.language = '<%= Language %>';
            }
            
            // Set the default value for the elements
            setDefaultValues();

	        var errorMessage = '<%= ErrorMessage %>';
	        if (errorMessage != '')
	        {
		        alert(errorMessage);
		        startLink.href = '';
	        }
        }
        
        // setFieldDisplay method
        function setFieldDisplay()
        {
	        _linkInternalAddressContainer.style.display = 'inline';
	        _linkLanguageContainer.style.display = <%=EPiServer.Configuration.Settings.Instance.UIShowGlobalizationUserInterface ? "'inline'" : "startLink.language!=null ? 'inline' : 'none'"%>;
	        WebPageTab.activeUrlField		= _linkinternalurl;
	        WebPageTab.activeUrlPrefix		= '';
	        WebPageTab.isInternalPageLink	= true;
        }
        
        function setDefaultValues()
        {
            // Preselect values based on current link configuration
	        // Web Page tab
	        setTextBoxValue(_linktitle, startLink.title);
        	
        	if(startLink.target == "null")
	            selectListItem(_linkframe, "");
            else
	            selectListItem(_linkframe, startLink.target);
        	
	        // Check link type
	        if (startLink.href)
	        {
		        var url = startLink.href;
		        if (startLink.language)
		        {	// Internal page
			        selectListItem(_linklanguages, startLink.language);
		        }
	        }
	        setFieldDisplay();
        }
        
        // Add item value to item list
        function selectListItem(list, itemValue)
        {
	        if(!itemValue)
	        {
		        list.selectedIndex = 0;
		        return;
	        }
	        for(i = 0; i < list.length; i++)
	        {
		        if(list.options[i].value.toLowerCase() == itemValue.toLowerCase())
		        {
			        list.selectedIndex = i;
			        return;
		        }
	        }
	        // A value has been set, but was not found in the list. Create a (temporary) list item for the
	        // value, to avoid clearing values set in HTML-mode by just opening and closing the dialog.
	        var newOption	= document.createElement("OPTION");
	        newOption.text	= itemValue;
	        newOption.value	= itemValue;
	        
	        AddOptionToSelectList(list, newOption)
	        
	        list.selectedIndex = list.options.length-1;
        }
        
        // Set value for the text
        function setTextBoxValue(textBox, value)
        {
	        if(!value)
		        value = '';
	        textBox.value = value;
        }
        function buildReturnValue()
        {
	        // For all return values - if they are empty/cleared/undefined, pass back null.
	        var returnValue = startLink;
        	
	        returnValueValidationErrorMessage = null;

        	
	        returnValue.href			= WebPageTab.GetCompleteUrl();
	        returnValue.displayUrl		= WebPageTab.GetDisplayUrl();
	        
	        if (returnValue.href.Trim().length == 0 || returnValue.href == "0")
	        {	
		        returnValueValidationErrorMessage = '<%=EPiServer.Core.LanguageManager.Instance.TranslateForScript("/Commerce/productlinkmceplugin/productlinkproperties/nourlvalidationmessage")%>';
	        }
	        else
	        {
		        returnValue.isUpdated		= true;
		        returnValue.title			= WebPageTab.TitleField.value.Trim();
		        returnValue.target			= WebPageTab.TargetFrame != null ? WebPageTab.TargetFrame[WebPageTab.TargetFrame.selectedIndex].value : null;
		        
		        returnValue.text = WebPageTab.GetDefaultText();
	        }
            
	        if (returnValueValidationErrorMessage != null)
	        {		            
	            alert(returnValueValidationErrorMessage);
		        return false;
	        }
	        
            return returnValue;	
        }
        
        function OkClick()
        {	
	        // The ok button makes a postback but we start building the dialog returnvalue here
	        // and finish it in the postback, where we also close the dialog.	        	        	        
	        var returnValue = buildReturnValue();
	        // If we don't have a returnValue we return false to prevent the form from getting posted.
	        if (!returnValue)
	        {
	            return false;    
	        }
	        EPi.GetDialog().returnValue = returnValue;
	        return true;
	    }

        // DeleteClick method
        function DeleteClick()
        {
            var returnValue = "-1";
            EPi.GetDialog().Close(returnValue);
        }

        function CancelClick()
        {
	        EPi.GetDialog().Close();
        }
        
        // Helper method for adding option elements to a select list
        function AddOptionToSelectList(selectNode, optionNode)
        {
		    try
		    {
		        // IE way
		       selectNode.add(optionNode);
		    }
		    catch(ex)
		    {
		        // DOM level 2
		       selectNode.add(optionNode, null);
		    }
        }
        
        // ]]>
    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="FullRegion" runat="server">
<EPiServerUI:BodySettings runat="server" CssClass="epiemptybackground" />
<div class="epi-smallPadddingVertical">
    <EPiServerUI:TabStrip id="actionTab" runat="server" GeneratesPostBack="false" TargetID="tabView">
	    <EPiServerUI:Tab Text="/Commerce/productlinkmceplugin/productlinkproperties/productlink" runat="server" id="WebPageTab"/>
    </EPiServerUI:TabStrip>
    <asp:panel id="tabView" runat="server" CssClass="epi-padding-small epi-formArea">
        <asp:Panel id="WebPagePanel"  runat="server">
		    <fieldset id="fieldset_information">
			    <legend><%=EPiServer.Core.LanguageManager.Instance.Translate("/Commerce/productlinkmceplugin/productlinkproperties/informationheading")%>&nbsp;</legend>
			    <!-- Link Title -->
			    <div class="epirowcontainer">
				    <label class="episize100 epiindent" for="linktitle"><%=EPiServer.Core.LanguageManager.Instance.Translate("/Commerce/productlinkmceplugin/productlinkproperties/linktitle")%></label>
				    <input id="linktitle" class="episize240" type="text" />
			    </div>

			    <!-- Target Frame -->
			    <div class="epirowcontainer">
			        <asp:Label CssClass="episize100 epiindent" AssociatedControlID="linkframe" runat="server" Text="<%$ Resources:EPiServer, Commerce.productlinkmceplugin.productlinkproperties.targetframe %>"/>
				    <asp:DropDownList ID="linkframe" runat="server" />
			    </div>
		    </fieldset>
		    <fieldset id="fieldset_link">
			    <legend><%=EPiServer.Core.LanguageManager.Instance.Translate("/Commerce/productlinkmceplugin/productlinkproperties/linktargetheading")%>&nbsp;</legend>
			    <!-- Product Page -->
			    <div class="epirowcontainer" id="linkInternalAddressContainer">
				    <asp:Label AssociatedControlID="selectProductControl" CssClass="episize100 epiindent" Text="<%$ Resources:EPiServer, Commerce.productlinkmceplugin.productlinkproperties.address %>" runat="server" /><EPiServer:SelectProduct runat="server" id="selectProductControl" style="display:inline;" />
			    </div>

			    <!-- Language List -->
			    <div class="epirowcontainer" id="linkLanguageContainer">
				    <asp:Label AssociatedControlID="linklanguages" CssClass="episize100 epiindent" Text="<%$ Resources:EPiServer, Commerce.productlinkmceplugin.productlinkproperties.language %>" runat="server" />
				    <asp:DropDownList id="linklanguages" runat="server" />
			    </div>
		    </fieldset>
        </asp:Panel>
    </asp:Panel>
    <!-------------------->
    <!-- FOOTER SECTION -->
    <!-------------------->
    <div style="position: absolute; bottom: 25px; right: 25px;">
	    <EPiServerUI:ToolButton OnClientClick="return OkClick();" ID="OkButton" Text="<%$ Resources:EPiServer, button.ok %>" ToolTip="<%$ Resources:EPiServer, button.ok %>" runat="server" />
	    <EPiServerUI:ToolButton ID="DeleteButton" OnClientClick="DeleteClick();" GeneratesPostBack="false" Text="<%$ Resources:EPiServer, button.delete %>" ToolTip="<%$ Resources:EPiServer, button.delete %>" runat="server" />
	    <EPiServerUI:ToolButton OnClientClick="CancelClick();" GeneratesPostBack="false" Text="<%$ Resources:EPiServer, button.cancel %>" ToolTip="<%$ Resources:EPiServer, button.cancel %>" runat="server" />
    </div>
</div>
</asp:Content>