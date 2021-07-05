//
//  PhotoUserViewModel.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

final class PhotoUserViewModel: ResponseForViewDelegate {
    
    
    var userViewModel = UserViewModel()
    var albumViewModel = AlbumViewModel()
    var photoViewModel = PhotoViewModel()
    
    
    var listener: [String: Bool] = ["UserViewModel": false, "AlbumViewModel": false, "PhotoViewModel": false] {
        didSet {
            if listener["UserViewModel"] == true && listener["AlbumViewModel"] == true && listener["PhotoViewModel"] == true {
                
                for index in 0 ..< albumViewModel.albumDataSource.count {
                    self.append3Photos(from: albumViewModel.albumDataSource[index].id!, index: index)
                }
                for index in 0 ..< userViewModel.userDataSource.count {
                    self.append3Albums(from: userViewModel.userDataSource[index].id!, index: index)
                }
                
                responseDelegate?.getResponse(response: "")
            }
        }
    }
    
    weak var responseDelegate: ResponseForViewDelegate?
    
    func getData() {
        userViewModel.responseDelegate = self
        albumViewModel.responseDelegate = self
        photoViewModel.responseDelegate = self
        
        userViewModel.getData()
        albumViewModel.getData()
        photoViewModel.getData()
    }
    
    func append3Photos(from albumID: Int, index: Int){ // For Thumbnail
        let photos = photoViewModel.photoDataSource.filter { photoModel in
            photoModel.albumId == albumID
        }
        albumViewModel.albumDataSource[index].photos = [PhotoModel]()
        for photo in photos {
            albumViewModel.albumDataSource[index].photos?.append(photo)
        }
        albumViewModel.albumDataSource[index].first3Photos = [PhotoModel]()
        albumViewModel.albumDataSource[index].first3Photos?.append(photos[0])
        albumViewModel.albumDataSource[index].first3Photos?.append(photos[1])
        albumViewModel.albumDataSource[index].first3Photos?.append(photos[2])
        
    }
    
    func append3Albums(from userID: Int, index: Int){ // For Thumbnail
        let albums = albumViewModel
            .albumDataSource.filter { albumModel in
                albumModel.userId == userID
        }
        userViewModel.userDataSource[index].albums = [AlbumModel]()
        for album in albums {
            userViewModel.userDataSource[index].albums?.append(album)
        }
        userViewModel.userDataSource[index].first3Albums = [AlbumModel]()
        userViewModel.userDataSource[index].first3Albums?.append(albums[0])
        userViewModel.userDataSource[index].first3Albums?.append(albums[1])
        userViewModel.userDataSource[index].first3Albums?.append(albums[2])
        
    }
    
    func getResponse(response: Any?) {
        if let _ = response as? [UserModel] {
            listener["UserViewModel"] = true
        }
        if let _ = response as? [PhotoModel] {
            listener["PhotoViewModel"] = true
        }
        if let _ = response as? [AlbumModel] {
            listener["AlbumViewModel"] = true
        }
    }
}
