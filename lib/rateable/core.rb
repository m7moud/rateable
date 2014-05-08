module Rateable
  module Core
    extend ActiveSupport::Concern
    module ClassMethods
      def rateable?
        true
      end

      def rateable
        include Rateable::Core::ClassMethods
        include Rateable::Core::InstanceMethods
        has_many :ratings, :as => :rateable, :dependent => :destroy
        
        scope :best_rated, lambda {order('rating desc') }
        scope :most_rated, lambda {order('ratings_count desc') }
      end
    end
    
    module InstanceMethods
      include Rateable::Core::ClassMethods
      def rated?(owner)
        rate = rating_by_user(owner)
        if !rate.nil?
          rate.rating
        else
          false
        end
      end
      
      def rating_by_user(owner)
        owner = owner.id if owner.is_a?(User)
        self.ratings.where(:user_id => owner).first
      end
      
      def rating!
        Rating.where(:rateable_type => self.class.base_class.name, :rateable_id => self.id).average(:rating) || 0.0
      end
      
      def rate(options)
        options[:user_id] = options.delete(:user).id if options[:user]
        self.ratings.create(options)
      end
      
      def users_rated(options={})
        options = {
          :limit => 10,
          :conditions => ["ratings.rateable_type = ? and ratings.rateable_id = ?", self.class.base_class.name, self.id],
          :join => :ratings
        }.merge(options)

        if Object.const_defined?('Paginate')
          User.paginate(options)
        else
          User.joins(options[:joins]).where(options[:conditions]).limit(options[:limit]).select("*")
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Rateable::Core
