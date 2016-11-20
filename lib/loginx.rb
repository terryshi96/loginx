# coding: utf-8
require "loginx/version"

module Loginx
  # Your code goes here...
  class Exist

    def self.project_exist?(value)
      project_path = "../projects/"
      @flag = 0
      Find.find("#{project_path}") do |filename|
        if File.basename(filename,'.yml') == value
          @flag = 1
          return true
        end
      end

      if @flag == 0
        return false
      end
    end


  end
end
