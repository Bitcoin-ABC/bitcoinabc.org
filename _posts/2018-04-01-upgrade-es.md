---
layout: post
title: Actualización de red del 15 de Mayo
subtitle: Bitcoin Cash está agregando códigos de operación (opcodes) y bloques de 32mb
multiLangId: 2018-04-01-upgrade
lang: es
---

## Qué pasará el 15 de Mayo?

El 15 de Mayo de 2018, la red Bitcoin Cash está programada para actualizar las reglas de consenso. La comunidad de desarrollo de Bitcoin Cash realiza actualizaciones regulares y periódicas de la red en orden de mantener la evolución de la misma.

## El nuevo software ya está listo?

Sí. Bitcoin ABC 0.17.1 ya está disponible y contiene el código para ejecutar las nuevas reglas de consenso, así como también el código para una suave transición de las reglas anteriores a las nuevas en el tiempo de activación programado.

## Cómo esto me afecta? Qué necesito hacer?

Si estás ejecutando un nodo Bitcoin Cash, debes actualizar inmediatamente a Bitcoin ABC 0.17.1 u otro software compatible.

## ¿Qué esfuerzos de comunicación se están realizando para que todos estén al tanto de la actualización?

Bitcoin ABC tomará acciones para contactar los principales proveedores de cambio y carteras. Toda ayuda en esta iniciativa es bienvenida. Puedes ayudar poniéndote en contacto con los proveedores de cambios, de carteras y otros participantes del ecosistema, y ​​haciéndoles saber que deben actualizar sus respectivos softwares o ejecutar una versión actualizada de Bitcoin ABC u otro software compatible.

## Cuales son los cambios de la nueva versión del software?

El cambio más notable es el incremento del tamaño máximo de bloque a 32 MB.

También hay varios códigos de operación de Bitcoin (*opcodes*) siendo agregados o reactivados. Estos incluyen OP_CAT, OP_AND, OP_OR, OP_XOR, OP_DIV, OP_MOD, OP_SPLIT, OP_NUM2BIN y OP_BIN2NUM. Finalmente, el transportador de datos OP_RETURN aumenta su tamaño a 220 bytes.

## Otros clientes como Bitcoin Unlimited y Bitcoin XT están actualizando su software?

No podemos hablar por otros proyectos, pero hemos visto anuncios de que así lo han hecho.

## Cuándo es el momento exacto de la actualización?

La actualización está basada en el método *"Median Time Past" (MTP)*, que se activa en el horario MTP de 1526400000 (Martes 15 de Mayo 16:00:00 UTC, 2018). En otras palabras, cuando la mediana de las marca-de-tiempo (*timestamp*) de los 11 bloques más recientes sea igual o mayor a 1526400000, las nuevas reglas de consenso serán aplicadas al bloque siguiente. La hora exacta de activación depende del momento en este bloque sea encontrado.

## Qué tipo de pruebas están siendo realizadas por la comunidad de desarrollo? ¿Qué herramientas para realizar pruebas están disponibles?

Bitcoin ABC se encuentra actualmente probando ambas, tanto las nuevas reglas como su activación. Se pone a disposición: [testnet](https://docs.google.com/spreadsheets/d/1_uJryqNnMEHogUdCY6WhCMoyuyoZsyMtVm2R4xAsIeI/edit). Alentamos a otros grupos a realizar sus respectivas pruebas.
