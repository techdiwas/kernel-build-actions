# 🤖 Kernel Build Actions

---

This repository targets 🎯 to compile OEM (e.g. Xiaomi, Samsung, Motorola, etc. ) android kernel source package 📦 using GitHub Actions.

---

---

## 📁 Repository Structure

```
.github/
├── workflows/
│   └── build-kernel.yml          # Main workflow orchestration
├── actions/                      # Reusable action components
│   ├── prep-env/                 # Build environment setup
│   ├── config-toolchain/         # Toolchain download and caching
│   ├── fetch-kernel/             # Kernel source fetching
│   ├── build-kernel/             # Kernel compilation
│   └── upload-artifact/          # Upload built artifacts
└── scripts/
    └── build_kernel.sh           # Core build script with error handling
```

---

---

## 😲 How to use:

- Fork 🎣 this repository.
- Navigate 🧭 to **Actions** tab.
- Select a workflow seen 🙉 there.
- Fill all asked details 🐻‍❄️.
- Run that workflow and see the magic 🪄.

---

---

## 📃 License

```md
    kernel-build-actions: GitHub Actions to build an Android kernel.
    Copyright (C) 2025  Diwas Neupane (techdiwas)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

---
