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

	private var imageNameContainer: [String]?

	// Same number to slide page index
	private var currentImageIndex: Int

	// MARK: - Computed Property

	private var imagePath: String? {

		// Return processed name of the image file ex. "babyHam"
		if let text = self.imageNameContainer?[currentImageIndex] {

			let processedText = text.prefix(text.count - 4)

			return "Images/" + String(processedText)
		} else {
			return nil
		}
	}

	internal var imageTitle: String? {

		// Return processed name of the image file ex. "babyHam"
		if let text = self.imageNameContainer?[currentImageIndex] {

			let processedText = text.prefix(text.count - 4)

			return String(processedText)
		} else {
			return nil
		}
	}

	internal var currentImage: UIImage? {
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
	init(indexNum: Int) {

		// Assign given value
		self.currentImageIndex = indexNum

		// Access file in bundle
		let fileManager = FileManager.default
		let imagePath = Bundle.main.resourcePath! + Constants.NAME_OF_DIRECTORY_OF_IMAGE

		// Get name of files in directory
		if let imagefileNames = try? fileManager.contentsOfDirectory(atPath: imagePath) {

			//Assign value to the container
			self.imageNameContainer = imagefileNames
		}
	}

}//End
