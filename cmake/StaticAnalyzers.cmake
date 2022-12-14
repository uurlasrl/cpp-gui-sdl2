if (NOT CMAKE_BUILD_TYPE STREQUAL "Release")
  find_program(CLANGTIDY clang-tidy)
  if (CLANGTIDY)
    message(STATUS "Using clang-tidy")
    set(CMAKE_CXX_CLANG_TIDY ${CLANGTIDY})
  else ()
    message(SEND_ERROR "clang-tidy requested but executable not found")
  endif ()

  # This will gradually increase memory usage of the program,
  # running on Apple M1, 13.0.
  message(STATUS "Using address sanitizer")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -fsanitize=address -g")
endif ()
