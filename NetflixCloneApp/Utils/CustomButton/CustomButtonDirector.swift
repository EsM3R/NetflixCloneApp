//
//  CustomButtonDirector.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 19.01.2024.
//

import Foundation


class CustomButtonDirector {
    private var builder: CustomButtonBuilder

    init(builder: CustomButtonBuilder) {
        self.builder = builder
    }

    func construct() -> CustomButton {
        builder.buildCornerRadius()
        builder.buildTitleColor()
        builder.buildBackgroundColor()
        builder.buildTitle()
        return builder.getResult()
    }
}
