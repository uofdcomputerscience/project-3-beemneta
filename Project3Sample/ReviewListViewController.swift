//
//  ReviewListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewListViewController: UIViewController {
    
    let reviewService = ReviewService.shared
    
    @IBOutlet weak var reviewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.reviewService.fetchReviews {
            DispatchQueue.main.async {
                      self.reviewTable.reloadData()
                   }
        }
       
        reviewTable.dataSource = self
        reviewTable.delegate = self
    }
 
    
    @IBAction func refreshButton(_ sender: UIButton) {
        self.reviewService.fetchReviews {
            DispatchQueue.main.async {
                      self.reviewTable.reloadData()
                   }
        }
    }
    
    
}

extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviewService.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reviewer = reviewService.reviews[indexPath.item].reviewer
        let bookID = reviewService.reviews[indexPath.item].bookId
        let rTitle = reviewService.reviews[indexPath.item].title
       
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell")!
        if let ReviewCell = cell as?
            ReviewCell{
            fillID(ReviewCell: ReviewCell, string: String(bookID))
            fillTitle(ReviewCell: ReviewCell, string: rTitle)
            fillReviewer(ReviewCell: ReviewCell, string: reviewer)
        }
        
        return cell
        
    }
    
    func fillReviewer (ReviewCell: ReviewCell, string:String){
        ReviewCell.reviewedBy.text = "Reviewer: \(string)"
    }
    func fillTitle (ReviewCell: ReviewCell, string:String){
        ReviewCell.reviewTitle.text = "Review Title: \(string)"
    }
    
    func fillID (ReviewCell: ReviewCell, string:String){
        ReviewCell.bookID.text = "Book Reviewed: \(string)"
    }
    
}
extension  ReviewListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let so = reviewService.reviews[indexPath.item]
       
        let vc = storyboard?.instantiateViewController(identifier: "ReviewDetailViewController") as! ReviewDetailViewController
        vc.ireBody = so.body
        vc.iBid = String(so.bookId)
        vc.iID = String(so.id!)
        vc.ireviewedBy = so.reviewer
        vc.iTitle = so.title        
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
