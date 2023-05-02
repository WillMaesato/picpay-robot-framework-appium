*** Settings ***
Library    AppiumLibrary
Library    XML
Resource   ../../utils/ConstantsData.robot
Resource   ../../utils/CommandsPage.robot

*** Variables ***

# Simulation Page locators
${SimulationScreen}     //android.view.ViewGroup[@resource-id='${ANDROID_APP_PACKAGE}:id/simulationScreen']
${SimulationContentScreenId}    ${ANDROID_APP_PACKAGE}:id/insuranceFrame
${SimulationTotalValue}    //android.widget.TextView[@resource-id='${ANDROID_APP_PACKAGE}:id/tvAdhesionTotalValue']

${SimulationCardProductPicPayCard}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/simulationCardProductViewPicPayCard']
${SimulationSwitchProductPicPayCard}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/simulationCardProductViewPicPayCard']/android.view.ViewGroup/android.widget.Switch

${SimulationCardProductGenericCard}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/simulationCardProductViewGenericCard']
${SimulationSwitchProductGenericCard}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/simulationCardProductViewGenericCard']/android.view.ViewGroup/android.widget.Switch

${SimulationCardProductAssistanceCard}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/simulationAssistanceProductViewCard']
${SimulationSwitchProductAssistanceCard}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/simulationAssistanceProductViewCard']/android.view.ViewGroup/android.widget.Switch

${SimulationOtherCardsSwitch}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.view.ViewGroup/android.widget.Switch
${SimulationDigitalSecuritySwitch}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.Switch    
${SimulationGeneralConditions}    //android.widget.TextView[@resource-id='${ANDROID_APP_PACKAGE}:id/tvPaymentDisclaimer']
${SimulationPayButton}    //android.widget.Button[@resource-id='${ANDROID_APP_PACKAGE}:id/btnPay']

# General Conditions Page locators
${GeneralConditionsOkUnderstandButton}    //android.widget.Button[@resource-id='${ANDROID_APP_PACKAGE}:id/btnConditionsOk']

# Biometri Authenticator Page locators
${BiometriAuthenticatorScreen}    //android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/custom']
${BiometriAuthenticatorPassword}    //android.widget.EditText[@resource-id='${ANDROID_APP_PACKAGE}:id/authDefaultDialogPassword']
${BiometriAuthenticatorFinishButton}    //android.widget.Button[@resource-id='${ANDROID_APP_PACKAGE}:id/buttonFinishWithPassword']

#Feedback Wallet Insurance Hired Page locators
${FeedbackWalletHiredScreen}    //android.widget.ImageView[@resource-id='${ANDROID_APP_PACKAGE}:id/ivFeedback']
${FeedbackWalletHiredOkUnderstandButton}    //android.widget.Button[@resource-id='${ANDROID_APP_PACKAGE}:id/btnFeedbackActionPrimary']

#Receipt Wallet Insurance Page locators
${ReceiptWalletInsuranceScreen}    //android.widget.FrameLayout[@resource-id='${ANDROID_APP_PACKAGE}:id/insuranceFrame']

*** Keywords ***
Abrir proteção carteira por deeplink
    Send Deeplink Picpay    "picpay://picpay/insurance/acquisition/simulation"
    Wait Until Element Is Visible    ${SimulationScreen}    timeout=30
    Sleep    3
    Capture Page Screenshot

Rodar até o final da tela de simulação
    Scroll Up Picpay    ${SimulationContentScreenId}

Valida preços dos combos
    Simular carteira com proteção básica
    Simular carteira com proteção básica + proteção PPCard
    Simular carteira com proteção básica + outros cartões
    Simular carteira com proteção básica + segurança digital
    Simular carteira com proteção completa (PPCard, Digital, outros cartões)
    Simular carteira com proteção básica + PPCard + outros cartões
    Simular carteira com proteção básica + PPCard + Digital
    Simular carteira com proteção básica + Digital + outros cartões

Simular carteira com proteção básica
    Desabilitar Segurança Digital
    Desabilitar Cartões Terceiros
    Desabilitar Cartão PicPay
    AppiumLibrary.Element Text Should Be    ${SimulationTotalValue}    R$ 5,40 por mês
    Capture Page Screenshot

Simular carteira com proteção básica + proteção PPCard
    Desabilitar Segurança Digital
    Desabilitar Cartões Terceiros
    Habilita Cartão PicPay
    AppiumLibrary.Element Text Should Be    ${SimulationTotalValue}    R$ 6,90 por mês
    Capture Page Screenshot

Simular carteira com proteção básica + outros cartões
    Desabilitar Segurança Digital
    Habilita Cartões Terceiros
    Desabilitar Cartão PicPay
    AppiumLibrary.Element Text Should Be    ${SimulationTotalValue}    R$ 8,50 por mês
    Capture Page Screenshot

Simular carteira com proteção básica + segurança digital
    Habilita Segurança Digital
    Desabilitar Cartões Terceiros
    Desabilitar Cartão PicPay
    AppiumLibrary.Element Text Should Be    ${SimulationTotalValue}    R$ 14,90 por mês
    Capture Page Screenshot

Simular carteira com proteção completa (PPCard, Digital, outros cartões)
    Habilita Segurança Digital
    Habilita Cartões Terceiros
    Habilita Cartão PicPay
    AppiumLibrary.Element Text Should Be    ${SimulationTotalValue}    R$ 19,50 por mês
    Capture Page Screenshot

Simular carteira com proteção básica + PPCard + outros cartões
    Desabilitar Segurança Digital
    Habilita Cartões Terceiros
    Habilita Cartão PicPay
    AppiumLibrary.Element Text Should Be    ${SimulationTotalValue}    R$ 9,50 por mês
    Capture Page Screenshot

Simular carteira com proteção básica + PPCard + Digital
    Habilita Segurança Digital
    Desabilitar Cartões Terceiros
    Habilita Cartão PicPay
    AppiumLibrary.Element Text Should Be    ${SimulationTotalValue}    R$ 16,90 por mês
    Capture Page Screenshot

Simular carteira com proteção básica + Digital + outros cartões
    Habilita Segurança Digital
    Habilita Cartões Terceiros
    Desabilitar Cartão PicPay
    AppiumLibrary.Element Text Should Be    ${SimulationTotalValue}    R$ 18,50 por mês
    Capture Page Screenshot

Desabilitar Segurança Digital
    ${containsAssitanceCard} =  Run Keyword And Return Status    Wait Until Element Is Visible   ${SimulationCardProductAssistanceCard}     timeout=30
    ${checked_attribute}    AppiumLibrary.Get Element Attribute    ${SimulationSwitchProductAssistanceCard}    checked
    ${isDisable} =   Run Keyword And Return Status    Should Be Equal As Strings    ${checked_attribute}    true
    Run Keyword If    ${isDisable} == ${True}   Click Element    ${SimulationSwitchProductAssistanceCard}

Desabilitar Cartões Terceiros
    ${containsGenericCard} =  Run Keyword And Return Status    Wait Until Element Is Visible   ${SimulationCardProductGenericCard}     timeout=30
    ${checked_attribute}    AppiumLibrary.Get Element Attribute    ${SimulationSwitchProductGenericCard}    checked
    ${isDisable} =   Run Keyword And Return Status    Should Be Equal As Strings    ${checked_attribute}    true
    Run Keyword If    ${isDisable} == ${True}   Click Element    ${SimulationSwitchProductGenericCard}

Desabilitar Cartão PicPay
    ${containsPicPayCard} =  Run Keyword And Return Status    Wait Until Element Is Visible   ${SimulationCardProductPicPayCard}     timeout=30
    ${checked_attribute}    AppiumLibrary.Get Element Attribute    ${SimulationSwitchProductPicPayCard}    checked
    ${isDisable} =   Run Keyword And Return Status    Should Be Equal As Strings    ${checked_attribute}    true
    Run Keyword If    ${isDisable} == ${True}   Click Element    ${SimulationSwitchProductPicPayCard}

Habilita Segurança Digital
    ${containsAssitanceCard} =  Run Keyword And Return Status    Wait Until Element Is Visible   ${SimulationCardProductAssistanceCard}     timeout=30
    ${checked_attribute}    AppiumLibrary.Get Element Attribute    ${SimulationSwitchProductAssistanceCard}    checked
    ${isDisable} =   Run Keyword And Return Status    Should Be Equal As Strings    ${checked_attribute}    true
    Run Keyword If    ${isDisable} == ${False}   Click Element    ${SimulationSwitchProductAssistanceCard}

Habilita Cartões Terceiros
    ${containsGenericCard} =  Run Keyword And Return Status    Wait Until Element Is Visible   ${SimulationCardProductGenericCard}     timeout=30
    ${checked_attribute}    AppiumLibrary.Get Element Attribute    ${SimulationSwitchProductGenericCard}    checked
    ${isDisable} =   Run Keyword And Return Status    Should Be Equal As Strings    ${checked_attribute}    true
    Run Keyword If    ${isDisable} == ${False}   Click Element    ${SimulationSwitchProductGenericCard}

Habilita Cartão PicPay
    ${containsPicPayCard} =  Run Keyword And Return Status    Wait Until Element Is Visible   ${SimulationCardProductPicPayCard}     timeout=30
    ${checked_attribute}    AppiumLibrary.Get Element Attribute    ${SimulationSwitchProductPicPayCard}    checked
    ${isDisable} =   Run Keyword And Return Status    Should Be Equal As Strings    ${checked_attribute}    true
    Run Keyword If    ${isDisable} == ${False}   Click Element    ${SimulationSwitchProductPicPayCard}

Abrir condições gerais
    Scroll Up Picpay    ${SimulationContentScreenId}
    Click Element    ${SimulationGeneralConditions}
    Sleep    1
    Capture Page Screenshot
    Click Element    ${GeneralConditionsOkUnderstandButton}
    
Contratar Seguro Carteira Digital
    Click Element    ${SimulationPayButton}
    Wait Until Element Is Visible    ${BiometriAuthenticatorScreen}    timeout=30
    Input Password   ${BiometriAuthenticatorPassword}   ${Password} 
    Click Element    ${BiometriAuthenticatorFinishButton}
    Wait Until Element Is Visible    ${FeedbackWalletHiredScreen}    timeout=30
    Sleep    1
    Capture Page Screenshot
    Click Element    ${FeedbackWalletHiredOkUnderstandButton}

Tela de Recibo Carteira Digital
    Wait Until Element Is Visible    ${ReceiptWalletInsuranceScreen}
    Sleep    1
    Capture Page Screenshot


