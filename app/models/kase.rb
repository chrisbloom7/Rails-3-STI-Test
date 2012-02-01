class Kase < ActiveRecord::Base
  def self.inherited(child)
    child.instance_eval do
      def model_name
        Kase.model_name
      end
    end
    super
  end  
end
