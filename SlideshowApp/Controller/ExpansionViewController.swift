//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 櫻井将太郎 on 2020/12/04.
//  Copyright © 2020 shoutarou.sakurai. All rights reserved.
//

import UIKit
// From SlideViewController, When user tapped image view.
final class ExpansionViewController: UIViewController {

	// MARK: - IBOutlet

	@IBOutlet weak var expansionImageVIew: UIImageView!
	@IBOutlet weak var infoView: UIView!
	@IBOutlet weak var infoLabel: UILabel!

	// MARK: - Property

	internal var slide: Slide?

	// MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

		// Set UI with values in slide that created in former VC
//		self.expansionImageVIew.image = self.slide?.image
//		self.navigationItem.title = self.slide?.title

		// Close info view
		self.infoView.isHidden = true
	}

	@IBAction func infoPressed(_ sender: UIBarButtonItem) {

		// Animate
		UIView.transition(with: self.infoView, duration: 0.5, options: .transitionCrossDissolve, animations: {

			// Open info View
			self.infoView.isHidden = false

		}, completion: nil)
	}

	@IBAction func closePressed(_ sender: UIButton) {

		// Animate
		UIView.transition(with: self.infoView, duration: 0.5, options: .transitionCrossDissolve, animations: {

			// Close info view
			self.infoView.isHidden = true

		}, completion: nil)
	}

}// End
