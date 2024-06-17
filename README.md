# Game of Life - macOS App

macOS Application to run [Conway's simulation](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) (Game of Life) using package [SwiftyLife](https://github.com/CaptainHarlockSSX/Swifty-Life) for the logic.

## 🎯 Goal

Implement UI of Conway's life simulation with some settings for view customization and simulation parameters tuning.  

I am aware the implementation may not be optimal and the views not really good-looking, as I was trying and 
struggling to figure out how to achieve some features to work.

> Note: I am a Junior Computer Vision Engineer, self-taughting Swift and Apple Ecosystem Development. 
I made this project to learn deeper Swift language, Apple apps architecture, as well as Xcode features.
Any feedback or advise would be really appreciated.

## 🛠️ Project State

`✅ Usable` `🛠️ Need Rework`

## 🧩 Features

🟢 : Implemented

🟠 : Implemented but buggy / not fully finished

🔴 : Not implemented yet

| Feature | State |
| --- | --- |
| Display Simulation | 🟢  |
| Manual / Auto Mode | 🟢  |
| Cells Color Setting | 🟢  |
| Simulation FPS Setting | 🟢  |
| Simulation Grid Size Setting | 🔴  |
| Alive Cells Generation Randomness Setting | 🟢  |
| Documentation | 🟢  |
| Unit Tests | 🔴  |

## 🧰 Tech Stack

- Swift 5.10
- SwiftUI
- Xcode 15

## 🐛 Known Issues

- Grid Canvas not appearing at application startup, I could not figured out why.
- Changing the amount of alive cells at generation in the settings view may not refresh the grid canvas, especially when the simulation
is at starting conditions (iteration 0).
- Changing the amount of alive cells at generation in the settings view may log an error in the console which I currently don't understand. *CLIENT ERROR: TUINSRemoteViewController does not override -viewServiceDidTerminateWithError: and thus cannot react to catastrophic errors beyond logging them*
