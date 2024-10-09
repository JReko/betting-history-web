from app import create_app
import sys

if __name__ == "__main__":
    if not (sys.version_info.major == 3 and sys.version_info.minor == 12 and sys.version_info.micro == 7):
        raise RuntimeError("This script requires Python 3.12.7")

    create_app().run(debug=True)
