//
//  StartPage.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 02.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct StartPage: View {
    
    @EnvironmentObject var viewRouter:ViewRouter
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.viewRouter.currentView = "SettingsPage"
                }) {
                    Text("Settings")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                Button(action: {
                    self.viewRouter.currentView = "GamePage"
                }) {
                    Text("Start Game")
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .font(.custom("Zapfino", size: 30))
                        .padding([.leading, .trailing])
                }
                .background(Color.white)
                .cornerRadius(5)
                .hoverEffect()
                Spacer()
            }
            Spacer()
        }
            
        .background(
            Image("homescreen-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
            .edgesIgnoringSafeArea(.all)
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StartPage()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)"))
                .previewLayout(.fixed(width: 1112, height: 834))
                .previewDisplayName("iPad")
            
            StartPage()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewLayout(.fixed(width: 812, height: 375))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
