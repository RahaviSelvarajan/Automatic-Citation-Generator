import os

def load_prompt(prompt_file: str) -> str:
    """
    Loads the prompt template from the specified file.
    """
    if not os.path.exists(prompt_file):
        raise FileNotFoundError(f"Prompt file not found: {prompt_file}")

    with open(prompt_file, "r") as file:
        return file.read().strip()