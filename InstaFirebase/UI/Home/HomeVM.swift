//
//  HomeVM.swift
//  InstaFirebase
//
//  Created by Hakan Adanur on 24.01.2023.
//

import Foundation
import UIKit
import Firebase

protocol HomeVMDelegate: AnyObject {
    func fetchDataSuccess()
    func fetchDataError()
}

class HomeVM{
    weak var delegate: HomeVMDelegate?
    var images = [imageModel]()
    
    func getDataFromFirebase(){
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("Posts").addSnapshotListener { (snapshot, error) in
            if error != nil {
                self.delegate?.fetchDataError()
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        print(documentID)
                        
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.images.append(imageModel(imageUrl: imageUrl))
                            self.delegate?.fetchDataSuccess()
                        }
                    }
                }
            }
        }
    }
}
