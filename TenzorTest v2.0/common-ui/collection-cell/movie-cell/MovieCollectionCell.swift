//
//  MovieCollectionCell.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 26.02.2022.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    func configure(with movie: Movie){
        self.title.text = movie.title
        self.rating.text = String(movie.popularity)
        if let path = movie.poster_path{
            self.poster.setImage(url: path)
        } else{
            self.poster.image = UIImage(named: "blankMovie")
        }
        
    }
    
    func configure(with cast: Cast){
        self.title.text = cast.name
        self.rating.text = cast.known_for_department
        if let path = cast.profile_path{
            self.poster.setImage(url: path)
        }else {
            if cast.gender == 1 {
                self.poster.image = UIImage(named: "blankFem")
            }else{
                self.poster.image = UIImage(named: "blankMale")
                }
            }
        
    }
    
    func configure(with crew: Crew){
        self.title.text = crew.name
        self.rating.text = crew.known_for_department
        if let path = crew.profile_path{
            self.poster.setImage(url: path)
        }else {
            if crew.gender == 1 {
                self.poster.image = UIImage(named: "blankFem")
            }else{
                self.poster.image = UIImage(named: "blankMale")
                }
            }
        
    }
    
    override func prepareForReuse() {
        self.poster.image = UIImage()
        self.title.text = ""
        self.rating.text = ""
    }
}
