//
//  MainViewController.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    var presenter: MainPresenterProtocol!
    let configurator: MainConfiguratorProtocol = MainConfigurator()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var genreButton: UIButton!
    private let refreshControl = UIRefreshControl()
    
    private let sectionInsets = UIEdgeInsets(
          top: 4.0,
          left: 16.0,
          bottom: 4.0,
          right: 16.0)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.configureView()
        
        self.title = "Movies"
        self.genreButton.setTitle("Select a genre", for: .normal)
        self.setCollection()

        refreshControl.addTarget(self, action: #selector(refreshPostLineData(_:)), for: .valueChanged)
        

        
    }
   
    @IBAction func pushGenres(_ sender: Any) {
        self.presenter.router.chooseGenre()
    }
    
    @objc private func refreshPostLineData(_ sender: Any) {
        self.presenter.currentPage += 1
        self.presenter.getMovies(genre: self.presenter.currentGenre)
    }
    
        private func setCollection(){
            self.collectionView.register(UINib(nibName: "MovieCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionCell")
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
            self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
            self.collectionView.refreshControl = refreshControl
        }
    
    }
    
    extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.presenter.dataArray.count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
            cell.configure(with: self.presenter.dataArray[indexPath.row])
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.presenter.router.goToDetails(movie: self.presenter.dataArray[indexPath.row])
    
        }
    
        func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
            let paddingSpace = sectionInsets.left * (2 + 1)
            let availableWidth = view.frame.width - paddingSpace
            let availableHeight = view.frame.height - sectionInsets.bottom*(3)-50
            let heightPerItem = availableHeight/3
            let widthPerItem = availableWidth / 2
            
            return CGSize(width: widthPerItem, height: heightPerItem)
        }
        
         func collectionView(
           _ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           insetForSectionAt section: Int
         ) -> UIEdgeInsets {
           return sectionInsets
         }
    
         func collectionView(
           _ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           minimumLineSpacingForSectionAt section: Int
         ) -> CGFloat {
           return sectionInsets.left
         }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
        }
    
    }

extension MainViewController: MainApiDelegate{
    func MovieResult(list: [Movie], maxPages: Int) {
        DispatchQueue.main.async{
            if self.presenter.currentPage == 1 {
                self.presenter.dataArray = []
            }
            self.presenter.dataArray.append(contentsOf: list)
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    
}

extension MainViewController: GenreDelegate{
    func callBack(genre: Genre) {
        self.genreButton.setTitle(genre.name, for: .normal)
        self.presenter.currentGenre = genre.id
        self.presenter.currentPage = 1
        self.presenter.getMovies(genre: self.presenter.currentGenre)
    }
}
