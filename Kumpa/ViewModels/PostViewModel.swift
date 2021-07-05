//
//  PostViewModel.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

final class PostViewModel: ViewModel {
    
    var postDataSource = [PostModel]()
    
    weak var responseDelegate: ResponseForViewDelegate?
    
    func getData() {
        let request = PostService()
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: [String:Any]()) { [weak self]models, error in
            if let _ = error {
                self?.responseDelegate?.getResponse(response: models)
            }else {
                if let models = models{
                    self?.postDataSource = models
                    self?.responseDelegate?.getResponse(response: models)
                }
                
            }
        }
    }
    
}
