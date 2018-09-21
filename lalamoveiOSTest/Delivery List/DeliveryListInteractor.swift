//
//  DeliveryListInteractor.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import Foundation
import Alamofire

class DeliveryListInteractor: DeliveryListInteractorInputProtocol {
    weak var presenterOutput: DeliveryListInteractorOutputProtocol?
    
    func getServerResponse(api apiValue: String, header headerData: [String : String]) {
        switch NetworkChecker.isActiveInternet{
        case true:
            guard !headerData.isEmpty, !apiValue.isEmpty else {return}
            Alamofire.request(apiValue, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headerData).responseJSON(completionHandler: { response in switch response.result {
                
            case .success(_):
                guard let receivedData = response.result.value,
                    let statusCode = response.response?.statusCode, statusCode == 200 else {
                        self.processResponseData(with: nil)
                        return
                }
                
                do {
                    let dataResponse = try JSONSerialization.data(withJSONObject: receivedData, options: .prettyPrinted)
                    self.processResponseData(with: dataResponse)
                    LocalDefaultsManager.shared.deliveryDetails = dataResponse
                } catch {
                    self.processResponseData(with: nil)
                }
                
                
            case .failure(_):
                self.processResponseData(with: nil)
            }
        })
            
        case false:
            processResponseData(with: nil)
        }
    }
}

private extension DeliveryListInteractor{
    private func processResponseData(with data: Data?){
        if let dataCheck = data{
            do {
                let finalServerResponse = try JSONDecoder().decode([DeliveryListData].self, from: dataCheck)
                self.presenterOutput?.serverDataResponse(data: finalServerResponse)
            } catch {
                self.presenterOutput?.serverDataResponse(data: nil)
            }
            
        } else {
            guard let localData = LocalDefaultsManager.shared.deliveryDetails else {
                self.presenterOutput?.serverDataResponse(data: nil)
                return
            }
            
            self.processResponseData(with: localData)
        }
    }
}
