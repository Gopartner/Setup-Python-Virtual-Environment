#!/bin/bash
# ===========================================
# 🔧 Python Version Switcher + VENV Tutor
# by yudibilly & ChatGPT
# ===========================================

set -e

# Fungsi: tampilkan versi aktif saat ini
show_current_version() {
    current_path=$(readlink -f "$(command -v python)" 2>/dev/null || echo "Not set")
    current_ver=$(python --version 2>&1 || echo "Unknown")
    echo "==========================================="
    echo " Select which Python version to set default:"
    echo "-------------------------------------------"
    echo " Current version : $current_ver"
    echo " Path            : $current_path"
    echo "==========================================="
}

# Fungsi: cari interpreter python yang valid
list_python_versions() {
    find /usr/bin /usr/local/bin -maxdepth 1 -type f -executable \
        -name "python*" 2>/dev/null \
        | grep -E '/python([0-9]+(\.[0-9]+)?)?$' \
        | sort -V
}

# Fungsi: ubah versi default python
set_python_version() {
    local version_path=$1
    if [[ -x "$version_path" ]]; then
        sudo update-alternatives --install /usr/bin/python python "$version_path" 1 >/dev/null 2>&1
        sudo update-alternatives --set python "$version_path"
        echo
        echo "✅ Python default telah diubah ke:"
        python --version
        echo "📂 Path: $(readlink -f "$(which python)")"
        echo
    else
        echo "❌ File tidak bisa dieksekusi atau tidak ditemukan: $version_path"
        exit 1
    fi
}

# Fungsi: tampilkan tutorial virtual environment
show_venv_tutorial() {
    echo "🧠 Tutorial: Membuat Virtual Environment untuk Python aktif saat ini"
    echo "--------------------------------------------------------------------"
    echo "Langkah-langkah:"
    echo "1️⃣ Buat folder project kamu, misalnya:"
    echo "   mkdir ~/myproject && cd ~/myproject"
    echo
    echo "2️⃣ Buat virtual environment baru:"
    echo "   python -m venv venv"
    echo
    echo "3️⃣ Aktifkan environment:"
    echo "   source venv/bin/activate"
    echo
    echo "4️⃣ Cek versi Python di dalam venv:"
    echo "   python --version"
    echo
    echo "5️⃣ Untuk keluar dari venv:"
    echo "   deactivate"
    echo
    echo "💡 Tips: Kamu bisa buat banyak venv dengan versi Python berbeda!"
    echo "--------------------------------------------------------------------"
}

# --- Main Program ---
show_current_version

mapfile -t available_versions < <(list_python_versions)
if [[ ${#available_versions[@]} -eq 0 ]]; then
    echo "❌ Tidak ditemukan versi Python di sistem!"
    exit 1
fi

current_path=$(readlink -f "$(command -v python)" 2>/dev/null || echo "")

echo "Daftar versi Python terdeteksi:"
index=1
for ver in "${available_versions[@]}"; do
    base=$(basename "$ver")
    if [[ "$ver" == "$current_path" ]]; then
        echo "$index) $base -> $ver   [✅ CURRENT]"
    else
        echo "$index) $base -> $ver"
    fi
    ((index++))
done
echo "0) Exit"
echo "-------------------------------------------"

read -p "Pilih versi [0-${#available_versions[@]}]: " choice
echo

if [[ "$choice" == "0" ]]; then
    echo "🚪 Keluar tanpa mengubah apa pun."
    exit 0
elif [[ "$choice" =~ ^[0-9]+$ && "$choice" -ge 1 && "$choice" -le "${#available_versions[@]}" ]]; then
    selected_path="${available_versions[$((choice-1))]}"
    echo "🔄 Mengatur default Python ke: $selected_path"
    set_python_version "$selected_path"
    show_venv_tutorial
else
    echo "❌ Pilihan tidak valid!"
    exit 1
fi
