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
	@IBOutlet weak var closeButton: UIButton!

	@IBOutlet weak var infoView: UIView!
	@IBOutlet weak var infoLabel: UILabel!

	// MARK: - Property

	internal var slide: Slide?

	// MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

		// Set UI with values in slide that created in former VC
		self.expansionImageVIew.image = self.slide?.image ?? UIImage(systemName: Constants.REPLACE_SYSTEM_IMAGE)
		self.navigationItem.title = self.slide?.title ?? "NIL"

		// Hide info view and button
		self.infoView.isHidden = true
		self.closeButton.isHidden = true

		// Place info text in label
		self.infoLabel.text = self.slide?.imageInfo
	}

	@IBAction func infoPressed(_ sender: UIBarButtonItem) {

		// Animate
		UIView.transition(with: self.infoView, duration: 0.5, options: .transitionCrossDissolve, animations: {

			// Open info View
			self.infoView.isHidden = false

		}, completion: nil)

		UIView.transition(with: self.closeButton, duration: 0.5, options: .transitionCrossDissolve, animations: {

			// Open info View
			self.closeButton.isHidden = false

		}, completion: nil)

	}

	@IBAction func closePressed(_ sender: UIButton) {

		// Animate
		UIView.transition(with: self.infoView, duration: 0.5, options: .transitionCrossDissolve, animations: {

			// Close info view
			self.infoView.isHidden = true

		}, completion: nil)

		UIView.transition(with: self.closeButton, duration: 0.5, options: .transitionCrossDissolve, animations: {

			// Close info view
			self.closeButton.isHidden = true

		}, completion: nil)
	}

}// End
