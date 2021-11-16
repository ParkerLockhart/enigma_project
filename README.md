## The Enigma Project  

s̷̺͂e̶̞͂ǹ̶͈d̶̺́ ̶̣͛a̷̫̎n̴̙͌ď̸̻ ̷̗́ȑ̸͎e̸͇̽c̷͇̀e̴͇͗i̷͙̍v̷̘́ẻ̵ͅ ̴͇̕m̸̦͑ḙ̴̊s̸̟̅s̶̰̓ḁ̷͆ģ̵̈e̸͓̅s̵̞͂ ̵͎̈́į̷͑n̷̜̔ ̴̠̂s̵͈͋e̴͔̊c̷̨̆r̷̝̅e̴͙̐ṱ̸̒ ̵̘͌c̴̛͇o̶̝̓d̶͉̏ē̴͙

A Module 1 Back End Final Project for [Turing School of Software & Design](https://turing.edu/)

![language](https://img.shields.io/github/languages/top/ParkerLockhart/enigma_project)
![pull requests](https://img.shields.io/github/issues-pr-closed/ParkerLockhart/enigma_project)
![rspec](https://img.shields.io/gem/v/rspec?label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?label=simplecov)


#### Self Assessment

*Functionality:*
Meets expectations 
  - Enigma Class with encrypt and decrypt methods successfully implemented.
    - Enigma Class, all tests passing, 100% coverage.
    - Enigma encrypt and decrypt methods working successfully as expected, giving correct output.  
  - Encrypt/decrypt command line interfaces successfully implemented.
    - Encrypt/decrypt runners read/write to files successfully and have correct command line output.  

*OOP:*
Meets expectations
  - Project is broken into logical components that are appropriately encapsulated.
    - Project includes Tools module for methods used by multiple classes. 
    - Project includes superclass and subclass structure to share methods without giving access to information that isn't needed. 
    - Project includes separate classes for different functionality.  
  - No classes are unreasonably small or large, or contain knowledge/information/behavior that they shouldn’t know about.
    - All classes are less than 100 lines long, and encompass one specific functionality and related data.  
  - Student can articulate the single responsibilities of the various components.
    - Each method performs only one function and only handles data it uses. 

*Ruby conventions and mechanics:*
Meets expectations
  - Code is mostly properly indented, spaced, and lines are not excessively long.
  - Class, method, variable, and file names follow convention. 
  - Some enumerables/data structures chosen are the most efficient tool for a given job, and students can speak as to why those enumerables/data structures were      chosen. 
  - At least one hash is implemented in a way that makes logical sense.

*Test driven development:*
Meets expectations
  - Every method is tested at both the unit and integration level, and completely verify expected behavior (i.e., if a single method does 3 things, all 3 things are explicitly tested). 
    - Testing includes as much functionality as possible, including using mocks to test certain methods and stubs where needed for integration testing. 
  - Obvious edge cases are addressed.
    - Argument inputs take multiple variations of data and is able to homogenize before sending to other methods.
  - Git history demonstrates students are writing tests before implementation code. 
  - Test coverage metrics show coverage at 99% or greater.
    - Test coverage currently at 99.44%
