# -*- encoding: utf-8 -*-
# stub: wicked 1.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "wicked"
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Richard Schneeman"]
  s.date = "2015-02-23"
  s.description = "Wicked is a Rails engine for producing easy wizard controllers"
  s.email = ["richard.schneeman+rubygems@gmail.com"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "https://github.com/schneems/wicked"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Use Wicked to turn your controller into a wizard"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.7"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.7"])
      s.add_dependency(%q<capybara>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.7"])
    s.add_dependency(%q<capybara>, [">= 0"])
  end
end