// Fake ObjectiveC module for testing String/NSString bridging.

@_exported import ObjectiveC

public struct ObjCBool : Boolean {
  var value : UInt8

  /// \brief Allow use in a Boolean context.
  public var boolValue: Bool {
    if value == 0 { return false }
    return true
  }
}

@_silgen_name("swift_BoolToObjCBool")
func _convertBoolToObjCBool(_ x: Bool) -> ObjCBool

@_silgen_name("swift_ObjCBoolToBool")
func _convertObjCBoolToBool(_ x: ObjCBool) -> Bool


public struct Selector : ExpressibleByStringLiteral {
  private var ptr : OpaquePointer

  public init(unicodeScalarLiteral value: String) {
    self.init(stringLiteral: value)
  }

  public init(extendedGraphemeClusterLiteral value: String) {
    self.init(stringLiteral: value)
  }

  public init (stringLiteral value: String) {
    self = sel_registerName(value)
  }
}
