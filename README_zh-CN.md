
<div align="center">
  <p>
    <a href="https://github.com/luohuabuxiema/LabelPaw" target="_blank">
      <img alt="X-AnyLabeling" width="200" src="assets/logo.png"></a>
  </p>
  <a href="README.md">English</a> | <a href="README_zh-CN.md">简体中文</a>
</div>


# LabelPaw - 智能图像标注系统 (v2.0.0)
## 前言
用 AI 打败 AI，AI 全自动开发，效率翻 10 倍！由于项目需要标注数据集，之前用过 labelme、labelimg 等工具，于是决定结合 SAM2、SAM3、YOLO 姿态估计等优秀的视觉模型，开发一个更智能、更高效的标注工具。经过多次迭代，系统迎来了全新的 **2.0.0 版本**！

源码地址：[https://github.com/luohuabuxiema/LabelPaw](https://github.com/luohuabuxiema/LabelPaw)

## 🆕 更新日志

- 2026-05-15：新增人脸、手部、行人等关键点模板骨架，可自定义关键点模板与连线。
- 2026-05-14：新增对 SAM2 的支持，并集成了 Ultralytics YOLO 用于姿态估计与关键点智能预标注。
- 2026-05-13：完善了 JSON/XML/YOLO 格式互转、支持 JSON 转 U-Net 掩膜（Mask）、数据集一键随机划分。
- 2026-05-10：系统新增对亮色（Light）和暗黑（Dark）主题模式的支持，提供更舒适的视觉体验。
- 2026-04-12：基于 PySide6 构建的基础智能标注界面（首次发布）。
- 2026-04-10：集成最新一代 SAM3，支持鼠标悬停预览、单点极速提取轮廓、输入文本提示词全图目标自动分割。
- 2026-04-9：支持矩形 (Rect)、多边形 (Poly)、点 (Point) 标注，以及独创的 OBB 旋转框控制手柄（支持 360° 无极顺滑旋转与贴墙滑动检测）。
- 2026-04-8：支持原生保存 JSON、YOLO (.txt)、XML (Pascal VOC)。


## 系统简介

系统基于 PySide6 构建，集成了 **SAM2**、**SAM3** 以及 **Ultralytics YOLO** 视觉模型，极大地提升了标注效率：
- **智能点选与提示词分割**：开启 SAM 智能标注后，支持在多边形、矩形、OBB 等模式下进行目标快速提取。
- **骨架与关键点标注**：全新的关键点模块，支持自定义人体、手部、面部等关键点模板，利用 YOLO 模型实现关键点的智能检测与自动连线。

| 功能 | 界面演示 |
| --- | --- |
| 多边形标注 | ![在这里插入图片描述](assets/img_1.png) |
| OBB智能标注 | ![在这里插入图片描述](assets/img_2.png) |
| 矩形智能标注 | ![在这里插入图片描述](assets/img_3.png) |
| 关键点标注 | ![在这里插入图片描述](assets/img_10.png) |
| 关键点智能标注 | ![在这里插入图片描述](assets/img_14.png) |
| 内置关键点模板 | ![在这里插入图片描述](assets/img_11.png) |
| 人脸关键点模板 | ![在这里插入图片描述](assets/img_13.png) |
| 手部关键点模板 | ![在这里插入图片描述](assets/img_16.png) |
| 自定义关键点模板 | ![在这里插入图片描述](assets/img_12.png) |
| 暗黑样式 | ![在这里插入图片描述](assets/img_15.png) |
| 数据集处理工具 | ![在这里插入图片描述](assets/img_6.png) |

## ✨ 核心功能特性

- **🚀 AI 智能辅助 (SAM2/SAM3 驱动)**：鼠标悬停预览、单点快速提取轮廓、输入文本提示词全图目标自动分割。
- **🦴 关键点与骨架模板标注 (YOLO 驱动)**：支持关键点拖拽、连线，自动生成姿态数据，可自定义骨架模板。
- **📐 全能标注模式**：矩形 (Rect)、多边形 (Poly)、点 (Point)、OBB 旋转框以及关键点 (Pose)。
- **🔄 极致 OBB 交互**：旋转框控制手柄，360° 无极顺滑旋转与贴墙滑动检测。
- **💾 多格式互转与导出**：原生保存 JSON、YOLO (.txt)、XML (Pascal VOC)，可一键生成 U-Net Mask。
- **🗄️ 数据集处理工作流**：支持按比例切分训练集/验证集/测试集。

---

## 🛠️ 部署与运行环境

### 1. 基础环境依赖

推荐使用 **Python 3.10+**。首先安装 PyTorch 及其核心依赖：

**PyTorch 安装指南（Windows/N卡）**
1. 查看 CUDA 版本：`cmd` 中运行 `nvidia-smi`，确认右上角 `CUDA Version`。
2. 推荐使用阿里云镜像安装（例如 CUDA 11.8）：
   ```bash
   pip install torch==2.5.0 torchvision==0.20.0 torchaudio==2.5.0 -f https://mirrors.aliyun.com/pytorch-wheels/cu118
   ```
3. 验证安装：在 Python 中运行 `import torch; print(torch.cuda.is_available())`，输出 `True` 即为成功。

接着，安装其他基础环境：
```bash
pip install -r requirements.txt
```

### 2. 源码依赖下载与安装

为了确保 SAM2、SAM3、Ultralytics（YOLO） 能够正常工作，你需要去官方仓库下载源码并放置在 `LabelPaw` 根目录下。因为官方库在不断更新，采用源码方式能最大程度保证兼容性。

**官方源码地址**：
- **SAM2**: [https://github.com/facebookresearch/sam2](https://github.com/facebookresearch/sam2)
- **SAM3**: [https://github.com/facebookresearch/sam3](https://github.com/facebookresearch/sam3)
- **Ultralytics (YOLO)**: [https://github.com/ultralytics/ultralytics](https://github.com/ultralytics/ultralytics)

**操作步骤**：
1. 访问上述 GitHub 地址，点击绿色的 **Code** 按钮，选择 **Download ZIP**。
2. 解压下载的压缩包。
3. **重要**：压缩包内往往包含文档、测试用例等很多文件。你只需要把解压后里面的**核心代码文件夹**（即对应名称的 `sam2`、`sam3`、`ultralytics` 文件夹，里面直接包含 `__init__.py` 等 Python 源码的那个目录）提取出来。
4. 将这三个文件夹（`sam2`, `sam3`, `ultralytics`）直接粘贴到 `LabelPaw` 的根目录下。

**通过命令行直接安装（可选，推荐进阶用户）**：
如果你不想手动下载和复制文件夹，可以直接使用 pip 从 GitHub 源码或 PyPI 进行安装：
```bash
# 安装 SAM2
pip install git+https://github.com/facebookresearch/sam2.git

# 安装 SAM3
pip install git+https://github.com/facebookresearch/sam3.git

# 安装 Ultralytics
pip install ultralytics
```

> ⚠️ **`git+` 安装方式注意事项**：
> 1. **需安装 Git**：你的电脑必须提前安装并配置好 [Git](https://git-scm.com/) 环境，否则命令会直接报错。
> 2. **国内网络问题**：由于 GitHub 在国内部分地区访问不稳定，使用 `git+https://...` 时容易遇到 `Time out` 或连接失败。国内用户建议：
>    - 开启科学上网环境，并在命令行中临时设置 Git 代理。
>    - 或者优先推荐使用上方的**官方源码下载解压**方式，这种方式最稳妥。

### 3. 模型下载与配置修改

为了启用智能标注，你需要下载相应的权重文件 (`.pt`)。

**模型下载与存放说明**：

为了启用智能标注，你需要下载相应的权重文件 (`.pt`) 并按照规范的目录结构组织。

**1. 推荐的模型存放目录结构**
建议按照以下结构在本地整理您的模型文件：
```text
 weights/
      ├── sam_weights/          <-- 存放所有 SAM 系列模型 (必须叫这个名字)
      │    ├── sam3.pt
      │    ├── sam2.1_hiera_tiny.pt
      │    └── ...
      ├── yolo26_weights/       <-- 存放 YOLO26 系列模型
      │    ├── yolo26n-pose.pt
      │    └── ...
      ├── yolov8_weights/       <-- 您也可以自己新建其他 YOLO 版本的文件夹
      │    ├── yolov8n.pt
      │    └── ...
      └── ...
```

**2. SAM 系列模型下载与存放**
- **SAM 3 模型 (3.5 GB)**：前往官方 GitHub 仓库或 HuggingFace 搜索 `sam3` 获取。存放在 `\weights\sam_weights\sam3.pt`。
- **SAM 2.1 模型 (推荐)**：
  - SAM 2.1 Tiny (推荐，速度快): [https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_tiny.pt](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_tiny.pt)
  - SAM 2.1 Small: [https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_small.pt](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_small.pt)
  - SAM 2.1 Base: [https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_base_plus.pt](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_base_plus.pt)
  - SAM 2.1 Large: [https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_large.pt](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_large.pt)
  - 存放位置：`\weights\sam_weights\` 目录下 (文件名请保持默认)。

**3. YOLO 系列模型下载与存放**
- **YOLO 模型**：可前往 YOLO 官方 GitHub 或对应框架页面下载最新权重（如 yolov8、yolo11、yolo26 等）。姿态估计推荐下载带 `-pose` 后缀的模型（如 `yolo26n-pose.pt`）。
- **存放位置**：存放在对应的文件夹内，如 `\weights\yolo26_weights\`。*(注：您也可以将自己训练好的 YOLO 模型放入对应文件夹中，软件可自动读取！)*

**代码路径修改说明**：
为了让系统找到你下载的模型，你**只需**修改代码中的一个基础路径变量：
打开 `main.py`、`core/sam_client.py` 以及 `ui/model_selector_dialog.py`，找到里面的 `MODEL_BASE_DIR`（或 `model_base_dir`）变量，将其统一修改为您本地 `weights` 文件夹的绝对路径：
```python
MODEL_BASE_DIR = r"你的绝对路径\weights"
```
*(注：系统会自动扫描该目录下所有形如 `yolo*_weights` 的子文件夹并加载 YOLO 模型，因此你只需放好模型，无需再手动指定 YOLO 的子目录！)*

**【特别说明：无显卡(GPU)用户的建议】**
如果您的电脑没有独立显卡（GPU）或者配置较低，强烈建议您优先使用 YOLO 系列模型（如带有 "n" 或 "s" 的轻量级模型）。SAM 系列模型即使是 tiny 版本也相对较重，在纯 CPU 环境下运行可能会非常卡顿或导致软件未响应，而 YOLO 轻量级模型在 CPU 上也能保持不错的处理速度。

### 4. 启动系统

完成所有配置后，在根目录下运行：
```bash
python main.py
```

---

## 📖 用户操作指南

### 基本工作流

1. **打开目录**：点击“打开目录”选择图片文件夹。
2. **选择格式**：在左侧下拉菜单选择保存格式（JSON / YOLO / XML）。
3. **开始标注**：选择左侧工具栏，或者使用快捷键。
4. **智能标注**：开启左下角 **SAM 智能辅助**（快捷键 Q）。支持悬停预览点选，或者输入提示词回车。
5. **关键点/骨架标注**：切换到关键点模式，在右侧面板选择骨架模板（如人脸、手部），可通过 YOLO 智能预推理，也可以手动添加点并连线。
6. **数据集处理**：点击工具栏的“数据集转换”，可执行格式互转、U-Net Mask 生成、以及训练/验证集比例划分。
7. **保存**：快捷键 `Ctrl + S`，或切换图片时自动保存。

### ⌨️ 快捷键大全

- **A / 左方向键**：上一张图片
- **D / 右方向键**：下一张图片
- **Ctrl + S**：手动保存当前标注
- **Q**：开启/关闭 SAM 智能辅助
- **R**：矩形标注 (Rect)
- **P**：多边形标注 (Poly)
- **O**：旋转框标注 (OBB)
- **T**：关键点标注 (Pose/Point)
- **M**：触发模型智能预标注 (需开启智能辅助并加载对应模型)
- **E**：修改当前选中的标签类别
- **Del / Backspace**：删除选中的标注框/点
- **Ctrl + Z**：撤销 (支持 20 步)
- **Ctrl + Y (或 Ctrl + Shift + Z)**：重做
- **Z / X / C / V**：OBB 旋转框快捷微调角度

---

## 🤝 欢迎二次开发 

系统采用模块化设计，高内聚低耦合，前端 UI 与底层模型推理分离。
- `main.py`：主控界面与事件路由。
- `core/`：核心绘图 (`canvas.py`)、数据导出 (`exporter.py`)、SAM 推理 (`sam_client.py`)、YOLO 推理 (`yolo_predictor.py`)。
- `ui/`：图形化组件与主题定制。

欢迎广大开发者 Fork 并提交 PR！

## 声明

本项目已采用 GPL-3.0 协议，如果您在商业或非商业项目中使用了本代码，请遵守该协议开源您的衍生修改版本。感谢大家的支持，有帮助的话可以给仓库点个 Star！

### 引用

如果您在研究中使用该软件，请引用如下：

```bibtex
@misc{LabelPaw,
  year = {2025},
  author = {luohuabuxiema},
  publisher = {Github},
  journal = {Github repository},
  title = {LabelPaw: Intelligent image annotation system},
  howpublished = {\url{https://github.com/luohuabuxiema/LabelPaw}}
}
```

**致谢与参考模型引用**：
```bibtex
@misc{carion2025sam3segmentconcepts,
      title={SAM 3: Segment Anything with Concepts},
      author={Nicolas Carion et al.},
      year={2025},
      eprint={2511.16719},
      archivePrefix={arXiv},
      primaryClass={cs.CV},
      url={https://arxiv.org/abs/2511.16719},
}

@article{ravi2024sam2,
  title={SAM 2: Segment Anything in Images and Videos},
  author={Ravi, Nikhila and Gabeur, Valentin and Hu, Yuan-Ting and Hu, Ronghang and Ryali, Chaitanya and Ma, Tengyu and Khedr, Haitham and R{\"a}dle, Roman and Rolland, Chloe and Gustafson, Laura and others},
  journal={arXiv preprint arXiv:2408.00714},
  year={2024}
}

@software{yolo_ultralytics,
  author = {Glenn Jocher and Ayush Chaurasia and Jing Qiu},
  title = {Ultralytics YOLO},
  year = {2023},
  url = {https://github.com/ultralytics/ultralytics},
  license = {AGPL-3.0}
}
```
