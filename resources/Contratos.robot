***Settings***
Documentation   Testes de contrato da API Serverest
...             https://serverest.dev

Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     JSONSchemaLibrary   ../resources/schema

***Variables***
${API_URL}      http://serverest.dev
${ALIAS}        serverest

***Keywords***
Dado que a sessão é iniciada
    Create Session      ${ALIAS}    ${API_URL}

Quando eu realizo a requisição
    [Arguments]     ${METODO}   ${ENDPOINT}
    
    ${URL}                  Set Variable    ${API_URL}${ENDPOINT}
    ${RESPONSE_JSON}        Run Keyword     ${METODO}   ${ALIAS}    ${URL}   expected_status=Any
    Set Test Variable       ${RESPONSE_JSON}
    Log                     ${RESPONSE_JSON.json()}

Então eu valido a estrutura de dados   
    [Arguments]             ${REF_JSON}
    Validate Json           ${REF_JSON}      ${RESPONSE_JSON.json()}        
    














    
    #  ${schema}=             OperatingSystem.Get File    ${CURDIR}${/}schema/contrato_produto.json
    # Validate jsonschema    ${RESPONSE_JSON.json()}    ${schema} 


    # ${teste}     Get Value From Json     ${RESPONSE_JSON.json()}    $.produtos[0].nome
    #     ${teste2}    Get Value From Json     ${RESPONSE_JSON.json()}    $.quantidade
    # Log                     ${teste}
    # Log                     ${teste2}
    # Should Be True          type(${teste}) is str
    # Should Be True          type(${RESPONSE_JSON.json()['produtos']}) is list
    # Should Be True          type(${RESPONSE_JSON.json()['produtos'][0]['preco']}) is int
    # Should Be True          type(${RESPONSE_JSON.json()['produtos'][0]['quantidade']}) is int
    # Log                     type(${RESPONSE_JSON.json()['produtos'][0]['_id']}))
    # Should Be True          type(${RESPONSE_JSON.json()['produtos'][0]['nome']}) is str
    # Should Be True          isinstance(${RESPONSE_JSON.json()['produtos'][0]['descricao']}, str)
    # Should Be True          type(${RESPONSE_JSON.json()['produtos'][0]['nome']}) is str


  