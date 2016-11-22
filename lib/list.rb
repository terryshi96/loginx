# coding: utf-8
require 'find'

class List_p
  attr_accessor :project


  def initialize(value)
    self.project = value
  end

  def list_all
    project_path = File.expand_path("~/.loginx/projects/")
      Find.find("#{project_path}") do |filename|
      puts File.basename(filename,'.yml')
    end
  end

  #find project and list records
  def list_project(value)
    if Loginx::Exist.project_exist?(value)
      project_path = File.expand_path("~/.loginx/projects/")
        projects =  YAML::load (File.open("#{project_path}/#{value}.yml"))
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
