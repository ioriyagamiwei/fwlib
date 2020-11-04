#include <libconfig.h>
#include <stdio.h>
#include <stdlib.h>

#define GTEST_COUT std::cerr << "[          ] [ INFO ]"

#include "../extern/googletest/googletest/include/gtest/gtest.h"
#include "../src/config.c"
int devicePort;
const char *deviceIP = NULL;

int add(int a, int b) { return a + b; }

TEST(widget, ok) { ASSERT_EQ(add(1, 1), 2); }

TEST(Config, ConfigWorks) {
  char config_file[] = "test_config.cfg";
  GTEST_COUT << "Hello World" << std::endl;

  EXPECT_EQ(deviceIP, nullptr) << "unexpected null value for deviceIP";
  EXPECT_EQ(devicePort, 0) << "unexpected null value for devicePort";

  ASSERT_EQ(read_config(config_file), 0) << "read_config failed!";

  EXPECT_STREQ(deviceIP, "127.0.0.1") << "unexpected device ip";
  EXPECT_EQ(devicePort, 8193) << "unexpected device port";
}

/*
int main(int argc, char *argv[]) {
  char config_file[] = "test_config.cfg";
  config_t cfg;

  if (read_config(config_file, &cfg)) {
    fprintf(stderr, "read config failed!");
    exit(1);
  }

  printf("ip: %s, port %d\n", deviceIP, devicePort);
  printf("toast!");

  exit(0);
}
*/
