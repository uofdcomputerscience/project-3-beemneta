//
//  BookListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {
    
    @IBOutlet weak var bookTable: UITableView!
    
    let bookService = BookService.shared
    
    override func viewDidLoad() {       
        super.viewDidLoad()        
            self.bookService.fetchBooks {
             DispatchQueue.main.async {
            self.bookTable.reloadData()
            }
            
        }
        bookTable.dataSource = self
        bookTable.delegate = self
    }
  
   
}

extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookService.books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bauthor = bookService.books[indexPath.item].author
        let btitle = bookService.books[indexPath.item].title
        let byear = bookService.books[indexPath.item].published
        //let bid = bookService.books[indexPath.item].id
        //let burl = bookService.books[indexPath.item].imageURL
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell")!
        if let BookCell = cell as?
            BookCell{
            fillTitle(BookCell: BookCell, string: btitle)
            fillAuthor(BookCell: BookCell, string: bauthor)
            fillYear(BookCell: BookCell, string: byear)
            setImage(BookCell: BookCell, book: bookService.books[indexPath.item])
        }
        return cell
    }
    func fillTitle (BookCell: BookCell, string:String){
        BookCell.bookTitle.text = "Title: \(string)"
    }
    func fillAuthor (BookCell: BookCell, string:String){
        BookCell.bookAuthor.text = "Author: \(string)"
    }
    func fillYear (BookCell: BookCell, string:String){
        BookCell.pubYear.text = "Publication Year: \(string)"
    }
    func setImage(BookCell: BookCell, book:Book) {
        bookService.image(for: book) { [weak BookCell] (retrievedBook, image) in
            if book.id == retrievedBook.id {
                DispatchQueue.main.async {
                    BookCell!.bookImage.image = image
                }
            }
        }
    }
}

extension BookListViewController: UITableViewDelegate{    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let so = bookService.books[indexPath.item]
        
        
        
        
        let vc = storyboard?.instantiateViewController(identifier: "BookDetailViewController") as! BookDetailViewController
        
        vc.bAuthor = so.author
        vc.bID = String(so.id!)
        vc.bImageurl = so.imageURL
        vc.bTitle = so.title
        vc.pYear = so.published
        
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
