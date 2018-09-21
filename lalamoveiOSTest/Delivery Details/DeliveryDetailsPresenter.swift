//
//  DeliveryDetailsPresenter.swift
//  lalamoveiOSTest
//
//  Created by Tuhin S on 15/09/18.
//  Copyright © 2018 iCrunchCoder. All rights reserved.


import UIKit
import GoogleMaps
import Kingfisher

class DeliveryDetailsPresenter: DeliveryDetailsPresenterProtocol {
    
    weak private var view: DeliveryDetailsViewProtocol?
    private let deliveryListData: DeliveryListData
    
    init(interface: DeliveryDetailsViewProtocol, data: DeliveryListData) {
        self.view = interface
        self.deliveryListData = data
    }
    
    func loadView(){
        setupViews()
    }
}

extension DeliveryDetailsPresenter{
    private func setupViews(){
        guard let viewController = view as? DeliveryDetailsViewController else {
            debugPrint("Failed to get viewcontroller inside presenter!")
            return
        }
        
        viewController.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
        viewController.title = "Delivery Details"
        viewController.view.backgroundColor = .white
        var mapCameraPosition: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 15)
        let mapMarker: GMSMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        if let deliveryLocationData = deliveryListData.location,
            let latitude = deliveryLocationData.latitude,
            let longitude = deliveryLocationData.longitude{
            mapCameraPosition = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 15)
            mapMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
        viewController.mapSuperView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: 0, height: 0), camera: mapCameraPosition)
        mapMarker.map = viewController.mapSuperView
        viewController.mapSuperView.isMyLocationEnabled = false
        viewController.mapSuperView.settings.myLocationButton = false
        viewController.mapSuperView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.mapSuperView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(viewController.mapSuperView!)
        let safeArea = viewController.view.safeAreaLayoutGuide
        viewController.mapSuperView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        viewController.mapSuperView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        viewController.mapSuperView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        viewController.mapSuperView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        viewController.mapSuperView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor).isActive = true

        viewController.detailsSuperView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(viewController.detailsSuperView)
        viewController.detailsSuperView.backgroundColor = .white
        viewController.detailsSuperView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5).isActive = true
        viewController.detailsSuperView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5).isActive = true
        viewController.detailsSuperView.topAnchor.constraint(equalTo: viewController.mapSuperView.bottomAnchor, constant: 10).isActive = true
        viewController.detailsSuperView.heightAnchor.constraint(equalToConstant: 92).isActive = true
        viewController.detailsSuperView.centerXAnchor.constraint(equalTo: viewController.mapSuperView.centerXAnchor).isActive = true
        viewController.detailsSuperView.layer.borderColor = UIColor.black.cgColor
        viewController.detailsSuperView.layer.borderWidth = 1
        
        viewController.detailImage.translatesAutoresizingMaskIntoConstraints = false
        viewController.lblDetails.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(viewController.detailImage)
        viewController.view.addSubview(viewController.lblDetails)
        viewController.detailImage.leadingAnchor.constraint(equalTo: viewController.detailsSuperView.leadingAnchor, constant: 1).isActive = true
        viewController.detailImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        viewController.detailImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        viewController.detailImage.centerYAnchor.constraint(equalTo: viewController.detailsSuperView.centerYAnchor).isActive = true
        viewController.lblDetails.topAnchor.constraint(equalTo: viewController.detailsSuperView.topAnchor, constant: 2).isActive = true
        viewController.lblDetails.bottomAnchor.constraint(equalTo: viewController.detailsSuperView.bottomAnchor, constant: 2).isActive = true
        viewController.lblDetails.leadingAnchor.constraint(equalTo: viewController.detailImage.trailingAnchor, constant: 10).isActive = true
        viewController.lblDetails.trailingAnchor.constraint(equalTo: viewController.detailsSuperView.trailingAnchor, constant: 5).isActive = true
        viewController.lblDetails.numberOfLines = 0
        if let imageUrl = deliveryListData.imageUrl, !imageUrl.isEmpty{
            viewController.detailImage.kf.setImage(with: URL(string: imageUrl))
        } else {
            viewController.detailImage.image = nil
        }
        
        if let description = deliveryListData.description, !description.isEmpty,
            let address = deliveryListData.location?.address, !address.isEmpty{
            viewController.lblDetails.text = "\(description) at \(address)"
        } else {
            viewController.lblDetails.text = "No delivery address found!"
        }
    }
}


