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
    raw %q(<script>gEditor('geditor'); </script>)
  end
end

ActionView::Base.send :include, GeditorHelper