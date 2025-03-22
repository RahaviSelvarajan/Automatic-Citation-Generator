import os
import sys 
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../")))
from app.v1.modules.keyword_utils import check_valid_keywords

# Define paths
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
PROMPT_FILE = os.path.join(BASE_DIR, "../prompts/check_valid_keyword.liquid")

# Example usage
if __name__ == "__main__":
    test_keywords = ["Einstein", "gravity", "blue", "tree"]
    valid_results = check_valid_keywords(test_keywords, PROMPT_FILE)
    print("Valid Keywords:", valid_results)