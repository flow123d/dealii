## ---------------------------------------------------------------------
##
## Copyright (C) 2012 - 2014 by the deal.II Authors
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


#
# Prepare tutorial.h:
#

file(GLOB DEAL_II_STEPS_BUILDSON
  ${DEAL_II_SOURCE_DIR}/examples/step-*/doc/builds-on
  )

ADD_CUSTOM_COMMAND(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/tutorial.h
  COMMAND ${PERL_EXECUTABLE}
  ARGS
    ${DEAL_II_SOURCE_DIR}/doc/doxygen/scripts/steps.pl
    ${CMAKE_CURRENT_SOURCE_DIR}/tutorial.h.in
    ${DEAL_II_STEPS}
    > ${CMAKE_CURRENT_BINARY_DIR}/tutorial.h
  DEPENDS
    ${DEAL_II_STEPS}
    ${DEAL_II_STEPS_BUILDSON}
    ${CMAKE_CURRENT_SOURCE_DIR}/tutorial.h.in
  )

#
# A target for the preparation of all the stuff happening in here...
#

ADD_CUSTOM_TARGET(tutorial
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/tutorial.h
  )

#
# Prepare the steps for documentation generation
#

FOREACH(_step ${DEAL_II_STEPS})
  GET_FILENAME_COMPONENT(_step "${_step}" NAME)

  ADD_CUSTOM_COMMAND(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_step}.cc
    COMMAND ${PERL_EXECUTABLE}
    ARGS
      ${DEAL_II_SOURCE_DIR}/doc/doxygen/scripts/program2plain
      < ${DEAL_II_SOURCE_DIR}/examples/${_step}/${_step}.cc
      > ${CMAKE_CURRENT_BINARY_DIR}/${_step}.cc
    DEPENDS
      ${DEAL_II_SOURCE_DIR}/doc/doxygen/scripts/program2plain
      ${DEAL_II_SOURCE_DIR}/examples/${_step}/${_step}.cc
    VERBATIM
    )

  ADD_CUSTOM_COMMAND(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_step}.h
    COMMAND ${PERL_EXECUTABLE}
    ARGS
      ${DEAL_II_SOURCE_DIR}/doc/doxygen/scripts/make_step.pl
      ${_step} ${DEAL_II_SOURCE_DIR}
      > ${CMAKE_CURRENT_BINARY_DIR}/${_step}.h
    WORKING_DIRECTORY
      ${CMAKE_CURRENT_BINARY_DIR}
    DEPENDS
      ${DEAL_II_SOURCE_DIR}/doc/doxygen/scripts/make_step.pl
      ${DEAL_II_SOURCE_DIR}/examples/${_step}/${_step}.cc
      ${DEAL_II_SOURCE_DIR}/examples/${_step}/doc/intro.dox
      ${DEAL_II_SOURCE_DIR}/examples/${_step}/doc/results.dox
    )

  ADD_CUSTOM_TARGET(tutorial_${_step}
    DEPENDS
      ${CMAKE_CURRENT_BINARY_DIR}/${_step}.h
      ${CMAKE_CURRENT_BINARY_DIR}/${_step}.cc
    )
  ADD_DEPENDENCIES(tutorial tutorial_${_step})
ENDFOREACH()
