//
//  ContentView.swift
//  NFL Team Generator
//
//  Created by Carlos David on 5/26/25.
//

import SwiftUI

struct ContentView: View {
    
    let afcTeams = ["Ravens", "Bills", "Bengals", "Browns", "Broncos", "Texans", "Colts", "Jaguars", "Chiefs", "Raiders", "Chargers", "Dolphins", "Patriots", "Jets", "Steelers", "Titans"]
    
    let nfcTeams = ["Cardinals", "Falcons", "Panthers", "Bears", "Cowboys", "Lions", "Packers", "Rams", "Vikings", "Saints", "Giants", "Eagles", "Niners", "Seahawks", "Buccaneers", "Commanders"]
    
    @State private var selectedTeam: String? = nil
    @State private var dragOffset: CGSize = .zero
    @State private var favoritesCount = 0
    @State private var hatedCount = 0
    
    
    var body: some View {
        VStack {
            Text("Welcome to The NFL Generator!").font(.title) .bold(true)
            
            Image("logo").resizable().frame(width: 90, height: 90)
            
            // Menu
            Menu(content: {
                Button("AFC Teams") {
                    selectedTeam = afcTeams.randomElement()
                }
                Button("NFC Teams") {
                    selectedTeam = nfcTeams.randomElement()
                }
            }, label: {
                Label("Select a Conference", systemImage: "chevron.down")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            })
            .padding(.bottom)
            Spacer()

            
            
            // Counters
            HStack {
                VStack {
                    Text("💔 Hated")
                    Text("\(hatedCount)")
                        .font(.title2)
                }
                Spacer()
                VStack {
                    Text("❤️ Favorites")
                    Text("\(favoritesCount)")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Team Card swiping gestures
            
            if let team = selectedTeam {
                Text("Your Random Team is:")
                Text("\(team)").font(.largeTitle) .bold(true)
                Image(team)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(12)
                    .offset(dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragOffset = value.translation
                            }
                            .onEnded { value in
                                if value.translation.width > 100 {
                                    favoritesCount += 1
                                    nextTeam()
                                } else if value.translation.width < -100 {
                                    hatedCount += 1
                                    nextTeam()
                                } else {
                                    dragOffset = .zero
                                }
                                
                            }
                    )
                    .animation(.spring(), value: dragOffset)
            }
            
            Button("Randomize Team") {
                let allTeams = afcTeams + nfcTeams
                selectedTeam = allTeams.randomElement()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
    
    func nextTeam() {
        dragOffset = .zero
        let allTeams = afcTeams + nfcTeams
        selectedTeam = allTeams.randomElement()
    }
    
}


#Preview {
    ContentView()
}
