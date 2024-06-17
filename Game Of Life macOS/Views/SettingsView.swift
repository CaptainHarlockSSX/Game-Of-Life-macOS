//
//  SettingsView.swift
//  GameOfLifeExperiment
//
//  Created by Nathan Rassié on 24/05/2024.
//

import SwiftUI
import SwiftyLife

struct SettingsView: View {
	@Binding var fps: Double
	@Binding var aliveColor: Color
	@Binding var deadColor: Color
	@Binding var aliveAmount: Float
	
	var body: some View {
		Spacer()
		HStack {
			Spacer()
			Form {
				TextField("FPS:", value: $fps, format: .number)
					.frame(maxWidth: 80)
				ColorPicker("Alive Cells Color:", selection: $aliveColor)
				ColorPicker("Dead Cells Color:", selection: $deadColor)
				
				Slider(value: $aliveAmount, in: 0...100) {
					Text("% of alive cells")
				} minimumValueLabel: {
					Text("0")
				} maximumValueLabel: {
					Text("100")
				}
				
				TextField("", value: $aliveAmount, format: .number)
					.frame(maxWidth: 50)
				
				
				Button(action: {
					restoreDefaults()
				}, label: {
					Label("Restore Default Parameters", systemImage: "gearshape.arrow.triangle.2.circlepath")
						.foregroundStyle(Color.red)
					
				})
				.padding(.top)
				Spacer()
				
			}
			
			Spacer()
		}
		Spacer()
	}
	
	/// Restore default parameters of the simulation.
	/// - Returns: None
	private func restoreDefaults() -> Void {
		fps = 30.00
		aliveColor = Color(.sRGB, red: 0.529, green: 0.808, blue: 0.922)
		deadColor = Color(.sRGB, red: 0.039, green: 0.035, blue: 0.463)
		aliveAmount = 20.0
	}
}

#Preview {
	SettingsView(fps: .constant(30.00), aliveColor: .constant(Color.green), deadColor: .constant(Color.red), aliveAmount: .constant(20.0))
}
