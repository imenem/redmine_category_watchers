# frozen_string_literal: true

module RedmineCategoryWatchers
  module Infectors
    module Issue
      module ClassMethods; end

      module InstanceMethods
        attr_accessor :attributes_before_change

        # def mail
        #   #priority.issue_slas.where(:project_id => project_id).first
        #   "teste"
        # end
      end

      def self.included(receiver)
        receiver.extend(ClassMethods)
        receiver.send(:include, InstanceMethods)
      end
    end
  end
end
