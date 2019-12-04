//
//  ReviewDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewDetailViewController: UIViewController {
    
    @IBOutlet weak var reviewDate: UILabel!
    
    @IBOutlet weak var reviewBody: UITextView!
    @IBOutlet weak var reviewID: UILabel!
    @IBOutlet weak var reviewedBy: UITextView!    
    @IBOutlet weak var reviewTitle: UITextView!
    @IBOutlet weak var bookID: UILabel!
    
    var iTitle: String?
    var iID:String?
    var iBid:String?
    var ireviewedBy: String?
    var ireBody:String?
    var iDate:String?
    
    override func viewDidLoad() {
        reviewTitle.text = "Review Title: \( iTitle ?? "")"
        reviewedBy.text = "Reviewed By: \(ireviewedBy ?? "")"
        bookID.text = "Book ID: \(iBid ?? "")"
        reviewID.text = "Review ID: \(iID ?? "")"
        reviewBody.text = ireBody
        

    }
    
    
}
