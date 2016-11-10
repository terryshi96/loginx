# coding: utf-8
require 'find'

class List
  attr_accessor :project

  def list_all
  Find.find("../projects/") do |filename|
    puts File.basename(filename,'.yml')
  end
  end

end
