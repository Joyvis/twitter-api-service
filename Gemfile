source 'https://rubygems.org'

gem 'rails', '~> 5.1.3'
gem 'puma', '~> 3.7'
gem 'rest-client',                    '>= 2.0.1'

group :test do
  gem 'factory_bot_rails' #Utilizado para facilitar a criação de objetos utilizados nos testes
  gem 'rspec-rails' #Gem para realizar testes unitários
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5' #Gem com testes 'Pré-prontos' para evitar duplicidade de código e facilitar testes básicos
  gem 'simplecov', require: false #gem utilizada para medir o nivel de cobertura dos testes unitários
  gem 'vcr' #Gem para salvar os resultados das requisições evitando a realização de requisições todas as vezes em que os testes forem rodados
  gem 'webmock' #Gem para gerar requisições fakes e 'forçar' resultados nessas requisições
end

group :development, :test do
  gem 'pry' #Console utilizado para debugs
  gem 'listen' #Gem para 'ouvir' alterações nos arquivos evitando ter que derrubar o server a cada alteração
  gem 'pry-byebug' #Gem para gerar breakpoints facilitando o debug da aplicação
  gem 'pry-rails'
  gem 'pry-highlight'
  gem 'dotenv-rails' #Carregar variáveis de ambiente
end

group :development do
  gem 'rails_best_practices' #Gem para manter as boas praticas ruby
  gem 'rubocop' #Gem para manter as boas praticas e padrões de código
  gem 'awesome_print', require: false #Printar elementos de forma mais legível
end
