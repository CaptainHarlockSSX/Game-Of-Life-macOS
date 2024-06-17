//
//  ContentView.swift
//  GameOfLifeExperiment
//
//  Created by Nathan Rassié on 12/05/2024.
//

import SwiftUI
import SwiftyLife

/// Main view of the App, composed of a ``LifeViewHeader`` and a Canvas to represent the simulation grid.
struct LifeView: View {
	@EnvironmentObject var lifeModel: LifeModel
	
	@State private var iteration: Int = 0
	@State private var isAutoModeOn: Bool = true
	@State private var isPlaying: Bool = false
	
	@State private var aliveRects = [CGRect]()
	@State private var deadRects = [CGRect]()
	
	@Binding var fps: Double
	@Binding var aliveColor: Color
	@Binding var deadColor: Color
	@Binding var aliveAmount: Float
	
	let cellSize: UIntSize
	
	var body: some View {
		
		ZStack {
			VStack {
				LifeViewHeader(fps: $fps, iteration: $iteration, isAutoModeOn: $isAutoModeOn, isPlaying: $isPlaying)
				
				Canvas { context, size in
					// Draw cells of different color according to their state (alive / dead)
					var aliveCellsPath = Path()
					aliveCellsPath.addRects(aliveRects)
					context.fill(aliveCellsPath, with: .color(aliveColor))
					
					var deadCellsPath = Path()
					deadCellsPath.addRects(deadRects)
					context.fill(deadCellsPath, with: .color(deadColor))
				}
				.frame(width: CGFloat(lifeModel.size.width * cellSize.width), height: CGFloat(lifeModel.size.height * cellSize.height))
				.shadow(color: .primary, radius: 15)
				.onTapGesture {
					guard !isAutoModeOn else { return }
					iteration += 1
					lifeModel.nextIteration()
					updateCanvas()
				}
				.onReceive(lifeModel.timer, perform: { _ in
					iteration += 1
					lifeModel.nextIteration()
					updateCanvas()
				})
				.onChange(of: isPlaying) {
					if isPlaying {
						lifeModel.startSimulation(at: fps)
					} else {
						lifeModel.stopSimulation()
					}
				}
				.onAppear {
					updateCanvas()
				}
				.onChange(of: iteration) {
					if iteration == 0 {
						updateCanvas()
					}
				}
				.onChange(of: aliveAmount) {
					isPlaying = false
					lifeModel.editLivingCellsAmount(to: UInt(aliveAmount))
					iteration = 0
				}
				Spacer()
			}
		}
		.background(
			LinearGradient(
				colors: [aliveColor, deadColor],
				startPoint: .top,
				endPoint: .bottom
			))
		
	}
	
	/// Pull the state of the grid model and create colored rectangles for dead / alive cells.
	/// - Returns: None
	func updateCanvas() -> Void {
		var newAliveRects = [CGRect]()
		var newDeadRects = [CGRect]()
		
		for cell in lifeModel.grid {
			let cellRect = CGRect(origin: 
									CGPoint(x: cell.position.x * Int(cellSize.width),
											y: cell.position.y * Int(cellSize.height)),
								  size: CGSize(width: Int(cellSize.width), height: Int(cellSize.height)))
			
			if cell.isAlive {
				newAliveRects.append(cellRect)
			} else {
				newDeadRects.append(cellRect)
			}
			
		}
		
		aliveRects = newAliveRects
		deadRects = newDeadRects
	}
	
}

#Preview {
	LifeView(fps: .constant(30.0), aliveColor: .constant(Color.purple), deadColor: .constant(Color.gray), aliveAmount: .constant(20.0), cellSize: UIntSize(width: 10, height: 10))
		.environmentObject(LifeModel(width: 30, height: 30, livingCellsAmount: 10))
}
