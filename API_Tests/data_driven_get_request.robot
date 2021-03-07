*** Settings ***

Library  RequestsLibrary
Library  Collections
Library  DataDriver  file=./API_Tests/Test_Data/Names.csv
Library  JSONLibrary
Library  os

Test Template  getPercentage()

*** Variables ***
${base_url} =  https://love-calculator.p.rapidapi.com
${f} =  fname=
${s} =  sname=

*** Test Cases ***
First Test Case  ${fname}  ${sname}

*** Keywords ***
getPercentage()
    [Arguments]  ${fname}  ${sname}
    ${headers} =  create dictionary  x-rapidapi-key=f3c3b7e93bmsh87da53673e92ae4p1814a9jsnb155078b1cb1  x-rapidapi-host=love-calculator.p.rapidapi.com
    create session  alias=myssion  url=${base_url}  headers=${headers}  verify=True
    ${response} =  get on session  alias=myssion  url=/getPercentage  params=${f}${fname}&${s}${sname}  headers=${headers}

    # Check the status code
    ${status_code} =  convert to string  ${response.status_code}
    should be equal  ${status_code}  200
    log to console  ${response.status_code}
    log to console  ${response.content}

    #Check the content - Singel Data - fnam
    ${fname_json} =  get value from json  ${response.json()}  $.fname
    should be equal  ${fname_json[0]}  ${fname}
    #Check the content - Singel Data - sname
    ${sname_json} =  get value from json  ${response.json()}  $.sname
    should be equal  ${sname_json[0]}  ${sname}
    #Check the content - key
    should contain  ${response.json()}  percentage
    should contain  ${response.json()}  result