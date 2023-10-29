//
//  File.swift
//  
//
//  Created by Noah Kamara on 16.10.23.
//

import Foundation
import SwiftData
import GazetteCore

@Model
public class Asset: AssetProtocol {
	@Attribute
	public let url: URL
	
	@Attribute(.externalStorage)
	public var data: Data?
	
	internal init(
		url: URL,
		data: Data? = nil
	) {
		self.url = url
		self.data = data
	}
}
