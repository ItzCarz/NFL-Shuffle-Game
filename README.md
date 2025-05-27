🏈 Random NFL Team Generator (SwiftUI)

This is a simple SwiftUI app that randomly selects an NFL team. Users can toggle between AFC, NFC, or All Teams to get a random pick.

📱 Features

🎲 Random NFL team generator
🔁 Toggle between:
All NFL teams
AFC teams
NFC teams
🧼 Clean and minimal SwiftUI interface
🛠 Requirements

iOS 14.0+
Xcode 12+
SwiftUI
🚀 Getting Started

Clone the repository:
git clone [https://github.com/yourusername/RandomNFLTeamGenerator.git](https://github.com/ItzCarz/NFL-Shuffle-Game)
cd RandomNFLTeamGenerator
Open the .xcodeproj or .xcodeworkspace file in Xcode.
Build and run the project using the simulator or your iOS device.
📸 Screenshots

Main Screen	Team Display
🧱 Project Structure

RandomNFLTeamGenerator/
├── ContentView.swift       # Main SwiftUI view
├── TeamGenerator.swift     # Logic for team selection
├── TeamData.swift          # AFC/NFC team lists
├── Assets.xcassets         # App assets
├── RandomNFLTeamGeneratorApp.swift # App entry point
└── README.md               # Documentation
💡 How It Works

The app stores NFL teams in two arrays (afcTeams and nfcTeams).
Based on the selected segment (All, AFC, NFC), it randomly picks a team.
The selected team is displayed on the screen.
📜 License

This project is open source and available under the MIT License.
