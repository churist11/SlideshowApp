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
	@IBOutlet weak var previousButton: UIBarButtonItem!
	@IBOutlet weak var nextButton: UIBarButtonItem!


	@IBOutlet weak var tapGesture: UITapGestureRecognizer!

	// MARK: - Property
	private var model = SlideModel()

	private var isPlaying: Bool = false

	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

		// Configure page control status
		self.pageControl.numberOfPages = self.model.numberOfImages
		self.pageControl.currentPage = 0

		// Set initial image to the image view
		self.imageView.image = self.model.slideContainer[self.pageControl.currentPage].image

		self.navigationItem.title = self.model.slideContainer[self.pageControl.currentPage].title
    }

	// MARK: - IBAction
	@IBAction func previousTapped(_ sender: UIBarButtonItem) {

		// Turn into last page from first page
		if self.pageControl.currentPage == 0 {

			self.pageControl.currentPage = self.pageControl.numberOfPages - 1

		} else {
			// Normally back 1 page
			self.pageControl.currentPage -= 1
		}
	}

	@IBAction func nextTapped(_ sender: UIBarButtonItem) {

		// Turn into first page from last page
		if self.pageControl.currentPage == self.pageControl.numberOfPages - 1 {

			self.pageControl.currentPage = 0

		} else {
			// Normally go 1 page
			self.pageControl.currentPage += 1
		}
	}

	@IBAction func playTapped(_ sender: UIBarButtonItem) {

		// Switch image of button
		sender.image = self.isPlaying ? UIImage(systemName: Constants.BAR_BUTTON_IMAGE_play) : UIImage(systemName: Constants.BAR_BUTTON_IMAGE_pause)

		// Change status
		self.isPlaying = !(self.isPlaying)

		// Determine how Slide moves
		if self.isPlaying {

			// TODO: - Auto slideshow starts , that display each slide every 2sec

			// Disable to tap side buttons
			self.previousButton.isEnabled = false
			self.nextButton.isEnabled = false
		} else {
			
			// TODO: - Stop Slideshow and hold current slide to screen

			// Enable to tap side buttons
			self.previousButton.isEnabled = true
			self.nextButton.isEnabled = true
		}
	}

	// MARK: - Instance Method


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}// End

