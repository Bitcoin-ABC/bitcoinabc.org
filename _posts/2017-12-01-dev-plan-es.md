---
layout: post
title: Plan de desarrollo a mediano plazo
multiLangId: 2017-12-01-dev-plan
lang: es
---

## Bitcoin ABC - Plan de desarrollo a mediano plazo

El propósito de esta declaración es comunicar los planes del proyecto Bitcoin ABC para el futuro de mediano plazo (próximos 6-12 meses).

Los desarrolladores de Bitcoin ABC han estado colaborando y comunicándose con desarrolladores y representantes de varios proyectos, incluyendo Bitcoin Unlimited, Bitprim, nChain, Bitcrust, ElectrumX, Parity y Bitcoin XT. Aunque todos estos son proyectos independientes, cada uno con sus propios procesos de desarrollo y prioridades, compartimos una visión común para promover de Bitcoin Cash. Si bien solo podemos hablar por nosotros mismos, los planes para Bitcoin ABC se alinean con esta visión compartida.

Nuestra principal prioridad para Bitcoin Cash es seguir mejorándolo como una excelente forma de dinero. Queremos hacerlo más confiable, escalable, con tarifas bajas y listo para un crecimiento rápido. Debería simplemente "funcionar", sin complicaciones ni molestias. Estando listo para una adopción global por parte de los usuarios principales, y proporcionar una base sólida en la que las empresas puedan confiar.

Un objetivo secundario es posibilitar funcionalidades mejoradas, cuando sea seguro hacerlo. Podemos facilitar casos de uso tales como marca-de-tiempo (*timestamping*), *tokens* representativos y comandos (*scripting*) de transacciones más complejos, cuando estas características no sean en detrimento de la función primaria de la moneda.

Los siguientes pasos que planeamos tomar son:

Programaremos una actualización de protocolo cuando el *Median Time Past* llegue a la marca-de-tiempo (*timestamp*) 1526400000 (15 de Mayo de 2018) y una subsecuente actualización 6 meses más tarde cuando el *Median Time Past* llegue a 1542300000 (15 de Noviembre de 2018).

Finalizaremos el código y las funcionalidades a ser incluidas en la actualización tres meses antes de la misma (15 de Febrero de 2018).

Algunas de las funcionalidades tentativamente planificadas para la próxima actualización son:

* Aumento del límite predeterminado de tamaño de bloque, y avanzar hacia el límite de tamaño de bloque adaptativo.
* Avanzar hacia el orden canónico de transacciones, tal vez eliminar la regla de consenso del orden de transacciones como primer paso.
* Mejorar el algoritmo de ajuste de dificultad.
* Reactivar algunos códigos de operación (*opcodes*) desactivados y avanzar hacia la adición de puntos de extensión de protocolo para facilitar futuras actualizaciones de códigos de operación (*opcodes*).

Tener en cuenta que las características específicas que serán incluidas dependen de una mayor discusión, implementación y prueba.

Para cualquiera interesado en ver estas características (u otras) en Bitcoin Cash, este es el momento de trabajar en ellas. Las actualizaciones de protocolo necesitarán una implementación sólida, con tiempo adecuado de revisión y prueba. No queremos estar la posición en la de ser presionados para que se incluyan cambios de último minuto en la actualización del protocolo. Necesitamos ser proactivos.

Trabajando juntos, haremos de Bitcoin Cash la mejor moneda que el mundo haya visto jamás.

Proyecto Bitcoin ABC
