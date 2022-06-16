*** Settings ***

Documentation    camada de API
Library          RequestsLibrary

*** Variable ***
${BASE_URL}      https://serverest.dev/


*** Keywords ***
Dado que tenho payload
    ${HEADERS}=          Create Dictionary      Content-Type=application/json
    Create Session       dev                    ${BASE_URL}                      disable_warnings=1          verify=${false}
    Set Test Variable    ${HEADERS}

Entao valido status code
    ${RESPOSTA}          GET on Session         dev                              url=${BASE_URL}/usuarios
    ...                  expected_status=200
    ...                  headers=${HEADERS}

    [return]             ${RESPOSTA}



