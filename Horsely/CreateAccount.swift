//
//  CreateAccount.swift
//  Horsely
//
//  Created by Saba Dawit on 10/28/20.
//  Copyright © 2020 Saba Dawit. All rights reserved.
//

import SwiftUI
import MobileCoreServices

struct CreateAccount: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
          // 1.
          @FetchRequest(
            // 2.
            entity: Horses.entity(),
            // 3.
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Horses.name, ascending: true)
            ]
           
            // 4.
    )
    var create: FetchedResults<Horses>
    
    @Environment(\.managedObjectContext) var moc
          // 1.
          @FetchRequest(
            // 2.
            entity: HorseMedications.entity(),
            // 3.
            sortDescriptors: [
                NSSortDescriptor(keyPath: \HorseMedications.name, ascending: true)
            ]
           
            // 4.
    )
    var meds: FetchedResults<HorseMedications>
    @State var username: String = ""
    @State var password: String = ""
    @State var vetName: String = ""
    @State var vetNumber: String = ""
    @State var name: String = ""
    
    @State var other: String = ""
    @State private var admin = 0
    @State private var dosage = 0
    @State private var c_admin = 0
    @State private var c_dosage = 0
    @State private var o_admin = 0
    @State private var o_dosage = 0
    @State private var selectedB = 0
    @State private var selectedC = 0
    
    @EnvironmentObject var viewRouter: ViewRouter
    var bronchodilators = ["albuterol", "clenbuterol", "salmeterol", "ipratroprium", "None"]
    var corticosteroids = ["dexamethasone- ", "prednisolone", "fluticasone", "budesonide", "beclomethasone,ciclesonide", "None"]
    var route = ["oral", "injection", "inhaled", "None"]
    var dosageType = ["tablets", "milliliters", "cc's", "puffs"]
    var body: some View {
        NavigationView{
            VStack{
            Form{
                Section(header: Text("Login Information")) {
                        TextField("Username", text: $username)
                        TextField("Password", text: $password)
                }
                Section(header: Text("Horse")) {
                    TextField("Horse's Name", text: $name)
                }
                Section(header: Text("Bronchodilators")) {
                    VStack{
                        Picker(selection: $selectedB, label: Text("Medication")) {
                            ForEach(0 ..< bronchodilators.count) {
                                Text(self.bronchodilators[$0])
                            }
                        }
                        
                    }
                        Picker(selection: $admin, label: Text("Route of Administration")) {
                            ForEach(0 ..< route.count) {
                                Text(self.route[$0])
                            }
                        }
                        Picker(selection: $dosage, label: Text("Dosage")) {
                            ForEach(0 ..< dosageType.count) {
                                Text(self.dosageType[$0])
                            }
                        }
                    
                }
                Section(header: Text("Corticosteroids")) {
                    VStack{
                        Picker(selection: $selectedC, label: Text("Medication")) {
                            ForEach(0 ..< corticosteroids.count) {
                                Text(self.corticosteroids[$0])
                            }
                        }
                    }
                        Picker(selection: $c_admin, label: Text("Route of Administration")) {
                            ForEach(0 ..< route.count) {
                                Text(self.route[$0])
                            }
                        }
                        Picker(selection: $c_dosage, label: Text("Dosage")) {
                            ForEach(0 ..< dosageType.count) {
                                Text(self.dosageType[$0])
                            }
                        }
                    
                }
                Section(header: Text("Other")) {
                    
                        TextField("Name", text: $other)
                    VStack{
                        Picker(selection: $o_admin, label: Text("Route of Administration")) {
                            ForEach(0 ..< route.count) {
                                Text(self.route[$0])
                            }
                        }
                    }
                    VStack{
                        Picker(selection: $o_dosage, label: Text("Dosage")) {
                            ForEach(0 ..< dosageType.count) {
                                Text(self.dosageType[$0])
                            }
                        }
                    }
                }
                Section(header: Text("My Vet")) {
                    TextField("Name", text: $vetName)
                    TextField("Phone Number", text: $vetNumber)
                }
                
                
            }
            .navigationBarTitle("Create an Account")
            Button(action: {
                print("Pressed")
                self.viewRouter.currentPage = "page2"
                self.createAccount(name: self.name, username: self.username, password: self.password, vetName: self.vetName, vetNumber: self.vetNumber)
                self.newBroc(bronc: self.bronchodilators[self.selectedB], admin: self.route[self.admin], dosage: self.dosageType[self.dosage])
                self.newCort(cort: self.corticosteroids[self.selectedC], c_admin: self.route[self.c_admin], c_dosage: self.dosageType[self.c_dosage])
                self.newOther(other: self.other, o_admin: self.route[self.o_admin], o_dosage: self.dosageType[self.o_dosage])
            }) {
                CreateButtonContent()
            }
        }
        }
    }
    
    func createAccount(name: String, username: String, password: String, vetName: String, vetNumber: String) {
      // 1
        let newAccount = Horses(context: managedObjectContext)
      // 2
        newAccount.name = name
        newAccount.username = username
        newAccount.password = password
        newAccount.vetName = vetName
        newAccount.vetNumber = vetNumber

      // 3
      saveContext()
    }//closes function
    func newBroc(bronc: String, admin: String, dosage: String) {
      // 1
        let storeBronc = HorseMedications(context: moc)
        storeBronc.name = bronchodilators[selectedB]
        storeBronc.administration = admin
        storeBronc.dosageType = dosage
      // 2

      // 3
      saveContext()
    }//closes function
    func newCort(cort: String, c_admin: String, c_dosage: String) {
      // 1
        let storeCort = HorseMedications(context: moc)
      // 2
        storeCort.name = corticosteroids[selectedC]
        storeCort.administration = c_admin
        storeCort.dosageType = c_dosage
      // 3
      saveContext()
    }//closes function
    
    func newOther(other: String, o_admin: String, o_dosage: String) {
      // 1
        let storeOther = HorseMedications(context: moc)
      // 2
        storeOther.name = other
        storeOther.administration = o_admin
        storeOther.dosageType = o_dosage
      // 3
      saveContext()
    }//closes function
    func saveContext() {
      do {
        try managedObjectContext.save()
        try moc.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }//cl
}

struct ParentView : View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "page1" {
                CreateAccount()
            } else if viewRouter.currentPage == "page2" {
                Home()
            }
        }
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
