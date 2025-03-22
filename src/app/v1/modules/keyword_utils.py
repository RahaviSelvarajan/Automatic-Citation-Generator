from typing import List
from app.utils.utils import load_prompt
from app.v1.modules.llm_utils import generate_text_ollama

def check_valid_keywords(keywords: List[str], prompt_file: str) -> List[str]:
    """
    Checks if extracted keywords have a fact associated with them.
    
    Args:
        keywords (List[str]): List of extracted keywords.
        prompt_file (str): Path to the prompt file.
    
    Returns:
        List[str]: List of valid keywords that have factual relevance.
    """
    valid_keywords = []
    prompt_template = load_prompt(prompt_file)
    
    for keyword in keywords:
        prompt = prompt_template.replace("{{keyword}}", keyword)
        generated_text = generate_text_ollama(prompt, model="llama2").lower()
        
        if "yes" in generated_text or "factual" in generated_text:
            valid_keywords.append(keyword)
    
    return valid_keywords