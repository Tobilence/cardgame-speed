//
//  ViewRouter.swift
//  cardgame.speed
//
//  Created by Tobias Furtlehner on 01.04.20.
//  Copyright © 2020 Tobias Furtlehner. All rights reserved.
//

import Foundation

class ViewRouter: ObservableObject {
    
    @Published var currentView:String = "StartPage"
    @Published var speedGame:SpeedGame!
}
