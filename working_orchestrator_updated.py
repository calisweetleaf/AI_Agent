import json
import subprocess
import logging
from transformers import AutoModelForCausalLM, AutoTokenizer

# Load configuration from config.json
CONFIG_PATH = "config.json"

def load_config():
    try:
        with open(CONFIG_PATH, "r", encoding="utf-8") as f:
            return json.load(f)
    except FileNotFoundError:
        logging.error("Configuration file not found! Ensure config.json exists.")
        exit(1)
    except json.JSONDecodeError:
        logging.error("Invalid JSON format in config.json!")
        exit(1)

config = load_config()

# Setup Logging
logging.basicConfig(filename=config["logging"]["file"], level=logging.INFO,
                    format="%(asctime)s - %(levelname)s - %(message)s")

# Load AI Model
def load_model():
    try:
        model_name = config["model"]["layers"]["base"]["model_name"]
        logging.info(f"Loading AI model: {model_name}")
        model = AutoModelForCausalLM.from_pretrained(model_name, device_map="auto")
        tokenizer = AutoTokenizer.from_pretrained(model_name)
        logging.info("Model loaded successfully.")
        return model, tokenizer
    except Exception as e:
        logging.error(f"Error loading model: {str(e)}")
        exit(1)

model, tokenizer = load_model()

# Define Tool Execution
def execute_tool(tool_name, params):
    if tool_name == "create_folder":
        folder_path = params.get("path", "")
        if folder_path:
            try:
                subprocess.run(["mkdir", folder_path], check=True)
                logging.info(f"Folder created: {folder_path}")
            except Exception as e:
                logging.error(f"Error creating folder: {str(e)}")
    elif tool_name == "launch_app":
        app = params.get("app", "")
        if app:
            try:
                subprocess.run([app], check=True)
                logging.info(f"Application launched: {app}")
            except Exception as e:
                logging.error(f"Error launching application: {str(e)}")
    else:
        logging.warning(f"Unknown tool requested: {tool_name}")

if __name__ == "__main__":
    logging.info("AI Orchestrator is running.")
