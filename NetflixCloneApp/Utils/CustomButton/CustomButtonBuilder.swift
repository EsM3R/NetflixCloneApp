//
//  CustomButtonBuilder.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 18.01.2024.
//

import Foundation

protocol CustomButtonBuilder {
    func buildCornerRadius()
    func buildTitleColor()
    func buildBackgroundColor()
    func buildTitle()
    func getResult() -> CustomButton
}

