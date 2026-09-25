#!/usr/bin/env bash
# Idempotent bootstrap for the Seattle cycling analysis environment.
# Creates a virtualenv and installs the pinned data-science + Jupyter stack.
set -euo pipefail

cd "$(dirname "$0")/.."

if [ ! -x ".venv/bin/python" ]; then
  python3 -m venv .venv
fi

.venv/bin/python -m pip install --upgrade pip
.venv/bin/python -m pip install -r requirements.txt

.venv/bin/python -m ipykernel install --user --name seattlebike --display-name "Python (SeattleBike)"

echo "Install complete. Python: $(.venv/bin/python --version)"
