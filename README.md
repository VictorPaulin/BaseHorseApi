<!DOCTYPE html>
<html lang="PT-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <H3 style="color: green;">BaseHorseApi</H3>
    <p style="font-weight: bold;">Este projeto é um acelerador para você que deseja construir sua API utilizando o Horse Framework</p>
    <p>O BaseHorseApi te entregará uma API utilizando o framework Horse, você terá os seguintes recursos a sua disposição:</p>
    <ul>
        <li>Basic-Authentication;</li>
        <li>Rota para verificação de disponibilidade do servidor;</li>
        <li>A classe TConnection para configuração de componentes de acesso a bancos de dados;</li>
        <li>Configuração com MySQL;</li>
        <li>Configuração com FireBird;</li>
        <li>Classe genérica com utilitários para bancos de dados (TGenericDAO);</li>
        <li>Configuração da porta de serviço da API.</li> 
    </ul>
    <p>Para este projeto, as seguintes de pendências são necessárias no seu RAD:</p>
    <ul>
        <li><a href="https://github.com/HashLoad/horse" target="_blank"> Horse</a></li>
        <li><a href="https://github.com/HashLoad/horse-basic-auth" target="_blank"> Horse Basic Auth</a></li>
        <li><a href="https://github.com/viniciussanchez/dataset-serialize" target="_blank"> Dataset-Serialize</a></li>
    </ul>
    <H3>Como iniciar com o BaseHorseApi ?</H3>
    <p>Ao executar o .exe pela primeira vez, o BaseHorseApi criará um arquivo .ini no mesmo diretório onde o .exe estará, neste arquivo estarão suas configurações do banco de dados e serviço, altere este arquivo conforme suas necessidades</p>
    <img src="https://iili.io/17Ny3Q.png" alt="Mostando arquivo .ini">
    <p>Depois de alterar, salve este arquivo e inicie seu servidor novamente. Pronto sua Api com Horse está Online !</p>
    <p>Para testar você pode acessar a seguinte rota: <a href="http://localhost{SUA_PORTA}/server-info">http://localhost{SUA_PORTA}/server-info</a></p> 
    <p>Este é o retorno que você deverá receber</p>
    <img src="https://iili.io/17Olcl.png" alt="Aplicação rodando">
</body>
</html>



