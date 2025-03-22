#!/bin/bash

# Define environment name and model
ENV_NAME="acg_env"
REQUIREMENTS_FILE="requirements.txt"
MODEL_NAME="llama2"

# Check if reset flag is passed
if [ "$1" == "--reset" ]; then
    echo "🧹 Resetting environment..."
    
    # Stop any running Ollama services
    pkill -f "ollama serve"
    
    # Remove virtual environment
    if [ -d "./$ENV_NAME" ]; then
        echo "🗑️ Deleting virtual environment..."
        rm -rf $ENV_NAME
    fi
    
    # Remove any __pycache__ directories
    echo "🗑️ Cleaning __pycache__ directories..."
    find . -type d -name "__pycache__" -exec rm -rf {} +
    
    echo "✅ Environment reset complete. Running setup again..."
fi

echo "🚀 Setting up Automatic Citation Generator..."

# 1. Create a virtual environment
if [ ! -d "./$ENV_NAME" ]; then
    echo "📦 Creating virtual environment: $ENV_NAME"
    python3 -m venv $ENV_NAME
else
    echo "✅ Virtual environment $ENV_NAME already exists."
fi

# 2. Activate the environment
source ./$ENV_NAME/bin/activate

# 3. Install required packages
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "📚 Installing required packages from $REQUIREMENTS_FILE"
    pip install -r $REQUIREMENTS_FILE
else
    echo "⚠️ No requirements.txt found. Skipping package installation."
fi

# 4. Install Ollama if not installed
if ! command -v ollama &> /dev/null; then
    echo "🛠️ Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "✅ Ollama is already installed."
fi

# 5. Pull the LLaMA 2 model using Ollama
if ollama list | grep -q "$MODEL_NAME"; then
    echo "✅ Model $MODEL_NAME is already pulled."
else
    echo "📥 Pulling $MODEL_NAME model with Ollama..."
    ollama pull $MODEL_NAME
fi

# 6. Start Ollama in the background
if pgrep -f "ollama serve" > /dev/null; then
    echo "✅ Ollama is already running."
else
    echo "🚀 Starting Ollama server..."
    ollama serve &
    sleep 5  # Give it some time to initialize
fi

echo "🎉 Setup complete! You can now use the 'acg' command."