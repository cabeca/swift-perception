#if canImport(SwiftUI)
  import SwiftUI

  /// A property wrapper type that supports creating bindings to the mutable properties of
  /// perceptible objects.
  ///
  /// A backport of SwiftUI's `Bindable` property wrapper.
  @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(visionOS, unavailable)
  @dynamicMemberLookup
  @propertyWrapper
  public struct Bindable<Value> {
    @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(visionOS, unavailable)
    @ObservedObject fileprivate var observer: Observer<Value>

    /// The wrapped object.
    @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(visionOS, unavailable)
    public var wrappedValue: Value {
      get { self.observer.object }
      set { self.observer.object = newValue }
    }

    /// The bindable wrapper for the object that creates bindings to its properties using dynamic
    /// member lookup.
    @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(visionOS, unavailable)
    public var projectedValue: Bindable<Value> {
      self
    }

    /// Returns a binding to the value of a given key path.
    @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(visionOS, unavailable)
    public subscript<Subject>(
      dynamicMember keyPath: ReferenceWritableKeyPath<Value, Subject>
    ) -> Binding<Subject> where Value: AnyObject {
      withPerceptionTracking {
        self.$observer[dynamicMember: (\Observer.object).appending(path: keyPath)]
      } onChange: { [send = UncheckedSendable(self.observer.objectWillChange.send)] in
        send.value()
      }
    }

    /// Creates a bindable object from an observable object.
    @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(visionOS, unavailable)
    public init(wrappedValue: Value) where Value: AnyObject & Perceptible {
      self.observer = Observer(wrappedValue)
    }

    /// Creates a bindable object from an observable object.
    @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(visionOS, unavailable)
    public init(_ wrappedValue: Value) where Value: AnyObject & Perceptible {
      self.init(wrappedValue: wrappedValue)
    }

    /// Creates a bindable from the value of another bindable.
    @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
    @available(visionOS, unavailable)
    public init(projectedValue: Bindable<Value>) where Value: AnyObject & Perceptible {
      self = projectedValue
    }
  }

  @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(visionOS, unavailable)
  extension Bindable: Identifiable where Value: Identifiable {
    public var id: Value.ID {
      wrappedValue.id
    }
  }

  @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(visionOS, unavailable)
  extension Bindable: Sendable where Value: Sendable {}

  @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(visionOS, unavailable)
  private final class Observer<Object>: ObservableObject {
    var object: Object
    init(_ object: Object) {
      self.object = object
    }
  }

  @available(iOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(macOS, introduced: 10.15, obsoleted: 14, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(tvOS, introduced: 13, obsoleted: 17, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(watchOS, introduced: 6, obsoleted: 10, message: "Use @Bindable without the 'Perception.' prefix.")
  @available(visionOS, unavailable)
  extension Observer: Equatable where Object: AnyObject {
    static func == (lhs: Observer, rhs: Observer) -> Bool {
      lhs.object === rhs.object
    }
  }
#endif
