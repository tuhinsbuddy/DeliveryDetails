//
//  DeliveryListProtocols.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import Foundation

//MARK: Presenter Protocol
protocol DeliveryListPresenterProtocol: class {
    var interactor: DeliveryListInteractorInputProtocol? { get set }
    func loadView()
}

//MARK: Interactor Output Protocol
protocol DeliveryListInteractorOutputProtocol: class {
    func serverDataResponse(data response: [DeliveryListData]?)
}

//MARK: Interactor Input Protocol
protocol DeliveryListInteractorInputProtocol: class {
    var presenterOutput: DeliveryListInteractorOutputProtocol?  { get set }
    func getServerResponse(api apiValue: String, header headerData: [String: String])
}

//MARK: View Protocol
protocol DeliveryListViewProtocol: class {
    var presenter: DeliveryListPresenterProtocol?  { get set }
}
