#!/bin/bash

# Fast(er) setup for Python projects.
# Be sure virtualenvwrapper is installed and set up.

# Prompt user for project name
read -p "📦 Enter your new project name: " PROJECT_NAME

# Base directory for all projects (customize this if you want)
PROJECTS_DIR=~/projects
PROJECT_PATH="$PROJECTS_DIR/$PROJECT_NAME"

# Create the project directory
mkdir -p "$PROJECT_PATH"
cd "$PROJECT_PATH" || exit 1

echo "🛠️  Created project directory: $PROJECT_PATH"

# Create and activate the virtualenv
mkvirtualenv "$PROJECT_NAME"
setvirtualenvproject "$WORKON_HOME/$PROJECT_NAME" "$PROJECT_PATH"
workon "$PROJECT_NAME"
echo "🐍 Created and activated virtualenv: $PROJECT_NAME"

# Handle requirements.txt
if [ -f requirements.txt ]; then
    echo "📦 Installing from existing requirements.txt..."
    pip install -r requirements.txt
else
    echo "# Add your packages here" > requirements.txt
    echo "📄 Created blank requirements.txt"
fi

# Create a default .gitignore for Python
cat <<EOF > .gitignore
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Virtual environment
.venv/
.env/
.venv.bak/
.python-version
*.env

# VSCode
.vscode/

# macOS / Linux
.DS_Store

# IDEs
.idea/
*.swp

# Logs and dumps
*.log
*.pot
*.pid
*.dump

# Tests
.coverage
.tox/
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
EOF

echo "🚫 Added default Python .gitignore"

# Create a default README
cat <<EOF > README.md
# $PROJECT_NAME

Brief description of what this project does and why it exists.

## Setup

\`\`\`bash
workon $PROJECT_NAME
pip install -r requirements.txt
\`\`\`

## Usage

Explain how to run the project or what files are important.

EOF

echo "📖 Added starter README.md"

# Initialize Git repo
git init
git add .
git commit -m "🎉 Initial project scaffold for $PROJECT_NAME"
echo "🔧 Initialized Git repository"

# Optionally open in VS Code (if installed)
if command -v code &> /dev/null; then
    read -p "🚀 Open project in VS Code now? (y/n): " OPEN_VSCODE
    if [[ "$OPEN_VSCODE" == "y" ]]; then
        code .
    fi
fi

# Done
echo -e "\n✅ Project '$PROJECT_NAME' is ready to go!"

