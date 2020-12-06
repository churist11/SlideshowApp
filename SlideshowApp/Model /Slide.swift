//
//  Slide.swift
//  SlideshowApp
//
//  Created by 櫻井将太郎 on 2020/12/05.
//  Copyright © 2020 shoutarou.sakurai. All rights reserved.
//

import UIKit

struct Slide {

	// MARK: - Stored Property
	internal var page: Int
	internal var title: String
	internal var image: UIImage

	internal var imageInfo: String {
		get {
			// Convert size into string
			let size = self.image.size
			let stringSize = NSCoder.string(for: size)

			// Add discription text
			let processedSize = "{width, height} = \(stringSize)"

			return processedSize
		}
	}

	// MARK: - Initializer
	init(page: Int, title: String,  image: UIImage) {
		self.page = page
		self.title = title
		self.image = image
	}
}
