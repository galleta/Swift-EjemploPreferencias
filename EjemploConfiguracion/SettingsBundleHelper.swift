//
//  SettingsBundleHelper.swift
//  EjemploConfiguracion
//
//  Created by Francisco Jesús Delgado Almirón on 7/8/18.
//  Copyright © 2018 Francisco Jesús Delgado Almirón. All rights reserved.
//

import Foundation

class SettingsBundleHelper
{
    // Estructura con toda la información de las preferencias de la app
    struct SettingsBundleKeys
    {
        static let Dato = "dato_preference"
        static let BuildVersionKey = "build_preference"
        static let AppVersionKey = "version_preference"
        static let RedThemeKey = "RedThemeKey"
    }
    
    class func checkAndExecuteSettings()
    {
        /*if UserDefaults.standard.bool(forKey: SettingsBundleKeys.Reset)
        {
            UserDefaults.standard.set(false, forKey: SettingsBundleKeys.Reset)
            let appDomain: String? = Bundle.main.bundleIdentifier
            UserDefaults.standard.removePersistentDomain(forName: appDomain!)
            // reset userDefaults..
            // CoreDataDataModel().deleteAllData()
            // delete all other user data here..
        }*/
    }
    
    // Cambia automáticamente la versión y el build number de la app
    class func setVersionAndBuildNumber()
    {
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.set(version, forKey: "version_preference")
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.set(build, forKey: "build_preference")
    }
}
