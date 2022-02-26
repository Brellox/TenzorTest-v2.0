//
//  DetailViewController.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import UIKit


class DetailViewController: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol!
    let configurator: DetailConfiguratorProtocol = DetailConfigurator()
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var overview: UITextView!
    @IBOutlet weak var castCollection: UICollectionView!
    @IBOutlet weak var crewCollection: UICollectionView!
    
    var movie: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        guard let m = self.movie else {return}
        self.title = m.title
        self.presenter.getMembers(movie: m.id)
        self.setInfo(movie: m)
        setCollections()
        
    }
    
    func setNavigation(){
        
    }
    
    private func setCollections(){
        castCollection.register(UINib(nibName: "MovieCollectionCell", bundle:  nil), forCellWithReuseIdentifier: "MovieCollectionCell")
        crewCollection.register(UINib(nibName: "MovieCollectionCell", bundle:  nil), forCellWithReuseIdentifier: "MovieCollectionCell")
        
        castCollection.dataSource = self
        castCollection.delegate = self
        
        crewCollection.dataSource = self
        crewCollection.delegate = self
    }
    
    private func setInfo(movie: Movie){
        
        if let path = movie.poster_path{
            self.poster.setImage(url: path)
        }
        self.name.text = movie.title
        self.rating.text = String(movie.popularity)
        self.overview.text = movie.overview
    }

}



extension DetailViewController: DetailApiDelegate{
    func MemberResult(cast: [Cast], crew: [Crew]) {
        self.presenter.cast = cast
        self.presenter.crew = crew
        DispatchQueue.main.async {
            self.crewCollection.reloadData()
            self.castCollection.reloadData()
        }
    }
    
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case castCollection:
            return self.presenter.cast.count
        default:
            return self.presenter.crew.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case castCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
            
            cell.configure(with: self.presenter.cast[indexPath.row])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
            
            cell.configure(with: self.presenter.crew[indexPath.row])
            return cell
        }
    }
    
    
}
