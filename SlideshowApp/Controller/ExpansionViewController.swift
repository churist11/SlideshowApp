//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 櫻井将太郎 on 2020/12/04.
//  Copyright © 2020 shoutarou.sakurai. All rights reserved.
//

import UIKit
// From SlideViewController, When user tapped image view.
class ExpansionViewController: UIViewController {

	// MARK: - IBOutlet

	@IBOutlet weak var expansionImageVIew: UIImageView!

	// MARK: - Property
	internal var model: SlideModel?

    override func viewDidLoad() {
        super.viewDidLoad()
//
//		// Set values with model that created in former VC
//		self.expansionImageVIew.image = self.model?.image
//		self.navigationItem.title = self.model?.title
//

	}
	@IBAction func infoPressed(_ sender: UIBarButtonItem) {
//
//		print(self.model?.image.size ?? 0.0)
	}
	
}// End
