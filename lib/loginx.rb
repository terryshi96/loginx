# coding: utf-8
require "loginx/version"

module Loginx
  # Your code goes here...
  class Exist

    def self.project_exist?(value)
      project_path = "../projects/"

      Find.find("#{project_path}") do |filename|
        if File.basename(filename,'.yml') == value
          return true
        else
          return false
        end
      end
    end


  end
end
