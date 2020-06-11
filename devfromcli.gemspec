Gem::Specification.new do |spec|
  spec.name = 'devfromcli'
  spec.version = '0.1.0'
  spec.authors = ['Opara Prosper']
  spec.email = ['oparaprosper79@gmail.com']
  spec.license = 'MIT'

  spec.summary = 'devfromcli is a tool that allows users to interact with the Dev.to platfrom the CLI'
  spec.description = 'devfromcli allows users to fetch latest articles on the dev.to platform (users
                      articles and latest articles from other authors, fetch articles based on their
                      interest using tags, and quickly put together an article draft for latter)'
  spec.homepage = 'https://github.com/OPARA-PROSPER/DEV-from-CLI'
  spec.files = ['lib/devfromcli.rb']
  spec.executables = ['devfromcli']
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_url'] = spec.homepage
  spec.metadata['source_code_url'] = spec.homepage
end
