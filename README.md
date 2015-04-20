Development version of deal.II
==============================

This is a fork of the official deal.II repository at GitHub whose
purpose is the integration of the library into the Flow123d project.
See also http://flow123d.github.com.

Current version of deal.II being used in the main branch is 8.2.1.


What is deal.II?
================

deal.II is a C++ program library targeted at the computational solution
of partial differential equations using adaptive finite elements. It uses
state-of-the-art programming techniques to offer you a modern interface
to the complex data structures and algorithms required.

For the impatient:
------------------

Configure compile and install the deal.II library with:

    $ mkdir build
    $ cd build
    $ cmake -DCMAKE_INSTALL_PREFIX=/path/where/deal.II/should/be/intalled/to ..
    $ make install    (alternatively $ make -j<N> install)
    $ make test

A detailed *ReadME* can be found at ./doc/readme.html and
./doc/users/cmake.html or at http://www.dealii.org/.

Getting started:
----------------

The tutorial steps are located under ./examples/
Information about the tutorial steps can be found at
./doc/doxygen/tutorial/index.html or at http://www.dealii.org/.

License:
--------

Please see the file ./LICENSE for details

Further information:
--------------------

For further information have a look at ./doc/index.html or at
http://www.dealii.org.

Continuous Integration Status:
------------------------

[![Build Status](https://travis-ci.org/dealii/dealii.png)](https://travis-ci.org/dealii/dealii)
