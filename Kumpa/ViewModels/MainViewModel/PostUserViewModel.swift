//
//  PostUserViewModel.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

final class PostUserViewModel: ResponseForViewDelegate {
    
    
    var userViewModel = UserViewModel()
    var postViewModel = PostViewModel()
    var commentViewModel = CommentViewModel()
    
    weak var responseDelegate: ResponseForViewDelegate?
    
    var listener: [String: Bool] = ["UserViewModel": false, "PostViewModel": false, "CommentViewModel": false] {
        didSet {
            if listener["UserViewModel"] == true && listener["PostViewModel"] == true && listener["CommentViewModel"] == true{
                
                appendAlbumWithComments()
                
                responseDelegate?.getResponse(response: "")
            }
        }
    }
    
    func getData(){
        userViewModel.responseDelegate = self
        postViewModel.responseDelegate = self
        commentViewModel.responseDelegate = self
        
        userViewModel.getData()
        postViewModel.getData()
        commentViewModel.getData()
    }
    
    func appendAlbumWithComments(){
        for index in 0 ..< postViewModel.postDataSource.count {
            self.appendComments(from: postViewModel.postDataSource[index].id ?? 0, index: index)
        }
    }
    
    func getUserNameByID(for id: Int) -> String{
        let res = userViewModel.userDataSource.first { user in
            user.id == id
        }
        return res?.username ?? ""
    }
    
    func appendComments(from postId: Int, index: Int){ // For Thumbnail
        let comments = commentViewModel.dataSource.filter { commentModel in
            commentModel.postId == postId
        }
        postViewModel.postDataSource[index].comments = [CommentModel]()
        for comment in comments {
            postViewModel.postDataSource[index].comments?.append(comment)
        }
        
    }
    
    func getResponse(response: Any?) {
        if let _ = response as? [UserModel] {
            listener["UserViewModel"] = true
        }
        if let _ = response as? [PostModel] {
            listener["PostViewModel"] = true
        }
        if let _ = response as? [CommentModel] {
            listener["CommentViewModel"] = true
        }
    }
}
