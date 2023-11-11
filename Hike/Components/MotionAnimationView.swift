//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Karim Sakr on 11/11/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimated: Bool = false
    
    //MARK: - Random Coordinates
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    //MARK: - Random Sizes
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    //MARK: - Random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //MARK: - Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    //MARK: - Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimated ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimated = true
                        }
                    })
            }
            
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup() 
    }
}

#Preview {
    
        MotionAnimationView()
        .background {
            Circle()
                .tint(.teal)
        }
    
    
}
