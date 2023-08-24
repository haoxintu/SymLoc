The changed function has marked a prefix `// *Haoxin`, and the following files may have changed:

- Executor.cpp
    - callExternalFunction() //replace the new symbolic variable with the concrete one
    - executeFree() // replace the new symbolic variable (still need to free the created buffer)
    - executeMemoryOperation() //

- Executor.h
    - added the definition of funciton executeAllocForMalloc()


- AddressSpace.h
    - added defintion of `MallocMemoryMap` and the `moobjects`


- SpecialFunctionHandler.cpp
    - HandleMalloc


