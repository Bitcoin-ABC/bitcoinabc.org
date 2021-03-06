---
layout: post
title: Подготовьтесь к обновлению сегодня с помощью Bitcoin ABC 0.20.0
subtitle: 15 ноября 2019 г. обновление протокола теперь заблокировано
multiLangId: 2019-08-21-bitcoin-abc-0-20-0
lang: ru
---

Цель Bitcoin ABC - помочь создать надежные деньги, которые можно использовать по всему миру, чтобы обеспечить свободу и процветание для всех. Биткойн ABC продолжает оставаться движущей силой в реализации [дорожной карты](https://www.bitcoincash.org/ru/roadmap.html) для Биткойн Кэш.

В соответствии с этим видением, команда Bitcoin ABC с гордостью представляет релиз обновления протокола ноября 2019 года. Биткойн ABC 0.20.0 теперь доступен и может быть загружен по адресу: [https://download.bitcoinabc.org/0.20.0/](https://download.bitcoinabc.org/0.20.0/)

Функции, включенные в каждое обновление протокола, планируются, указываются [1] и разрабатываются заранее, чтобы дать всем участникам экосистемы Bitcoin Cash достаточно времени для подготовки. Как и в случае с последним обновлением, выпуск Bitcoin ABC 0.20.0 стал доступен за три месяца до активации обновления, которое запланировано на 15 ноября 2019 года.
После активации обновления протокола появятся следующие функции:
* **Schnorr подписи для OP_CHECKMULTISIG(VERIFY)** [2]. Предыдущее обновление позволило использовать подписи Schnorr с OP_CHECKSIG и OP_CHECKDATASIG, это обновление расширяет эту поддержку до OP_CHECKMULTISIG. После этого обновления все операции проверки подписи будут поддерживать подписи Schnorr.
* **Применять МИНИМАЛЬНЫЕ ДАННЫЕ в скрипте** [3]. Это удаляет окончательный вектор податливости BIP 62 и означает, что большинство транзакций в сети BCH (включая все транзакции P2PKH) теперь будут не податливыми.

Для технической подготовки к обновлению доступна тестовая сеть, в которой можно протестировать и протестировать функции обновления [4]. Эту тестовую сеть можно использовать для обеспечения совместимости или для создания продуктов, использующих функции обновления.

Внедряя оптимизацию и модернизацию протоколов, мы можем позволить одноранговым цифровым денежным средствам масштабировать многие порядки за пределы текущих ограничений. Биткойн Кэш должен постоянно улучшаться, чтобы конкурировать. Мы в Bitcoin ABC рады работать над созданием инфраструктуры, необходимой для того, чтобы Bitcoin Cash стали лучшими деньгами в мире.

### Reference Links
[1] [November 2019 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md)  
[2] [Specification for Schnorr Signatures in OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md)  
[3] [Specification for Enforcing MINIMALDATA in Script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md)  
[4] [Testnet Information](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md)  
