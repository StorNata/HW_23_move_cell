//
//  NavigationController.swift
//  HW_23_move_cell
//
//  Created by Nataliia Storozheva on 27.05.2020.
//  Copyright © 2020 Nataliia Storozheva. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    override var shouldAutorotate: Bool {
               return topViewController?.shouldAutorotate ?? true
           }
           override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
               return self.topViewController?.supportedInterfaceOrientations ?? .all
           }
           
           override var preferredStatusBarStyle: UIStatusBarStyle {
               return self.topViewController?.preferredStatusBarStyle ?? .`default`
           }
       }
