# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{optionize}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["maiha"]
  s.date = %q{2010-02-02}
  s.description = %q{method argument utils}
  s.email = %q{maiha@wota.jp}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README", "Rakefile", "lib/optionize", "lib/optionize/array.rb", "lib/optionize.rb", "spec/optionize_spec.rb", "spec/hash_spec.rb", "spec/its_helper.rb", "spec/spec_helper.rb", "spec/syntax_spec.rb"]
  s.homepage = %q{http://github.com/maiha/optionize}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{asakusarb}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{method argument utils}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
