# 🔧 Setup Python Virtual Environment (Multi-version Support)

Dokumen ini menjelaskan cara memilih versi Python tertentu dan membuat virtual environment (venv) yang sesuai, lengkap dengan perintah penting lainnya. Cocok untuk setup awal project Python di berbagai sistem (Windows, Linux, MacOS).

---

## 📌 Daftar Isi
- [🎯 Tujuan](#-tujuan)
- [🧪 Cek Versi Python](#-cek-versi-python)
- [🛠️ Membuat Virtual Environment](#️-membuat-virtual-environment)
- [▶️ Mengaktifkan Virtual Environment](#️-mengaktifkan-virtual-environment)
- [📦 Manajemen Dependensi](#-manajemen-dependensi)
- [✅ Cek Versi Python Aktif](#-cek-versi-python-aktif)
- [🧹 Menghapus Virtual Environment](#-menghapus-virtual-environment)
- [📎 Contoh Lengkap](#-contoh-lengkap)
- [📁 Struktur Folder](#-struktur-folder)

---

## 🎯 Tujuan

- Menjalankan project Python dengan versi tertentu (misalnya Python 3.10)
- Mengisolasi dependensi agar tidak bentrok dengan project lain
- Mudah di-replikasi oleh developer lain

---

## 🧪 Cek Versi Python

### Windows:
```bash
py -0
```
Siap! Berikut adalah versi **lengkap dan praktis** dari `README.md` setup virtual environment Python, **dengan tambahan perintah penting** seperti upgrade `pip`, install requirements, generate `requirements.txt`, dan hapus venv jika perlu:

---

### Linux/Mac:

```bash
python3 --version
# atau cek versi lain:
python3.10 --version
```

---

## 🛠️ Membuat Virtual Environment

### 🔹 Windows (pakai Python launcher `py`):

```bash
py -3.10 -m venv venv
```

### 🔸 Linux/Mac:

```bash
python3.10 -m venv venv
```

> `venv` adalah nama folder environment, bisa diganti sesuai keinginan.

---

## ▶️ Mengaktifkan Virtual Environment

### ✅ Windows (CMD/PowerShell):

```bash
venv\Scripts\activate
```

### ✅ Git Bash (Windows):

```bash
source venv/Scripts/activate
```

### ✅ Linux/Mac:

```bash
source venv/bin/activate
```

---

## 📦 Manajemen Dependensi

### 🔄 Upgrade pip (opsional tapi disarankan):

```bash
python -m pip install --upgrade pip
```

### 📥 Install dependencies dari `requirements.txt`:

```bash
pip install -r requirements.txt
```

### 📤 Generate `requirements.txt` dari environment aktif:

```bash
pip freeze > requirements.txt
```

### 🧪 Cek package yang sudah terinstall:

```bash
pip list
```

---

## ✅ Cek Versi Python Aktif

Setelah venv aktif:

```bash
python --version
```

---

## 🧹 Menghapus Virtual Environment

Cukup hapus folder `venv`:

```bash
rm -rf venv       # Linux / Mac
rd /s /q venv     # Windows CMD
```

---

## 📎 Contoh Lengkap (Windows)

```bash
py -3.10 -m venv venv
venv\Scripts\activate
python -m pip install --upgrade pip
pip install -r requirements.txt
python --version
```

---

## 📁 Struktur Folder

```
project/
├── venv/               # Virtual environment
├── main.py             # File utama Python
├── requirements.txt    # Daftar dependensi
└── README.md           # Dokumentasi ini
```

---

## 🚀 Siap digunakan!

Setelah venv aktif, install semua dependensi lalu jalankan project-mu:

```bash
pip install -r requirements.txt
python main.py
```

> Jangan lupa untuk menjalankan `deactivate` setelah selesai.

---

