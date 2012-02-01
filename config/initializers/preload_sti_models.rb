if Rails.env.development?
  # Make sure we preload the parent and children class in development
  %w[kase alpha_kase beta_kase].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end
