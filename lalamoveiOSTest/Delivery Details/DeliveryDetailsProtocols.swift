//
//  DeliveryDetailsProtocols.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import Foundation

//MARK: Wireframe -
protocol DeliveryDetailsWireframeProtocol: class {

}

//MARK: Presenter -
protocol DeliveryDetailsPresenterProtocol: class {
    func loadView()
}

//MARK: View -
protocol DeliveryDetailsViewProtocol: class {
    var presenter: DeliveryDetailsPresenterProtocol?  { get set }
}
