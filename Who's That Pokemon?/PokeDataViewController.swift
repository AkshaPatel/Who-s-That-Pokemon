//
//  PokeDataViewController.swift
//  Who's That Pokemon?
//
//  Created by Aksh Patel on 11/27/23.
//

import UIKit

protocol PokeDataViewControllerDelegate: AnyObject {
    
}

class PokeDataViewController: UIViewController {
    let rows = ["Pokemon", "Height", "Weight", "Type", "Evolutions"]
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
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

extension PokeDataViewController: UITableViewDelegate {
    
}

extension PokeDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rows[indexPath.row], for: indexPath)
        
        return cell
    }
}
