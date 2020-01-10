# frozen_string_literal: true

class CategoryWatcher < ActiveRecord::Base
  attr_accessor :selected_users
  attr_accessor :category
  #   attr_writer :category
end
