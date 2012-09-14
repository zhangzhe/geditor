require "geditor/version"
require 'action_view'
require 'coderay'
require File.expand_path('../models/coderay_string.rb', __FILE__)
require File.expand_path('../models/gformat_string.rb', __FILE__)
require File.expand_path('../helpers/geditor_helper.rb', __FILE__)

class GeditorUtils
  def self.copy_files
    require "fileutils"
    dir = "app/assets/stylesheets"
    file = File.expand_path('../stylesheets/geditor.css', __FILE__)
    FileUtils.mkdir_p dir unless File.exists? dir
    FileUtils.cp(file, dir)
        
    dir = "app/assets/images"
    folder = File.expand_path('../images/geditor/', __FILE__)    
    FileUtils.mkdir_p dir unless File.exists? dir
    FileUtils.cp_r(folder, dir)
  rescue
  end
end

GeditorUtils.copy_files