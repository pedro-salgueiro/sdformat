################################################################################
#Find available package generators

# DEB
if ("${CMAKE_SYSTEM}" MATCHES "Linux")
  find_program(DPKG_PROGRAM dpkg)
  if (EXISTS ${DPKG_PROGRAM})
    list (APPEND CPACK_GENERATOR "DEB")
  endif(EXISTS ${DPKG_PROGRAM})

  find_program(RPMBUILD_PROGRAM rpmbuild)
endif()

list (APPEND CPACK_SOURCE_GENERATOR "TBZ2")
list (APPEND CPACK_SOURCE_GENERATOR "ZIP")
list (APPEND CPACK_SOURCE_IGNORE_FILES ";TODO;/.hg/;.swp$;/build/")

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  SET(CMAKE_INSTALL_DEBUG_LIBRARIES true)
  SET(CMAKE_INSTALL_DEBUG_LIBRARIES_ONLY true)
endif()

include (InstallRequiredSystemLibraries)

#execute_process(COMMAND dpkg --print-architecture _NPROCE)
set (DEBIAN_PACKAGE_DEPENDS "libtinyxml-dev")

set (RPM_PACKAGE_DEPENDS "libtinyxml-dev")

set (SDF_CPACK_CFG_FILE "${PROJECT_BINARY_DIR}/cpack_options.cmake")
