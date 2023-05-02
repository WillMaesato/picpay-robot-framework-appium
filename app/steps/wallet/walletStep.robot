*** Settings ***

Resource    ../../pages/wallet/walletPage.robot

*** Keywords ***

Dado abro o Carteira digital e seleciono os combos disponiveis
    Abrir proteção carteira por deeplink
    Rodar até o final da tela de simulação
    Valida preços dos combos

Dado que estou na tela do Carteira digital e vejo as condições gerais
    Abrir condições gerais

Dado que estou na tela do Carteira digital e clico em contratar
    