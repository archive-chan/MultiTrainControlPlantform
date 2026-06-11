# 多列车协同控制系统仿真平台 (MultiTrainControlPlantform)

<p style="text-align:left">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="License">
  &nbsp;&nbsp;
  <img src="https://img.shields.io/badge/MATLAB-R2016a%2B-blue" alt="MATLAB">
  &nbsp;&nbsp;
  <img src="https://img.shields.io/badge/Database%20Toolbox-orange" alt="Toolbox">
</p>

## 📖 项目简介

基于 MATLAB 开发的图形用户界面（GUI）仿真工具，主要面向教学演示与科学研究场景，用于模拟和研究多列车协同控制行为。平台支持包含多种通信拓扑结构在内不同参数配置、非理想工况条件下的多列车协同控制仿真，支持仿真过程可视化、回放以及仿真数据的查询、导出等功能。

本项目适用于轨道交通领域的教学演示与科研实验，帮助学生和研究人员直观理解多列车协同控制的基本原理与算法效果。

## ✨ 功能概要

### 登录系统

- **注册登录**：完成核心数据验证和用户账号切换
- **场景选择**：教学场景（teaching）、科研场景（research）与管理场景（administrator），针对不同用户场景展示不同的功能界面
- **事件监听**：响应登录（Login）、登出（Logout）、退出（Exit）等事件协调各界面组件的切换

### 基本参数配置

- **仿真基础**：采样时间 dt、总时长 T
- **列车参数**：列车数量 N、列车长度 L、列车间距 d、初始位置/速度
- **领航车轨迹**：支持按速度设计或按位置设计轨迹，通过关键点插值生成
- **通信拓扑**：支持前车跟随、双向协同、全互联、领航跟随、双向领航五种拓扑结构
- **控制参数**：位置系数 Kp、速度系数 Kv
- **物理性质**：速度限幅、控制输入限幅、阻力系数（c0、c1、c2）

### 高级参数配置（教学端隐藏）

- **通信延时**：支持固定延时与波动延时，提供无补偿、匀速预测、Smith 预估器三种延时补偿策略
- **外部干扰**：支持阻力干扰与牵引电信号干扰，提供干扰观测器（DOB）进行补偿
- **能耗统计**：实时计算并显示各跟随车的能耗数据

### 仿真可视化

- **列车运行动画（科研端隐藏）**：实时显示各列车的位置移动
- **位置曲线**：各列车位置随时间变化曲线
- **速度曲线**：各列车速度随时间变化曲线
- **间距误差曲线**：跟随车与期望位置的间距误差
- **控制输入曲线**：各跟随车的控制输入变化

### 数据管理

- **参数配置**：支持新增、删除、保存参数配置（JSON 格式）
- **仿真记录**：自动保存仿真结果到 SQLite 数据库，支持查看、删除、导出到 Excel
- **账号导入（仅管理员端）**：支持通过 Excel 文件批量导入账号信息
- **数据还原（仅管理员端）**：一键清除所有数据并恢复初始状态

## 📑 项目结构

```
MultiTrainControlPlantform/
├── main.m                  # 程序入口
├── LoginWindow.m           # 登录窗口
├── MainWindow.m            # 主窗口
├── DBCenter.m              # SQLite 数据库操作封装类
├── JsonHelper.m            # JSON 参数配置文件操作封装类
├── LICENSE                 # MIT 许可证
├── README.md               # 本文件
├── account.xlsx            # 管理员端账号导入参考数据表
├── db/
│   └── local.db            # SQLite 数据库文件（账号数据、仿真记录）
├── params/
│   └── default.json        # 默认参数配置文件
└── icons/                  # 工具栏图标资源
    ├── start.png
    ├── pause.png
    ├── continue.png
    ├── result.png
    ├── replay.png
    ├── paramsAdd.png
    ├── paramsDelete.png
    ├── recordDelete.png
    ├── recordExport.png
    └── accountImport.png
```

## 🚀 快速开始

### 环境要求

- MATLAB R2016a (最低支持版本)
- MATLAB R2025b (开发推荐版本)

### 依赖工具箱

- [Database Toolbox](https://ww2.mathworks.cn/help/database/index.html?s_tid=CRUX_lftnav)（用于 SQLite 数据库操作）

### 运行

1. 将项目克隆或下载到本地
2. 在 MATLAB 中打开项目文件夹
3. 终端运行 `main` 启动程序

```matlab
>> main
```

## ℹ️ 信息

当前版本：v0.1

项目链接：[https://github.com/archive-chan/MultiTrainControlPlantform](https://github.com/archive-chan/MultiTrainControlPlantform)

本项目基于 [MIT License](LICENSE) 开源

默认管理员账号
| 用户名 | 密码 | 场景 |
|--------|------|------|
| admin  | 88888888 | administrator（管理员） |

## 📌 Todo

- [X] 注册登录数据库验证
- [X] 登录窗口与主窗口切换
- [X] 教学端 toolbar 状态控制按钮逻辑
- [X] 科研端 toolbar 状态控制按钮逻辑
- [X] 管理员端 从 excel 批量导入账号
- [X] 可视化UI布局 优化画图性能问题
- [X] toolbar 增删参数配置
- [X] toolbar 删除导出记录
- [X] 关于UI布局 展示毕设信息
- [X] 重构setPage切换界面UI
- [X] 历史数据 查看表格记录
- [X] 关于页面重写UI布局 恢复初始数据
- [X] 参数设置添加变量名和单位
- [X] 参数 数据合法化验证 增加tooltip提示
- [X] 美化 添加toolbar各按钮icon 动画演示加入轨道线
