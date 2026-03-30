*** Settings ***
Library    Selenium2Library
Library    Collections

*** Keywords ***
openn browser
    open browser    https://parking-garage-app.netlify.app/    browser=Firefox
    Click Element    //*[@id="login-link"]/i

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
    Wait Until Element Is Visible    class:profile-menu-toggle
    Click Element    class:profile-menu-toggle
    Click Element    class:dropdown-logout-button
    Sleep    2s
    Close Browser

*** Test Cases ***
Sikeres uj auto felvitele es helyes adatok ellenorzese
    openn browser
    Input Text    //*[@id="email"]    lazarusz@pelo.com
    Input Password    //*[@id="password"]    lazarusz
    Click Element    //*[@id="login-button"]
    Sleep    2s
    Click Element    class:secondary
    Wait Until Element Is Visible    class:add-button 
    Click Element    class:add-button 
    Input Text    //*[@id="brand"]    Opel
    Click Element    id:model
    Select From List By Label    id:model    Mokka
    Input Text    //*[@id="year"]    2000
    Input Text    //*[@id="licensePlate"]    ABC-123
    Textfield Value Should Be    //*[@id="brand"]    Opel
    List Selection Should Be    id:model    Mokka
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
    Click Element    class:secondary
    Sleep    2s
    Click Button    class:delete-button
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
    Click Element    class:secondary
    Sleep    2s
    Click Button    class:delete-button
    Alert Should Be Present    action="Mégse"
    Sleep    2s
    Close Browser

