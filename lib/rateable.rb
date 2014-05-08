require "active_record"
require 'active_support/concern'

$LOAD_PATH.unshift(File.dirname(__FILE__))

module Rateable
  if defined?(ActiveRecord::Base)
    require "rateable/core"
    require "rateable/rating"
    require "rateable/version"
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.extend Rateable::Core
  end
end
