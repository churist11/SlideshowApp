//
//  SlideViewController.swift
//  SlideshowApp
//
//  Created by 櫻井将太郎 on 2020/12/04.
//  Copyright © 2020 shoutarou.sakurai. All rights reserved.
//

import UIKit

final class SlideViewController: UIViewController {

	// MARK: - IBOutlet
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var pageControl: UIPageControl!

	@IBOutlet weak var tapGesture: UITapGestureRecognizer!

	// MARK: - Property
	private var model: SlideModel?

	private var isPlaying: Bool = false

	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

		// Initialize SlideModel
		self.model = SlideModel(indexNum: self.pageControl.currentPage)

		// Set initial image to the image view
		self.imageView.image = self.model?.currentImage

		self.navigationItem.title = self.model?.imageTitle

    }

	// MARK: - IBAction
	@IBAction func previousTapped(_ sender: UIBarButtonItem) {

		print("previous!!")

	}

	@IBAction func nextTapped(_ sender: UIBarButtonItem) {
		
	}

	@IBAction func playTapped(_ sender: UIBarButtonItem) {

		// Switch image of button
		sender.image = self.isPlaying ? UIImage(systemName: Constants.BAR_BUTTON_IMAGE_play) : UIImage(systemName: Constants.BAR_BUTTON_IMAGE_pause)

		// Change status
		self.isPlaying = !(self.isPlaying)
	}

	// MARK: - Instance Method


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}// End

