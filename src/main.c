#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int read_dir() {
  DIR *d;
  struct dirent *dir;
  // set path to "~/Dev"
  char *path = strcat(getenv("HOME"), "/Dev");

  d = opendir(path);
  if (d) { // if dir exists
    // iterate through contents of dir
    while ((dir = readdir(d)) != NULL) {
      printf("%s\n", dir->d_name);
    }
    closedir(d);
  }
  return (0);
}

int dir_exists(const char *path) {
  struct stat info;
  if (stat(path, &info) != 0) {
    return 0;
  }
  return S_ISDIR(info.st_mode);
}

void find_projects() {
  char *path = strcat(getenv("HOME"), "/Dev");
  if (dir_exists(path)) {
    printf("%s\n", path);
  }
}

int main(int argc, char **argv) {
  char *project, *language;
  if (argc < 2) {
    printf("missing args\n");
    find_projects();
  } else if (strcmp(argv[1], "-i") == 0) {
    project = argv[2];
    language = argv[3];
    printf("new project: %s\n", project);
    printf("language: %s\n", language);
    printf("dir: ~/Dev/%s/%s\n", language, project);
  } else {
    project = argv[1];
    printf("search for: %s\n", project);
  }
  return 0;
}
