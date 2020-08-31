---
layout: post
title: Las direcciones CashAddr están aquí
subtitle: La versión 0.16.2 soporta el nuevo formato  de dirección Bitcoin Cash CashAddr.
multiLangId: 2018-01-14-CashAddr
lang: es
---

**Qué es *CashAddr*?**

*CashAddr* es un nuevo formato de dirección para Bitcoin Cash. Si alguna vez viste una dirección de Bitcoin o una dirección de Bitcoin Cash, estás al menos relativamente familiarizado con la apariencia de las direcciones --básicamente un montón de letras y números.

Esto es lo que está obteniendo un nuevo formato. Técnicamente, es una nueva ‘codificación’ y visualmente aparecerá de manera diferente.

**Cómo son las nuevas direcciones?**

Sigue un ejemplo:
```
bitcoincash:qqeht8vnwag20yv8dvtcrd4ujx09fwxwsqqqw93w88
```

Tené en cuenta el prefijo "bitcoincash:", que técnicamente es siempre parte de la dirección, aunque el mismo puede ser opcional o faltar por completo, dependiendo de la cartera o de la implementación.

**Cómo esto me afecta? Qué necesito hacer?**

Te recomendamos utilizar las direcciones nuevas, aunque no sea obligatorio. Podrías experimentar ‘incompatibilidad de cartera’ y necesitar usar una herramienta de conversión de dirección (más sobre esto a continuación).

Si observás que tu cartera o servicio elegido aún no ha sido actualizado para admitir *CashAddr*, sería útil informarles sobre el nuevo formato.

**Puedo seguir usando las antiguas direcciones ‘heredadas’?**

Técnicamente sí, pero te recomendamos actualizar. Si tenés una dirección heredada que se encuentra actualmente en uso, la misma continuará funcionando. Sin embargo, la mayoría de los usuarios deberían actualizar porque las nuevas direcciones son más seguras. Además, la experiencia de usuario mejorará cuando todos utilicen el mismo formato.

**Puedo enviar desde una dirección antigua a una dirección nueva o viceversa?**

Sí. El formato de dirección es solo una codificación. Para usar una analogía, pensá en la codificación como un envoltorio, o ‘vestimenta’. Considerá el hecho de que siempre podés hablar con tus amigos, independientemente de la vestimenta que estés usando.

En esta analogía, lo que está por debajo de la vestimenta es el hash de la clave pública (*pubkeyHash*).

**Puedo comenzar a usar las nuevas direcciones inmediatamente?**

Sí. Por favor, hacelo.

**Intenté enviar a una de estas nuevas direcciones y mi cartera no me lo permitió. Por qué?**

Si la cartera no ha sido actualizada, la misma todavía no conoce el nuevo formato. Pero no te preocupes, hay una fácil solución al problema. Es posible convertir formatos antiguos a formatos nuevos, o formatos nuevos a formatos antiguos. Existen varias herramientas de conversión disponibles. Recomendamos: [https://cashaddr.bitcoincash.org/](https://cashaddr.bitcoincash.org/). Otra herramienta de conversión está disponible en [Electron Cash 3.1.](Https://electroncash.org).

Si vas a utilizar alguna herramienta de conversión, es muy importante utilizar solo las confiables, ya que existe la posibilidad de que una herramienta malintencionada te proporcione una dirección falsa.

**Existe un ‘mapeo’ uno-a-uno de formatos antiguos a formatos nuevos?**

Sí. Cualquier formato de dirección Bitcoin heredado se convertirá en uno y solo un formato de *CashAddr*, y lo mismo se aplica a la inversa. Por lo tanto, siempre habrá 2 versiones (heredada y *CashAddr*) de cualquier dirección dada, y son intercambiables porque corresponden al mismo conjunto de claves privadas y públicas.

**Qué sucede si convierto una dirección antigua al nuevo formato y le envío algunas monedas a un amigo pero su cartera no admite el nuevo formato?**

No hay problema. El dinero aparecerá en la dirección antigua de tu amigo (ya que es realmente la misma dirección, solo codificada de manera diferente).

**Por qué la comunidad de desarrollo de Bitcoin Cash decidió crear un nuevo formato de dirección?**

Como un libro mayor y criptomoneda diferente, Bitcoin Cash debería tener su propio formato de dirección, lo que reducirá posibles errores y confusión en los usuarios.

**Cuáles son los beneficios de este formato de dirección en particular?**

Además de ofrecer un formato de dirección distintivo, el nuevo formato no diferencia entre letras mayúsculas y minúsculas, lo que hace que las direcciones sean más fáciles de escribir y de comunicar entre humanos. Es también extensible, por lo que no será necesario cambiarlo en el futuro a medida que nuevas funcionalidades de Bitcoin Cash sean agregadas.

**Pueden explicar lo que significa, técnicamente, contar con un nuevo formato?**

Cuando realizás una transacción para ‘enviar’ Bitcoins a una dirección, lo que realmente estás haciendo es desbloquear salidas (*outputs*) no gastadas y volverlas a bloquear para que solo alguien con la capacidad de firmar la clave pública (con su clave privada) pueda controlarlos.

El nuevo formato de dirección no cambia el formato de estas transacciones en el blockchain, sino más bien: simplemente la representación visual que es presentada al usuario.

**Es esto un cambio de protocolo, un *softfork*, o un *hardfork*?**

No, no es ninguno de estos.

**Alguna de mis claves privadas o públicas cambia?**

No.

**Existe alguna especificación *CashAddr* oficial para desarrolladores?**

Sí, [aquí.](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/cashaddr.md)
