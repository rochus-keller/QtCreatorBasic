TEMPLATE = subdirs

SUBDIRS = qtpromaker \
     sdktool \
     valgrindfake \
     3rdparty \
     buildoutputparser

win32 {
    SUBDIRS += qtcdebugger \
        wininterrupt \
        winrtdebughelper
}

mac {
    SUBDIRS += iostool
}

isEmpty(LLVM_INSTALL_DIR):LLVM_INSTALL_DIR=$$(LLVM_INSTALL_DIR)
exists($$LLVM_INSTALL_DIR) {
    SUBDIRS += clangbackend
}

BUILD_CPLUSPLUS_TOOLS = $$(BUILD_CPLUSPLUS_TOOLS)
!isEmpty(BUILD_CPLUSPLUS_TOOLS) {
    SUBDIRS += cplusplus-ast2png \
        cplusplus-frontend \
        cplusplus-mkvisitor \
        cplusplus-update-frontend
}

QT_BREAKPAD_ROOT_PATH = $$(QT_BREAKPAD_ROOT_PATH)

