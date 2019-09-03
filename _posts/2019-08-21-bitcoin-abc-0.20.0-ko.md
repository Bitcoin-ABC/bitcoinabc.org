---
layout: post
title: 비트코인 ABC 0.20.0 업그레이드를 준비하세요
subtitle: 2019년 11월 15일, 프로토콜 업그레이드가 확정되었습니다
multiLangId: 2019-08-21-bitcoin-abc-0-20-0
lang: ko
---

비트코인 ABC 팀의 목표는 완벽한 화폐의 탄생입니다. 언제 어디에서나, 모두의 자유와 번영을 지원해줄 수 있는. 비트코인 ABC 팀은 [비트코인 캐시의 로드맵](https://www.bitcoincash.org/ko/roadmap.html) 을 진두지휘하고 있습니다.

비트코인 캐시의 비전에 걸맞은 2019년 11월 프로토콜 업그레이드를 자랑스럽게 공개합니다. 비트코인 ABC 0.20.0은 현재 다운로드가 가능합니다. 다운로드 링크: [https://download.bitcoinabc.org/0.20.0/](https://download.bitcoinabc.org/0.20.0/)

모든 프로토콜 업그레이드에 추가되는 기능들은 사전에 계획되고, 구체화하고 개발됩니다. 비트코인 캐시 생태계의 모든 참여자에게 업그레이드를 준비할 수 있는 시간을 충분히 드리기 위함입니다. 비트코인 ABC 0.20.0은 2019년 11월 15일로 예정된 업그레이드의 준비를 완료했습니다.
프로토콜 업그레이드가 완료된 후에는 이와 같은 기능들이 추가될 예정입니다:
* **OP_CHECKMULTISIG(VERIFY)를 위한 스크노 서명** [2]. 이전 업그레이드는 OP_CHECKSIG와 OP_CHECKDATASIG를 스크노 서명과 함께 사용을 가능케 했습니다. 이번 업그레이드는 OP_CHECKMULTISIG에도 스크노 서명을 가능케 합니다. 업그레이드 이후에 진행되는 모든 서명 확인 프로세스는 스크노 서명을 지원합니다.
* **스크립트에의 MINIALDATA 시행** [3]. BIP 62의 가변성 벡터를 제거하는 작업입니다. BCH 네트워크에서 이뤄지는 대부분 트랜잭션의 (모든 P2PKH 트랜잭션 포함) 가변성을 제거합니다.

업그레이드의 준비를 지원하기 위해 테스트넷을 준비했습니다. 테스트넷에서 업그레이드 추가 기능들을 시험해 보실 수 있습니다 [4]. 테스트넷으로 호환성을 확인하고, 새로운 기능들을 활용하는 새로운 프로젝트들을 미리 시작 하실 수 있습니다.

P2P 전자 화폐는 끊임없는 프로토콜 최적화와 업그레이드를 통해 현재 존재하는 기술적 한계를 뛰어넘을 수 있습니다. 비트코인 캐시는 경쟁에서 살아남기 위해 쉬지 않고 강해져 야합니다. 비트코인 ABC팀은 비트코인 캐시를 사상 최고의 화폐로 만들기 위해 최선을 다하고 있습니다.

### Reference Links
[1] [November 2019 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md)  
[2] [Specification for Schnorr Signatures in OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md)  
[3] [Specification for Enforcing MINIMALDATA in Script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md)  
[4] [Testnet Information](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md)  
