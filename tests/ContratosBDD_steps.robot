***Settings***
Documentation   Testes de contrato da API Serverest
...             https://serverest.dev

Resource        ../resources/Contratos.robot


***Test Cases***
Teste de contrato endpoint GET /produtos
    Dado que a sessão é iniciada
    Quando eu realizo a requisição       GET On Session    /produtos
    Então eu valido a estrutura de dados    get-produtos-ref.json

Teste de contrato endpoint GET /usuarios
    Dado que a sessão é iniciada
    Quando eu realizo a requisição       GET On Session    /usuarios
    Então eu valido a estrutura de dados    get-usuarios-ref.json


Teste de contrato endpoint GET /carrinhos
    Dado que a sessão é iniciada
    Quando eu realizo a requisição       GET On Session    /carrinhos
    Então eu valido a estrutura de dados    get-carrinhos-ref.json
