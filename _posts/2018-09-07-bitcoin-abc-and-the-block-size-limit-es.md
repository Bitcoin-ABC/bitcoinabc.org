---
layout: post
title: Bitcoin ABC y el Límite del Tamaño de Bloque
subtitle: Habilitando bloques mayores realizando el trabajo técnico necesario.
multiLangId: 2018-09-07-bitcoin-abc-and-the-block-size-limit
lang: es
---

El propósito de este documento es describir las mejoras técnicas en las que se está trabajando para aumentar el tamaño máximo de bloque para Bitcoin Cash. Es parte de una serie de artículos con la intención de proporcionar mayor información acerca del trabajo de Bitcoin ABC.

## Nuestro abordaje al escalado

Como el primer software en implementar Bitcoin Cash, el escalado en-cadena (*on-chain*) es nuestra razón de ser. Bitcoin ABC está comprometido a aumentar el límite del tamaño de bloque para Bitcoin Cash. Pero el escalado en-cadena involucra algo más que simplemente cambiar un número en el software. Hay varias mejoras técnicas y optimizaciones que deben llevarse a cabo para que el sistema pueda manejar bloques mayores de forma segura y eficiente.

Tenemos un abordaje simple de dos frentes para el escalado:

1. Remover los cuellos de botella que tengan implementación inmediata para incrementar el límite del tamaño de bloque.
2. Sentar las bases técnicas para el escalado en-cadena masivo futuro.

Bitcoin ABC representa "Limite de Bloque Ajustable (*Ajustable Blocksize Cap*)", y como el nombre lo implica, es fácil para cualquier operador de nodo ajustar su límite del tamaño de bloque. Estamos a favor de aumentar y, eventualmente remover el límite del tamaño de bloque. Los mineros que usan nuestro software, sin embargo, quieren una implementación que funcione bien para los bloques que producen y aceptan. Esto significa que la mejor manera en que podemos ayudar a aumentar el límite del tamaño de bloque, que los mineros eligen, es removiendo los cuellos de botella del software.

Hemos estado trabajando arduamente para remover las limitaciones técnicas que existían hasta este momento, y continuaremos trabajando para remover las que queden. Las siguientes secciones enumeran algunos de los trabajos que se han realizado y algunas de las tareas que yacen enfrente.

## Realizadas

### Hasheo cuadrático para grandes transacciones

El método utilizado para hashear los datos de transacción al momento de la firma (utilizado en la familia de *Op Codes* OP_CHECKSIG) requería un hasheo de datos diferente para cada entrada. Dado que la cantidad de datos necesitando ser hasheados también aumenta linealmente con el tamaño de la transacción, esto significaba que el tiempo de hasheo total empleado aumentaría de forma cuadrática para transacciones con muchas entradas. Este problema se volvió significativo para tamaños de transacción de alrededor 1 MB. El problema fue solucionado de forma permanente en Bitcoin Cash como parte del BIP-143 algoritmo de hasheo de firma protegido de respuesta derivada [[1]](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/replay-protected-sighash.md).

### Índex de bloque compacto

Los índex de bloques compactos están basados en números enteros (*integers*) de 16-bits a lo largo del código, el que no funciona cuando hay más de 65536 transacciones en un bloque. En teoría, el límite puede ser alcanzado con un bloque de ~ 4 MB (un bloque de todas las transacciones OP_TRUE de 1 entrada), en la práctica sería un problema para bloques > 8 MB. Esta limitación ha sido corregida en Bitcoin ABC y Bitcoin XT cambiando los índex a numeros enteros de 32 bits [[2]](https://reviews.bitcoinabc.org/D1146), [[3]](https://github.com/bitcoinxt/bitcoinxt/pull/345).

### Tamaño del mensaje de red del protocolo P2P

El protocolo de comunicación Par-a-par (*P2P*) entre nodos utilizado para limitar el tamaño de los mensajes está configurado en 32 MB. Esto significa que a medida que los bloques se acercaban y excedían los 32 MB de tamaño, se veían imposibilitados de ser comunicados entre nodos. Esta limitación fue removida con Bitcoin ABC 0.17.0 [[4]](https://reviews.bitcoinabc.org/D1133). También lo fue previamente en Bitcoin Unlimited [[5]](https://github.com/BitcoinUnlimited/BitcoinUnlimited/commit/7e65d18b99042c066401b24b99abc6e33915ba2c#diff-cd92d63baa290a195308bcb16b9105b5R19).

### Interface RPC

El límite en el tamaño del mensaje impedía que bloques candidatos mayores a 16 MB fueran enviados a través de RPC. Este cuello de botella fue removido en Bitcoin ABC 0.17.1 [[6]](https://github.com/Bitcoin-ABC/bitcoin-abc/blob/master/doc/release-notes/release-notes-0.17.1.md), [[7]](https://reviews.bitcoinabc.org/D1285).

## Próximos pasos

### Mineración RPC

Las interfaces utilizadas por los mineros (*getblocktemplate* y *Stratum*) son ineficientes e inmanejables. Una de las principales deficiencias es que hacen que sea difícil lidiar con grandes bloques. Estas dificultades son perceptibles aún por debajo del límite actual de 32MB, y se irán volviendo más pronunciadas más allá de él.
Hay mucho trabajo siendo realizado en esta área, con muchos diferentes proyectos y propuestas. [[8]](https://github.com/cpacia/spec/blob/gbt/getblocktemplate2.md), [[9]](https://github.com/TheBlueMatt/bips/blob/master/bip-XXXX.mediawiki#BLOCK_TEMPLATE), [[10]](https://github.com/BitcoinUnlimited/BitcoinUnlimited/blob/dev/doc/miner.md#getminingcandidate-and-submitminingsolution). Bitcoin ABC está trabajando actualmente en la refactorización del sistema RPC para permitir el paso de la dependencia. Esto está en preparación para la implementación de un administrador de templates de bloque que no se base en variables globales. Esto permitirá la implementación de interfaces de mineración que sean capaces de manejar de forma eficiente bloques mucho mayores de lo que es actualmente posible. Parte de este proceso también implica trabajar con mineros y *pools* de mineración para migrar a un protocolo actualizado.

### Lógica de admisión al mempool

Debido a la traba de hilo simple (*single thread*) en el código de aceptación del mempool, la aceptación al mempool comienza a tener dificultades para ejecutarse en torno a 100 transacciones por segundo (equivalente a bloques de ~ 32MB). Este efecto fue identificado y estudiado por Bitcoin Unlimited en su proyecto Gigablock Testnet [[11]](https://youtu.be/5SJm2ep3X_M?t=5m). Es importante remover esta limitación paralelizando el código de admisión al mempool.

## Pasos a largo plazo

Si bien es importante remover los cuellos de botella a medida que los encontramos, también debemos sentar las bases para un escalado masivo en el futuro. El primer paso para esto es construir estructuras de datos altamente escalables. Estos cambios son bastante simples y bien entendidos, e incluyen el Orden Canónico de Transacciones [[12]](https://www.bitcoinabc.org/2018-08-27-sharding-bitcoin-cash-es/). El diseño básico de Bitcoin Cash está bien equipado para el escalado masivo, y solo necesita algunas pequeñas mejoras. Una vez que estas estructuras de datos están listas, el software puede mejorarse para tomar ventaja de la paralelización en todos los niveles. Este será un proyecto de largo plazo, por lo que es importante tener las estructuras de datos listas ahora para permitir que el trabajo comience.

## Conclusión

Bitcoin ABC está comprometido a habilitar el aumento del límite del tamaño de bloque haciendo que el software sea capaz de manejar bloques mayores, ahora y en el futuro.

La mejor manera de lograr este objetivo no es cambiar simbólicamente un número, sino continuar con el trabajo de desarrollar las capacidades técnicas para el escalado masivo en-cadena.

## Referencias

[1] [Replay Protected Sighash which solves quadratic hashing](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/replay-protected-sighash.md)

[2] [Compact Block Index fix in Bitcoin ABC](https://reviews.bitcoinabc.org/D1146)

[3] [Compact Block Index fix in Bitcoin XT](https://github.com/bitcoinxt/bitcoinxt/pull/345)

[4] [P2P Protocol limit removal in Bitcoin ABC](https://reviews.bitcoinabc.org/D1133)

[5] [P2P Protocol limit removal in Bitcoin Unlimited](https://github.com/BitcoinUnlimited/BitcoinUnlimited/commit/7e65d18b99042c066401b24b99abc6e33915ba2c#diff-cd92d63baa290a195308bcb16b9105b5R19)

[6] [Bitcoin 0.17.1 release notes](https://github.com/Bitcoin-ABC/bitcoin-abc/blob/master/doc/release-notes/release-notes-0.17.1.md)

[7] [Code change removing the RPC message limit in Bitcoin ABC](https://reviews.bitcoinabc.org/D1285)

[8] [Chris Pacia’s getblocktemplate2 proposal](https://github.com/cpacia/spec/blob/gbt/getblocktemplate2.md)

[9] [Matt Corallo’s BetterHash Mining Protocol proposal](https://github.com/TheBlueMatt/bips/blob/master/bip-XXXX.mediawiki#BLOCK_TEMPLATE)

[10] [Bitcoin Unlimited’s getminingcandidate and submitminingsolution RPC functions](https://github.com/BitcoinUnlimited/BitcoinUnlimited/blob/dev/doc/miner.md#getminingcandidate-and-submitminingsolution)

[11] [Bitcoin Unlimited Gigablock presentation](https://youtu.be/5SJm2ep3X_M?t=5m)

[12] [Artículo de Shammah Chancellor “Fragmentación (*Sharding*) de Bitcoin Cash”](https://www.bitcoinabc.org/2018-08-27-sharding-bitcoin-cash-es/)
