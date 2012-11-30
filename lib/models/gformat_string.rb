class GformatString < String
  def to_html_format
    content = self
    classes_in_order = self.class.subclasses.map(&:to_s).sort.map(&:constantize)
    classes_in_order.each do |formatable_string|
      content = formatable_string.new(content).format
    end
    return content
  end
end

#importent to put it in first (not good)
class ListString < GformatString
  def format
    content = self + "\n" # add \n
    content.gsub!(/(^\* [^\n]+\n)+/) {|ul| "<ul>#{ul.gsub!(/\* [^\n]+\n/){|li| "<li>#{li[2..-2]}</li>"} }<\/ul>"}
    return content[0..-2] # remove \n
  end
end

class NString < GformatString
  def format
    return self.gsub("\n", "<br/>\n\r").gsub("\t", "&nbsp;&nbsp;")
  end
end

class FontSizeString < GformatString
  def format
    return self.gsub(/\[h\](.+)\[\/h\]/,'<span style="font-size:27px">\1</span>')
  end
end

class ImageString < GformatString
  def format
    return self.gsub(/\[img(:*.*)\](.+?)\[\/img\]/,'<img style="float\1" src="\2">')
  end
end

class UrlString < GformatString
  def format
    return self.gsub(/\[link:(.+?)\](.+?)\[\/link\]/, '<a target="_blank" style="color:#2894FF" href=\2>\1</a>')
  end
end

class RuleString < GformatString
  RULES = {"*" => "</b>"}
  def format
    @content = self
    unescape_rule = generate_unescape_rule
    escape_rule = generate_escape_rule(unescape_rule)
    escape(escape_rule)
    convert
    escape(unescape_rule)
    return @content
  end

  private
  def convert
    RULES.each do |key, value|
      while @content =~ /#{"\\"+key}(.+?)#{"\\"+key}/m
        @content = $` + value.delete("/") + $1 + value + $'
      end
    end
  end

  def generate_unescape_rule
     un_escape_rule = []
      RULES.each_key do |key|
        un_escape_rule << [Kernel.rand.to_s, key]
      end
    un_escape_rule
  end

  def generate_escape_rule(un_escape_rule)
    return un_escape_rule.map{|rule| ["\\" + rule[1], rule[0]]}
  end

  def escape(escape_rules)
    escape_rules.each { |escape_rule| @content.gsub!(escape_rule[0], escape_rule[1]) }
  end
end