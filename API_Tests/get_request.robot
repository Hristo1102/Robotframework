*** Settings ***

Library  RequestsLibrary
Library  Collections
Library  DataDriver  ../Test_Data/Names.csv

*** Variables ***
${base_url} =  https://love-calculator.p.rapidapi.com
#${fname} =  fname=Anna
#${sname} =  sname=Ivan

*** Test Cases ***
getPercentage()
    ${headers} =  create dictionary  x-rapidapi-key=f3c3b7e93bmsh87da53673e92ae4p1814a9jsnb155078b1cb1  x-rapidapi-host=love-calculator.p.rapidapi.com
    create session  alias=myssion  url=${base_url}  headers=${headers}  verify=True
    ${response} =  get on session  alias=myssion  url=/getPercentage  params=${fname}&${sname}  headers=${headers}


    # Check the status code
    ${status_code} =  convert to string  ${response.status_code}
    should be equal  ${status_code}  200
    log to console  ${response.status_code}
    log to console  ${response.content}
