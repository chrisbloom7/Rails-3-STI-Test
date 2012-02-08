class Kase < ActiveRecord::Base
  validate do |kase|
    kase.errors[:type] << "must be a valid subclass of Kase" unless Kase.descendants.collect(&:original_model_name).include?(kase.type)
  end
  # Make sure our STI children are routed through the parent routes
  def self.inherited(child)
    child.instance_eval do
      alias :original_model_name :model_name
      def model_name
        Kase.model_name
      end
    end
    super
  end
end
