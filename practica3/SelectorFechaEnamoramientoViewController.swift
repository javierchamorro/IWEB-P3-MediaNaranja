//
//  SelectorFechaEnamoramientoViewController.swift
//  practica3
//
//  Created by Oscar Sanchez Rueda on 20/10/2017.
//  Copyright © 2017 Oscar Sanchez Rueda. All rights reserved.
//

import UIKit

class SelectorFechaEnamoramientoViewController: UIViewController {
    
    
    var fechaNac : Date = Date()
    
    
    
    @IBOutlet weak var selectorFechaEnamoramiento: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let fecha_enam = defaults.object(forKey: "fecha_enam") as? Date{
            selectorFechaEnamoramiento.date = fecha_enam
        } else {
            selectorFechaEnamoramiento.date = Date()
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        
        if identifier == "fechaEnamoramientoSeleccionada" {
            
            if fechaNac.compare(selectorFechaEnamoramiento.date) == .orderedDescending {
            
            let msg : String? = "Atencion"
            let msg2 : String? = "La fecha de enamoramiento no puede ser anterior a la de nacimiento"
            
            let alert = UIAlertController(title: msg, message: msg2, preferredStyle: UIAlertControllerStyle.alert)
            
                let acc : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                
            alert.addAction(acc)
            
            present(alert, animated: true)
                return false
            }
            
        }
        return true
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "fechaEnamoramientoSeleccionada" {
            
            let defaults = UserDefaults.standard
            defaults.set(fechaNac, forKey: "fecha_nac")
            defaults.set(selectorFechaEnamoramiento.date, forKey: "fecha_enam")
            defaults.synchronize()
            
            if let vCPrincipal = segue.destination as? ViewController {
                
                //var dateFormatter = DateFormatter()
                //dateFormatter.dateStyle = .medium
                
                vCPrincipal.fechaNac = fechaNac
                vCPrincipal.fechaEnam = selectorFechaEnamoramiento.date
            }
        }
        
    }
    
    
}

