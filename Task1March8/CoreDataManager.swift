//
//  CoreDataManager.swift
//  Task1March8
//
//  Created by MAC on 08/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit
import  CoreData

class CoreDataManager: NSObject
{
	private class func  getContext () -> NSManagedObjectContext
	{
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		return appDelegate.persistentContainer.viewContext
		
	}
	//MARK :- TO Save Objects
	
	class func saveObject (username : String, userage : Int16,useremail : String)
	{
		let context =  CoreDataManager.getContext ()
		let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
		
		let manageObject  = NSManagedObject(entity: entity!,insertInto : context)
		manageObject.setValue(username, forKey: "name")
		manageObject.setValue(userage,forKey: "age")
		manageObject.setValue(useremail, forKey: "email")
		do
		{
			try context.save()
			print("saved")
		}
		catch let error as NSError
		{
			print("could not save. \(error),\(error.userInfo)")
		}
	}
	//MARK :- TO Fetch Objects
	class func fetchData () -> [Person]?
	{
		var personDetail:[Person]? = nil
		let  context  = CoreDataManager.getContext()
		do
		{
			personDetail = try context.fetch(Person.fetchRequest()) as? [Person]
			return personDetail
		}
		catch let error as NSError
		{
			print("Could not fetch. \(error), \(error.userInfo)")
			return nil
		}
	}	//MARK :- TO Delete Objects
	class func deleteObject(user: Person) 
	{
		let  context  = CoreDataManager.getContext()
		context.delete(user)
		do
		{
			try context.save()
			print("delete")
		}
		catch  let error as NSError
		{
			print("could not save.\(error),\(error.userInfo)")
		}
	}
	
	
//	Mark: To Update Data
	class func update(user: Int, username: String?, useremail: String?,userage:  Int16)
	{
		let context =  CoreDataManager.getContext ()
	 let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
	 var indexx = 0
	 do{
	 let table = try context.fetch(request) as! [NSManagedObject]
	 for persons in table{
	if indexx == user
	{
	persons.setValue(username, forKey: "name")
	persons.setValue(useremail,forKey: "email")
	persons.setValue(userage,forKey: "age")
	}
	indexx = indexx + 1
	}
	}
	catch{
	
	}
	}
	
//	class func update(user: Person,username: String?, useremail: String?,userage:  Int16)
//	{
//		let context =  CoreDataManager.getContext ()
//		let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
//
//		let manageObject  = NSManagedObject(entity: entity!,insertInto : context)
//		manageObject.setValue(username, forKey: "name")
//		manageObject.setValue(userage,forKey: "age")
//		manageObject.setValue(useremail, forKey: "email")
//		do
//		{
//			try context.save()
//			print("saved")
//		}
//		catch let error as NSError
//		{
//			print("could not save. \(error),\(error.userInfo)")
//		}
//	}
}
