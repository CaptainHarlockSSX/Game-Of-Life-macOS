//
//  LifeViewHeader.swift
//  GameOfLifeExperiment
//
//  Created by Nathan Rassié on 14/05/2024.
//

import SwiftUI
import SwiftyLife

struct LifeViewHeader: View {
	@EnvironmentObject var lifeModel: LifeModel
	
	@Binding var fps: Double
	@Binding var iteration: Int
	@Binding var isAutoModeOn: Bool
	@Binding var isPlaying: Bool
	
	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 10) {
				Text("FPS : \(fps, specifier: "%.2f")")
				Text("Iteration : \(iteration)")
			}
			.bold()
			Spacer()
			VStack(alignment: .trailing, spacing: 10) {
				HStack {
					Text("Manual")
					Toggle(isOn: $isAutoModeOn) {}
						.toggleStyle(.switch)
						.accessibilityLabel("Auto mode switch")
					Text("Auto")
				}
				.bold()
				HStack {
					if isPlaying {
						Button(action: {
							isPlaying.toggle()
						}, label: {
							Label("Stop", systemImage: "stop.fill")
								.labelStyle(.iconOnly)
						})
						.disabled(!isAutoModeOn)
					} else {
						Button(action: {
							isPlaying.toggle()
						}, label: {
							Label("Play", systemImage: "play.fill")
								.labelStyle(.iconOnly)
						})
						.disabled(!isAutoModeOn)
					}
					
					Button(action: {
						isPlaying = false
						iteration = 0
						lifeModel.resetSimulation()
					}) {
						Label("Reset", systemImage: "arrow.circlepath")
							.bold()
							.labelStyle(.iconOnly)
					}
				}
				
			}
		}
		.padding()
	}
	
	
}

#Preview("Auto Mode") {
	LifeViewHeader(fps: .constant(30), iteration: .constant(0), isAutoModeOn: .constant(true), isPlaying: .constant(true))
		.environmentObject(LifeModel(width: 30, height: 30, livingCellsAmount: 20))
}

#Preview("Manual Mode") {
	LifeViewHeader(fps: .constant(30), iteration: .constant(0), isAutoModeOn: .constant(false), isPlaying: .constant(false))
		.environmentObject(LifeModel(width: 30, height: 30, livingCellsAmount: 20))
}
