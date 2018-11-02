---
layout: post
title: Reporte de incidente de Bitcoin ABC (17 de Septiembre de 2018)
multiLangId: 2018-09-26-incident-report
lang: es
---

Este documento contiene información en relación a nuestra respuesta a una vulnerabilidad crítica que afecta a todas las versiones de Bitcoin ABC, versiones de Bitcoin Core 0.14.3 a 0.16.2 y varias versiones derivadas de la versión base de Bitcoin Core como Litecoin, Dash y otras. Medidas apropiadas han sido tomadas para mitigar el impacto de esta vulnerabilidad. El presente documento es proporcionado solamente con fines informativos.

Bitcoin ABC [0.18.2](https://download.bitcoinabc.org/0.18.2/) corrige esta vulnerabilidad y se insta a todos los operadores de nodos a actualizar tan pronto como sea posible.

El 17 de Septiembre de 2018, desarrolladores de Bitcoin ABC fueron notificados de forma anónima sobre la vulnerabilidad. Si explotaba, la vulnerabilidad podría haber sido utilizada como un vector DDoS (mediante un crash de nodo) y/o un método para inflar el suministro de monedas. Al momento de la divulgación, Bitcoin ABC solo se encontraba en conocimiento del vector DDoS. El vector de inflación de monedas fue descubierto poco después de la divulgación y corrección del error en Bitcoin ABC.

## Descripción

Al momento de la divulgación, se descubrió una vulnerabilidad en Bitcoin Core y Bitcoin ABC que permitiría a un minero crear un bloque con una transacción conteniendo el gasto de una misma entrada varias veces. Esto provocaría una aserción en el código de validación de bloque, causando un crash del nodo. Dicho bloque especialmente diseñado podría ser enviado a cualquier nodo de la red con la intención de atacarlo y desactivarlo, permitiendo el comportamiento de denegación-de-servicio (*denial-of-service*).

La vulnerabilidad fue inicialmente introducida en Bitcoin Core 0.14, cuyos detalles se proporcionan [aquí](https://bitcoincore.org/en/2018/09/20/notice/). Dado que Bitcoin ABC comenzó como un *software fork* de Bitcoin Core después de la introducción de la vulnerabilidad, ABC también la contenía.

Más información sobre el error descubierto se detalla [aquí](https://medium.com/@awemany/600-microseconds-b70f87b0b2a6) por la persona que lo reveló.

Después de la vulnerabilidad fue corregida, se descubrió que el mismo error podría explotarse para inflar el suministro de monedas si un minero incluyera una transacción sin-difusión (*non-broadcast*) con entradas duplicadas en el bloque.

## Impacto

La vulnerabilidad descrita anteriormente no fue explotada en la red principal (*mainnet*). Esto se puede verificar examinando todas las transacciones en blockchain y viendo que ninguna transacción contiene entradas duplicadas.

## Mitigación

Se aplicó una solución al repositorio de Bitcoin ABC, con el [*commit message*](https://reviews.bitcoinabc.org/D1790) deliberadamente vago para no llamar la atención del público sobre la existencia del problema. Esto se hizo para evitar alertar a atacantes potenciales antes de que los operadores de nodos pudieran tener la oportunidad de actualizar a la versión que corregía esos errores.

Una vez que la corrección fue aplicada, preparamos el lanzamiento de la versión 0.18.2 y la pusimos inmediatamente a disposición de varios operadores de *mining pools*. Poco después del lanzamiento de la versión 0.18.2, Bitcoin ABC envió comunicaciones públicas alentando a todos los operadores de nodos a actualizar.

Se alienta enfáticamente a cualquier operador de nodo ejecutando Bitcoin ABC 0.18.1 o anterior a que actualice lo antes posible.

## Seguimiento

Bitcoin ABC tomará varias acciones para mejorar y optimizar el proceso de divulgación responsable que hizo posible el descubrimiento y la solución de este error.

## Reconocimiento

Bitcoin ABC desea agradecer a la persona anónima que reveló la vulnerabilidad de manera responsable. Esta persona se ha autoidentificado como desarrollador de Bitcoin Unlimited, Awemany, a través de su [post en Medium](https://medium.com/@awemany/600-microseconds-b70f87b0b2a6).

También nos gustaría agradecer a los mineros y otros operadores de nodos que tomaron medidas inmediatas para actualizar su software Bitcoin ABC. Al hacerlo, han brindado seguridad y protección a la red de Bitcoin Cash y sus usuarios.
