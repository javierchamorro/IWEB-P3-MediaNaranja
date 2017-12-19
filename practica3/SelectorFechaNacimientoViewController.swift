//
//  SelectorFechaNacimientoViewController.swift
//  practica3
//
//  Created by Oscar Sanchez Rueda on 20/10/2017.
//  Copyright © 2017 Oscar Sanchez Rueda. All rights reserved.
//

import UIKit

class SelectorFechaNacimientoViewController: UIViewController {

    @IBOutlet weak var selectorFechaNacimiento: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let fecha_nac = defaults.object(forKey: "fecha_nac") as? Date{
            selectorFechaNacimiento.date = fecha_nac
        } else {
            selectorFechaNacimiento.date = Date()
        }

        
       // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        
        if identifier == "fechaNacSeleccionada" {
            
            if selectorFechaNacimiento.date.compare(Date()) == .orderedDescending {
                
                let msg : String? = "Atencion"
                let msg2 : String? = "No puedes haber nacido en una fecha posterior a la actual"
                
                let alert = UIAlertController(title: msg, message: msg2, preferredStyle: UIAlertControllerStyle.alert)
                
                let acc : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                
                alert.addAction(acc)
                
                present(alert, animated: true)
                return false
            }
            
        }
        return true
        
    }
    
    
    
    
    
    @IBAction func atras(_ segue : UIStoryboardSegue){
    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "fechaNacSeleccionada" {
            
            
            
            if let sfevc = segue.destination as? SelectorFechaEnamoramientoViewController{
                
              // var dateFormatter = DateFormatter()
               // dateFormatter.dateStyle = .medium
                
                sfevc.fechaNac = selectorFechaNacimiento.date
                
            }
        }
        
    }
    

}
