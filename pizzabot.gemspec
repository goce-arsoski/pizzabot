require_relative 'lib/pizzabot/version'

Gem::Specification.new do |spec|
  spec.name          = 'pizzabot'
  spec.version       = Pizzabot::VERSION
  spec.authors       = ['Robot']
  spec.email         = ['robot@gmail.com']

  spec.summary       = %q{Robot for pizza delivery.}
  spec.description   = %q{For given string with grid and coordinates, the Pizzabot will give a string with instructions.}
  spec.homepage      = 'https://github.com/pizzabot'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata['allowed_push_host'] = 'https://github.com/pizzabot'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/pizzabot'
  spec.metadata['changelog_uri'] = 'https://github.com/pizzabot'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
