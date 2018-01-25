

/*

Here is the description of what the very simple executable file should look like.
Note that this is much simpler than real executables, because it doesn't support
any static or dynamic linking, so no symbol table is incorporated. Further, it
doesn't support any relocation.

Note the occurrence of a 32-bit delimiter value (0xf0f0f0f0) that must appear
at the start of the file, after the data section of the executable, and
after the code section of the executable (i.e. at the end of the file). This
use of a delimiter is primarily as a simple check that the the file is of
the correct format (i.e. not some random file) and has not been corrupted.

FORMAT OF EXECUTABLE FILE
-------------------------

Header
-----
  4 bytes: Delimiter Value (0xf0f0f0f0)
  4 bytes: Total size in bytes of data section in file  
  4 bytes: Number of instructions (not bytes) in code section

Data Section
------------
  Series of entries, each entry identified by:
  -- 4 bytes: address
  -- 4 bytes: byte_count (identifies the number initialization bytes in the next field)
  -- byte_count bytes: Initialization bytes
  
  4 bytes: Delimiter value (0xf0f0f0f0)

Code Section
------------
  A sequence of 4-byte (32-bit) instructions. The number of instructions is 
  specified in the header, above)

  4 bytes: Delimiter value (0xf0f0f0f0)

*/

//This constants defines the delimiter value
#define DELIMITER 0xf0f0f0f0	


//This is the procedure that loads the executable into memory. It should be
//called after cpu_initialize() and before cpu_execute(). See cpu.h

void  load_executable(char *filename);


