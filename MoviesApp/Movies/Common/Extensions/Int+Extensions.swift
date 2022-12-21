//
//  Int+Extensions.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

import Foundation

extension Int {
    var movieTime: String {
        var movieTime = ""
        let hour = self/60

        if hour > 0 {
            movieTime.append("\(hour)h ")

            let min = self - (hour * 60)

            if min > 0 {
                movieTime.append("\(min)m")
            }
        } else {
            movieTime.append("\(self)m")
        }

        return movieTime
    }
}
