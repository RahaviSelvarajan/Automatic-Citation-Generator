import requests

OLLAMA_API_URL = "http://localhost:11434/api/generate"

def generate_text_ollama(prompt: str, model: str = "llama2") -> str:
    """
    Generates text using the Ollama API with the specified model.
    """
    payload = {
        "model": model,
        "prompt": prompt,
        "stream": False,
        "max_tokens": 50,
    }

    response = requests.post(OLLAMA_API_URL, json=payload)
    
    if response.status_code == 200:
        result = response.json()
        return result["response"].strip()
    else:
        raise Exception(f"Error generating text: {response.status_code} - {response.text}")