***Settings***
Documentation   Suíte de testes para a funcionalidade de cadastro de usuário da API Serverest
...             https://serverest.dev/

Library     RequestsLibrary
Library     Collections


***Variables***
${API_URL}      http://serverest.dev
${ALIAS}        serverest

***Keywords***
Dado que a sessão é iniciada
    Create Session      ${ALIAS}    ${API_URL}

Quando eu utilizar os parametros
    [Arguments]     ${NOME}   ${EMAIL}   ${SENHA}    ${ADM}

    ${HEADERS}              Create Dictionary       content-type=aplication/json
    ${REQ_BODY}             Create Dictionary       nome=${NOME}    email=${EMAIL}  password=${SENHA}   administrador=${ADM}
    ${RESPONSE_JSON}        POST On Session         alias=${ALIAS}           url=${API_URL}/usuarios       data=${REQ_BODY}    expected_status=Any
    Set Test Variable       ${RESPONSE_JSON}
    Log                     ${RESPONSE_JSON}  

Então obtenho o status code
    [Arguments]     ${STATUS_CODE}

    Should Be Equal As Strings        ${STATUS_CODE}      ${RESPONSE_JSON.status_code}

E obtenho a mensagem no campo
    [Arguments]     ${MSG_RETORNO}  ${CAMPO_RETORNO}

    Should Be Equal As Strings      ${MSG_RETORNO}      ${RESPONSE_JSON.json()['${CAMPO_RETORNO}']} 
    Log                             ${RESPONSE_JSON.json()['${CAMPO_RETORNO}']} 

E obtenho o ID do usuário

    Should Not Be Empty         ${RESPONSE_JSON.json()['_id']} 
    Log                         ${RESPONSE_JSON.json()['_id']} 

Quando eu verifico se o usuário já existe pelo email
    [Arguments]     ${EMAIL}
    
    ${RESPONSE_JSON}        Get On Session  ${ALIAS}    ${API_URL}/usuarios     params=email=${EMAIL}     expected_status=Any
    Set Test Variable       ${RESPONSE_JSON}
    Should Not Be Empty     ${RESPONSE_JSON.json()['usuarios'][0]['_id']}

Então eu salvo o ID numa variável   
    ${USER_ID}      Set Variable    ${RESPONSE_JSON.json()['usuarios'][0]['_id']} 
    Set Test Variable       ${USER_ID}    

E excluo o usuário e aguardo uma mensagem
    [Arguments]     ${MSG_RETORNO}      ${CAMPO_RETORNO}
    ${RESPONSE_JSON}        Delete On Session  ${ALIAS}    ${API_URL}/usuarios/${USER_ID}       expected_status=Any
    Should Be Equal As Strings      ${MSG_RETORNO}      ${RESPONSE_JSON.json()['${CAMPO_RETORNO}']} 