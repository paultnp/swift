# libswiftRemoteMirror.dylib should not have runtime dependencies; it's
# always built as a shared library.
if(SWIFT_BUILD_DYNAMIC_STDLIB OR SWIFT_BUILD_REMOTE_MIRROR)
  add_swift_library(swiftRemoteMirror SHARED TARGET_LIBRARY DONT_EMBED_BITCODE
      SwiftRemoteMirror.cpp
      LINK_LIBRARIES swiftReflection
      INSTALL_IN_COMPONENT swift-remote-mirror)
endif()
