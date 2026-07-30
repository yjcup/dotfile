# Dotfiles

用于同步本机常用的终端配置、命令别名和快捷键，让新机器可以快速恢复熟悉的命令行环境。

配置使用 [GNU Stow](https://www.gnu.org/software/stow/) 管理。敏感信息不进入仓库，统一保存在本机的 `~/.config/secrets/global.env`。

## 配置内容

| 目录 | 用途 |
| --- | --- |
| `zsh/` | Shell 别名、函数、补全、历史记录及工具初始化 |
| `tmux/` | 终端会话、窗口和面板管理 |
| `nvim/` | Neovim 编辑器配置 |
| `yazi/` | 终端文件管理器、快捷键及书签插件 |

## 安装

安装 GNU Stow 后，在仓库根目录按需链接配置：

```sh
stow zsh tmux nvim yazi
```

只同步单个工具时，例如：

```sh
stow yazi
```

## Zsh 快捷命令

### 编辑器与开发工具

| 命令 | 实际行为 | 说明 |
| --- | --- | --- |
| `v` | `nvim` | 打开 Neovim |
| `vim` | `nvim` | 使用 Neovim 替代 Vim |
| `nv` | `nvim` | 打开 Neovim |
| `cc` | `claude` | 启动 Claude Code |
| `oc` | `opencode` | 启动 OpenCode |
| `python` | `python3.11` | 使用 Python 3.11 |
| `make` | `make -j` | 并行执行 Make 任务 |

### 文件与目录

| 命令 | 实际行为 | 说明 |
| --- | --- | --- |
| `ls` | `eza` | 使用现代化文件列表 |
| `ll` | `eza -lh --git` | 显示详细信息、文件大小和 Git 状态 |
| `rm` | `trash` | 移到废纸篓，避免直接永久删除 |
| `y` | Yazi 函数 | 退出 Yazi 后进入最后浏览的目录 |
| `jo` | `joshuto` | 启动 Joshuto 文件管理器 |

### 网络代理

| 命令 | 说明 |
| --- | --- |
| `proxyon` | 设置终端 HTTP/HTTPS 代理为 `127.0.0.1:7897` |
| `proxyoff` | 清除终端 HTTP/HTTPS 代理 |

## 本机常用命令

根据本机 Shell 使用习惯整理。这里只记录工具用途，不保存 SSH 地址、远程主机、令牌或其他敏感参数。

### 搜索与文件管理

| 命令 | 用途 |
| --- | --- |
| `fzf` | 模糊搜索和交互式选择 |
| `fd` | 快速查找文件，也是 fzf 的默认文件来源 |
| `eza` | 带 Git 信息和更友好输出的 `ls` 替代品 |
| `yazi` / `ya` | 终端文件管理与插件管理 |
| `trash` | 将文件移至废纸篓 |

`fzf` 默认搜索隐藏文件，并忽略 `.git`、`node_modules`、`dist`、`build`、`.venv`、`target`、`vendor` 等大型目录。

### 开发与版本管理

| 命令 | 用途 |
| --- | --- |
| `git` | 版本管理 |
| `lazygit` | Git 终端交互界面 |
| `gh` | GitHub CLI |
| `uv` | Python 项目、依赖和虚拟环境管理 |
| `npm` | Node.js 包管理 |
| `docker` | 容器管理 |
| `curl` | HTTP 请求和接口调试 |
| `tmux` | 持久化终端会话 |

### 远程与系统工具

| 命令 | 用途 |
| --- | --- |
| `ssh` | 连接远程主机 |
| `ssh-copy-id` | 安装 SSH 公钥 |
| `ping` | 检查网络连通性 |
| `orb` | 管理 OrbStack 环境 |

## Shell 能力

Zsh 使用 Zinit 管理以下插件：

- `zsh-completions`
- `fzf-tab`
- `zsh-autosuggestions`
- `fast-syntax-highlighting`

同时启用了跨终端共享历史、忽略重复命令、大小写不敏感补全，以及基于 fzf 的交互式选择。
