//
//  ViewController.swift
//  RxMoyaExample
//
//  Created by Obde Willy on 27/02/23.
//

import Moya
import Moya_ModelMapper
import UIKit
import RxCocoa
import RxSwift

class IssueListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let disposeBag = DisposeBag()
    var provider: MoyaProvider<GitHub>!
    var latestRepositoryName: Observable<String> {
        return searchBar
            .rx.text
            .orEmpty
            .debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
    }
    
    func setupRx() {
        // First part of the puzzle, create our Provider
        provider = MoyaProvider()
        
        // Here we tell table view that if user clicks on a cell,
        // and the keyboard is still visible, hide it
        tableView
            .rx.itemSelected
            .subscribe(onNext: { indexPath in
                if self.searchBar.isFirstResponder == true {
                    self.view.endEditing(true)
                }
            })
            .disposed(by: disposeBag)
    }
}

