# experimentalkernel
# 这个是为了测试，别乱加到自己的 Gentoo 中，谢谢，如果你用了，后果自负

**如果你将我的 overlay 加入到系统中，不用担心，可以安心使用**

**但是非常建议各位使用 Gentoo Linux 的朋友添加 Gentoo-zh overlay 源，这样能够得到更好更稳定的更新，谢谢你们的支持**

**大家注意源中提供的 Xanmod 默认 config 文件的，这两个内核都可以兼容 openZFS 文件爱你系统，望周知**

### Xanmod-Hybrid 内核

[Xanmod-Hybrid](https://xanmod.org/) 是 Linux 第三方定制内核中非常著名的。因为我将原始版本 xanmod，cjktty 和 uksm 进行了融合，为了区别 xanmod 原始贡献者的版本，取了这个名字。原始 Xanmod 内核并没有对 CPU 调度器做非常特殊定制的情况下，能够在 [Phoronix Benchmark](https://www.phoronix.com/scan.php?page=article&item=xanmod-2020-kernel&num=3) 中击败众多对手，比方说 [Liquorix](https://liquorix.net/)。并且 Xanmod 的稳定版本在其官方主页支持基于 Debian 的所有发行版，当然，还有 [Archlinux](https://aur.archlinux.org/packages/linux-xanmod/) 和 [Gentoo](https://gitlab.com/src_prepare/src_prepare-overlay/-/tree/master/sys-kernel/xanmod-sources) 。那么既然已经有 Gentoo 的 overlay 了，我为什么还要做一个 overlay 呢？

1. [src_prepare overlay](https://gitlab.com/src_prepare/src_prepare-overlay) 只提供稳定版本的 Xanmod 内核；
2. config 在内核源码安装后就有了，是 Xanmod 默认提供的版本，大家直接 make nconfig 就能够狗按照自己的喜好定制了，方便；
3. UKSM 补丁，来源是 [Piotr Górski](https://gitlab.com/sirlucjan/kernel-patches/-/tree/master) 提供的各式各样第三方补丁，并且根据主线会实时更新；
4. cjktty 补丁，来源是 [zhmars](https://github.com/zhmars/cjktty-patches) 提供的第三方补丁，支持关注并保持更新。

### Xanmod-Cacule-Hybrid 内核

[Xanmod-Cacule-Hybrid](https://github.com/hamadmarri/cacule-cpu-scheduler) 是原始 Xanmod-Cacule，cjktty 和 uksm 补丁的混合体，Cacule 这个算法是从 FreeBSD 的 ULE 调度器学习过来，并有所创新的，大家不妨可以试试。这个内核将遵循以下原则更新：

1. 内核跟随 [Xanmod-Cacule](https://github.com/xanmod/linux/tree/5.12-cacule) 官方主线，补丁增加 cjktty 和 uksm
2. 无其他特殊改变

## 写在最后

为什么放弃继续维护 Project-C 内核：

1. 补丁复杂，而且效果一般
2. 生成的 initramfs 提及臃肿

Xanmod 内核补丁是目前全网性能最好的，突出表现在响应速度。希望大家喜欢。

以上就是该 overlay 现在和将来的目标，维护这三个 ebuild，持续更新，为了更好的性能，为了我们共同的挚爱—Linux Kernel。

希望大家多多提意见，多多提 issue，多多点赞。
