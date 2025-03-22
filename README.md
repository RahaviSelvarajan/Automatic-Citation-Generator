# 📚 Automatic Citation Generator
---

## 🎯 Project Overview

**Automatic Citation Generator** (ACG) is a Python-based terminal application that validates extracted keywords using a language model (LLaMA 2 via `ollama`). It leverages natural language processing to determine whether a given keyword has factual relevance. 

---

## ⚡️ Features
- ✅ Keyword validation with `LLaMA 2` using `ollama`.
- ✅ Easy setup with a single `setup.sh` script.
- ✅ CLI interface (`acg validate`) to validate keywords.
- ✅ `acg reset` to reset the environment and re-run the setup.
- ✅ Automatic virtual environment management.

---

## 📂 Project Structure

```
/Automatic-Citation-Generator
├── acg                      # CLI command to run or reset
├── setup.sh                 # Setup and reset script
├── requirements.txt         # List of Python dependencies
└── src/
    ├── app/
    │   ├── __init__.py
    │   ├── utils/
    │   │   ├── __init__.py
    │   │   └── file_utils.py  # Contains load_prompt function
    │   └── v1/
    │       ├── __init__.py
    │       └── modules/
    │           ├── __init__.py
    │           ├── keyword_utils.py  # Checks valid keywords
    │           └── llm_utils.py      # Handles ollama API calls
    ├── prompts/
    │   └── check_valid_keyword.liquid  # Template for validation prompt
    └── steps/
        └── validate_keywords_llama2.py  # Main script to validate keywords
```

---

## 🚀 Getting Started

---

### 1️⃣ Pre-requisites

- Python 3.9 or higher
- `ollama` installed ([Install Ollama](https://ollama.com))
- Homebrew (for macOS users) to manage OpenSSL if necessary:
```bash
brew install openssl
brew link --force openssl
```

---

### 2️⃣ Setup Instructions

To set up the environment and download the LLaMA 2 model:

```bash
./setup.sh
```

✅ This will:
- Create and activate a virtual environment (`acg_env`).
- Install the required packages from `requirements.txt`.
- Download and configure `ollama` with the LLaMA 2 model.
- Run `ollama` in the background.

---

### 3️⃣ Running the Application

To validate keywords, use:

```bash
acg validate
```

✅ This will:
- Run the `validate_keywords_llama2.py` script.
- Check if extracted keywords have factual relevance.

---

### 4️⃣ Reset and Re-setup the Environment

To reset the environment and start over:

```bash
acg reset
```

✅ This will:
- Stop `ollama` if running.
- Delete the virtual environment and clear `__pycache__`.
- Run `setup.sh` again to rebuild everything.

---

## 🔥 Usage

1. **Validate Keywords**

```bash
acg validate
```

The results will be displayed in the terminal, showing which keywords are considered factually relevant.

---

2. **Reset Environment**

```bash
acg reset
```

This will remove the current environment and start fresh.

---

## 🧠 How It Works

1. **Prompt Template:**  
   Located at:
   ```
   /src/prompts/check_valid_keyword.liquid
   ```

   Template content:
   ```
   Is there a factual statement associated with the keyword '{{keyword}}'?
   Respond with 'Yes' if it has factual relevance, otherwise 'No'.
   ```

2. **Keyword Validation Workflow:**
   - Loads the template.
   - Sends the prompt to `ollama` via `llm_utils.py`.
   - Checks if the generated response contains `yes` or `factual`.
   - Returns a list of valid keywords.

---

## 🛠️ Configuration

### Modify the Prompt

To modify the prompt, edit:

```
/src/prompts/check_valid_keyword.liquid
```

Example:

```liquid
Is the keyword '{{keyword}}' associated with a historical event?
Respond with 'Yes' if it has historical relevance, otherwise 'No'.
```

---

## 📦 Dependencies

Listed in `requirements.txt`:

```
requests
transformers
torch
```

To install manually:

```bash
pip install -r requirements.txt
```

---

## 📝 Troubleshooting

### ❌ Import Errors

If you encounter `ModuleNotFoundError` for `app` or `steps`:

```bash
export PYTHONPATH="/Users/farhanrahman02/Desktop/dev/Automatic-Citation-Generator/src"
```

---

### ⚡️ OpenSSL/urllib3 Issues

If `urllib3` gives SSL errors:

1. Downgrade `urllib3`:

```bash
pip install urllib3==1.26.16
```

2. Or upgrade OpenSSL via Homebrew:

```bash
brew install openssl
brew link --force openssl
brew reinstall python
```

---

## 👥 Contributing

Feel free to fork this repository and submit pull requests for improvements.

---

## 📜 License

This project is licensed under the MIT License.

---

## 🎉 Acknowledgments

- OpenAI for LLaMA 2
- Ollama for local LLM support

---

## 📧 Contact

For support or inquiries, contact:
- **Email:** farhanrahman02@example.com
- **GitHub:** [Your GitHub Profile](https://github.com/yourprofile)

---

## 🎯 Future Improvements

- Add support for more LLM models.
- Include web scraping for automatic citation generation.
- Improve keyword extraction accuracy.
