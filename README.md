# Interview_iOS
iOS Interview Question's 
Preparation Interview Created Project for every variable and functional properties

Q1: What is the difference between weak, unowned, and strong references?

	•	strong: Default. Increases retain count. Causes retain cycles if used in closures or mutual references.
	•	weak: Optional. Does not retain the object. Becomes nil when the object is deallocated.
	•	unowned: Non-optional. Assumes object will always be available when accessed (can crash if not).

Q2: What is the difference between @State, @Binding, and @ObservedObject in SwiftUI?

	•	@State: Local, owns the state. Use inside a view to trigger UI updates.
	•	@Binding: A reference to a @State from a child view.
	•	@ObservedObject: Refers to external state conforming to ObservableObject.

 Q3: Explain the difference between async/await and completion handlers in Swift
 
	•	Completion Handler: Callback pattern. Pyramid of doom if nested.
	•	Async/Await: Modern, readable, linear flow. Requires async functions and await calls.

 Q4: What is the difference between DispatchQueue and Task?
 
	•	DispatchQueue: Part of GCD (Grand Central Dispatch), lower-level, works with closures.
	•	Task: Part of Swift Concurrency, supports structured concurrency, cancelation, and isolation.

Q5: What is a @MainActor and when should you use it?

	•	Ensures code runs on the main thread.
	•	Important for updating UI safely.
	•	Works well with async/await.




