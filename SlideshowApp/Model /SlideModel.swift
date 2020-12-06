//
//  SlideModel.swift
//  SlideshowApp
//
//  Created by 櫻井将太郎 on 2020/12/05.
//  Copyright © 2020 shoutarou.sakurai. All rights reserved.
//

import UIKit

struct SlideModel {

	// MARK: - Stored Property
	internal var slideContainer = [Slide]()
	private var currentIndex: Int = 0
	private var imageNameContainer = [String]()

	// MARK: - Computed Property
	internal var numberOfSlides: Int {
		get {
			return self.imageNameContainer.count
		}
	}

	private var imagePath: String {
		get {
			// Return processed name of the image file ex. "babyHam"
			let text = self.imageNameContainer[currentIndex]

			let processedText = text.prefix(text.count - 4)

			return "Images/" + String(processedText)
		}
	}

	private var imageTitle: String {
		get {
			// Return processed name of the image file ex. "babyHam"
			let text = self.imageNameContainer[currentIndex]

			let processedText = text.prefix(text.count - 4)

			return String(processedText)
		}
	}

	private var currentImage: UIImage! {
		get {
			// Initialize image object with specified name
			if let path = Bundle.main.path(forResource: self.imagePath, ofType: "jpg") {
				return UIImage(contentsOfFile: path)
			} else {

				// Catch Initialization failure, Assign Alternative image
				return UIImage(systemName: Constants.REPLACE_SYSTEM_IMAGE)
			}
		}
	}

	// MARK: -  Initializer
	init() {

		// Access file in bundle
		let fileManager = FileManager.default
		let imagePath = Bundle.main.resourcePath! + Constants.NAME_OF_DIRECTORY_OF_IMAGE

		// Get name of files in directory
		let imagefileNames = try! fileManager.contentsOfDirectory(atPath: imagePath)

		//Assign value to the container
		self.imageNameContainer = imagefileNames

		// Prepare slides for container
		for i in 0 ..< self.numberOfSlides {

			// Assign each page number
			self.currentIndex = i

			// Initialize slide for specified page
			let slide = Slide(page: i, title: self.imageTitle, image: self.currentImage)

			// Add to container
			self.slideContainer.append(slide)
		}
	}


}//End
