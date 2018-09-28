---
layout: post
title: Cambios del Hardfork de Noviembre a ser completados al 15 de Agosto
subtitle: Solo una semana restante para la fecha de completación del código
multiLangId: 2018-08-08-nov-code-complete-reminder
lang: es
---

Manteniéndonos alineados con nuestra propuesta de calendario para la  [actualización de Noviembre](https://www.bitcoinabc.org/2018-07-05-nov-hardfork-timeline/), Bitcoin ABC se ha esforzado para que los cambios relacionados al consenso se encontrasen completos al 15 de Agosto. Este es un recordatorio para aquellos que contribuyen con el código de Bitcoin ABC así como una actualización de la situación a la comunidad. Una vez que todos los cambios estén incluidos al 15 de Agosto, procederemos al lanzamiento de la versión 0.18.0 y comenzaremos las pruebas en testnet.

Los siguientes cambios se encuentran completos y estarán listos para las pruebas el 15 de Agosto:
 * Orden Canónico de Transacciones [1].
 * Ejecución del tamaño mínimo de transacciones de 100 bytes para prevenir ataques al árbol de Merkle (*Merkle tree*).
 * Activación del código e implementación para OP_CHECKDATASIG y OP_CHECKDATASIGVERIFY [2].
 * Hacer la regla *push-only* mandatoria para *ScriptSig* [1].

Los siguientes cambios se encuentran en progreso y esperamos se encuentren listos para el 15 de Agosto:
 * Estructura de tasa modificada (*Modified fee structure*) para permitir la disminución de un orden de magnitud en las tasas para transacciones típicas (no estrictamente un cambio de consenso, pero un cambio importante a ser incluido en el lanzamiento).

### Enlaces de Referencia
[1] [Especificaciones del Hardfork de Noviembre.](https://github.com/bitcoincashorg/bitcoincash.org/pull/94/files)  
[2] [Especificaciones para OP_CHECKDATASIG y OP_CHECKDATASIGVERIFY.](https://github.com/bitcoincashorg/bitcoincash.org/pull/93/files)  
