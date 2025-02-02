# 🗑️ File Type Deleter

## 📌 Overview

**File Type Deleter** is a powerful yet simple shell script designed to delete files of specific extensions from a selected folder. It offers both a command-line version and a GUI-based version using `dialog` for a better user experience.

## ✨ Features

✅ **Command-line Mode** – Easy-to-use terminal-based execution with prompts.
✅ **GUI Mode** – Interactive UI with `dialog` for a seamless experience.
✅ **Batch Deletion** – Delete multiple file extensions at once.
✅ **Confirmation & Safety** – Requests user confirmation before deletion.
✅ **Cross-Platform Support** – Works on Linux (Ubuntu, Debian, Arch) & macOS (requires Homebrew).

---

## ⚙️ Installation

### 🔹 Linux (Debian/Ubuntu & Arch)
No special installation required. Ensure `bash` is installed and run the script directly.

### 🍏 macOS
The GUI version requires Homebrew to install `dialog`. If you don’t have Homebrew, the script will prompt for installation.

---

## 🚀 Usage

### 📌 1. Command-Line Version
Run the following command in the terminal:

```bash
bash FTD_suless.sh
```

### 📌 2. GUI Version (with `dialog`)
Run the following command in the terminal:

```bash
bash FTD_su.sh
```

---

## 📝 Script Breakdown

### 🔹 CLI Version (`FTD_suless.sh`)
📍 Prompts user for a folder path.  
📍 Accepts file extensions (case-sensitive, comma-separated).  
📍 Confirms before deletion.  
📍 Deletes matching files securely.  
📍 Allows repeat actions until user exits.  

### 🔹 GUI Version (`FTD_su.sh`)
📍 Uses `dialog` for interactive folder selection and input.  
📍 Ensures `Homebrew` and `dialog` are installed on macOS.  
📍 Provides graphical confirmation before file deletion.  
📍 Supports easy repeat actions.  

---

## 🛠️ Dependencies

- **Linux** – No extra dependencies (just Bash)  
- **macOS** – Requires Homebrew and `dialog`  

---

## 🤝 Contributing

💡 Contributions are welcome! Feel free to fork, modify, and submit a pull request.  

---

## 📜 License

🔖 This project is licensed under the **MIT License**.

---

## ⚠️ Disclaimer

❗ **Use this script with caution!** Deleted files **cannot be recovered**. Ensure you select the correct folder and file extensions before proceeding.  

