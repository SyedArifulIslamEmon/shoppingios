//
//  ViewController.swift
//  r3piShopping
//
//  Created by Sean Denton on 7/30/16.
//  Copyright © 2016 Sean Denton. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        let managedContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest()
        let entity = NSEntityDescription.entityForName("Product", inManagedObjectContext: managedContext)
        request.entity = entity
        
        // var error: NSError? = nil
        let results: [AnyObject]?
        do {
            results = try managedContext.executeFetchRequest(request)
        } catch let error1 as NSError {
            print(error1)
            results = nil
        }
        print(results)
        
        loadTestData()
        
       
        
    }
    func loadTestData(){
     SampleData().loadSampleData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

