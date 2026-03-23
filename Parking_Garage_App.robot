*** Settings ***
Library    Selenium2Library
Library    Collections

*** Keywords ***
openn browser
    open browser    https://parking-garage-app.netlify.app/    browser=Firefox
    Click Element    //*[@id="login-link"]/span

*** Test Cases ***
Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
    openn browser
    Input Text    //*[@id="email"]    lazarusz@pelo.com
    Input Password    //*[@id="password"]    lazarusz
    Click Element    //*[@id="login-button"]

*** Test Cases ***
Sikertelen bejelentkezes hibas jelszo eseten
    openn browser
    Input Text    //*[@id="email"]    lazarusz@pelo.com
    Input Password    //*[@id="password"]    lazar
    Click Element    //*[@id="login-button"]
    Sleep    2s
    Close Browser

*** Test Cases ***
Sikertelen bejelentkezes nem letezo felhasznaloval
    openn browser    
    Input Text    //*[@id="email"]    lazar@gmail.commmmmmmmmmmm
    Input Password    //*[@id="password"]    lazarusz
    Click Element    //*[@id="login-button"]
    Wait Until Page Contains    Invalid email or password.
    Sleep    2s
    Close Browser

*** Test Cases ***
Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
    openn browser
    Input Text    //*[@id="email"]    ${EMPTY}
    Input Password    //*[@id="password"]    ${EMPTY}
    Click Element    //*[@id="login-button"]
    Sleep    2s
    Close Browser

*** Test Cases ***
Kijelentkezes
    openn browser
    Input Text    //*[@id="email"]    lazarusz@pelo.com
    Input Password    //*[@id="password"]    lazarusz
    Click Element    //*[@id="login-button"]
    Wait Until Element Is Visible    class:logout-button
    Click Button    class:logout-button
    Sleep    2s
    Close Browser

*** Test Cases ***
Sikeres uj auto felvitele es helyes adatok ellenorzese
    openn browser
    Input Text    //*[@id="email"]    lazarusz@pelo.com
    Input Password    //*[@id="password"]    lazarusz
    Click Element    //*[@id="login-button"]
    Sleep    2s
    Click Element    cars-navbarlink
    Click Element    class:add-button
    Input Text    //*[@id="brand"]    Opel
    Input Text    //*[@id="model"]    Meriva
    Input Text    //*[@id="year"]    2000
    Input Text    //*[@id="licensePlate"]    ABC-123
    Textfield Value Should Be    //*[@id="brand"]    Opel
    Textfield Value Should Be    //*[@id="model"]    Meriva
    Textfield Value Should Be    //*[@id="year"]    2000
    Textfield Value Should Be    //*[@id="licensePlate"]    ABC-123
    Click Element    class:submit-button
    Sleep    2s
    Close Browser

*** Test Cases ***
Torles megerosito ablakkal
    openn browser
    Input Text    //*[@id="email"]    lazarusz@pelo.com
    Input Password    //*[@id="password"]    lazarusz
    Click Element    //*[@id="login-button"]
    Sleep    2s
    Click Element    cars-navbarlink
    Sleep    2s
    Click Button    xpath=/html/body/div/main/div/div[2]/div[3]/div[3]/button[2] 
    Alert Should Be Present
    Sleep    2s
    Close Browser

*** Test Cases ***
Torles megszakitasa
    openn browser
    Input Text    //*[@id="email"]    lazarusz@pelo.com
    Input Password    //*[@id="password"]    lazarusz
    Click Element    //*[@id="login-button"]
    Sleep    2s
    Click Element    cars-navbarlink
    Sleep    2s
    Click Button    xpath=/html/body/div/main/div/div[2]/div[3]/div[3]/button[2] 
    Alert Should Be Present    action="Mégse"
    Sleep    2s
    Close Browser

