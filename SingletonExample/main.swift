//
//  Main.swift
//  SingletonExample
//
//  Created by nishu nishanta on 16/05/19.
//  Copyright © 2019 nishu nishanta. All rights reserved.
//

import UIKit
import Foundation

 UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(
            to: UnsafeMutablePointer<Int8>.self,
            capacity: Int(CommandLine.argc)),
    NSStringFromClass(TimerUIApplication.self),
    NSStringFromClass(AppDelegate.self)
)
