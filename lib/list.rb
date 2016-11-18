# coding: utf-8
require 'find'

class List
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
    Find.find("../projects/") do |filename|
      if File.basename(filename,'.yml') == value
        #load yaml file
        projects =  YAML::load (File.open("../projects/#{value}.yml"))
       # puts projects
        if projects == nil
          puts "no servers in this project"
          exit 1
        end
        projects.each do |item|
          puts item
        end
      end
    end
  end


end
