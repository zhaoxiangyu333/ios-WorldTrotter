//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by hadoop on 2018/4/26.
//  Copyright © 2018年 hadoop. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        self.view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["标准", "复杂", "卫星"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive  = true
        trailingConstraint.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChange(sender:)), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func mapTypeChange(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .standard
        default:
            break
        }
    }
}
