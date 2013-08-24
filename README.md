Controle Academico
==================

Sistema tem como finalidade controlar notas dos alunos cadastrados no sistema, centralizando as informações e ajudando a calcular a nota necessária para obter aprovação.

Iniciando o projeto
-------------------

Clonando o projeto git no seu computador
```
git clone https://github.com/basmoura/controleacademicomobile.git
```

Baixe as gems necessárias para roda o projeto
```
bundle install
```

Configurando banco de dados (PostgreSQL)
----------------------------------------

Copie o arquivo de configuração exemplo e renomeio.
```
cp config/database.yml.example config/database.yml
```

Edite com as informações de acesso do seu banco
```yaml
# config/database.yml
...
development:
  ...
  username: usariopostgres
  password: senhapostgres

...

test: &test
  ...
  username: usariopostgres
  password: senhapostgres

...

production:
  ...
  username: usariopostgres
  password: senhapostgres

...
```

Criando o banco de dados e rodando migrações
```
rake db:create
rake db:migrate
```

Iniciando a aplicação
---------------------

Iniciando servidor
```ruby
rails server # alias: rails s
```

Rodando Testes (Cucumber Only)
--------------
```ruby
rake cucumber
```
