//
//  UserDetailsViewController.swift
//  JsonProj
//
//  Created by epita on 19/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

        //Views declarations
    @IBOutlet weak var ibfname:UILabel!
    @IBOutlet weak var iblname:UILabel!
    @IBOutlet weak var ibstreet:UILabel!
    @IBOutlet weak var ibcity:UILabel!
    @IBOutlet weak var ibemail:UILabel!
    @IBOutlet weak var ibphone:UILabel!
    @IBOutlet weak var ibcell:UILabel!
    @IBOutlet weak var ibImageView:UIImageView!
    
    var product: RandomUserDet!
    
    var firstdetail,lastdetail,genderdetail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set data from the previous controller via segue
        ibfname.text=product.name.first
        iblname.text=product.name.last
        ibstreet.text=product.location.street
        ibcity.text=product.location.city
        ibemail.text=product.email
        ibphone.text=product.phone
        ibcell.text=product.cell
        
        //set Image URL
        let url = URL(string: product.picture.large)
        let data = try? Data(contentsOf: url!)
        ibImageView.image = UIImage(data: data!)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
