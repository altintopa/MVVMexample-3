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
    
    var deneme : RickAndMortyServiceProtocol?
    
    var DataArr = [RickAndMortyModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDataFromApi()
    }
    
    func getData(){
        
        let task = URLSession.shared.dataTask(with: URL(string: ServiceConstants.RickUrl.url.rawValue)!) { (data, response, error) in
            if error != nil {
                print("Nope !")
            }else {
                if data != nil {
                    do {
                        let response = try JSONDecoder().decode([RickAndMortyModel].self, from: data!)
                        DispatchQueue.main.async {
                            self.DataArr = response
                            self.collectionView.reloadData()
                        }
                    }
                    catch {
                        print("N O O O !")
                    }
                }
            }
        }
        task.resume()

        
    }
    
    func getDataFromApi() {
        
        if DataArr.count < 1 {  /// wiilAppear ' da çalıştığından dolayı ekran her açıldığında  API'den data çekiyor. Engellemek için !
          
            let url = URL(string: "https://rickandmortyapi.com/api/character")
            let session = URLSession.shared
            
            let task = session.dataTask(with: url!) { (data, response, error) in
                if  error != nil {
                    let alert = UIAlertController(title: "Nope !", message: error?.localizedDescription,preferredStyle: UIAlertController.Style.alert)
                    
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    if data != nil {
                        do {
                            let response = try JSONDecoder().decode([RickAndMortyModel].self, from: data!)
                            DispatchQueue.main.async {
                                self.DataArr = response
                                self.collectionView.reloadData()
                            }
                            
                        } catch {
                            print(" NOOO ! ")
                        }
                    }
                }
            }
            task.resume()
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if DataArr.count > 0 {
            return DataArr.count
        } else {
            return 12
        }
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
        
        
        return CGSize(width: newWidth , height: 240)
    }
    
}
