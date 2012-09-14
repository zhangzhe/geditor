module GeditorHelper
  def g_format(text)
    if text
      result = ""
      while text =~ /(\[code\:([a-z].+?)\](.+?)\[\/code\])/m
        result << GformatString.new($`).to_html_format + $&
        text = $'
      end
      result << GformatString.new(text).to_html_format
      return raw CoderayString.new(result).format
    end
  end
  
  def geditor_buttons
    raw %q(
    <script>
    /*****************************************/
    // Name: Javascript Textarea HTML Editor
    // Version: 1.3
    // Author: Balakrishnan
    // Modified by: Gary Zhang
    // Last Modified Date: 13/Sep/2012
    // License: Free
    // URL: http://www.corpocrat.com
    /******************************************/

    var textarea;
    var content;
    function gEditor(obj) {
    	document.write("<img class=\"button\" src=\"/assets/geditor/bold.png\" name=\"btnBold\" title=\"Bold\" onClick=\"doAddTags('*','*','" + obj + "')\">");
    	document.write("<img class=\"button\" src=\"/assets/geditor/underline.png\" name=\"btnUnderline\" title=\"Underline\" onClick=\"doAddTags('+','+','" + obj + "')\">");
    	document.write("<img class=\"button\" src=\"/assets/geditor/h1.png\" name=\"btnHead\" title=\"Head1\" onClick=\"doAddTags('[h]','[/h]','" + obj + "')\">");
    	document.write("<img class=\"button\" src=\"/assets/geditor/ordered.png\" name=\"btnList\" title=\"Unordered List\" onClick=\"doList('<ul>','</ul>','" + obj + "')\">");
      	document.write("<img class=\"button\" src=\"/assets/geditor/code.png\" name=\"btnCode\" title=\"Code\" onClick=\"doAddTags('[code:ruby]','[/code]','" + obj + "')\">");
    	document.write("<img class=\"button\" src=\"/assets/geditor/link.png\" name=\"btnLink\" title=\"Insert Link\" onClick=\"doAddTags('[link: link_description]','[/link]','" + obj + "')\">");
    	document.write("<img class=\"button\" src=\"/assets/geditor/image.png\" name=\"btnPicture\" title=\"Insert Picture\" onClick=\"doAddTags('[img]','[/img]','" + obj + "')\">");
    	document.write("<br>"); }
		
    function doAddTags(tag1,tag2,obj)
    {
    	textarea = document.getElementById(obj);
    	if (document.selection) // Code for IE
    	  {
    		  textarea.focus();
    			var sel = document.selection.createRange();
    			sel.text = tag1 + sel.text + tag2;
    		}
       else // Code for Mozilla Firefox
         {
    			var len = textarea.value.length;
    		   var start = textarea.selectionStart;
    			var end = textarea.selectionEnd;
    			var scrollTop = textarea.scrollTop;
    			var scrollLeft = textarea.scrollLeft;
            var sel = textarea.value.substring(start, end);
    			var rep = tag1 + sel + tag2;
            textarea.value =  textarea.value.substring(0,start) + rep + textarea.value.substring(end,len);		
    			textarea.scrollTop = scrollTop;
    			textarea.scrollLeft = scrollLeft;
    		}
    }

    function doList(tag1,tag2,obj)
    {
    	textarea = document.getElementById(obj);	
    	if (document.selection) // Code for IE
    	{
    	  textarea.focus();
    		var sel = document.selection.createRange();
    		var list = sel.text.split('\n');
    		for(i=0;i<list.length;i++) 
    		{ list[i] = '* ' + list[i]; }
    		sel.text = list.join("\n");
    	} 
    	else // Code for Firefox
    	{
    		var len = textarea.value.length;
    	   var start = textarea.selectionStart;
    		var end = textarea.selectionEnd;
    		var i;
    		var scrollTop = textarea.scrollTop;
    		var scrollLeft = textarea.scrollLeft;
         var sel = textarea.value.substring(start, end);
    		var list = sel.split('\n');
    		for(i=0;i<list.length;i++) 
    		{ list[i] = '* ' + list[i]; }
    		var rep = list.join("\n");
    		textarea.value =  textarea.value.substring(0,start) + rep + textarea.value.substring(end,len);
    		textarea.scrollTop = scrollTop;
    		textarea.scrollLeft = scrollLeft;
     	 }
    }
    gEditor('geditor'); </script>
    )
  end
end

ActionView::Base.send :include, GeditorHelper