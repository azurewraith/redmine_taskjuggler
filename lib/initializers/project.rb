require_dependency 'project'

module RedmineTaskjuggler
  module Patch
    # Patches Redmine's Projects dynamically.
    module Project
      extend ActiveSupport::Concern
      included do
        extend ClassMethods
        base.class_eval do
          safe_attributes 'tj_activated',
            'tj_version',
            'tj_dailyworkinghours',
            'tj_period',
            'tj_currency',
            'tj_now',
            'tj_numberformat',
            'tj_timingresolution',
            'tj_timeformat'
        end
        base.class_eval do
          attr_accessible :tj_activated,
            :tj_version,
            :tj_dailyworkinghours,
            :tj_period,
            :tj_currency,
            :tj_now,
            :tj_numberformat,
            :tj_timingresolution,
            :tj_timeformat
        end
      end
      
      module ClassMethods
         
      end
      
      module InstanceMethods
         
      end
    end
  end
end

Project.send(:includes,RedmineTaskjuggler::Patch::Project)
Project.send(:includes,RedmineTaskjuggler::Patch::Project::InstanceMethods)
Project.safe_attributes :tj_activated,
          :tj_version,
          :tj_dailyworkinghours,
          :tj_period,
          :tj_currency,
          :tj_now,
          :tj_numberformat,
          :tj_timingresolution,
          :tj_timeformat