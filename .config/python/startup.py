import atexit
import readline
import sys

if sys.version_info[:2] >= (3, 4):
    sys.__interactivehook__()
    atexit.unregister(readline.write_history_file)
