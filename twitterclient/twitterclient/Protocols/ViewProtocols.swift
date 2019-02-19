//
//  ViewProtocols.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

protocol ReusableView: class {}

protocol NibLoadableView: class { }

protocol IndicatableView: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}
