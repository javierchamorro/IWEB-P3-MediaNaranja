//
//  ViewController.swift
//  practica3
//
//  Created by Oscar Sanchez Rueda on 20/10/2017.
//  Copyright © 2017 Oscar Sanchez Rueda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fechaNacimientoLabel: UILabel!
    
    @IBOutlet weak var fechaEnamoramientoLabel: UILabel!
    
    @IBOutlet weak var fechaMuerteLabel: UILabel!
   
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var resLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var msg : String = ""
    var msg2 : String = ""
    var msg3 : String = ""
    
    var fechaNac : Date = Date()
   
    var fechaEnam : Date = Date()
 
 
    var timer : Timer!
    var seconds : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Persistencia
       let defaults = UserDefaults.standard
        if let fecha_nac = defaults.object(forKey: "fecha_nac") as? Date{
            fechaNac = fecha_nac
        } else {
            fechaNac = Date()
        }
        
        if let fecha_enam = defaults.object(forKey: "fecha_enam") as? Date{
            fechaEnam = fecha_enam
        } else {
            fechaEnam = Date()
        }
 
        runTimer()

        //Fecha de muerte
        let intervalo = fechaEnam.timeIntervalSince(fechaNac)
        let fechaMuerte : Date = fechaEnam.addingTimeInterval(intervalo)
        seconds = Int(fechaEnam.timeIntervalSince(fechaNac))

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        msg=dateFormatter.string(from: fechaNac)
       msg2=dateFormatter.string(from: fechaEnam)
        msg3=dateFormatter.string(from: fechaMuerte)
        
        fechaNacimientoLabel.text = "Fecha de Nacimiento: "+msg
        fechaEnamoramientoLabel.text = "Fecha de Enamoramiento: "+msg2
        fechaMuerteLabel.text = "Fecha de Muerte: "+msg3
    }
    
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer(){
        if(seconds != 0){
        seconds! -= 1
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    }
    
    
    func timeString(time:TimeInterval) -> String{
        let days = Int(time)/(3600*24)
        let hours = Int(time)/3600 % 24
        let minutes = Int(time)/60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "Te quedan %02i dias %02i horas %02i minutos %02i segundos de vida",days, hours, minutes, seconds)
    }
    
    @IBAction func finaliza(_ segue : UIStoryboardSegue){
        
        //Fecha de muerte
        let intervalo = fechaEnam.timeIntervalSince(fechaNac)
        let fechaMuerte : Date = fechaEnam.addingTimeInterval(intervalo)
        seconds = Int(fechaEnam.timeIntervalSince(fechaNac))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        msg=dateFormatter.string(from: fechaNac)
        msg2=dateFormatter.string(from: fechaEnam)
        msg3=dateFormatter.string(from: fechaMuerte)
        
        fechaNacimientoLabel.text = "Fecha de Nacimiento: "+msg
        fechaEnamoramientoLabel.text = "Fecha de Enamoramiento: "+msg2
        fechaMuerteLabel.text = "Fecha de Muerte: "+msg3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}

