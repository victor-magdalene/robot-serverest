***Settings***
Documentation   Suíte de testes para a funcionalidade de cadastro de usuário da API Serverest
...             https://serverest.dev/

Resource        ../resources/UsuariosBDD.robot


***Test Cases***
Parametrizo o usuário a ser usado na massa
    Dado que a sessão é iniciada
    Quando eu verifico se o usuário já existe pelo email    bob@qa.com
    Então eu salvo o ID numa variável
    E excluo o usuário e aguardo uma mensagem   Registro excluído com sucesso       message

Cadastro com dados corretos
    Dado que a sessão é iniciada
    Quando eu utilizar os parametros    Bob     bob@qa.com      1234        true              
    Então obtenho o status code     201
    E obtenho a mensagem no campo   Cadastro realizado com sucesso      message
    E obtenho o ID do usuário

Cadastro com email já existente
    Dado que a sessão é iniciada
    Quando eu utilizar os parametros    Bob2     bob@qa.com      1234        true              
    Então obtenho o status code     400
    E obtenho a mensagem no campo   Este email já está sendo usado      message

Cadastro com nome em branco
    Dado que a sessão é iniciada
    Quando eu utilizar os parametros    ${EMPTY}     bob@qa.com      1234        true              
    Então obtenho o status code     400
    E obtenho a mensagem no campo   nome não pode ficar em branco      nome

Cadastro com email em branco
    Dado que a sessão é iniciada
    Quando eu utilizar os parametros    Bob     ${EMPTY}       1234        true              
    Então obtenho o status code     400
    E obtenho a mensagem no campo   email não pode ficar em branco      email

Cadastro com email em incorreto
    Dado que a sessão é iniciada
    Quando eu utilizar os parametros    Bob     bob*qa.com       1234        true              
    Então obtenho o status code     400
    E obtenho a mensagem no campo   email deve ser um email válido      email


Cadastro com senha em branco
    Dado que a sessão é iniciada
    Quando eu utilizar os parametros    Bob     bob@qa.com       ${EMPTY}        true              
    Então obtenho o status code     400
    E obtenho a mensagem no campo   password não pode ficar em branco      password

Cadastro com administrador em branco
    Dado que a sessão é iniciada
    Quando eu utilizar os parametros    Bob     bob@qa.com       1234        ${EMPTY}               
    Então obtenho o status code     400
    E obtenho a mensagem no campo   administrador deve ser 'true' ou 'false'      administrador


Cadastro com administrador inválido
    Dado que a sessão é iniciada
    Quando eu utilizar os parametros    Bob     bob@qa.com       1234        abc              
    Então obtenho o status code     400
    E obtenho a mensagem no campo   administrador deve ser 'true' ou 'false'      administrador






