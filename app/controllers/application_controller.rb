require 'java'    
require 'lib/goose-1.3.5-jar-with-dependencies.jar'

module Goose
  include_package "com.jimplush.goose"
    
  def self.extractor
    configuration = Configuration.new
    configuration.setMinBytesForImages(5000)
    configuration.setLocalStoragePath('/tmp')
    extractor = Goose::ContentExtractor.new(configuration)    
    extractor
  end
  
end

    
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def goose
    extractor = Goose::extractor
    @article = extractor.extractContent(params[:url]);
  end
  
  
end
