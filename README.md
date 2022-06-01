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
    <p>O BaseHorseApi te entrega uma API já funcionando com o framework Horse, além disso você já tem a sua disposição:</p>
    <ul>
        <li>Basic-Authentication</li>
        <li>Rota de teste para verificar se o servidor está online</li>
        <li>A classe TConnection te entrega uma TFDQuery já instanciada e com uma conexão setada, tudo pronto para rodar seu SQL</li>
        <li>Configuração da conexão com MySQL</li>
        <li>Configuração da porta de serviço que sua API irá usar</li> 
    </ul>
    <p>Para poder te entregar este conteudo, o BaseHorseApi tem algumas dependencias que você precisa ter instalado no seu RAD para poder rodar o projeto sem erros, elas são:</p>
    <ul>
        <li><a href="https://github.com/HashLoad/horse" target="_blank"> Horse</a></li>
        <li><a href="https://github.com/HashLoad/horse-basic-auth" target="_blank"> Horse Basic Auth</a></li>
    </ul>
    <p>Este próximo item não é necessário para dar o start com o BaseHorseApi, mas facilita muito o seu dia-a-dia, esta biblioteca converte um DataSet em JSON ou JSON em DataSet</p>
    <ul>
        <li><a href="https://github.com/viniciussanchez/dataset-serialize" target="_blank"> Dataset-Serialize</a></li>
    </ul>
    <H3>Como iniciar com o BaseHorseApi ?</H3>
    <p>Quando você roda o .exe pela primeira vez, o BaseHorseApi cria um arquivo .ini no mesmo diretório onde o .exe está, neste arquivo vão estar suas configurações do MySQL e do Serviço, altere este arquivo conforme suas necessidades</p>
    <img src="https://iili.io/17Ny3Q.png" alt="Mostando arquivo .ini">
    <p>Depois de alterar, salve este arquivo e inicie seu servidor novamente. Pronto sua Api com Horse está Online !</p>
    <p>Para testar você pode acessar a seguinte rota: <a href="http://localhost{SUA_PORTA}/server-info">http://localhost{SUA_PORTA}/server-info</a></p> 
    <p>Este é o retorno que você deverá receber</p>
    <img src="https://iili.io/17Olcl.png" alt="Aplicação rodando">
</body>
</html>



