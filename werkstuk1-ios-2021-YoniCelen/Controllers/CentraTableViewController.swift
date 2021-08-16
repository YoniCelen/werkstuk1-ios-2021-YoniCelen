//
//  CentraTableViewController.swift
//  werkstuk1-ios-2021-YoniCelen
//
//  Created by user201042 on 8/16/21.
//

import Foundation
import UIKit

var centra = [Centrum]()

class CentraTableViewController: UITableViewController {

    //Centra in mijn buurt (Testelt)
    func loadCentra(){
        let centrum1 = Centrum(naam: "CC Den Amer", address: Address(straat: "Nijverheidslaan", nummer: "24", postcode: 3290, gemeente: "Diest"), coordinates: Coordinates(latitude: 50.988563, longitude: 5.0375586), telNr: "013 46 06 40", foto: UIImage(named: "diest")!)
        let centrum2 = Centrum(naam: "Stadsfeestzaal", address: Address(straat: "Demervallei", nummer: "14", postcode: 3200, gemeente: "Aarschot"), coordinates: Coordinates(latitude: 50.9818946, longitude: 4.8364398), telNr: "0475 55 95 71", foto: UIImage(named: "aarschot")!)
        let centrum3 = Centrum(naam: "Rijksadministratief centrum", address: Address(straat: "Goossensvest", nummer: "3", postcode: 3300, gemeente: "Tienen"), coordinates: Coordinates(latitude: 50.8033964, longitude: 4.9322219), telNr: "02 713 87 10", foto: UIImage(named: "tienen")!)
        let centrum4 = Centrum(naam: "Brabanthal", address: Address(straat: "Brabantlaan", nummer: "1", postcode: 3001, gemeente: "Leuven"), coordinates: Coordinates(latitude: 50.8552574, longitude: 4.7262073), telNr: "0800 16 916", foto: UIImage(named: "leuven")!)

        centra.append(centrum1)
        centra.append(centrum2)
        centra.append(centrum3)
        centra.append(centrum4)
        print(centra.count)
        
    }
    
    override func viewDidLoad() {
        print("loaded")
        loadCentra()
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        print("sections")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count")
        return centra.count
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            centra.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

    @IBAction func unwindToTable(_ sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddCentrumViewController, let centrum = sourceViewController.centrum {
            let newIndexPath = IndexPath(row: centra.count, section: 0)
            centra.append(centrum)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let DetailViewController = segue.destination as! CentrumDetailViewController
            let vaccinatiecentrum = sender as! CentrumTableViewCell
            let indexPath = tableView.indexPath(for: vaccinatiecentrum)
            let selectedVC = centra[indexPath!.row]
            DetailViewController.centrum = selectedVC}
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "CentrumTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CentrumTableViewCell else { fatalError("The cell is not an instance of CentrumTableViewCell.")}
        
        let centrum = centra[indexPath.row]
        
        cell.nameLabel.text = centrum.naam
        cell.cityLabel.text = centrum.address.gemeente
        cell.imgView.image = centrum.foto

        return cell    }
}
