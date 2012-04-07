module BackRack
  class NewApp < Thor::Group
     include Thor::Actions
   
     argument :name
   
     def self.source_root
       File.join File.dirname(__FILE__), 'templates'
     end
   
     def gemfile
       template 'Gemfile', "#{name}/Gemfile"
     end
     
     def rack
       template 'config.ru', "#{name}/config.ru"
     end
     
     def stylesheets
       template 'application.css', "#{name}/src/stylesheets/application.css"
     end
     
     def javascripts
       template 'application.js', "#{name}/src/javascripts/application.js"
     end
     
     def structure
       %w{javascripts/collections javascripts/models javascripts/views javascripts/templates
          stylesheets/vendor}.each do |directory|
         copy_file '.gitkeep', "#{name}/src/#{directory}/.gitkeep"
       end
     end
 
     def rakefile
       template 'Rakefile', "#{name}/Rakefile"
     end
     
     def statics
       copy_file 'index.html', "#{name}/public/index.html"
       %w{jquery-1.7.2.js json2.js backbone.js underscore.js}.each do |static|
         copy_file static, "#{name}/src/javascripts/vendor/#{static}"
       end
       copy_file '../../../bin/backrack', "#{name}/scripts/backrack"
       FileUtils.chmod 0755, "#{name}/scripts/backrack", verbose: false
     end
     
     def config_javascript
       template 'config.js.coffee', "#{name}/src/javascripts/config.js.coffee"
     end
     
     def boot_file
       template 'boot.js.coffee', "#{name}/src/javascripts/boot.js.coffee"
     end
     
     def router
       template 'router.js.coffee', "#{name}/src/javascripts/router.js.coffee"      
     end
  end
  
  class Generate < Thor
    include Thor::Actions
    
    def self.banner(task, namespace = false, subcommand = false)
      "#{basename} generate #{task.formatted_usage(self, namespace, subcommand)}"
    end
      
    def initialize(*args)
      raise "No Backrack app found." unless File.exists?(File.join(Pathname.new(Dir.pwd), 'scripts', 'backrack'))
      super(*args)
    end
    
    def self.source_root
      File.join File.dirname(__FILE__), 'templates'
    end
    
    desc "view NAME", "Creates a new view"
    method_option :body, type: :string
    def view(name)
      @name = name
      @body = options[:body]
      @camelized_name = name.camelize
      template "view.js.coffee", "src/javascripts/views/#{name}.js.coffee"
      template "view.jst.eco", "src/javascripts/templates/#{name}.jst.eco"   
    end
    
    desc "model NAME", "Creates a new model"
    def model(name)
      @name = name.camelize
      template "model.js.coffee", "src/javascripts/models/#{name}.js.coffee"
    end
    
    desc "collection NAME", "Creatse a new collection"
    method_option :model, type: :string
    method_option :url, type: :string
    def collection(name)
      @name   = name.camelize
      @model  = options[:model]
      @url    = options[:url]
      template "collection.js.coffee", "src/javascripts/collections/#{name}.js.coffee"
    end
  end
end
