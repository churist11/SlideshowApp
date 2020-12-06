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
	@IBOutlet weak var titleLabel: UILabel!
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
		self.pageControl.numberOfPages = self.model.numberOfSlides
		self.pageControl.currentPage = 0

		// Setup intial status
		self.updateSlide()
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

		// Animate slide transition
		self.updateSlide(animated: true, duration: 0.7, options: .transitionFlipFromLeft)
	}

	@IBAction func nextTapped(_ sender: UIBarButtonItem) {

		// Turn into first page from last page
		if self.pageControl.currentPage == self.pageControl.numberOfPages - 1 {

			self.pageControl.currentPage = 0

		} else {
			// Normally go 1 page
			self.pageControl.currentPage += 1
		}

		// Animate slide transition
		self.updateSlide(animated: true, duration: 0.7, options: .transitionFlipFromRight)
	}

	@IBAction func playTapped(_ sender: UIBarButtonItem) {

		// Switch image of button
		sender.image = self.isPlaying ? UIImage(systemName: Constants.BAR_BUTTON_IMAGE_play) : UIImage(systemName: Constants.BAR_BUTTON_IMAGE_pause)

		// Change status
		self.isPlaying = !(self.isPlaying)

		// Determine how Slide moves
		if self.isPlaying {

			// TODO: - Auto slideshow animation starts , that display each slide every 2sec timer.

			// Disable to tap side buttons
			self.previousButton.isEnabled = false
			self.nextButton.isEnabled = false
		} else {
			
			// TODO: - Stop Slideshow, stop timer, and hold current slide to screen

			// Enable to tap side buttons
			self.previousButton.isEnabled = true
			self.nextButton.isEnabled = true
		}
	}

	// MARK: - Instance Method

	private func updateSlide(animated: Bool = false, duration animationDuration: TimeInterval? = nil, options animationOptions: UIView.AnimationOptions? = nil) -> Void {

		if animated && animationDuration !=  nil, animationOptions != nil {
			// <Animate>
			// Animated transition
			UIView.transition(with: self.imageView, duration: animationDuration!, options: animationOptions!, animations: {

				// Update the image view to current status
				self.imageView.image = self.model.slideContainer[self.pageControl.currentPage].image

			}, completion: nil)

			UIView.transition(with: self.titleLabel, duration: animationDuration!, options: animationOptions!, animations: {

				// Set title provided by slide
				self.titleLabel.text = self.model.slideContainer[self.pageControl.currentPage].title

			}, completion: nil)

		} else if !(animated) {
			// <Not - animate>
			// Set image provided by slide
			self.imageView.image = self.model.slideContainer[self.pageControl.currentPage].image

			// Set nvaigation title provided by slide
			self.titleLabel.text = self.model.slideContainer[self.pageControl.currentPage].title
		}
	}


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		// Confirm segue id
		if segue.identifier == Constants.SEGUE_ID {

			// Get refernce to next screen
			guard let expansionVC = segue.destination as? ExpansionViewController else {
				return
			}

			// Set curren slide into destination
			expansionVC.slide = self.model.slideContainer[self.pageControl.currentPage]
		}
    }

}// End

