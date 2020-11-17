//
//  Core data.swift
//  WeatherShow
//
//  Created by Hoorad Ramezani on 11/17/20.
//

import Foundation
import CoreData

class DataManagement {
        
    // MARK: - Core Data stack
    open lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1] as NSURL
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application.
        let modelURL = Bundle.main.url(forResource: "WeatherShow", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    open lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("WeatherShow.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                               configurationName: nil,
                                               at: url, options: nil)
        } catch {
            // Report any error we got.
            abort()
        }
        
    return coordinator
    }()
    
    open lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    func saveName(data:HomeModel,date:String) {
        let entity =  NSEntityDescription.entity(forEntityName: "History", in:managedObjectContext!)
        let item = NSManagedObject(entity: entity!, insertInto:managedObjectContext!)
        item.setValue(data.dt, forKey: "id")
        item.setValue(data.main.temp, forKey: "temp")
        item.setValue(date, forKey: "date")
        do {
            try managedObjectContext!.save()
            print("Data Saved")
        } catch _ {
            print("Something went wrong.")
        }
    }
    
    func fetchAndPrintEachPerson() -> [History]? {
        let fetchRequest = NSFetchRequest<History>(entityName: "History")
        do {
            let fetchedResults = try managedObjectContext!.fetch(fetchRequest)
            return fetchedResults
        } catch let error as NSError {
            // something went wrong, print the error.
            print(error.description)
            return nil
        }
    }
}
