class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    # Syntax sugar for before and except filters:
    # before_filter :assign_somesing, :only => for_forms(:and => :another_action)
    def self.for_forms(options={})
      actions =  [:new, :edit, :create, :update]
      actions += [options[:and]].flatten     if options[:and]
      actions -= [options[:without]].flatten if options[:without]
      actions.flatten
    end

    # Syntax sugar for before and except filters:
    # before_filter :assign_collection, :only => for_crud(:and => :another_action)
    def self.for_crud(options={})
      actions =  [:show, :new, :edit, :create, :update, :destroy]
      actions += [options[:and]].flatten     if options[:and]
      actions -= [options[:without]].flatten if options[:without]
      actions.flatten
    end
end
