//
//  ViewController.swift
//  MVVMexample-3 RickAndMorty
//
//  Created by Ahmet WOW on 18/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sgmType: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! RickAndMortyCollectionCell
        cell.configureCell()
        return cell
    }
    
    
}
extension ViewController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let newWidth = ( self.view.frame.size.width / 2) - 24
        
        
        return CGSize(width: newWidth , height: 275)
    }
    
}
