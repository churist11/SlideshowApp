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

	// Same number to slide page index
	internal var currentImageIndex: Int

	// MARK: - Computed Property

	private var imageNameContainer: [String] {
		get {
			// Access file
			let fileManager = FileManager.default
			let imagePath = Bundle.main.resourcePath! + "/Images"

			// Get name of files in directory
			let imagefileNames = try! fileManager.contentsOfDirectory(atPath: imagePath)

			return imagefileNames
		}
	}

	internal var currentImageName: String {

		// Return name of the image file
		return self.imageNameContainer[currentImageIndex]
	}

	internal var currentImage: UIImage {
		get {
			// Initialize image object with specified name
			if let image = UIImage(named: self.currentImageName, in: Bundle.main, with: .none) {

				return image
			} else {

				// If image fetching failed, assign system image to the image view
				return UIImage(systemName: Constants.REPLACE_SYSTEM_IMAGE)!
			}
		}
	}

	// MARK: -  Initializer
	init(indexNum: Int) {
		self.currentImageIndex = indexNum
	}

}//End
