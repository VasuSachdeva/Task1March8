//
//  ViewController.swift
//  Task1March8
//
//  Created by MAC on 08/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var currentIndex = 0
	
	var userInfo = [Person]()
	@IBOutlet weak var tableViewOutlet: UITableView!
	@IBOutlet weak var name: UITextField!
	@IBOutlet weak var email: UITextField!
//	var coredata : CoreDataManager?
//
	override func viewDidLoad() {
		super.viewDidLoad()
	self.tableViewOutlet.delegate = self
		self.tableViewOutlet.dataSource = self
//		coredata = CoreDataManager()
		
	}
	@IBOutlet weak var age: UITextField!

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func saveButton(_ sender: UIButton) {
		let Name = (self.name.text ?? "")
		let Email = self.email.text ?? ""
		let Age = Int16(self.age.text!) ?? 0
	
		CoreDataManager.saveObject(username: Name , userage: Age, useremail: Email)
		print("button clicked")

		
	}
	
	@IBAction func fetchButton(_ sender: UIButton) {
		print("fetch")
		userInfo = (CoreDataManager.fetchData())!
		
		tableViewOutlet.reloadData()
}
	@IBAction func deleteButton(_ sender: UIButton) {
		CoreDataManager.deleteObject(user: userInfo[currentIndex])
		userInfo.remove(at: currentIndex)
		self.tableViewOutlet.reloadData()
	}
	
	@IBAction func updateButton(_ sender: UIButton) {
		let username = self.name.text
		let useremail = self.email.text
		let userage = Int16(self.age.text!)
		
		CoreDataManager.update(user: currentIndex, username: username, useremail: useremail,userage:userage!)
		print(currentIndex)
		self.tableViewOutlet.reloadData()

	}
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return userInfo.count
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
		let user = self.userInfo[indexPath.row]
		cell.namelabel.text = user.name
		cell.agelabel.text = String(user.age)
		cell.emaillabel.text = user.email
		return cell
		

	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 80
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		return currentIndex = indexPath.row
	}

}


