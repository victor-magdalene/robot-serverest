***Settings***
Documentation   Suíte de testes para a funcionalidade de login da API Serverest
...             https://serverest.dev/

Resource        ../resources/LoginBDD.robot


***Test Cases***
Login realizado com sucesso
    Dado que a sessão é iniciada
    Quando eu realizar o login com o email e a senha    testeqa@qa.com  1234
    Então obtenho o status code     200
    E obtenho a mensagem no campo   Login realizado com sucesso     message   
    E obtenho o token vinculado ao usuário  

Login com senha incorreta
    Dado que a sessão é iniciada
    Quando eu realizar o login com o email e a senha    testeqa@qa.com      12345
    Então obtenho o status code     401
    E obtenho a mensagem no campo    Email e/ou senha inválidos     message

Login com email incorreto
    Dado que a sessão é iniciada
    Quando eu realizar o login com o email e a senha    testeqa@qa.co     12345
    Então obtenho o status code     401
    E obtenho a mensagem no campo    Email e/ou senha inválidos     message

Login com email em branco
    Dado que a sessão é iniciada
    Quando eu realizar o login com o email e a senha    ${EMPTY}   "12345"
    Então obtenho o status code     400
    E obtenho a mensagem no campo    email não pode ficar em branco     email

Login com senha em branco
    Dado que a sessão é iniciada
    Quando eu realizar o login com o email e a senha    testeqa@qa.com      ${EMPTY}
    Então obtenho o status code     400
    E obtenho a mensagem no campo    password não pode ficar em branco      password

Login com senha e email em branco
    Dado que a sessão é iniciada
    Quando eu realizar o login com o email e a senha    ${EMPTY}    ${EMPTY}
    Então obtenho o status code     400
    E obtenho a mensagem no campo    email não pode ficar em branco     email
    E obtenho a mensagem no campo    password não pode ficar em branco  password




