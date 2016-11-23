## ---------------------------------------------------------------------
##
## Copyright (C) 2014 by the deal.II authors
##
## This file is part of the deal.II library.
##
## The deal.II library is free software; you can use it, redistribute
## it, and/or modify it under the terms of the GNU Lesser General
## Public License as published by the Free Software Foundation; either
## version 2.1 of the License, or (at your option) any later version.
## The full text of the license can be found in the file LICENSE at
## the top level of the deal.II distribution.
##
## ---------------------------------------------------------------------

IF(DEAL_II_COMPONENT_PACKAGE)
  MESSAGE(STATUS "Setting up CPack")
  SET(CPACK_GENERATOR "Bundle")

  CONFIGURE_FILE(
    ${DEAL_II_SOURCE_DIR}/cmake/cpack-mac-bundle/mac_startup_script.sh.in
    ${DEAL_II_BINARY_DIR}/cpack/mac_startup_script.sh
    @ONLY
    )

  CONFIGURE_FILE(
    ${DEAL_II_SOURCE_DIR}/cmake/cpack-mac-bundle/dealii-terminal.in
    ${DEAL_II_BINARY_DIR}/cpack/dealii-terminal
    @ONLY
    )

  CONFIGURE_FILE(
    ${DEAL_II_SOURCE_DIR}/cmake/cpack-mac-bundle/dealii.conf.in
    ${DEAL_II_BINARY_DIR}/cpack/dealii.conf
    @ONLY
    )

  CONFIGURE_FILE(
    ${DEAL_II_SOURCE_DIR}/cmake/cpack-mac-bundle/Info.plist.in
    ${DEAL_II_BINARY_DIR}/cpack/Info.plist
    @ONLY
    )

  SET(CPACK_PACKAGE_ICON
    "${DEAL_II_SOURCE_DIR}/cmake/cpack-mac-bundle/dealii-icon.icns"
    )

  set(CPACK_PACKAGE_FILE_NAME
    "${DEAL_II_PACKAGE_NAME}-${DEAL_II_PACKAGE_VERSION}"
    )

  set(CPACK_BUNDLE_NAME
    "${DEAL_II_PACKAGE_NAME}"
    )

  SET(CPACK_BUNDLE_ICON
    "${DEAL_II_SOURCE_DIR}/cmake/cpack-mac-bundle/dealii-icon.icns"
    )

  SET(CPACK_BUNDLE_PLIST
    "${DEAL_II_BINARY_DIR}/cpack/Info.plist"
    )

  SET(CPACK_BUNDLE_STARTUP_COMMAND
    "${DEAL_II_BINARY_DIR}/cpack/mac_startup_script.sh"
    )
    IF(DEAL_II_INSTALL_RULES)
      INSTALL(FILES
        ${DEAL_II_BINARY_DIR}/cpack/dealii.conf
        DESTINATION ${DEAL_II_COMMON_RELDIR}
        )
      INSTALL(PROGRAMS
        ${DEAL_II_BINARY_DIR}/cpack/dealii-terminal
        DESTINATION ${DEAL_II_EXECUTABLE_RELDIR}
        )
      IF(NOT "${DEAL_II_CPACK_EXTERNAL_LIBS_TREE}" STREQUAL "")
         INSTALL(DIRECTORY ${DEAL_II_CPACK_EXTERNAL_LIBS_TREE}/
           DESTINATION opt
           USE_SOURCE_PERMISSIONS
           )
      ENDIF()
    ENDIF()

  INCLUDE(CPack)
  MESSAGE(STATUS "Setting up CPack - Done")
ENDIF()
