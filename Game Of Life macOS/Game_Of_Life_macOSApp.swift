//
//  Game_Of_Life_macOSApp.swift
//  Game Of Life macOS
//
//  Created by Nathan Rassié on 12/06/2024.
//

import SwiftUI
import SwiftyLife

@main
struct Game_Of_Life_macOSApp: App {
	@State private var fps: Double = 30.0
	@State private var aliveColor = Color(.sRGB, red: 0.529, green: 0.808, blue: 0.922)
	@State private var deadColor = Color(.sRGB, red: 0.039, green: 0.035, blue: 0.463)
	@State private var aliveAmount: Float = 20.0
	
	@StateObject var lifeModel = LifeModel(width: 30, height: 30, livingCellsAmount: 20)
	
	var body: some Scene {
		WindowGroup {
			LifeView(fps: $fps, aliveColor: $aliveColor, deadColor: $deadColor, aliveAmount: $aliveAmount, cellSize: UIntSize(width: 10, height: 10))
				.environmentObject(lifeModel)
		}
		Settings {
			SettingsView(fps: $fps, aliveColor: $aliveColor, deadColor: $deadColor, aliveAmount: $aliveAmount)
		}

	}
}
