*** Settings ***
Library    AppiumLibrary
Resource   ../../utils/ConstantsData.robot

*** Variables ***

# Login Page locators
${LoginButton}     //android.widget.Button[@resource-id='${ANDROID_APP_PACKAGE}:id/newLoginButton']
${LoginInputCPF}   //android.widget.EditText[@resource-id='${ANDROID_APP_PACKAGE}:id/editTextUsername']
${LoginInputPassword}     //android.widget.EditText[@resource-id='${ANDROID_APP_PACKAGE}:id/editTextPassword']
${LoginEnterButton}     //android.widget.Button[@resource-id='${ANDROID_APP_PACKAGE}:id/apolloButtonEnter']

# Login Biometri Authenticator locators
${LoginBiometriAuthenticatorDialog}     //android.view.ViewGroup[@resource-id='${ANDROID_APP_PACKAGE}:id/container']
${LoginBiometriAuthenticatorDialogNotNowButton}     //android.widget.TextView[@resource-id='${ANDROID_APP_PACKAGE}:id/textViewMessageButton' and @text='Agora não']

# Benefits Screen locators
${BenefitsPixScreen}    //android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/android:id/content']
${BenefitsPixButton}    //android.widget.Button[@content-desc='OK, entendi' and @index='0']

*** Keywords ***

Clicar no botao entrar na tela de login
    Wait Until Element Is Visible    ${LoginButton}    timeout=30
    Click Element    ${LoginButton}

Tela de login apresentada
    Wait Until Element Is Visible    ${LoginInputCPF}    timeout=30
    Capture Page Screenshot
    
Digitar login e senha corretas
    Input Text      ${LoginInputCPF}       ${CPF}
    Input Password  ${LoginInputPassword}  ${Password}
    Capture Page Screenshot

Clicar no botao entrar no app
    Wait Until Element Is Visible    ${LoginEnterButton}    timeout=30
    Click Element    ${LoginEnterButton}

Clicar no botao agora não em autenticar biometria
    Wait Until Element Is Visible    ${LoginBiometriAuthenticatorDialog}    timeout=30
    Click Element    ${LoginBiometriAuthenticatorDialogNotNowButton}
    

Fechar Tela Inicial de Pix
    ${present}=  Run Keyword And Return Status    Wait Until Element Is Visible   ${BenefitsPixButton}     timeout=30
    Run Keyword If    ${present}     Clicar no botao ok entendi do Pix   

Clicar no botao ok entendi do Pix 
    Click Element    ${BenefitsPixButton}     
    

