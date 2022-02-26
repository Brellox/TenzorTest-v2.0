//
//  GenreViewController.swift
//  TenzorTest v2.0
//
//  Created by Иван Суслов on 25.02.2022.
//

import UIKit

class GenreViewController: UIViewController, GenreViewProtocol {
    
    var presenter: GenrePresenterProtocol!
    let configurator: GenreConfiguratorProtocol = GenreConfigurator()
    
    var delegate: GenreDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        self.title = "Genres"
        self.configureTable()
        self.presenter.getGenres()
    }
    
    func configureTable(){
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension GenreViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.genres.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.callBack(genre: self.presenter.genres[indexPath.row])
        self.presenter.router.goToMovies()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = self.presenter.genres[indexPath.row].name
        return cell
    }
    
}

extension GenreViewController: GenreApiDelegate{
    func GenresResult(list: [Genre]) {
        self.presenter.genres = list
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
