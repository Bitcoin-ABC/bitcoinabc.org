---
layout: post
title: Fragmentación de Bitcoin Cash
subtitle: Artículo de Shammah Chancellor, Desarrollador de Bitcoin ABC
multiLangId: 2018-09-06-sharding-bitcoin-cash
lang: es
---

La ley de Moore es aplicada comúnmente a Bitcoin como un argumento de cómo Bitcoin puede ser escalado acompañando una utilización futura mayor. Claramente la ley de Moore en lo que respecta al número de transistores cumple con este criterio. Sin embargo, debe notarse que las velocidades de reloj (*clock speeds*) de un único núcleo no han aumentado -esto se debe a limitaciones físicas. En cambio, los fabricantes de CPU han aumentado el número de núcleos para el procesamiento paralelo.

Esto significa que para que Bitcoin escale con la ley de Moore, la construcción de bloques y validación deben hacer uso de núcleos CPU adicionales. En orden de hacer un uso efectivo de núcleos adicionales, los datos utilizados deben ser procesados localmente. Este proceso de organización de datos para procesamiento local se denomina fragmentación (*sharding*).

Sin embargo, Bitcoin actualmente emplea estructuras de datos para calcular la raíz Merkle (*Merkle root*) del cabezal del bloque que impiden que los datos sean localizados (locales al núcleo). Cambiando el orden de cálculo de la raíz Merkle a través de una canonicalización (*canonicalization*) los datos pueden ser fragmentados (*sharded*). Esta nueva raíz Merkle podría ser calculada como sigue, para un bloque con 4 transacciones que están en orden lexicográfico por hash (donde TX_A HASH < TX_B HASH y así sucesivamente, de izquierda a derecha). Es importante notar que este reordenamiento de la raíz Merkle aún permite las pruebas Merkle (*Merkle proofs*) con igual seguridad que el orden original.

![Visualización del cálculo de la raíz Merkle/Merklix](/img/merklix-root-calculation-es.png "Figura 1. Visualización del cálculo de la raíz Merkle/Merklix")

Si podemos clasificar las transacciones en rangos aplicados al orden canónico de las transacciones, podemos calcular el hash del subárbol B y del subárbol C utilizando dos procesos independientes. Los resultados de estos cálculos pueden ser enviados a un agregador para generar el subárbol A. Esto a su vez, puede ser combinado con el hash de la monedabase (*coinbase*) para generar una raíz Merkle válida para un *template* de bloque.

Actualmente, la raíz Merkle para un bloque debe computarse a partir de una lista de transacciones mantenidas en orden topológico (las transacciones expendedoras vienen después de las transacciones expendidas). Sin embargo, los fragmentos (*shards*) deben mantener los datos en base a rangos consistentes. Debido a la discrepancia entre la localización posible de los datos en un sistema fragmentado, y el set de datos sobre el cual el hash del subárbol (*subtree hash*) debe ser computado, los fragmentos individuales no consiguen pre-computar los hashes del subárbol sin una significativa sincronización. En orden de resolver este problema, el árbol Merkle debe estar organizado de modo que sea computado como un agregado de hashes de subárboles que pueden ser calculados por fragmentos individuales.

Otra propiedad que se revela de utilidad con la canonicalización del orden de transacciones por hash es que la aceptación del *mempool* también puede ser fragmentada a través de múltiples procesos. Esto es posible de realizar colocando múltiples "ruteadores" de transacciones frente a múltiples procesadores del *mempool*.

![Ejemplo ilustrativo de la potencial arquitectura paralela de aceptación del mempool](/img/parallel-mempool-acceptance-es.png "Figura 2. Ejemplo ilustrativo de la potencial arquitectura paralela de aceptación del mempool")

En esta arquitectura, el ruteador 1 y el ruteador 2 pueden enviar transacciones, dentro del mismo rango, a los aceptadores del *mempool* previamente acordados. Usando un método similar, los aceptadores del *mempool* pueden consultarse entre ellos, y a la base de datos de *UTXO*, para asegurar que las transacciones padres existan y sean posibles de ser expendidas.

Con el *mempool* fragmentado en múltiples procesos, cualquier *API Request processor* puede consultar los hashes de varios subárboles Merkle. A partir de la Figura (1) podríamos solicitar el Subárbol B y el Subárbol C. Posteriormente, podríamos continuar y juntarlos en la raíz Merkle.

En orden de construir un nodo con la arquitectura anterior las estructuras de datos adecuadas deben primero estar en el Blockchain. El software no puede ser fácilmente escrito para aprovechar la fragmentación antes de que las estructuras de datos para esa fragmentación sean usadas para computar la raíz Merkle. El orden canónico de transacciones debe preceder a la creación de cualquier software semejante.

Esta es la razón por la que ABC está abogando por estos cambios hoy. Debemos estar preparados para la demanda futura, y esto significa que debemos comenzar a trabajar ahora en un nodo que pueda manejar bloques extremadamente grandes -esta no es una tarea fácil y llevará años completarla.

Algunas personas han solicitado que ABC produzca parámetros de referencia de rendimiento en relación a cómo esta optimización podría funcionar. Como se indicó anteriormente, para generar tales parámetros de referencia el software debe existir primero. Como esto tomará varios años, los parámetros de referencia no pueden generarse con esa premisa -debe llevarse a cabo una ingeniería real de forma anticipada para planearlos. Un resumen de ese trabajo de ingeniería se menciona arriba.

En orden de soportar una actualización de protocolo suave y sin problemas, la versión actual debe poder producir y validar ambos tipos de bloques -el resultado es una producción de *templates* de bloque más lenta con un impacto menor en la validación. De hecho, la versión actual de Bitcoin-ABC v0.18.0 será levemente más lenta en la creación de *templates* de bloque debido a la necesidad de reorganizar las transacciones después de la clasificación topológica inicial. Esto es intencional y será tratado cuando el código pueda ser refactorizado después del CTO (Orden Canónico de Transacciones), y finalmente los árboles Merklix puedan ser activados.

La fragmentación (*sharding*) no es opcional para Bitcoin Cash si es que queremos que sea escalado con la ley de Moore. Los CPU individuales no se volverán significativamente más rápidos. El hardware especializado no puede resolver este problema por sí solo. El protocolo debe facilitar un software de nodo que sea capaz de ser escalado horizontalmente, porque el escalado vertical no funcionará más allá de bloques de aproximadamente 1GB de tamaño. Este cambio es para Bitcoin, capa 1, para que los mineros puedan recolectar tasas a escala global. Los incentivos de Bitcoin deben y serán mantenidos.
