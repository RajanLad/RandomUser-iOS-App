//
//  ViewController.swift
//  JsonProj
//
//  Created by epita on 05/06/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController {
    

//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableVi: UITableViewCell!
    @IBOutlet weak var tableVie: UITableViewCell!
    @IBOutlet weak var tableViewUser: UITableView!
    
    var results:UserBase?
    var userArray:[RandomUserDet]?
    var userArr = [RandomUserDet] ()
    
    var firstname="",lastname="",gender="";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableViewUser.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchUsers()
    }
    




func fetchUsers(){
    var req = URLRequest(url: URL(string: "https://randomuser.me/api/?results=20")!)
    req.httpMethod="GET"
    
    URLSession.shared.dataTask(with: req) { (data, response, error) in
        do{
            let jsondecoder = JSONDecoder()
            let response = try jsondecoder.decode(UserBase.self, from: data!)
            self.userArray = response.results
            print("Array",self.userArray!.count)
//            for RandomUserDe in self.userArray["gender"] {
//
//            }
            self.userArr=self.userArray!
            print("Array  ARR",self.userArr.count)
            DispatchQueue.main.async{
                self.tableViewUser.reloadData()
            }
        }
        catch let error{
            print("JSON error",error)
        }
        }.resume()
    
}


func formatName(userName: Name) -> String{
    print("ArrayA",userName.title)
    return userName.title.capitalized + " "+userName.first.capitalized
}
}
extension JsonViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ArrayB",userArray?.count ?? 2)
        return userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)

        if let user = userArray?[indexPath.row]{
                    let fullName = formatName(userName:user.name)
                        cell.textLabel?.text=fullName
                        cell.detailTextLabel?.text="Last Name :"+user.name.last+" Gender: "+user.gender
            
            
                    }
                    else
                    {
                        print("JSON error","WR")
                    }
        
        
                    return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserDetailsViewController {
            var index: Int = tableViewUser.indexPathForSelectedRow?.row ?? 0
            
            destination.product = userArray![index]
            tableViewUser.deselectRow(at: tableViewUser.indexPathForSelectedRow!, animated: true)
            
        }
    }
    

}




