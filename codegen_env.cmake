# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

function(desktop_app_prepare_codegen_command out_var)
    set(result ${ARGN})
    if (WIN32 AND DESKTOP_APP_USE_PACKAGED_QT AND DESKTOP_APP_QT_BIN_DIR)
        list(PREPEND result
            ${CMAKE_COMMAND}
            -E
            env
            --modify
            "PATH=prepend:${DESKTOP_APP_QT_BIN_DIR}"
        )
    endif()
    set(${out_var} ${result} PARENT_SCOPE)
endfunction()
