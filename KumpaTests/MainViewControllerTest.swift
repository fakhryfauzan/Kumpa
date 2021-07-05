//
//  MainViewControllerTest.swift
//  KumpaUITests
//
//  Created by MNC BANK 2 on 05/07/21.
//

import XCTest
@testable import Kumpa
class MainViewControllerTest: XCTestCase {

    var sut: ViewController!
    var postDataSource = [PostModel]()
    var userDataSource = [UserModel]()
    var commentDataSource = [CommentModel]()
    
    override func setUpWithError() throws {
        // INJECT
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        _ = sut.view
        
        postDataSource = postHITAPI()
        userDataSource = userHITAPI()
        commentDataSource = commentHITAPI()
        
        sut.postUserViewModel.postViewModel.postDataSource = postDataSource
        sut.postUserViewModel.userViewModel.userDataSource = userDataSource
        sut.postUserViewModel.commentViewModel.dataSource = commentDataSource
        
        sut.postUserViewModel.appendAlbumWithComments()
        
        sut.postTableView.reloadData()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetFirstUsernameByID() throws {
        let userName = sut.postUserViewModel.getUserNameByID(for: 1)
        XCTAssertEqual(userName, "Bret")
    }
    
    func testGetSecondUsernameByID() throws {
        let userName = sut.postUserViewModel.getUserNameByID(for: 2)
        XCTAssertEqual(userName, "Antonette")
    }
    
    func testFirstPostTableViewCell() throws{
        // Test bandingan nama post di cell pertama
        
        let userName = sut.postUserViewModel.getUserNameByID(for: 1)
        
        //WHEN
        let cell = getPostCell(for: 0)
        let firstNameLabel = cell.postedByLabel.text
        
        //THEN
        XCTAssertEqual(firstNameLabel, "Posted By \(userName)")
    }
    func testSecondPostTableViewCell() throws{
        // Test bandingan nama post di cell pertama
        
        let userName = sut.postUserViewModel.getUserNameByID(for: 1)
        
        //WHEN
        let cell = getPostCell(for: 1)
        let firstNameLabel = cell.postedByLabel.text
        
        //THEN
        XCTAssertEqual(firstNameLabel, "Posted By \(userName)")
    }
    
    func postHITAPI() -> [PostModel]{ // MOCK
        var post = [PostModel]()
        let exp = expectation(description: "Post berhasil didownload")
        let mockService = PostAPIMock()
        let apiLoader = APILoader(apiHandler: mockService)
        apiLoader.loadAPIRequest(requestData: [String : Any]()) { model, error in
            if let model = model {
                post = model
            }
            XCTAssertNotNil(model, "Gagal Download")
            XCTAssertEqual(model?.count, 100)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 15)
        
        return post
    }
    
    func userHITAPI() -> [UserModel]{ // MOCK
        var user = [UserModel]()
        let exp = expectation(description: "User berhasil didownload")
        let mockService = UserAPIMock()
        let apiLoader = APILoader(apiHandler: mockService)
        apiLoader.loadAPIRequest(requestData: [String : Any]()) { model, error in
            if let model = model {
                user = model
            }
            XCTAssertNotNil(model, "Gagal Download")
            XCTAssertEqual(model?.count, 10)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 15)
        
        return user
    }
    
    func commentHITAPI() -> [CommentModel]{ // MOCK
        var comment = [CommentModel]()
        let exp = expectation(description: "Comment berhasil didownload")
        let mockService = CommentAPIMock()
        let apiLoader = APILoader(apiHandler: mockService)
        apiLoader.loadAPIRequest(requestData: [String : Any]()) { model, error in
            if let model = model {
                comment = model
            }
            XCTAssertNotNil(model, "Gagal Download")
            XCTAssertEqual(model?.count, 500)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 15)
        
        return comment
    }
    
    func getPostCell(for index: Int) -> PostTableViewCell {
        return sut.postTableView.dataSource?.tableView(sut.postTableView, cellForRowAt: IndexPath(item: index, section: 0)) as! PostTableViewCell
    }
    
    func testPostServiceFAILMOCK() throws {
        
        //INJECT
        let exp = expectation(description: "Post Stat berhasil didownload")
        let mockService = PostAPIFAILMock()
        let apiLoader = APILoader(apiHandler: mockService)
        
        //WHEN
        apiLoader.loadAPIRequest(requestData: [String : Any]()) { model, error in
            
            //THEN
            if let error = error { // Akan kesini karena MOCK Fail
                print(error)
                XCTAssertNotNil(error, error.message)
                exp.fulfill()
            }else {
                XCTAssertNotNil(model, "Gagal Download")
                XCTAssertEqual(model?.count, 29)
                exp.fulfill()
            }
            
        }
        wait(for: [exp], timeout: 15)
    }
    
    func testUserServiceFAILMOCK() throws {
        
        //INJECT
        let exp = expectation(description: "User Stat berhasil didownload")
        let mockService = PostAPIFAILMock()
        let apiLoader = APILoader(apiHandler: mockService)
        
        //WHEN
        apiLoader.loadAPIRequest(requestData: [String : Any]()) { model, error in
            
            //THEN
            if let error = error { // Akan kesini karena MOCK Fail
                print(error)
                XCTAssertNotNil(error, error.message)
                exp.fulfill()
            }else {
                XCTAssertNotNil(model, "Gagal Download")
                XCTAssertEqual(model?.count, 29)
                exp.fulfill()
            }
            
        }
        wait(for: [exp], timeout: 15)
    }

    
    func testCommentServiceFAILMOCK() throws {
        
        //INJECT
        let exp = expectation(description: "Comment Stat berhasil didownload")
        let mockService = CommentAPIFailMock()
        let apiLoader = APILoader(apiHandler: mockService)
        
        //WHEN
        apiLoader.loadAPIRequest(requestData: [String : Any]()) { model, error in
            
            //THEN
            if let error = error { // Akan kesini karena MOCK Fail
                print(error)
                XCTAssertNotNil(error, error.message)
                exp.fulfill()
            }else {
                XCTAssertNotNil(model, "Gagal Download")
                XCTAssertEqual(model?.count, 29)
                exp.fulfill()
            }
            
        }
        wait(for: [exp], timeout: 15)
    }

}
