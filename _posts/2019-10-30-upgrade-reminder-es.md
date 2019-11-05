---
layout: post
title: Asegúrate de estar listo para la actualización de red Bitcoin Cash
subtitle: La actualización se activa el 15 de Noviembre
multiLangId: 2019-10-30-upgrade-reminder
lang: es
---

## Qué pasará?

En aproximadamente dos semanas, el 15 de Noviembre de 2019, la red Bitcoin Cash se someterá a una actualización de red planificada. Esta actualización es un proceso programado de rutina, como parte de la [Hoja de Ruta Bitcoin Cash](https://www.bitcoincash.org/roadmap.html).

## Qué necesito hacer?

Todos los operadores de nodo deberán actualizar su software de nodo a una versión reciente. Para los usuarios de Bitcoin ABC, esto significa cualquier versión 0.20.0 o superior, que se puede descargar [aquí](https://download.bitcoinabc.org/).

Cualquier persona ejecutando un servicio, como un explorador de bloques, un sitio de cambio o cualquier otro servicio proporcionado por un nodo pleno, debe actualizar.

Los usuarios comunes no necesitan hacer nada. Las carteras no son afectadas por esta actualización, y deberían continuar funcionando normalmente.

## Qué pasa si no actualizo?

Las versiones de Bitcoin ABC anteriores (0.19.x) se volverán automáticamente incompatibles con el resto de la red Bitcoin Cash a partir de que la actualización sea activada el 15 de Noviembre. Los nodos no actualizados están diseñados para operar de manera que no interfieran con la red actualizada, y se separen de manera segura de los nodos actualizados, después del 15 de Noviembre. Esto significa que cualquier persona que desee utilizar un nodo en la red Bitcoin Cash en el futuro debe actualizar.

## Qué funcionalidades están incluidas en la actualización?

La especificación para la actualización de Noviembre está disponible [aquí](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md).

Esta actualización activará dos funcionalidades:
* [Firmas Schnorr para OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md). La actualización anterior habilitó las firmas Schnorr para ser usadas con OP_CHECKSIG y OP_CHECKDATASIG, esta actualización extiende ese soporte a OP_CHECKMULTISIG. Después de esta actualización, todas las operaciones de verificación de firmas soportarán firmas Schnorr.
* [Hacer cumplir MINIMALDATA en script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md). Esto remueve el vector de maleabilidad BIP 62 final, y significa que la mayoría de las transacciones en la red BCH (incluyendo todas las transacciones P2PKH) ya no serán maleables.

Estas características permiten ciertas funcionalidades mejoradas, como [contratos inteligentes ocultos](https://youtu.be/6V98Q4FnSY0). Los usuarios comunes de Bitcoin Cash no se verán afectados.

## Qué otra información está disponible?

Para asistir las preparaciones técnicas de la actualización se cuenta con un [testnet](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md) donde las nuevas funcionalidades pueden ser probadas y evaluadas.
Este testnet puede ser usado para asegurar compatibilidad, o para comenzar a construir productos que utilicen las nuevas funcionalidades.

En caso de preguntas, o necesidad de asistencia, por favor contáctanos a través de [email](mailto:info@bitcoinabc.org).
Desarrolladores son bienvenidos a nuestro grupo Bitcoin ABC development de [Telegram](https://t.me/joinchat/HCYr50mxRWjA2uLqii-psw).
