*** Settings ***
Library        AppiumLibrary
Library        OperatingSystem
Resource       ../../app/base/base.robot
Resource       ../../app/steps/login/loginStep.robot
Resource       ../../app/steps/wallet/walletStep.robot

*** Test Cases ***

Login App PicPay
    Dado que inicio o App PF PicPay
    Quando informo login e senha corretos
    
Abrir Proteção Carteira e Validar Preços dos Produtos
    Dado abro o Carteira digital e seleciono os combos disponiveis
    Dado que estou na tela do Carteira digital e vejo as condições gerais
    
Efetuar Contratação do Proteção Carteira
    Contratar Seguro Carteira Digital
    Tela de Recibo Carteira Digital
    Stop Screen Recording
