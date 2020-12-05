//
//  SlideViewController.swift
//  SlideshowApp
//
//  Created by 櫻井将太郎 on 2020/12/04.
//  Copyright © 2020 shoutarou.sakurai. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

	// MARK: - IBOutlet
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var tapGesture: UITapGestureRecognizer!

	// MARK: - Property
	private var model: SlideModel?

	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Allocate self method to gesture
		self.tapGesture.addTarget(self, action: #selector(Test))

		// Set initial image to the image view
    }

	// MARK: - IBAction


	// MARK: - Instance Method

	// FIXME: - Test for gesture segue
	@objc func Test() -> Void {
		print("Tapped!")
	}



    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}// End
