Quando(/^acesso a pagina de cadastro$/) do
  visit new_user_path
end

Quando(/^preencho o campo "(.*?)" com "(.*?)"$/) do |input, value|
  fill_in input, :with => value
end

Então(/^vejo na tela "(.*?)"$/) do |text|
  should include(text)
end
