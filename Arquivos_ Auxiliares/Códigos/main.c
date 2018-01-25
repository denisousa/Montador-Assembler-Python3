
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "cpu.h"
#include "loader.h"


main(int argc, char *argv[])
{

  if (argc < 2) {
    printf("Executable file name required\n");
    exit(1);
  }

  cpu_initialize();

  load_executable(argv[1]);

  cpu_execute();
}
