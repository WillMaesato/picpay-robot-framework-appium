*** Settings ***
Resource    ../../base/base.robot
Resource    ../../pages/Login/LoginPage.robot
*** Keywords ***

Dado que inicio o App PF PicPay
    Abrir Android PF PicPay App
    Start Screen Recording
    Clicar no botao entrar na tela de login
    Tela de login apresentada

Quando informo login e senha corretos
    Digitar login e senha corretas
    Clicar no botao entrar no app
    Clicar no botao agora não em autenticar biometria
    Fechar Tela Inicial de Pix
    