# RainBloodRemoval

A Project Zomboid mod that automatically removes blood from outdoor ground tiles and walls during rain events.

## Features

- Automatically removes blood from outdoor ground tiles when it's raining with an intensity above a specified threshold.
- Debug mode that can be toggled on and off for troubleshooting and development purposes.

## Installation

1. Download the latest release from the Releases tab or the mod repository.
2. Extract the contents of the ZIP archive into your `Zomboid/mods` folder.
3. Launch Project Zomboid, go to the Mods menu, and enable the RainBloodRemoval mod.
4. Restart Project Zomboid for the changes to take effect.

### Also you can add it in the steam workshop, but the latest version will be here for a while

## Usage

The mod works automatically by removing blood from outdoor ground tiles when it's raining with an intensity above the specified threshold. The default threshold is 0.5.

To toggle debug mode on and off, press the following key combination: `Ctrl + ]`.
Having some issues with the keymap, so just change `rainBloodRemoval.debugMode` (true / false) in `RainBloodRemoval.lua` script

## Configuration

You can customize the mod's behavior by editing the `RainBloodRemoval.lua` script:

- `rainCheckInterval`: The interval between rain checks (default: 600).
- `rainThreshold`: The rain intensity threshold for blood removal (default: 0.5).

## Contributing

Feel free to submit issues, pull requests, or suggestions

## License

This mod is released under the [MIT License](LICENSE).

## Credits

- by nubowski