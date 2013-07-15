require 'xcoder'
require_relative 'Scripts/RakefileHelper.rb'

# mogenerator paths
model_path = "Classes/Models/DataModel/ZHFResource.xcdatamodeld/ZHFResource.xcdatamodel"
model_machine_dir_path = "Classes/Models/DataModel/Machine"
model_human_dir_path = "Classes/Models/DataModel"

task :mogen => 'tools:mogen'

namespace :tools do

  desc "Run mogenerator"
  task :mogen do
    puts
    puts "Updating Model Objects from #{model_path}".cyan
    Runner.instance.execute "Running mogenerator on model", "mogenerator --model \"#{model_path}\" --machine-dir \"#{model_machine_dir_path}\" --human-dir \"#{model_human_dir_path}\" --template-var arc=true"
  end

end