//
//  ViewController.swift
//  EjemploConfiguracion
//
//  Created by Francisco Jesús Delgado Almirón on 7/8/18.
//  Copyright © 2018 Francisco Jesús Delgado Almirón. All rights reserved.
//

// Tutorial: https://medium.com/@abhimuralidharan/adding-settings-to-your-ios-app-cecef8c5497

import UIKit

class ViewController: UIViewController
{
    // Método para abrir la configuración de la app directamente
    @IBAction func funcionBotonConfiguracion(_ sender: Any)
    {
        let alertController = UIAlertController (title: "Información ", message: "¿Abrir configuración?", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Configuración", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)
                else
                {
                    return
                }
            
            if UIApplication.shared.canOpenURL(settingsUrl)
            {
                UIApplication.shared.open(settingsUrl, completionHandler:
                    {
                        (success) in
                            print("Settings opened: \(success)") // Prints true
                    })
            }
        }
        
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Código para lanzar las preferencias
        registerSettingsBundle()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
        defaultsChanged()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Funciones para las preferencias
    
    // Carga las preferencias
    func registerSettingsBundle()
    {
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
    // Mira si las preferencias han cambiado y hace algo
    @objc func defaultsChanged()
    {
        // Cambio el color de fondo de la app
        if UserDefaults.standard.bool(forKey: "RedThemeKey")
        {
            self.view.backgroundColor = UIColor.red
        }
        else
        {
            self.view.backgroundColor = UIColor.green
        }
    }
    
    //Not needed for iOS9 and above. ARC deals with the observer in higher versions.
    /*
     Las preferencias se guardan en memoria, así que para liberarlas hace falta este método.
     Así nos ahorramos problemas futuros.
    */
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }

}

