//
//  HomeVC.swift
//  InstaFirebase
//
//  Created by Hakan Adanur on 23.01.2023.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: HomeVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postCell = UINib(nibName: "PostCell", bundle: nil)
        tableView.register(postCell, forCellReuseIdentifier: "PostCell")
        
        let storyCell = UINib(nibName: "StoryCell", bundle: nil)
        collectionView.register(storyCell, forCellWithReuseIdentifier: "StoryCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel.delegate = self
        viewModel.getDataFromFirebase()
    }
}

extension HomeVC {
    static func create() -> HomeVC {
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        vc.viewModel = HomeVM()
        return vc
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let data = viewModel.images[indexPath.row]
        cell.configure(image: data)
        return cell
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        let data = viewModel.images[indexPath.row]
        cell.configure(image: data)
        return cell
    }
}

extension HomeVC: HomeVMDelegate{
    func fetchDataSuccess() {
        self.tableView.reloadData()
        self.collectionView.reloadData()
    }
    
    func fetchDataError() {
        self.showAlert(title: "Error", message: "Try Again")
    }
}
