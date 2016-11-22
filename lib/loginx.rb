# coding: utf-8
require "loginx/version"

module Loginx
  # Your code goes here...
  class Exist

    def self.project_exist?(value)
      project_path = File.expand_path("~/.loginx/projects/")
      @flag = 0

      if File.exist?("#{project_path}")
      Find.find("#{project_path}") do |filename|
        if File.basename(filename,'.yml') == value
          @flag = 1
          return true
        end
      end

      if @flag == 0
        return false
      end

      else
        puts "initialize successfully,please try again"
      end

    end


  end
end
