***Settings***
Documentation   Suíte de testes para a funcionalidade de login da API Serverest
...             https://serverest.dev/

Library     RequestsLibrary
Library     Collections


***Variables***
${API_URL}      http://serverest.dev
${ALIAS}        serverest

***Keywords***
Dado que a sessão é iniciada
    Create Session      ${ALIAS}    ${API_URL}

Quando eu realizar o login com o email e a senha
    [Arguments]     ${EMAIL}  ${SENHA}

    ${HEADERS}              Create Dictionary       content-type=aplication/json
    ${REQ_BODY}             Create Dictionary       email=${EMAIL}           password=${SENHA}
    ${RESPONSE_JSON}        POST On Session         alias=${ALIAS}           url=${API_URL}/login       data=${REQ_BODY}    expected_status=Any
    Set Test Variable       ${RESPONSE_JSON}
    Log                     ${RESPONSE_JSON}  

Então obtenho o status code
    [Arguments]     ${STATUS_CODE}

    Should Be Equal As Strings        ${STATUS_CODE}      ${RESPONSE_JSON.status_code}

E obtenho a mensagem no campo
    [Arguments]     ${MSG_RETORNO}  ${CAMPO_RETORNO}

    Should Be Equal As Strings      ${MSG_RETORNO}      ${RESPONSE_JSON.json()['${CAMPO_RETORNO}']} 
    Log                             ${RESPONSE_JSON.json()['${CAMPO_RETORNO}']} 

E obtenho o token vinculado ao usuário

    Should Not Be Empty         ${RESPONSE_JSON.json()['authorization']} 
    Log                         ${RESPONSE_JSON.json()['authorization']} 
