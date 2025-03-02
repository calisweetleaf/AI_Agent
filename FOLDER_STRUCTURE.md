AI_Agent/
├── src/
│   ├── core/
│   │   ├── __init__.py
│   │   ├── security/
│   │   │   ├── __init__.py
│   │   │   ├── memory_protection.py      # From core_sys_security.py
│   │   │   ├── secure_channel.py         # Communication components
│   │   │   └── metrics.py                # Security metrics tracking
│   │   ├── model/
│   │   │   ├── __init__.py
│   │   │   ├── loader.py                 # Model loading logic
│   │   │   └── inference.py              # Model inference handling
│   │   └── utils/
│   │       ├── __init__.py
│   │       ├── file_handler.py           # From read_file.py
│   │       └── calculator.py             # From calculate.py
│   ├── tools/
│   │   ├── __init__.py
│   │   ├── powershell/
│   │   │   ├── new_folder.ps1
│   │   │   ├── launch_app.ps1
│   │   │   └── sys_info.ps1
│   │   └── autohotkey/
│   │       └── notepad_type.ahk
│   ├── orchestrator.py
│   └── download_model.py
├── config/
│   ├── default.yaml
│   ├── dev.yaml
│   ├── prod.yaml
│   └── logging.yaml
├── security/
│   ├── certs/
│   │   └── generate_certs.py
│   ├── policies/
│   │   ├── apparmor.profile
│   │   └── seccomp.json
│   └── monitoring/
│       └── health_check.py
├── tests/
│   ├── __init__.py
│   ├── unit/
│   │   ├── test_security.py
│   │   ├── test_model.py
│   │   └── test_tools.py
│   └── integration/
│       └── test_orchestrator.py
├── models/
│   ├── base/
│   │   └── modelfile.txt
│   └── .gitkeep
├── logs/
│   └── .gitkeep
├── data/
│   └── .gitkeep
├── docs/
│   ├── setup_guide.md
│   ├── API.md
│   └── security.md
├── scripts/
│   ├── install_hermes3.ps1
│   └── download_file.py
├── .vscode/
│   ├── launch.json
│   ├── settings.json
│   └── keybindings.json
├── .gitignore
├── container.dockerfile
├── requirements.txt
└── README.md