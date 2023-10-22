//
//  File.swift
//  
//
//  Created by Noah Kamara on 16.10.23.
//

import SwiftUI
import SwiftData


struct PersistenceModifier: ViewModifier {
	let inMemory: Bool
	
	func body(content: Content) -> some View {
		content
			.modelContainer(try! Persistence.container(inMemory: inMemory))
	}
}

public extension View {
	func persistence(
		inMemory: Bool
	) -> some View {
		self
			.modifier(PersistenceModifier(inMemory: inMemory))
	}
}
