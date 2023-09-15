---
layout: post
title:  Pós-Consenso Avalanche no eCash
subtitle: Benefícios para mineradores, Corretoras, and Pessoas Físicas.
multiLangId: 2022-09-29-avalanche-post-consensus
lang: pt
---

![Avalanche integrado na rede principal](/img/avalanche-live.jpg)

O Avalanche está aqui.

Em 14 de Setembro de 2022, a rede [eCash](https://e.cash) foi atualizada para suportar a finalização de blocos usando o Pós-Consenso Avalanche.

O lançamento do Pós-Consenso Avalanche na Rede Principal (Mainnet) do eCash é uma conquista significante, trazendo benefícios tangíveis para os mineradores de eCash, corretoras, e usuários comuns.

No momento da redação desse artigo, mais de 80 Bilhões de XEC estavam em stake para rodar nós de votação Avalanche e apoiar a rede eCash. Para ver estatísticas em tempo real da rede Avalanche e para acompanhar o desenvolvimento das etapas futuras, veja [avalanche.cash](https://avalanche.cash/).

## Os Benefícios para Mineradores

O Pós-Consenso Avalanche traz prevenção a ataques de 51% ao eCash. Isso é particularmente importante para os mineradores. Pelo fato de o eCash ser uma rede minoritária compartilhando o mesmo algoritimo de mineração que o Bitcoin (BTC) - SHA256, para ser específico -, ele é mais vulnerável a um atacante malicioso sem motivações econômicas, que pode tentar uma reorganização de blockchain. Embora a rede, como um todo, possa se recuperar de tal ataque, ele seria particularmente disruptivo para os mineradores, que podem perder blocos, custando-lhes dinheiro.

O Pós-Consenso Avalanche resolve esse problema. Os nós (Nodes) chegam a um consenso para "finalizar" os blocos que eles encontram na rede. Em outras palavras, o Avalanche permite que os nós saibam que os blocos que eles encontram são também encontrados e aceitos pelo resto da rede. Se blocos conflitantes aparecerem depois, os mineradores que usam Avalanche chegarão a um consenso e ignorarão os blocos que aparecerem mais tarde. Desta maneira, eles defendem a rede contra os ataques de sonegação de blocos e reorganização de blockchain.

## Os Benefícios para Corretoras

O Pós-Consenso Avalanche também traz benefícios significativos para as corretoras por trazer a finalização de 1-bloco para o eCash. Isso habilita depósitos de 1-confirmação.

É muito importante que as corretoras garantam que os depósitos sejam seguros antes de permitirem negociações e saques.
Isso normalmente é feito exigindo que as transações de depósito tenham um certo número de confirmações de blockchain. antes que os fundos possam ser negociados.

Com o Pós-Consenso Avalanche, agora existe uma maneira segura de verificar os depósitos dos clientes, usando o status de finalização do Avalanche em vez de “número de confirmações”. Isso também fará com que os depósitos sejam finalizados apenas com 1 confirmação de bloco. Isso aumentará a segurança da corretora, evitando ataques de reorganização e aumentando a satisfação  dos clientes reduzindo o tempo de confirmação dos depósitos. Também permitirá uma arbitragem mais fácil para os traders, trazendo mais volume e liquidez para a corretora. Clientes mais felizes são bons para as corretoras.

Para começar a se beneficiar do Pós-Consenso, as corretoras devem configurar seu nó eCash para executar o Avalanche e usar o
novo comando RPC `isfinaltransaction` para verificar se os depósitos foram finalizados ou não. O `isfinaltransaction` do RPC é compatível com futuras atualizações do Avalanche.

## Os Benefícios para os Usuários

No seu estado atual, o eCash já oferece uma experiência semelhante à do dinheiro para transferências peer-to-peer. Para usuários que enviam XEC usando diretamente uma carteira como a [Cashtab](https://cashtab.com/), os pagamentos normalmente aparecem em questão de
segundos, com taxas de subcentavos.

O que os usuários podem esperar do Pós-Consenso do Avalanche é que a experiência semelhante à do dinheiro melhorará ainda mais à medida que as corretoras e outros serviços eCash aproveitam a proteção contra reorganização de blockchain e a finalidade de 1 bloco oferecida pelo Pós-Consenso do Avalanche. Isso permitirá que os serviços ofereçam uma experiência de pagamento mais rápida e semelhante à do dinheiro.

Olhando mais para o futuro, a experiência do eCash deverá continuar a melhorar ainda mais com o Pré-Consenso e outras tecnologias em desenvolvimento. O propósito de todos esses desenvolvimentos é perseguir o objetivo do eCash de ser a forma de dinheiro eletrônico mais utilizável, segura e escalonável possível.

## Rodando o Avalanche no eCash

Os operadores de nós eCash podem ativar o Avalanche atualizando para versão Bitcoin ABC 0.26.2 ou superior e definindo o parâmetro `avalanche=1` em seu arquivo `bitcoin.conf`. Isso ativará o Avalanche no modo "poll only" – apenas captação, na tradução livre, que significa que o nó pode consultar a rede para encontrar o status de finalização dos blocos, mas não contribui para o Consenso do avalanche.

Os operadores de nós que desejam contribuir para a rede eCash participando do Avalanche podem configurar um nó de staking seguindo nosso [tutorial escrito do Avalanche](/2022-09-07-avalanche-tutorial/) e o
[Guia em vídeo do Stake Proof](https://youtu.be/3k5M4k8OF-I).

Uma das características do protocolo Avalanche é que sua segurança depende de os nós estarem bem conectados com o resto da rede. Isso significa que é importante, especialmente para nós de staking, ter uma conexão confiável com a Internet e aceitar conexões de entrada. Se você tiver um firewall, certifique-se de abrir a porta 8333.
Certifique-se também de que o parâmetro `maxconnections` não esteja definido em seu arquivo bitcoin.conf.

Para grandes stakers, também é uma boa ideia executar mais de um nó para cada Proof. Uma boa opção é usar servidores hospedados remotamente. Criamos um guia em vídeo para ajudar os usuários a configurarem um [nó Avalanche do eCash usando um servidor virtual privado](https://youtu.be/ls88OH3eGwQ).

## Sobre o Pós-Consenso

O Pós-Consenso tem esse nome porque trata de blocos *depois* de serem produzidos pelos mineradores.
Por outro lado, o Pré-Consenso (ainda não implementado) é quando o protocolo Avalanche é usado pelos nós para chegarem a um consenso sobre as transações *antes* dos blocos serem produzidos.

Com o Pós-Consenso Avalanche, os nós podem chegar a um consenso sobre o status atual dos blocos que são visíveis na rede eCash. Em outras palavras, permite que os nós saibam que os blocos que veem são também aceito pelo resto da rede. Esta informação pode então ser usada para defender a rede contra ataques de sonegação de blocos e ataques de reorganização de blockchain.

Depois que o Pré-Consenso for implementado no Bitcoin ABC, o Pós-Consenso também será usado para rejeitar blocos que incluem transações que entram em conflito com transações que foram finalizadas via pré-consenso. Isso vai permitir que os usuários da rede eCash se beneficiem da finalização de transações quase instantânea, com a confiança de que as transações finalizadas não podem ser revertidas.

## Sobre o Avalanche

Usar um protocolo de consenso rápido para fazer o pré-consenso tem sido um item de longa data no [roteiro do eCash](https://e.cash/roadmap-explained) (e anteriormente no roteiro do Bitcoin Cash). Esta é uma das melhorias necessárias para que o eCash seja um concorrente e uma alternativa às Moedas Digitais de Banco Central (CBDCs). Quando o [whitepaper do Avalanche](https://ipfs.io/ipfs/QmUy4jh5mGNZvLkjies1RWM4YuvJh5o2FYopNPVYwrRVGV) apareceu em 2018, o fundador do eCash, Amaury Séchet, e a equipe Bitcoin ABC reconheceram que esse novo protocolo era o que procuravam, pois atendia aos requisitos necessários.

Deve-se notar que a implementação do Avalanche do eCash é completamente separada e distinta do projeto AVAX Avalanche. Eles não têm nenhuma conexão, exceto ambos usando o protocolo descrito no whitepaper do Avalanche. O Avalanche no eCash é uma implementação totalmente nova que teve que ser desenvolvida do zero pela equipe Bitcoin ABC.

No caso do eCash, o consenso Avalanche é usado para necessidades de consenso rápido e ao vivo, como a finalização rápida da transação. O consenso de Nakamoto baseado em prova de trabalho é mantido onde é superior, fornecendo critérios de consenso objetivos para permitir a inicialização descentralizada de nós.

Para obter mais informações e monitorar o progresso do desenvolvimento, consulte [Avalanche.cash](https://www.avalanche.cash/)
