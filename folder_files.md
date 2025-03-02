E:\Projects\AI_Agent\
│
├── src\
│   ├── core\
│   │   ├── security\
│   │   │   ├── __init__.py
│   │   │   ├── memory_protection.py        (from core_sys_security.py)
│   │   │   └── metrics.py
│   │   ├── model\
│   │   │   ├── __init__.py
│   │   │   └── loader.py
│   │   └── utils\
│   │       ├── __init__.py
│   │       └── calculator.py               (from calculate.py)
│   ├── tools\
│   │   ├── powershell\
│   │   │   ├── launch_app.ps1             (existing)
│   │   │   └── new_folder.ps1             (existing)
│   │   └── autohotkey\
│   │       └── notepad_type.ahk           (existing)
│   ├── orchestrator.py                     (existing)
│   └── download_model.py                   (existing)
│
├── config\
│   ├── default.yaml                        (new)
│   ├── dev.yaml                            (new)
│   └── logging.yaml                        (new)
│
├── security\
│   ├── certs\
│   │   └── generate_certs.py              (new)
│   └── policies\
│       ├── apparmor.profile               (new)
│       └── seccomp.json                   (new)
│
├── tests\
│   ├── __init__.py
│   └── test_core_security.py              (existing)
│
├── models\
│   └── modelfile.txt                      (existing)
│
├── logs\
│   └── .gitkeep
│
├── docs\
│   └── setup_guide.md                     (existing)
│
├── scripts\
│   └── download_file.py                   (existing)
│
├── .vscode\
│   ├── launch.json                        (new)
│   └── settings.json                      (new)
│
├── .gitignore                             (existing)
├── container.dockerfile                    (existing)
└── requirements.txt                        (existing)