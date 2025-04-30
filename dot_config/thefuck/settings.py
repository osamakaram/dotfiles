"""The Fuck settings module.

This module contains configuration settings for The Fuck command correction tool.
See https://github.com/nvbn/thefuck#settings for more information.
"""

# Rules to include and exclude
rules = ["cd_parent", "git_push", "sudo", "apt_get", "ls_lah", "no_command"]
exclude_rules = ["rm_dir", "git_delete_branch"]

# Command behavior settings
WAIT_COMMAND = 1
REQUIRE_CONFIRMATION = True
NO_COLORS = False
DEBUG = False

# Command priorities
priority = {
    "no_command": 9999,
    "sudo": 100,
}

# History and performance settings
HISTORY_LIMIT = 50000
ALTER_HISTORY = True
WAIT_SLOW_COMMAND = 5
slow_commands = [
    "lein",
    "react-native",
    "gradle",
    "./gradlew",
    "vagrant",
    "terraform",
    "docker-compose",
    "docker",
    "kubectl",
]

# Behavior settings
REPEAT = False
INSTANT_MODE = False
NUM_CLOSE_MATCHES = 4

# Environment variables
env = {
    "LC_ALL": "C",
    "LANG": "C",
    "GIT_TRACE": "1",
}

# Search path exclusions
excluded_search_path_prefixes = ["/mnt", "/Volumes", "/private/tmp"]
