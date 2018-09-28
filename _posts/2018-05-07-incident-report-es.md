---
layout: post
title: Reporte de incidente de Bitcoin ABC (26 de Abril de 2018)
subtitle:
multiLangId: 2018-05-07-incident-report
lang: es
---

Este documento contiene información acerca de la reacción a una vulnerabilidad crítica que aplica a los mineros de Bitcoin Cash utilizando Bitcoin ABC 0.17.0. Se han tomado las medidas adecuadas para mitigar el impacto de esta vulnerabilidad. El presente documento es proporcionado únicamente con fines informativos.

Bitcoin ABC 0.17.1 soluciona este problema.

El 26 de Abril de 2018 los desarrolladores de Bitcoin ABC fueron notificados por una(s) persona(s) desconocida(s) acerca de la vulnerabilidad. Si fuese explotada, la falla habría causado una división no intencionada de la red Bitcoin Cash.

## Descripción

Un atacante podría construir una transacción maliciosa que sería aceptada por Bitcoin ABC 0.17.0 y minada en un bloque. Este bloque sería rechazado por todas las demás versiones de implementaciones Bitcoin Cash en conformidad con las reglas. La transacción maliciosa contendría el *bitflag* de *0x20* establecido en el tipo de firma *hash* (*signature hash type*).

## Impacto

BUCash y las versiones de Bitcoin ABC anteriores a 0.17.0 podrían ser separadas de la mayoría del *blockchain* Bitcoin Cash. Sólo los nodos Bitcoin ABC y BUCash fueron incluidos en el análisis de esta vulnerabilidad.

## Mitigación

Después del análisis de la vulnerabilidad y de las posibles respuestas, los desarrolladores de Bitcoin ABC prepararon un parche para la vulnerabilidad, y una versión privada, para ser distribuida directamente a los operadores de los grupos de mineración (*mining pools*). Debido a la naturaleza descentralizada de la comunidad minera, no fue posible contactar a todos directamente. Esta versión fue entregada a los mineros verificados de Bitcoin Cash para ellos re-enviarla luego a sus mineros de confianza luego de haber actualizado.

Aconsejamos a todos los usuarios de Bitcoin ABC 0.17.0 actualizar a la última versión lo antes posible.

## Seguimiento

Bitcoin ABC tomará varias medidas en orden de prevenir que dada situación ocurra nuevamente, así como también reducir el tiempo de respuesta general en el caso de problemas emergentes en el futuro.

Adicionalmente, Bitcoin ABC está en conversaciones con participantes de la industria para establecer un sistema formal de recompensas para errores (*bugs*).

## Agradecimiento

Bitcoin ABC quiere agradecer a la(s) persona(s) que reveló(aron) esta vulnerabilidad de manera responsable. Ellos proporcionaron un reporte claro y profesional. Si están dispuestos a presentarse, nos gustaría garantizar de que reciban una recompensa.

También queremos agradecer a los mineros por su cooperación, comprensión y por la manera rápida y profesional en la que tomaron medidas para proteger la red Bitcoin Cash y sus usuarios.
