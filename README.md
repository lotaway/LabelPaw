
<div align="center">
  <p>
    <a href="https://github.com/luohuabuxiema/LabelPaw" target="_blank">
      <img alt="X-AnyLabeling" width="200" src="assets/logo.png"></a>
  </p>
  <a href="README.md">English</a> | <a href="README_zh-CN.md">简体中文</a>
</div>

# LabelPaw - Intelligent Image Annotation System (v2.0.0)

## Introduction
Defeat AI with AI! Fully automated AI development increases efficiency by 10 times! Due to project needs for labeling datasets, having previously used tools like labelme and labelimg, we decided to combine advanced models like SAM2, SAM3, and YOLO pose estimation to develop a smarter and more efficient annotation tool. After multiple iterations, the system has welcomed its brand new **v2.0.0**!

Source Code: [https://github.com/luohuabuxiema/LabelPaw](https://github.com/luohuabuxiema/LabelPaw)

## 🆕 Changelog

- 2026-05-15: Newly added keypoint templates for faces, hands, pedestrians, and other key areas, with customizable keypoint templates and connections.
- 2026-05-14: Added support for SAM2, and integrated Ultralytics YOLO for pose estimation and smart keypoint pre-annotation.
- 2026-05-13: Improved JSON/XML/YOLO format conversion, supported JSON to U-Net Mask generation, and random dataset splitting.
- 2026-05-10: Added support for Light and Dark theme modes, providing a more comfortable visual experience.
- 2026-04-12: Basic smart annotation interface built on PySide6 (Initial Release).
- 2026-04-10: Integrated the latest generation SAM3, supporting hover preview, single-point rapid contour extraction, and text prompt whole-image automatic object segmentation.
- 2026-04-9: Supported Rectangle (Rect), Polygon (Poly), and Point annotation, along with original OBB rotating box control handles (supporting 360° smooth rotation and wall-sliding collision detection).
- 2026-04-8: Supported native save formats: JSON, YOLO (.txt), XML (Pascal VOC).


## System Overview

The system is built on PySide6 and deeply integrates **SAM2**, **SAM3**, and **Ultralytics YOLO**, greatly improving annotation efficiency:
- **Smart Pointing and Prompt Segmentation**: After enabling SAM smart annotation, rapid object extraction is supported in Polygon, Rectangle, and OBB modes.
- **Skeleton and Keypoint Annotation**: A brand-new keypoint module supporting customizable topologies like human body, hands, and faces, utilizing YOLO models for smart keypoint detection and automatic connection.

| Feature | Interface Demonstration |
| --- | --- |
| Polygon Annotation | ![Image](assets/img_1.png) |
| OBB Smart Annotation | ![Image](assets/img_2.png) |
| Rectangle Smart Annotation | ![Image](assets/img_3.png) |
| Keypoint Annotation | ![Image](assets/img_10.png) |
| Keypoint Smart Annotation | ![Image](assets/img_14.png) |
| Built-in Keypoint Templates | ![Image](assets/img_11.png) |
| Face Keypoint Template | ![Image](assets/img_13.png) |
| Hand Keypoint Template | ![Image](assets/img_16.png) |
| Custom Keypoint Template | ![Image](assets/img_12.png) |
| Dark Theme | ![Image](assets/img_15.png) |
| Dataset Processing Tool | ![Image](assets/img_6.png) |

## ✨ Core Features

- **🚀 AI Smart Assistance (Powered by SAM2/SAM3)**: Hover preview, single-point rapid contour extraction, and text prompt whole-image object segmentation.
- **🦴 Keypoint and Skeleton Annotation (Powered by YOLO)**: Supports keypoint dragging and connection, auto-generating pose data, with customizable skeleton templates.
- **📐 Comprehensive Annotation Modes**: Rectangle (Rect), Polygon (Poly), Point, OBB (Oriented Bounding Box), and Keypoint (Pose).
- **🔄 Ultimate OBB Interaction**: Rotation box control handles supporting 360° smooth rotation and physical boundary sliding detection.
- **💾 Multi-Format Conversion and Export**: Natively save as JSON, YOLO (.txt), XML (Pascal VOC), and one-click U-Net Mask generation.
- **🗄️ Dataset Processing Workflow**: Supports proportional splitting of training/validation/testing sets.

---

## 🛠️ Deployment and Environment

### 1. Basic Environment Dependencies

**Python 3.10+** is recommended. First, install PyTorch and its core dependencies:

**PyTorch Installation Guide (Windows / NVIDIA GPU)**
1. Check CUDA Version: Run `nvidia-smi` in `cmd` to confirm `CUDA Version` in the top right.
2. It is recommended to install via Alibaba Cloud mirror (e.g., CUDA 11.8):
   ```bash
   pip install torch==2.5.0 torchvision==0.20.0 torchaudio==2.5.0 -f https://mirrors.aliyun.com/pytorch-wheels/cu118
   ```
3. Verify Installation: Run `import torch; print(torch.cuda.is_available())` in Python. If it outputs `True`, the installation is successful.

Next, install other basic dependencies:
```bash
pip install -r requirements.txt
```

### 2. Source Code Dependencies Download and Installation

To ensure SAM2, SAM3, and Ultralytics (YOLO) work properly, you need to download the source code from their official repositories and place them in the `LabelPaw` root directory. Because the official libraries are constantly updated, using the source code approach ensures maximum compatibility.

**Official Source Code URLs**:
- **SAM2**: [https://github.com/facebookresearch/sam2](https://github.com/facebookresearch/sam2)
- **SAM3**: [https://github.com/facebookresearch/sam3](https://github.com/facebookresearch/sam3)
- **Ultralytics (YOLO)**: [https://github.com/ultralytics/ultralytics](https://github.com/ultralytics/ultralytics)

**Operation Steps**:
1. Visit the GitHub addresses above, click the green **Code** button, and select **Download ZIP**.
2. Extract the downloaded archive.
3. **Important**: The extracted folder usually contains many files like documentation and test cases. You only need to extract the **core code folder** (i.e., the `sam2`, `sam3`, and `ultralytics` folders that directly contain `__init__.py` and other Python source files).
4. Paste these three folders (`sam2`, `sam3`, `ultralytics`) directly into the root directory of `LabelPaw`.

**Direct Installation via Command Line (Optional, recommended for advanced users)**:
If you do not want to manually download and copy folders, you can use pip to install directly from the GitHub source or PyPI:
```bash
# Install SAM2
pip install git+https://github.com/facebookresearch/sam2.git

# Install SAM3
pip install git+https://github.com/facebookresearch/sam3.git

# Install Ultralytics
pip install ultralytics
```

> ⚠️ **Notes for `git+` Installation Method**:
> 1. **Git is required**: You must have [Git](https://git-scm.com/) installed and configured on your computer beforehand, otherwise the command will fail directly.
> 2. **Network issues in China**: Due to unstable access to GitHub in some regions in China, using `git+https://...` may easily encounter `Time out` or connection failures. Suggestions for users in China:
>    - Use a proxy environment and temporarily set the Git proxy in the command line.
>    - Or, it is highly recommended to use the **official source code download and extraction** method above, which is the most reliable.

### 3. Model Download and Configuration Modification

To enable smart annotation, you need to download the corresponding weight files (`.pt`).

**Model Download and Storage Instructions**:

To enable smart annotation, you need to download the corresponding weight files (`.pt`) and organize them into the recommended directory structure.

**1. Recommended Model Directory Structure**
We suggest organizing your local model files as follows:
```text
 weights/
      ├── sam_weights/          <-- Directory for all SAM series models (Must use this exact name)
      │    ├── sam3.pt
      │    ├── sam2.1_hiera_tiny.pt
      │    └── ...
      ├── yolo26_weights/       <-- Directory for YOLO26 series models
      │    ├── yolo26n-pose.pt
      │    └── ...
      ├── yolov8_weights/       <-- You can create other directories for different YOLO versions
      │    ├── yolov8n.pt
      │    └── ...
      └── ...
```

**2. Downloading and Storing SAM Series Models**
- **SAM 3 Model (3.5 GB)**: Please visit the official GitHub repository or search for `sam3` on HuggingFace. Store it at `\weights\sam_weights\sam3.pt`.
- **SAM 2.1 Models (Recommended)**:
  - SAM 2.1 Tiny (Recommended, high speed): [Download Link](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_tiny.pt)
  - SAM 2.1 Small: [Download Link](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_small.pt)
  - SAM 2.1 Base: [Download Link](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_base_plus.pt)
  - SAM 2.1 Large: [Download Link](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_large.pt)
  - Storage Location: Under `\weights\sam_weights\` (Do not rename the files).

**3. Downloading and Storing YOLO Series Models**
- **YOLO Models**: You can download the latest weights (e.g., yolov8, yolo11, yolo26) from the official YOLO GitHub or corresponding framework pages. For pose estimation, we recommend downloading models with the `-pose` suffix (e.g., `yolo26n-pose.pt`).
- **Storage Location**: Store them in the corresponding folder, e.g., `\weights\yolo26_weights\`. *(Note: You can also place your own custom-trained YOLO models into the respective folders, and the software will load them automatically!)*

**Code Path Modification Instructions**:
To allow the system to locate your downloaded models, you **only** need to modify a single base path variable in the code:
Open `main.py`, `core/sam_client.py` and `ui/model_selector_dialog.py`, find the `MODEL_BASE_DIR` (or `model_base_dir`) variable, and change it to the absolute path of your local `weights` folder:
```python
MODEL_BASE_DIR = r"Your_Absolute_Path\weights"
```
*(Note: The system will automatically scan all subdirectories named like `yolo*_weights` under this path and load the YOLO models. Therefore, you only need to place your models in the correct folders without manually specifying the YOLO subdirectory!)*

**[Special Note: Recommendations for Users Without a Dedicated GPU]**
If your computer lacks a dedicated graphics card (GPU) or has lower specs, we highly recommend prioritizing the YOLO series models (such as lightweight models with an "n" or "s" suffix). Even the tiny versions of the SAM (Segment Anything) series are relatively heavy; running them in a pure CPU environment may cause significant lag or software unresponsiveness. Conversely, lightweight YOLO models can maintain decent processing speeds on CPUs!

### 4. Start the System

After completing all configurations, run in the root directory:
```bash
python main.py
```

---

## 📖 User Operation Guide

### Basic Workflow

1. **Open Directory**: Click "Open Directory" to select the image folder.
2. **Select Format**: Choose the save format (JSON / YOLO / XML) from the left dropdown menu.
3. **Start Annotation**: Select the tools on the left toolbar, or use shortcuts.
4. **Smart Annotation**: Enable the **SAM Smart Assist** (Shortcut Q) in the bottom left corner. Supports hover preview for pointing, or enter a prompt and press Enter.
5. **Keypoint/Skeleton Annotation**: Switch to keypoint mode, select the skeleton template (e.g., face, hand) in the right panel. You can use YOLO for smart pre-inference, or manually add points and connect them.
6. **Dataset Processing**: Click "Dataset Conversion" on the toolbar to perform format conversion, U-Net Mask generation, and training/validation set proportional splitting.
7. **Save**: Shortcut `Ctrl + S`, or automatically save when switching images.

### ⌨️ Shortcut Keys Reference

- **A / Left Arrow**: Previous Image
- **D / Right Arrow**: Next Image
- **Ctrl + S**: Manually save the current annotation
- **Q**: Toggle SAM Smart Assist
- **R**: Rectangle Annotation (Rect)
- **P**: Polygon Annotation (Poly)
- **O**: Rotated Box Annotation (OBB)
- **T**: Keypoint Annotation (Pose/Point)
- **M**: Trigger model smart pre-annotation (requires smart assist enabled and corresponding model loaded)
- **E**: Modify the label category of the currently selected box
- **Del / Backspace**: Delete selected annotation box/point
- **Ctrl + Z**: Undo (supports 20 steps)
- **Ctrl + Y (or Ctrl + Shift + Z)**: Redo
- **Z / X / C / V**: OBB rotation box quick angle fine-tuning

---

## 🤝 Welcome to Secondary Development

The system adopts a modular design with high cohesion and low coupling, separating the front-end UI and the underlying model inference.
- `main.py`: Main control interface and event routing.
- `core/`: Core drawing (`canvas.py`), data export (`exporter.py`), SAM inference (`sam_client.py`), YOLO inference (`yolo_predictor.py`).
- `ui/`: Graphical components and theme customization.

Developers are welcome to Fork and submit PRs!

## License

This project is licensed under the GPL-3.0 License. If you use this code in commercial or non-commercial projects, please comply with this license and open source your derivative modified versions. Thank you for your support. If it helps, please give the repository a Star!

### Citation

If you use this software in your research, please cite it as follows:

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

**Acknowledgements and Reference Model Citations**:
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