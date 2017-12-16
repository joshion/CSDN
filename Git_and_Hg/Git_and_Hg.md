# Choice of commands, Model of branch, Difference between Git and Hg(Mercurial)

## **Some Version Control**

### *```SVN``` and ```CVS```*

> 传统版本控制系统（中心存储库模式）。CVS(Concorrent version system)，就目前情况来看，CVS应该已经被SVN替代（SVN都快要被其他分布式结构的版本管理软件所替代），这是一个比较古老的软件，就我而言，我是仅知道有这么一个软件，但是从未用过。SVN(Subversion)，作为一个为了代替CVS而开发出来的软件，但是仍是没有脱离原有的```中心存储库模式```框架，因而即使是一些小项目，一些仅有一个文件的项目，若你想使用SVN来进行代码管理，还是得先搭一下服务器。虽然SVN是我第一接触到的版本管理软件，但是稍后就转到Git去了（毕竟Github是宇宙第一男同性交友网站），故而对SVN的特性并没有什么了解，在此不再细说。

### *```Hg(Mercurial)``` , ```Git``` and ```Bazaar```*

> 现代版本控制系统（分布式）。此三者都是基于分布式的设计，相比于SVN，这类的版本控制系统最突出的优点在于无需一个中心服务器（客户端和服务器可以在同一机器上）。可以随时随地在某一个文件夹下建立个仓库，再将这些文件添加到版本管理中，对于个人独立开发者，这个一个致命的诱惑。我想这也是Github能成为宇宙第一男同性交友网站的原因之一。

### *Others*

1. Gerrit
    > 基于git的一个代码review系统
1. BitKeeper
    > Linus在开发出Git之前使用其来管理Linux内核代码主线

## **Choice of commands**

本人日常使用的版本控制软件为Hg 和 Git，这两者虽然在某些特性上有所差别，但是在命令层次却是高度相似。而两者的差别，暂时没有做过全面的对比，无法给出一个系统的结果。这里也并非hg和git的使用教学，而是一些```可以实现同一个功能的不同命令的实际结果```的一些心得。在此以Hg为例（无可置疑，TortoiseHg的界面还是比TortoiseGit好看那么一丢丢）

### merge, rebase and graft(transplant)

### hg, patch and diff

### shelve, rollback and backout

## **Model of branch**

## **Difference between Git and Hg**

## *Reference*


1. [[git]merge和rebase的区别](http://www.cnblogs.com/xueweihan/p/5743327.html)
1. [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)
1. [Git的Patch功能](http://www.cnblogs.com/y041039/articles/2411600.html)
1. [hg vs git ：这个世界除了svn还有别的](http://www.cnblogs.com/code-style/p/3795763.html)
1. [[代码管理_版本控制]开放源代码版本控制系统](http://www.cnblogs.com/webapplee/p/3959828.html)
1. [gotgit](https://github.com/gotgit/gotgit)
1. [https://www.mercurial-scm.org/](https://www.mercurial-scm.org/)
1. [Mercurial: The Definitive Guide by Bryan O'Sullivan](http://hgbook.red-bean.com/read/)