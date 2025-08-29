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
   Copyright 2025 Diwas Neupane

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
```

---
