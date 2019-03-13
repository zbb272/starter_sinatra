class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  #set :views, "../views"
  set :views, Proc.new { File.join(root, "../views/") }
end
