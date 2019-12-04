//
//  BookDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
 
    
    @IBOutlet weak var pubYear: UILabel!    
    @IBOutlet weak var bookTitle: UITextView!
    @IBOutlet weak var bookID: UILabel!
    @IBOutlet weak var bookAuthor: UITextView!
    @IBOutlet weak var bookImage: UIImageView!
    
    var pYear:String?
    var bTitle:String?
    var bID: String?
    var bAuthor: String?
    var bImageurl:URL?
    
    
    override func viewDidLoad() {
        pubYear.text = pYear
        bookID.text = bID
        bookAuthor.text = bAuthor
        bookTitle.text = bTitle
        
        
        if bImageurl != nil {
            postImage(url: bImageurl!)
        } 
    }
    
    func postImage (url: URL) {
        let session = URLSession(configuration: .ephemeral)
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            if let data = data {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.bookImage.image = image
                    }
                
                }
            }
        }
        task.resume()
    }
    
   
}
