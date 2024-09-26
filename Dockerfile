# Use uma imagem oficial Ruby como base
FROM ruby:3.2.2

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client nano

# Configura o diretório de trabalho na imagem Docker
WORKDIR /app

# Copia o arquivo Gemfile e Gemfile.lock para a imagem
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Instala as gems
RUN bundle install

# Copia o restante da aplicação
COPY . /app

EXPOSE 3001

# Comando para iniciar o servidor
CMD ["rails", "server", "-b", "0.0.0.0", -"p", "3001"]
