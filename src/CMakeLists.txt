##------------------------------------------------------------------------------
## SECTION: Setup the Source Executable
##------------------------------------------------------------------------------
set(BOOL_CREATE_INSTALLER OFF)
set(BOOL_CREATE_EXECUTABLE ON)
set(BOOL_CREATE_LIBRARY ON)
set(BOOL_USE_BOOST OFF)

## Read the required C++ version
file(STRINGS "../build_info/build_cxx_standard.txt" STRING_REQUIRED_CXX_STANDARD)

## Find a list of all files in the current CMake Directory
file(GLOB_RECURSE EXEC_FILE_SOURCES LIST_DIRECTORIES false *.h *.cpp)

## Set the required C++ Standard
set(CMAKE_CXX_STANDARD ${STRING_REQUIRED_CXX_STANDARD})
set(CMAKE_CXX_STANDARD_REQUIRED ON)

##------------------------------------------------------------------------------
## SECTION: Create an executable
##------------------------------------------------------------------------------
if(${BOOL_CREATE_EXECUTABLE})
    ## Create the required executable
    add_executable(${PROJECT_NAME} ${EXEC_FILE_SOURCES})
endif()

##------------------------------------------------------------------------------
## SECTION: Create a library
##------------------------------------------------------------------------------
if(${BOOL_CREATE_LIBRARY})
    ## Create the required library
    add_library(${PROJECT_NAME}_lib STATIC ${EXEC_FILE_SOURCES})
endif()

##------------------------------------------------------------------------------
## SECTION: Create an installer with CPack
##------------------------------------------------------------------------------
## CPack Information if you want to create an installer
if(${BOOL_CREATE_INSTALLER})
    set(CPACK_PROJECT_NAME ${PROJECT_NAME})
    set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
    set(CPACK_VERBATIM_VARIABLES true)
    set(CPACK_PACKAGE_VERSION_MAJOR 0)
    set(CPACK_PACKAGE_VERSION_MINOR 1)
    set(CPACK_PACKAGE_VERSION_PATCH 0)
    #set(CPACK_PACKAGE_DESCRIPTION_SUMMARY )
    #set(CPACK_PACKAGE_DESCRIPTION_FILE )
    #set(CPACK_RESOURCE_FILE_WELCOME )
    set(CPACK_RESOURCE_FILE_LICENSE ../LICENSE)
    set(CPACK_RESOURCE_FILE_README ../README.md)
    include(CPack)
endif()

##------------------------------------------------------------------------------
## SECTION: Potential Future Version Will include
##------------------------------------------------------------------------------
#if(${BOOL_USE_BOOST})
#    set(Boost_USE_STATIC_LIBS OFF) 
#    set(Boost_USE_MULTITHREADED ON)  
#    set(Boost_USE_STATIC_RUNTIME OFF)
    
#    set(BOOST_LIBRARIES_TO_USE filesystem thread regex)
    
#    find_package(Boost 1.45.0 COMPONENTS ${BOOST_LIBRARIES_TO_USE}) 

#    if(Boost_FOUND)
#        include_directories(${Boost_INCLUDE_DIRS}) 
#        add_executable(progname file1.cxx file2.cxx) 
#        target_link_libraries(progname ${Boost_LIBRARIES})
#    endif()
#endif()