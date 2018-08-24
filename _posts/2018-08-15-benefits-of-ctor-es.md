---
layout: post
title: Beneficios del Orden Canónico de Transacciones
multiLangId: 2018-08-15-benefits-of-ctor
lang: es
---

Jonathan Toomim escribió un maravilloso artículo explicando varias de las consideraciones involucradas en la decisión detrás del Orden Canónico de Transacciones (CTOR) [1]. A continuación se presenta un sintético resumen de los puntos mencionados y la razón del valor de CTOR. También proporcionamos el artículo de Joannes Vermorel acerca del orden de transacciones como referencia [2].

Debido a la forma en que las transacciones de Bitcoin Cash son creadas y hasheadas (aplicación de función hash), se forma un grafo acíclico dirigido, donde las transacciones hijas gastan las salidas de las transacciones padres. A pesar de que un orden topológico (TTOR, éste es el modo actual del orden de transacciones de Bitcoin Cash en un bloque) de las transacciones en un bloque es siempre posible, no es la forma ni más eficiente ni la más elegante de ordenar transacciones. Como tal, pasar de TTOR a CTOR proporciona los siguientes beneficios:

1. CTOR es más simple de implementar que TTOR. Gran parte de la complejidad de TTOR proviene del requisito de ordenar las transacciones padres antes que las hijas.
2. Los mineros ya no necesitan descubrir un orden válido. Alrededor del 70% del tiempo de creación del modelo de bloque parece provenir del código hija-paga-por-padre (child-pays-for-parent) debido a los requerimientos de orden. Eliminar esto incrementará el rendimiento.
3. No hay necesidad de preocuparse por los estados intermedios durante la validación del bloque. Esto asegura que la validación de bloques pueda ser perfectamente paralela [3]. La escalabilidad de Ethereum, por ejemplo, sufre por tener un gran número de estados intermedios.
4. Hace la codificación y la transmisión de bloques mucho más fáciles al permitir que los nodos sólo comuniquen las transacciones que difieren entre sus mempools y un bloque recientemente publicado. Esto es lo que Graphene [4] hace, y funciona muy eficientemente con CTOR.
5. CTOR reduce la complejidad del sistema, eliminando la clase completa de vectores de ataque donde un minero malintencionado puede publicar un bloque mayor con un orden de transacciones que sea tan lento de validar como fuera posible.

Dado lo anterior mencionado, el equipo de Bitcoin ABC cree que CTOR es superior a TTOR y vale implementarlo. Reducir la complejidad ahora tendrá grandes recompensas para el futuro de Bitcoin Cash.

[1] [Jonathan Toomin. Canonical block order, or: How I learned to stop worrying and love the DAG](https://medium.com/@j_73307/canonical-block-order-or-dbe3ac48bcd3)

[2] [Joannes Vermorel, et al. Canonical Transaction Ordering for Bitcoin](http://blog.vermorel.com/journal/2018/6/12/canonical-transaction-ordering-for-bitcoin.html)

[3] [Wikipedia. Embarrassingly parallel](https://en.wikipedia.org/wiki/Embarrassingly_parallel)

[4] [A. Pinar Ozisik, et al. Graphene: A New Protocol for Block Propagation Using Set Reconciliation](http://forensics.cs.umass.edu/graphene/graphene-short.pdf)
