import re

def parse_scene(script):
    # Define regular expressions for the CFG rules
    scene_pattern = r"\[Scene:(.*?)\]"
    character_pattern = r"\[Character:(.*?)\]"
    action_pattern = r"\[Action:(.*?)\]"
    dialogue_pattern = r"\[Character:(.*?)\]\nSays \"(.*?)\""

    # Find all matches for scene, character, action, and dialogue patterns
    scenes = re.findall(scene_pattern, script)
    characters =set (re.findall(character_pattern, script))
    actions = re.findall(action_pattern, script)
    dialogues = re.findall(dialogue_pattern, script)

    print(len(scenes), len(characters), len(actions), len(dialogues))

    # Check if the script conforms to the CFG rules
    if not scenes:
        print("Error: Script must contain at least one scene.")
        return

    # if len(scenes) != len(characters) or len(scenes) != len(actions):
    #     print("Error: Number of scenes, characters, and actions must match.")
    #     return

    if len(dialogues) > 0 and len(dialogues) != len(characters):
        print("Error: Number of dialogues must match the number of characters.")
        return

    # If all checks pass, the script is valid
    print("Script is valid.")
    print("Scenes:", scenes)
    print("Characters:", characters)
    print("Actions:", actions)
    print("Dialogues:", dialogues)

# Example usage
script = """
[Scene: Final Battle]
[Character: Iron Man]
[Action: Talks to]
[Character: Thanos]
Says \"Kuja tumengo\"
[Scene: Titan Showdown]
[Character: Thanos]
[Action: Fights]
[Character: Iron Man]
Says \"I can do this all day.\"
"""

bat_script = """
[Scene: Gotham City Rooftop]
[Character: Batman]
[Character: Joker]
[Action: Stands]
[Character: Batman]
Says \"I'm not wearing hockey pads.\"
[Character: Joker]
Says \"Why so serious?\"
[Action: Laughs maniacally]
"""

parse_scene(script)
parse_scene(bat_script)
