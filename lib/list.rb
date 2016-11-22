# coding: utf-8
require 'find'

class List_p
  attr_accessor :project

  def initialize(value)
    self.project = value
  end

  def list_all
      Find.find("../projects/") do |filename|
      puts File.basename(filename,'.yml')
    end
  end

  #find project and list records
  def list_project(value)
    if Loginx::Exist.project_exist?(value)
        projects =  YAML::load (File.open("../projects/#{value}.yml"))
        if projects == nil
          puts "no servers in this project"
          exit 1
        end
        projects.each do |item|
          puts item
        end
    else
      puts "cant find this project"
      exit 1
    end
  end

end
