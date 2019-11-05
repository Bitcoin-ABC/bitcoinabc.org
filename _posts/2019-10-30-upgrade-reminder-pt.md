---
layout: post
title: Certifique-se de estar pronto para a atualização de rede Bitcoin Cash
subtitle: A atualização é ativada em 15 de novembro
multiLangId: 2019-10-30-upgrade-reminder
lang: pt
---

## O que vai acontecer?

Em aproximadamente duas semanas, 15 de novembro de 2019, a rede Bitcoin Cash passará por uma atualização de rede planejada. Esta atualização é um processo programado de rotina, como parte do [Roteiro Bitcoin Cash](https://www.bitcoincash.org/roadmap.html).

## O que preciso fazer?

Todos os operadores de nodo devem atualizar seu software de nodo para uma versão recente. Para usuários do Bitcoin ABC, isso significa qualquer versão 0.20.0 ou superior, que pode ser baixada [aqui](https://download.bitcoinabc.org/).

Qualquer pessoa que esteja executando um serviço, como um explorador de blocos, um site de alterações ou qualquer outro serviço proporcionado por um nodo pleno, deve atualizar.
Usuários comuns não precisam fazer nada. As carteiras não são afetadas por esta atualização e deveriam continuar funcionando normalmente.

## O que acontece se eu não atualizar?

As versões anteriores do Bitcoin ABC (0.19.x) se tornarão automaticamente incompatíveis com o resto da rede Bitcoin Cash após a atualização ser ativada em 15 de novembro. Os nodos não atualizados são projetados para operar de uma maneira que não interfira na rede atualizada e serem separados com segurança dos nodos atualizados após 15 de novembro. Isso significa que qualquer pessoa que desejar usar um nodo na rede Bitcoin Cash no futuro deve atualizar.

## Que funcionalidades são incluídos na atualização?

A especificação para a atualização de novembro está disponível [aqui](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md).

Esta atualização ativará dois funcionalidades:
* [Firmas Schnorr para OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md). A atualização anterior permitiu que as assinaturas Schnorr fossem usadas com OP_CHECKSIG e OP_CHECKDATASIG; esta atualização estende esse suporte para OP_CHECKMULTISIG. Após esta atualização, todas as operações de verificação de assinaturas suportaram assinaturas Schnorr.
* [Fazer cumprir MINIMALDATA em script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md). Isto remove o vetor de maleabilidade BIP 62 final, e significa que a maioria das transações na rede BCH (incluindo todas as transações P2PKH) ja não serão maleáveis.

Estas caraterísticas permitem certas funcionalidades aprimoradas, como [contratos inteligentes ocultos](https://youtu.be/6V98Q4FnSY0). Os usuários comuns do Bitcoin Cash não serão afetados.

## Que outras informações estão disponíveis?

Para ajudar nos preparativos técnicos da atualização, existe um [testnet](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md) onde novos recursos podem ser testados e avaliados.
Este testnet pode ser usado para garantir compatibilidade ou para começar a criar produtos que usam os novos recursos.

Em caso de dúvidas ou necessidade de assistência, entre em contato conosco através do [email](mailto:info@bitcoinabc.org).
Desenvolvedores são bem-vindos em nosso grupo Bitcoin ABC development do [Telegram](https://t.me/joinchat/HCYr50mxRWjA2uLqii-psw).
