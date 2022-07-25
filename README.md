## OpenBSP

* 适用于 SDCC 编译器的单片机板级支持包

&emsp;&emsp;起因是 Keil5 支持的语法非常古老，而我又是深度 Linux 用户，总之使用过程中各种难受。于是配置了一套能在 Linux 环境下编译和烧录的工具链——然后就发现学习通上给的 BSP 库并不能适配 sdcc 编译器，遂决定仿照其 API 重新实现一套支持包。~~因为工程量比较大，最后有可能直接摆烂弃坑（~~

### 使用（Docker）

* 当前版本 Docker 镜像略大（571 MB），欢迎各位大佬来 PR 一个优化方案（

```shell
git clone https://github.com/Mufanc/OpenBSP
cd OpenBSP
./build.sh        # 仅编译
./build.sh flash  # 编译 & 下载
```

### 使用（GNU Make）

```shell
git clone https://github.com/Mufanc/OpenBSP
cd OpenBSP
make install-deps
```

此操作会：

* 通过 apt 安装 sdcc 编译器
* 通过 pip 安装 stcgal 包

```shell
make        # 仅编译
make flash  # 编译 & 下载
```
