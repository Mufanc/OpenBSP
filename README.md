## OpenBSP

### 适用于 SDCC 编译器的单片机板级支持包

&emsp;&emsp;起因是 Keil5 支持的语法非常古老，而我又是深度 Linux 用户，总之使用过程中各种难受。于是配置了一套能在 Linux 环境下编译和烧录的工具链——然后就发现学习通上给的 BSP 库并不能适配 sdcc 编译器，遂决定仿照其 API 重新实现一套支持包。~~因为工程量比较大，最后有可能直接摆烂弃坑（~~

* 安装依赖（需要 GNU Make）

```bash
git clone https://github.com/Mufanc/OpenBSP
cd OpenBSP
make install
```

此操作会：

1. 通过 apt 安装 sdcc 编译器 
2. 在当前目录创建 Python3 虚拟环境，并安装 stcgal 用于烧录

后续可能会制作 docker 镜像，方便快速安装和避免污染外部环境

* 使用

```bash
# 编译
make
# 编译并烧录
make flash
```
