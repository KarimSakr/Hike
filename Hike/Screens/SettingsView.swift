//
//  SettingsView.swift
//  Hike
//
//  Created by Karim Sakr on 11/11/2023.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK: - Properties
    private let alternateAppIcons = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    "AppIcon-Campfire"
    ]
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors:
                            [.colorGreenLight,
                             .colorGreenMedium,
                             .colorGreenDark],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8){
                    
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks ggorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off your boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                Text("Choose your favourite app icon from the collection above")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } header: {
                Text("Alternate Icons")
            }
            
            
            Section {
                
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Karim Sakr", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "GitHub", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "KarimSakr", rowLinkDestination: "https://github.com/KarimSakr")
                
            } header: {
                Text("ABOUT THE APP")
            } footer: {
                HStack{
                    Spacer()
                    Text("Copyrights © All right reserved.")
                    Spacer()
                }
                .padding(.vertical, 8)
            }

        }
        
    }
}

#Preview {
    SettingsView()
}
