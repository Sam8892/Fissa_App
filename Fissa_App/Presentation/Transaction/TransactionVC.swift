//
//  TransactionVC.swift
//  Fissa_App
//
//  Created by Stage2021 on 25/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit

class TransactionVC: UIViewController {
    
    let firestoreManager = DatabaseManager()

    override func viewDidLoad() {
        super.viewDidLoad()
     //   addTask(taskText: "by Saddem")
        // Do any additional setup after loading the view.
     //   firestoreManager.addToList(firstName: "test", lastName: "tedtdt", email: "test@efd.com", password: "123456789", description: "dedede" , adress: "rue de libertéé",  city:  " city city ", country: "Tunisia")
         firestoreManager.testFireStore(firstName: "saddemTest", lastName: "LaifiTest", image: "http/mp/imageTest")
    }

    func addTask(taskText: String) {
     /*  firestoreManager.addToList(taskDescription: taskText, completion: { (status) in
            if status {
                print("Status ** :", status)
            }
        })*/
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
