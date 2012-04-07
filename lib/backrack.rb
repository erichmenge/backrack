require "rubygems"
require "thor"
require "thor/group"
require "fileutils"
require "pathname"
require "backrack/version"
require "backrack/generators"

module BackRack
  class Runner < Thor
    register BackRack::Generate, 'generate', 'generate <command>', "Generates new models, views, collections"
    desc "new NAME", "Creates a new Backrack application bundle"
    def new(*args)
      BackRack::NewApp.start args
      FileUtils.cd args[0]
      BackRack::Generate.new.invoke "view", ['root'], :body => "Congratulations, you're running Backrack."
      system 'bundle install'
    end
  end
  
  module Helpers
    module String
      def camelize
        self.split(/[_\/]/).map(&:capitalize).join
      end
    end
  end
end

class String
  include BackRack::Helpers::String
end
