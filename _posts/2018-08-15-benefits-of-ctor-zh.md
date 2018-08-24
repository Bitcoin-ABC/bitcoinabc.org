---
layout: post
title: 交易规范排序的优点
multiLangId: 2018-08-15-benefits-of-ctor
lang: zh_simple
---

Jonathan Toomim撰写了一篇文章，关于为何推崇交易规范排序(Canonical Transaction Ordering，简称CTOR)[1]这一决定的原因。这里是对其观点，以及为何CTOR具有优势的总结。同时，我们也提供了Joannes Vermorel关于交易排序的文章作为参考。[2]

由于比特币现金交易的构成以及哈希方式，一个有向无回路的图被生成，且子交易会消费母交易的结果。尽管可以在区块交易中使用拓扑排序(Topological ordering, 简称TTOR，这也是比特币现金在区块中目前的交易排序)，但是它是既不有效，也不优雅的排序交易的方式。因此，从TTOR转化使用CTOR具有以下优势：

1. CTOR比TTOR实现起来更简单。TTOR的复杂性在于必须在排序子元素前必须排序母元素。
2. 矿工不再需要发现有效的排序了。大约70%的区块模版的生成时间在用于因为排序规定造成的child-pays-for-parent(CPFP)代码。除去这一步骤可用大大增加性能。
3. 不需要担心由于区块验证所需的中间态。这可以保证区块验证可以完全平行化。[3]举个例子，以太坊不能规模化就是因为遭受过多数量的中间态。
4. 由于节点只需要传送其内存池和最近发布的区块的差别，编码和传送区块变得更简单。这是得益于Graphene[4]，其和CTOR一起使用更加有效。
5. CTOR可减少系统复杂性，并且排除了攻击者发布一个排序数量众多的区块来减慢验证，以此恶意攻击的可能。

综上所述，Bitcoin ABC认为CTOR比TTOR更优，并且值得实现。比特币现金的将来可以大大得益于目前减少其复杂性但工作。

[1] [Jonathan Toomin. Canonical block order, or: How I learned to stop worrying and love the DAG](https://medium.com/@j_73307/canonical-block-order-or-dbe3ac48bcd3)

[2] [Joannes Vermorel, et al. Canonical Transaction Ordering for Bitcoin](http://blog.vermorel.com/journal/2018/6/12/canonical-transaction-ordering-for-bitcoin.html)

[3] [Wikipedia.  Embarrassingly parallel](https://en.wikipedia.org/wiki/Embarrassingly_parallel)

[4] [A. Pinar Ozisik, et al. Graphene: A New Protocol for Block Propagation Using Set Reconciliation](http://forensics.cs.umass.edu/graphene/graphene-short.pdf)
