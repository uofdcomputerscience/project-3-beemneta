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
    
   
    
   
  
    @IBAction func reviewDone(_ sender: UIButton) {
        let name = reviewerName.text!
        let id = bookID.text!
        let title = reviewTitle.text!
        let body = reviewBody.text!
        let review = Review(id: nil, bookId:Int(id)!, date: nil, reviewer: name, title: title, body: body)
        
        submitReview(review: review)
        
    }
    
    func submitReview(review:Review) {
        reviewService.createReview(review: review) {
            print("review created")
        }
    }
    
    
    @IBOutlet weak var reviewDone: UIButton!
   
    @IBOutlet weak var reviewTitle: UITextField!
   
    @IBOutlet weak var reviewBody: UITextView!
    
   
    @IBOutlet weak var bookID: UITextField!
    
    
    
}
