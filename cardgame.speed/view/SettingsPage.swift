//
//  SettingsPage.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 02.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import SwiftUI

struct SettingsPage: View {
    
    @EnvironmentObject var viewRouter:ViewRouter
    
    
    var body: some View {
        Button(action: {
            self.viewRouter.currentView = "StartPage"
        }) {
            Text("Done")
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
