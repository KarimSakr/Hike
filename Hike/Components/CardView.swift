//
//  CardView.swift
//  Hike
//
//  Created by Karim Sakr on 10/11/2023.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - Properties
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    @State private var isShowingSheet: Bool = false
    
    //MARK: - Functions
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
            
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK: - Header
                
                VStack {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.colorGrayLight,
                                             .colorGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                        Spacer()
                        
                        Button {
                            //MARK: - Action
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(.colorGrayMedium)
                }
                .padding(.horizontal, 30)
                
                //MARK: - Main Content
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                //MARK: - Footer
                
                Button {
                    randomImage()
                    
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors:[.colorGreenLight,
                                                   .colorGreenMedium],
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25),
                                radius: 0.25,
                                x: 1,
                                y: 2)
                }
                .buttonStyle(GradientButton())
                
            }
        }
        .frame(width: 320, height: 570)
        
    }
}

#Preview {
    CardView()
}
