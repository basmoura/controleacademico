# language: pt
Funcionalidade: Gerênciar Usuário
  Permitir que o usuário
  Crie uma conta
  Acesse o sistema
  Altere seus dados
  Remova sua conta

  Cenário: Criar um novo usuário
  Para poder ter acesso ao sistema
  Como usuário
  Quero poder me cadastrar no sistema

  Quando acesso a pagina de cadastro
  E preencho o campo "nome" com "João"
  E preencho o campo "email" com "joao@gmail.com"
  E preencho o campo "senha" com "senha_secreta"
  Então vejo na tela "Cadastrado com sucesso"


  Cenário: Acessar sistema
  Para acessar o sistema
  Como usuário cadastrado
  Quero poder utilizar areas restritas a usuários autenticados

  Quando acesso a pagina inicial
  E preencho o campo "email" com "joao@gmail.com"
  E preencho o campo "senha" com "senha_secreta"
  Então vejo na tela "Olá João"


  Cenário: Acessar sistema
  Para acessar o sistema
  Como usuário cadastrado
  Quero poder utilizar areas restritas a usuários autenticados

  Quando acesso a pagina inicial
  E preencho o campo "email" com "joao@gmail.com"
  E preencho o campo "senha" com "senha_secreta"
  Então vejo na tela "Olá João"
