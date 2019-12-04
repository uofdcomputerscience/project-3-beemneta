//
//  BookInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookInputViewController: UIViewController {
    
    let bookService = BookService.shared
    
    @IBAction func titleEntry(_ sender: UITextField) {
    }
    
    @IBOutlet weak var titleEntry: UITextField!
    
    @IBOutlet weak var authorEntry: UITextField!
    
    @IBAction func authorEntry(_ sender: UITextField) {
    }
    
    @IBAction func imageURL(_ sender: UITextField) {
    }
    @IBOutlet weak var imageURL: UITextField!
    @IBOutlet weak var pubYear: UITextField!
    @IBAction func pubYear(_ sender: UITextField) {
    }
    @IBAction func doneButton(_ sender: UIButton) {
        let title = titleEntry.text
        let author = authorEntry.text
        let year = pubYear.text
        let imageurl = imageURL.text
        
        let book = Book(id: nil, title: title!, author: author!, published: year!, imageURLString: imageurl!)
        
        submitBook(book: book)
        
    }
    
    func submitBook(book: Book){
        bookService.createBook(book: book, completion: {
            print ("Book Created")
           
        })
            
    }
    
    @IBOutlet weak var doneButton: UIButton!
}


