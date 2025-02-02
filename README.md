---

# 🗑️ **File Type Deleter (FTD)**

## 📌 **Overview**
**File Type Deleter** is a powerful yet simple script designed to delete files of specific extensions from a selected folder. It offers:
- **Command-line** and **GUI-based** versions for Linux/macOS.
- **Windows Batch and PowerShell** versions for native Windows compatibility.

---

## ✨ **Features**
✅ **Command-line Mode** – Works in Terminal (Linux/macOS) and CMD/PowerShell (Windows).  
✅ **GUI Mode** – Uses `dialog` for Linux/macOS (planned for Windows GUI in the future).  
✅ **Batch Deletion** – Delete multiple file extensions at once.  
✅ **Confirmation & Safety** – Requests user confirmation before deletion.  
✅ **Cross-Platform Support** – Works on **Linux, macOS, and Windows**.  

---

## ⚙️ **Installation & Requirements**

### 🔹 **Linux (Ubuntu/Debian/Arch)**
- **No extra dependencies required.**  
- Just run the script in a **Bash shell**.

### 🍏 **macOS**
- **For CLI Version**: Works out of the box.  
- **For GUI Version**: Requires `Homebrew` and `dialog`. If not installed, the script will guide you through installation.

### 🏁 **Windows**
- **For Batch (`.bat`) Version**: Works in **Command Prompt (CMD)**.  
- **For PowerShell (`.ps1`) Version**: Works in **PowerShell** (requires minor setup).  

---

## 🚀 **Usage**

### **🔹 Linux/macOS**
#### 📌 1. **Command-Line Version**
Run the following command in **Terminal**:
```bash
bash FTD_suless.sh
```

#### 📌 2. **GUI Version (with `dialog`)**
Run:
```bash
bash FTD_su.sh
```

---

### **🏁 Windows**
#### 📌 1. **Batch (`.bat`) Version (CMD)**
1. **Double-click** `FTD_Windows.bat`
2. Follow the on-screen prompts.
3. Files are deleted after confirmation.

OR run manually via CMD:
```cmd
FTD_Windows.bat
```

#### 📌 2. **PowerShell (`.ps1`) Version**
1. **Right-click** `FTD_Windows.ps1` → Click **Run with PowerShell**.
2. If execution is restricted, enable it temporarily with:
   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope Process
   ```
3. Follow the on-screen prompts.

---

## 📝 **Script Breakdown**
### 🔹 **Linux/macOS CLI Version (`FTD_suless.sh`)**
📍 Prompts user for a folder path.  
📍 Accepts file extensions (case-sensitive, comma-separated).  
📍 Confirms before deletion.  
📍 Deletes matching files securely.  
📍 Allows repeat actions until the user exits.  

### 🔹 **Linux/macOS GUI Version (`FTD_su.sh`)**
📍 Uses `dialog` for interactive folder selection and input.  
📍 Ensures `Homebrew` and `dialog` are installed on macOS.  
📍 Provides graphical confirmation before file deletion.  
📍 Supports easy repeat actions.  

### 🔹 **Windows Batch (`FTD_Windows.bat`)**
📍 Works in **Command Prompt (CMD)**.  
📍 Allows easy deletion of files with specific extensions.  
📍 Supports batch deletion and confirmation.  

### 🔹 **Windows PowerShell (`FTD_Windows.ps1`)**
📍 Works in **PowerShell** (faster & more powerful than `.bat`).  
📍 Supports **recursive deletion** and better error handling.  
📍 Allows repeat actions.  

---

## 🛠️ **Dependencies**
| **OS**   | **Dependencies**            |
|----------|-----------------------------|
| **Linux**  | Bash (pre-installed)        |
| **macOS**  | Homebrew (for GUI) & `dialog`  |
| **Windows** | None for `.bat` (CMD), PowerShell (pre-installed) |

---

## 🤝 **Contributing**
💡 Contributions are welcome! Fork the repo, improve it, and submit a pull request.  

---

## 📜 **License**
🔖 This project is licensed under the **MIT License**.

---

## ⚠️ **Disclaimer**
❗ **Use this script with caution!** Deleted files **cannot be recovered**. Ensure you select the correct folder and file extensions before proceeding.  

---
