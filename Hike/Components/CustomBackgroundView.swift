//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Karim Sakr on 10/11/2023.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            
            //MARK: - Depth
            
            Color(.colorGreenDark)
                .cornerRadius(40)
                .offset(y:12)
            
            //MARK: - Light
            
            Color(.colorGreenLight)
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            //MARK: - Surface
            LinearGradient(colors: [
                .colorGreenLight,
                .colorGreenMedium],
                           startPoint: .top,
                           endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
