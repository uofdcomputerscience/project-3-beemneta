//
//  ReviewInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewInputViewController: UIViewController {
    
    let reviewService = ReviewService.shared
    
    @IBOutlet weak var reviewerName: UITextField!
    
    @IBAction func reviewerName(_ sender: UITextField) {
    }
    
    @IBOutlet weak var dateLabel: UILabel!
  
    @IBAction func reviewDone(_ sender: UIButton) {
        let name = reviewerName.text!
       // let id = bookID.text!
        let title = reviewTitle.text!
        let body = reviewBody.text!
      //  let review = Review(id: <#T##Int?#>, bookId:12, date: <#T##Date?#>, reviewer: name, title: title, body: body)
        
       // submitReview(review: review)
        
    }
    
    func submitReview(review:Review) {
        reviewService.createReview(review: review) {
            print("review created")
        }
    }
    
    
    @IBOutlet weak var reviewDone: UIButton!
    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var reviewTitle: UITextField!
    @IBAction func reviewTitle(_ sender: UITextField) {
    }
    @IBOutlet weak var reviewBody: UITextView!
    
    @IBAction func bookID(_ sender: UITextField) {
    }
    @IBOutlet weak var bookID: UITextField!
    
    
    
}
