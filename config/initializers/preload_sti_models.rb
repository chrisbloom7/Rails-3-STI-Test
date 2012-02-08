if !Rails.configuration.action_controller.perform_caching?
  # Pre-loadeing our STI subclasses in development so Kase.descendants is properly populated
  %w[kase alpha_kase beta_kase].each do |klass|
    require_dependency Rails.root.join("app","models","#{klass}.rb").to_s
  end
end
