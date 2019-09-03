---
layout: post
title: Prepare-se para a atualização de novembro 2019 hoje com o Bitcoin ABC 0.20.0
subtitle: A atualização de protocolo de 15 de Nov 2019 está agora encerrada
multiLangId: 2019-08-21-bitcoin-abc-0-20-0
lang: pt
---

O objetivo do Bitcoin ABC é ajudar a criar uma moeda sólida que seja usada globalmente para impulsionar a liberdade e a prosperidade de todos. O Bitcoin ABC continua sendo uma força impulsora na execução do [roteiro para o Bitcoin Cash](https://www.bitcoincash.org/pt-BR/roadmap.html).

Alinhada a essa visão, a equipe Bitcoin ABC tem o orgulho de apresentar a versão de atualização de protocolo de novembro 2019. O Bitcoin ABC 0.20.0 já está disponível e pode ser baixado em: [https://download.bitcoinabc.org/0.20.0/](https://download.bitcoinabc.org/0.20.0/)

As funcionalidades que são incluídas em cada atualização de protocolo são planejadas, especificadas [1] e desenvolvidas com bastante antecedência para dar a todos os participantes do ecossistema do Bitcoin Cash tempo de preparação suficiente. De forma similar à última atualização, a versão Bitcoin ABC 0.20.0 foi disponibilizada três meses antes da ativação, que está programada para 15 de novembro, 2019.
A atualização de protocolo, uma vez ativada, permitirá as seguintes funcionalidades:
* **Assinaturas Schnorr para OP_CHECKMULTISIG(VERIFY)** [2]. A atualização anterior permitiu que as assinaturas Schnorr fossem usadas com OP_CHECKSIG e OP_CHECKDATASIG, esta atualização estende esse suporte para OP_CHECKMULTISIG. Após esta atualização, todas as operações de verificação de assinaturas suportarão assinaturas Schnorr.
* **Aplicar MINIMALDATA em script** [3]. Isto elimina o vetor de maleabilidade final BIP 62 e significa que a maioria das transações na rede BCH (incluindo todas as P2PKH) já não serão maleáveis.

Para ajudar com os preparativos técnicos da atualização, existe um testnet disponível onde as funcionalidades podem ser testadas [4]. Este testnet pode ser usado para garantir a compatibilidade ou para começar a criar produtos que usem funcionalidades da atualização.

Implementando otimizações e atualizações de protocolo, podemos fazer com que o dinheiro digital par-a-par escale várias ordens de magnitude além dos limites atuais. O Bitcoin Cash deve melhorar continuamente para competir. Na Bitcoin ABC, estamos felizes em trabalhar na construção da infraestrutura necessária para tornar o Bitcoin Cash a melhor moeda que o mundo já viu.

### Reference Links
[1] [November 2019 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md)  
[2] [Specification for Schnorr Signatures in OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md)  
[3] [Specification for Enforcing MINIMALDATA in Script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md)  
[4] [Testnet Information](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md)  
