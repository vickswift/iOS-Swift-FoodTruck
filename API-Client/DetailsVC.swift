//
//  DetailsVC.swift
//  API-Client
//
//  Created by Victor  Adu on 4/28/17.
//  Copyright © 2017 Victor  Adu. All rights reserved.
//

import UIKit
import MapKit

class DetailsVC: UIViewController {

    var selectedFoodTruck: FoodTruck?
    var loginVC: LogInVC?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var avgCostLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedFoodTruck?.name
        foodTypeLabel.text = selectedFoodTruck?.foodType
        avgCostLabel.text = "\(selectedFoodTruck!.avgCost)"
        
        mapView.addAnnotation(selectedFoodTruck!)
        centerMapOnLocation(CLLocation(latitude: selectedFoodTruck!.lat, longitude: selectedFoodTruck!.long))
    }
    
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(selectedFoodTruck!.coordinate, 1000, 1000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func backButtonTapped(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func reviewsButtonTapped(sender: UIButton) {
        performSegue(withIdentifier: "showReviewsVC", sender: self)
    }
    
    @IBAction func addReviewButtonTapped(sender: UIButton) {
        if AuthService.instance.isAuthenticated == true {
            performSegue(withIdentifier: "showAddReviewVC", sender: self)
        } else {
            showLogInVC()
        }
    }
    
    func showLogInVC() {
        loginVC = LogInVC()
        loginVC?.modalPresentationStyle = UIModalPresentationStyle.formSheet
        self.present(loginVC!, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReviewsVC" {
            let desinationViewController = segue.destination as! ReviewsVC
            desinationViewController.selectedFoodTruck = selectedFoodTruck
        } else if segue.identifier == "showAddReviewVC" {
            let destinationViewController = segue.destination as! AddReviewVC
            destinationViewController.selectedFoodTruck = selectedFoodTruck
        }
    }

}
