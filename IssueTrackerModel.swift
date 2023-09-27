//
//  IssueTrackerModel.swift
//  RxMoyaExample
//
//  Created by Obde Willy on 27/02/23.
//

import Foundation
import Moya
import Mapper
import Moya_ModelMapper
import RxOptional
import RxSwift

struct IssueTrackerModel {
    
    let provider: MoyaProvider<GitHub>
    let repositoryName: Observable<Any>
    
    func trackIssues() -> Observable<[Issue]> {
        
    }
    
    internal func findIssues(repository: Repository) -> Observable<[Issue]> {
        return (self.provider
            .request(GitHub.issues(repositoryFullName: repository.fullName), completion: { result in
              print(result)
                switch result {
                case let .next: {
                    
                }
                case let .error: {
                    
                }
                }
            })
        as! Observable<[Issue]>)
        .map({ item in
            <#code#>
        })
        .mapObjectOptional<Issue>()
    }
    
    internal func findRepository(name: String) -> Observable<Repository> {
        return self.provider
               .request(GitHub.repo(fullName: name), completion: { result in
                   print(result)
                 }) as! Observable<Repository>
    }
}
